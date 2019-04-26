## Overview

Artifact description from challenge details:
```
iSmartAlarm – Memory images: 0x0000’0000 (ismart_00.img), 0x8000’0000
(ismart_80.img)
  File/Folder, SHA256: 
    dump/ismart_00.img, b175f98ddb8c79e5a1e7db84eeaa691991939065ae17bad84cdbd915f65d9a10
    dump/ismart_80.img, b175f98ddb8c79e5a1e7db84eeaa691991939065ae17bad84cdbd915f65d9a10
```

## Lazy Extraction

I used binwalk to extract what I could. Unsure if it's everything. Be careful if you extract directly with cpio as I accidentally burned a box.

```bash
binwalk -e -M /mnt/hgfs/vmshare/ismartalarm/dump/ismart00_sda.bin
```

## Comparison of ismart_00.img and ismart_80.img

The two files are identical
```bash
$ diff -s ismart_00.img ismart_80.img 
Files ismart_00.img and ismart_80.img are identical
```

## Strings in ismart_00.img

ASCII Strings inspected using `strings ismart_00.img | less`

String Findings:
   * ~~File appears to be a `SPI Flash Image`~~ _string was in the image, but challenge description indicates this is a memory image_
   * Contains a U-Boot boot loader, version 1.1.3: `U-Boot 1.1.3 (Apr 28 2013 - 17:57:40)`
   * Contains a block of u-boot environment variables (next section)

## U-Boot environment variables in image:

|Setting | Meaning |
|--------|---------|
|bootcmd=tftp | U-Boot launches tftp to download an image by default |
|bootdelay=5 | U-Boot waits 5 seconds for user shell request before booting |
|baudrate=57600 | RS-232 baud rate |
|ethaddr="00:AA:BB:CC:DD:10"  | Mac address to use while bootloader is running |
|ipaddr=10.10.10.123 | IP Address to use while bootloader is running |
|serverip=10.10.10.3 | TFTP server to access |
|ramargs=setenv bootargs root=/dev/ram rw    | boot arguments to use when booting out of RAM |
|addip=setenv bootargs $(bootargs) ip=$(ipaddr):$(serverip):$(gatewayip):$(netmask):$(hostname):$(netdev):off | adds bootline arguments that set up networking upon linux boot |
|addmisc=setenv bootargs $(bootargs) console=ttyS0,$(baudrate) ethaddr=$(ethaddr) panic=1 | adds bootline arguments that sets up serial and ethernet config |
|flash_self=run ramargs addip addmisc;bootm $(kernel_addr) $(ramdisk_addr) | _Note: ramdisk_addr appears undefined._  Configures the full bootline, boots kernel out of flash, with ramdisk initrd |
|kernel_addr=BFC40000 | starting address of raw kernel address. Should be an offset into flash segment |
|u-boot=u-boot.bin |  The name of the u-boot binary, which was/is flashed onto SPI Flash |
|load=tftp 8A100000 $(u-boot) | Command that loads the u-boot binary into RAM |
|u_b=protect off 1:0-1;era 1:0-1;cp.b 8A100000 BC400000 $(filesize) | disables flash write protection, erases entire flash segment, then copies u-boot.bin from RAM into Flash |
|loadfs=tftp 8A100000 root.cramfs | loads the cramfs filesystem into RAM from a TFTP server |
|u_fs=era bc540000 bc83ffff;cp.b 8A100000 BC540000 $(filesize) | erases flash from bc540000 through bc83ffff, then copies cramfs to b5c40000 |
|test_tftp=tftp 8A100000 root.cramfs;run test_tftp | Loads the cramfs over and over, apparently to test tftp |

## Flash Layout

Based on U-Boot settings above:

| Data Type       | Start CPU address (Hex) | Offset into flash area (Hex) | Format |
|-----------------|-------------------------|------------------------|--------|
| U-Boot          | BC400000                | 00000000               | Boot loader                | 
| Initial Ramdisk | BC540000                | 00140000               | Cramfs |
| Linux kernel    | BFC40000                | 03840000               | Raw (vmlinux) memory image |

## Attempts to find/extract cramfs
### First try
Based on environment variables and inferred flash layout, this was attempted
```bash
$ dd if=ismart_00.img of=root.cramfs bs=1 skip=0x140000 count=0x3700000
```

This results in a zero-length file because `ismart_00.img` is only 8MB (0x800000) in length.
The count is too long.  This implies that the image does not start at 0xBC400000 and/or kernel is missing from image.

### Second Try -- allow for smaller file

Extract as much as possible at the target offset (by omitting `count` argument).
```
$ dd if=ismart_00.img of=root.cramfs bs=1c skip=0x140000
```
This did not result in a useable cramfs image.

### Third try -- Look for cramfs signature

```
$ apt install cramfsprogs
$ mkdir x
$ touch x/y.txt
$ mkcramfs x x.cramfs
$ xxd x.cramfs | head
00000000: 453d cd28 0010 0000 0300 0000 0000 0000  E=.(............
00000010: 436f 6d70 7265 7373 6564 2052 4f4d 4653  Compressed ROMFS
00000020: 41fd 76d9 0000 0000 0000 0000 0200 0000  A.v.............
00000030: 436f 6d70 7265 7373 6564 0000 0000 0000  Compressed......
00000040: f841 0000 1400 0087 c004 0000 f881 0000  .A..............
00000050: 0000 0087 0200 0000 792e 7478 7400 0000  ........y.txt...
00000060: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00000070: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00000080: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00000090: 0000 0000 0000 0000 0000 0000 0000 0000  ................
```
*Note* Format includes signature `Compressed ROMFS`
Verified by format description at http://formats.kaitai.io/cramfs/index.html

```
$ grep Compressed ismart_00.img || echo not found
not found
```

*Conclusion: `ismart_00.img` does not contain a cramfs filesystem.*

## No cramfs.  Why?

Re-reading the [challenge details](https://github.com/dfrws/dfrws2018-challenge/blob/master/challenge-details):

> The digital forensic specialist preserves the diagnostic logs from the iSmartAlarm base station, and acquires a copy of the filesystem of the WinkHub. He also collects the iSmartAlarm and Arlo base stations to perform an in-depth analysis at the forensic laboratory.

So these are probably memory images taken while u-boot is running -- not flash images.  Still, only 8MB were collected, which is probably smaller than the Cube's full RAM.  

So we were not really sure how this happend.  In digital forensics best practices, the analyst taking the image would have provided fully detailed the process that he used to create the image in a scientific repeatable process.  However we were provided limited details and sometimes this happens in real forensics.  