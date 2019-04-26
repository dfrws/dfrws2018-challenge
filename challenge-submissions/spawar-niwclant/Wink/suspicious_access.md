# Suspicious access to Wink via SSH

## Abuse of ssh (dropbear) 

Wink filesystem includes the Dropbear lightweight ssh server, which was running at the time of image capture:
```
# find . -iname '*dropbear*'
./usr/bin/dropbearkey
./usr/bin/dropbearconvert
./usr/sbin/dropbear
./etc/default/dropbear
./etc/dropbear
./etc/dropbear/dropbear_ecdsa_host_key
./etc/init.d/S50dropbear
./tmp/dropbear.pid
```

### Root account was configured for public key login by "fluffy@hogwarts":
```
# ls -al root/.ssh
total 12
drwxr-xr-x 2 root root 4096 Jan  1  1970 .
drwxr-xr-x 7 root root 4096 May  8  2018 ..
-rw-r--r-- 1 root root  397 Jan  1  1970 authorized_keys
# cat root/.ssh/authorized_keys 
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDfsxSzezIJ89i98gO9HxfKAdJnX1bHx3j8v/QSD8hXZPOXKUy9/TMSz1dwRTj3jbFZMn5B6W1NoeXc1ZrgmRBBX5wEDXJYNEnAP59Y4znTx4RwD08DtLzbeRcyDyFk11ve4AW6Li9hkC+v50wYx5XED4hv2JUUQo9F0jgFKRXvI9a1u+3uXIHiNB3xGVmM7jbMnCB3JUxpwvKt2WNdJQeXZj82TsBCuAtWycF2LbZv/FdZpMZCS6GsORSDoyQz/trXt7ubhTT75I7Xp0TglArGgcwCg60ydohVH7mBEXzQ4EBC/Y05wCFSgGnSHnuYSxCiiDzu43pAWyxV35IGjuWh fluffy@hogwarts
# ssh-keygen -l -E md5 -f root/.ssh/authorized_keys 
2048 MD5:b8:a6:d6:7c:d8:9d:dc:8a:cb:25:7e:ec:5d:67:aa:04 fluffy@hogwarts (RSA)
```

### Logs are written to `/tmp/` since `/var/` is full of symlinks:
```
# ls -l var
total 4
lrwxrwxrwx 1 root root    6 May 19  2016 cache -> ../tmp
drwxr-xr-x 3 root root 4096 Jan  1  1970 lib
lrwxrwxrwx 1 root root    6 May 19  2016 lock -> ../tmp
lrwxrwxrwx 1 root root    6 May 19  2016 log -> ../tmp
lrwxrwxrwx 1 root root    6 May 19  2016 pcmcia -> ../tmp
lrwxrwxrwx 1 root root    6 May 19  2016 run -> ../tmp
lrwxrwxrwx 1 root root    6 May 19  2016 spool -> ../tmp
lrwxrwxrwx 1 root root    6 May 19  2016 tmp -> ../tmp
```

### Suspicious remote login

According to logs, `fluffy@hogwarts` logged into the wink as root at 12:11 on 17 May (note md5 hash matches `authorized_keys` above):
```
# find tmp -type f -print0 | xargs -0 grep -i dropbear
tmp/all.log:May 17 12:11:08 flex-dvt authpriv.info dropbear[27387]: Child connection from 172.21.94.4:59817
tmp/all.log:May 17 12:11:10 flex-dvt authpriv.notice dropbear[27387]: Pubkey auth succeeded for 'root' with key md5 b8:a6:d6:7c:d8:9d:dc:8a:cb:25:7e:ec:5d:67:aa:04 from 172.21.94.4:59817
```

# Suspicious shell histories

`/root/.bash_history` has been zeroed-out and timestamp set to beginning of epoch:
```
# ls -l root/.bash_history
-rw-r--r-- 1 root root 0 May 19  2016 root/.bash_history
```

## Bash _and_ Busybox as shells

The filesystem contains busybox, which has support for shells other than bash:
```
# ls -l bin
total 1612
lrwxrwxrwx 1 root root      7 May 19  2016 ash -> busybox
-rwxr-xr-x 1 root root 671208 May 19  2016 bash
-rwxr-xr-x 1 root root 642276 May 19  2016 busybox
[...]
-rwxr-xr-x 1 root root  26576 May 19  2016 httpfs2-ssl
[...]
lrwxrwxrwx 1 root root      7 May 19  2016 login -> busybox
-rwxr-xr-x 1 root root 117384 May 19  2016 lsof
[...]
-rwxr-xr-x 1 root root  82872 May 19  2016 ntpdate
[...]
-rwxr-xr-x 1 root root 100724 May 19  2016 sed
[...]
lrwxrwxrwx 1 root root      7 May 19  2016 sh -> busybox
[...]
lrwxrwxrwx 1 root root      7 May 19  2016 su -> busybox
[...]
```

## Strange history files

The `/bin/sh` shell stores no history. `/bin/bash` stores history in `~/.bash_history`.  And `/bin/ash` stores history in `~/.ash_history`.
```
# find . -name '.*history' | xargs ls -l --full-time
-rw------- 1 root root 2442 1970-01-01 00:04:55.000000000 +0000 ./.ash_history
-rw------- 1 root root  446 2018-05-13 10:00:19.000000000 +0000 ./root/.ash_history
-rw-r--r-- 1 root root    0 2016-05-19 23:46:22.000000000 +0000 ./root/.bash_history
```

Here we can see that `/bin/ash` has been invoked with `HOME=/root`, and also with `HOME=/`.  The root history file was either written with corrupted real time clock, or the timestamp has been cleared.  The `/root/.ash_history` file was *last written on 13 May at 10:00:19 UTC*.

### Inspection of `/.ash_history`

```
# cat ./.ash_history 
mount -a
ubiattach -p /dev/mtd3
mount -t ubifs ubi1:database /database
ls /database
cd etc/
ls
mount -t ubifs ubi1:database /database
less /etc/inittab 
less /etc/fstab 
mount
mount -t ubifs ubi0:database /database
mount -t ubifs ubi1:database /database
mount
whoami
mount -t ubifs ubi1:database /database
netstat
netstat -a
netstat -ln
ifconfig 
lsof -i
netstat -lptu
netstat -tulpn
netstat -tuln
netstat -tln
netstat -ln
mount -t ubifs ubi1:database /database
mount -t ubifs ubi0:database /database
ls /dev/
less /etc/inittab 
less /etc/fstab 
mount
ls /database
touch /database/ENABLE_SSH
vi /etc/inittab
passwd 
vi /database/authorized_keys
rm -f /tmp/rootfs/etc/default/dropbear
reboot
sudo !!
sudo reboot
reboot now
shutdown now
halt -r
halt
halt -d 0
mount -a
ubiattach -p /dev/mtd3
mount -t ubifs ubi1:database /database
ls /database
touch /database/ENABLE_SSH
vi /etc/inittab
rm -f /tmp/rootfs/etc/default/dropbear
vi /database/authorized_keys
reboot
mount -a
ubiattach -p /dev/mtd3
mount -t ubifs ubi1:database /database
reboot
mount -a
ubiattach -p /dev/mtd3
mount -t ubifs ubi1:database /database
wpa_supplicant 
wpa_supplicant  -i wlan0
iwconfig 
iwlist
iwlist -i wlan0
ifconfig -a
ifup wlan0
vim /etc/hosts 
vi /etc/hosts 
reboot
mount -a
ubiattach -p /dev/mtd3
mount -t ubifs ubi1:database /database
man find
cd /root/platform/
ls
cat run_upgrade.sh 
cat upgrade.sh 
vi upgrade.sh 
set_rgb 
set_boot_application
vi upgrade.sh 
cd /database
ls
vim cf_cert 
cat cf_
cat cf_cert 
cat cf_url 
cat cf_cert 
vi cf_cert 
mount -a
ubiattach -p /dev/mtd3
mount -t ubifs ubi1:database /database
vi /etc/hosts 
reboot
mount -a
ubiattach -p /dev/mtd3
mount -t ubifs ubi1:database /database
vim /database_default/
cd database_default/
ls
cd db_backup/
ls
vim cf_cert 
vi cf_cert 
cd ..
cd /database
ls
vim wpa_supplicant.conf 
vi wpa_supplicant.conf 
vi
ls
cat cf_cert 
cp /database_default/db_backup/cf_cert .
cat cf_cert 
cat DO_UPDATE 
vi DO_UPDATE 
ls
vi oauth 
ls
cat refurb_mode 
cat error.log 
cat upgrade_log 
less upgrade_log 
vi upgrade_log 
ls /etc/bluetooth/main.conf 
vim /etc/bluetooth/main.conf 
cat /etc/bluetooth/main.conf 
which setrgb
ls /usr/sbin/
/sbin/poweroff 
/sbin/reboot
mount -a
ubiattach -p /dev/mtd3
mount -t ubifs ubi1:database /database
cd /database
ls
cat cf_cert 
mv cf_cert cf_cert.bck
vi DO_UPDATE 
ls
cd ..
umount /database
mount -t ubifs ubi1:database /database
vi /database/DO_UPDATE 
umount /database
```
This history likely spans multiple reboot/relog cycles because it contains multiple `mount` commands, which would be redundant if all performed in a single session.
The user:
   1. mounts ubi0 and ubi1 to the `/database` mountpoint many times
   2. Inspects network connections
   3. Alters boot sequence (`/etc/inittab`)
   4. Enables an ssh daemon (`/database/ENABLE_SSH`)
   5. Manipulates wifi settings
   6. Alters certificates
   7. performs multiple system upgrades
   8. _Edits_ `/database/upgrade_log`

*Summary: This might be product setup/installation activity.  Only the manual edit of `upgrade_log` looks very suspicious*

### Inspection of `/root/.ash_history`

```
# cat root/.ash_history 
ls
cd /
ls
ls /dev
df -h
devices
ls /dev/disk/
ls /dev/disk/by-id/
ls /dev/disk/by-path/
ls /dev/disk/by-uuid/
ls /dev/ra
ubiblock --create /dev/ubi0_0
ubinfo
cd /database
ls
ls ota-files/
ls local_control_data/
ls /var/log/
cd /var/lo
ls
cd /var/log
ls
ls -la
cat all.log 
vim all.log 
vi all.log 
ls -la
ls -lah
cd /
less .ssh/authorized_keys 
ls -la
pwd
cat /var/log/subsys/dbus-daemon 
cat /var/log/database/apron-2.db 
cat /var/log/all.log 
```

This user:
   1. Inspects storage device mount points and identities
   2. Attempts to create a UBI block device, inspects UBI status
   3. Inspects filenames present in the `/database` tree
   4. inspects logs in `/var/log`
   5. Edits `/var/log/all.log` (aka `/tmp/all.log`)
   6. Inspects (possibly copies) `/.ssh/authorized_keys`... which does not exist in the current image
   7. Reviews system logs again

## Where else does `fluffy` appear in our artifacts?

```
$ sudo find . -type f -print0 | sudo xargs -0 grep -i fluffy
[sudo] password for sift: 
./wink/fs/database/authorized_keys:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDfsxSzezIJ89i98gO9HxfKAdJnX1bHx3j8v/QSD8hXZPOXKUy9/TMSz1dwRTj3jbFZMn5B6W1NoeXc1ZrgmRBBX5wEDXJYNEnAP59Y4znTx4RwD08DtLzbeRcyDyFk11ve4AW6Li9hkC+v50wYx5XED4hv2JUUQo9F0jgFKRXvI9a1u+3uXIHiNB3xGVmM7jbMnCB3JUxpwvKt2WNdJQeXZj82TsBCuAtWycF2LbZv/FdZpMZCS6GsORSDoyQz/trXt7ubhTT75I7Xp0TglArGgcwCg60ydohVH7mBEXzQ4EBC/Y05wCFSgGnSHnuYSxCiiDzu43pAWyxV35IGjuWh fluffy@hogwarts
./wink/fs/database_default/db_backup/authorized_keys:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDfsxSzezIJ89i98gO9HxfKAdJnX1bHx3j8v/QSD8hXZPOXKUy9/TMSz1dwRTj3jbFZMn5B6W1NoeXc1ZrgmRBBX5wEDXJYNEnAP59Y4znTx4RwD08DtLzbeRcyDyFk11ve4AW6Li9hkC+v50wYx5XED4hv2JUUQo9F0jgFKRXvI9a1u+3uXIHiNB3xGVmM7jbMnCB3JUxpwvKt2WNdJQeXZj82TsBCuAtWycF2LbZv/FdZpMZCS6GsORSDoyQz/trXt7ubhTT75I7Xp0TglArGgcwCg60ydohVH7mBEXzQ4EBC/Y05wCFSgGnSHnuYSxCiiDzu43pAWyxV35IGjuWh fluffy@hogwarts
./wink/fs/root/.ssh/authorized_keys:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDfsxSzezIJ89i98gO9HxfKAdJnX1bHx3j8v/QSD8hXZPOXKUy9/TMSz1dwRTj3jbFZMn5B6W1NoeXc1ZrgmRBBX5wEDXJYNEnAP59Y4znTx4RwD08DtLzbeRcyDyFk11ve4AW6Li9hkC+v50wYx5XED4hv2JUUQo9F0jgFKRXvI9a1u+3uXIHiNB3xGVmM7jbMnCB3JUxpwvKt2WNdJQeXZj82TsBCuAtWycF2LbZv/FdZpMZCS6GsORSDoyQz/trXt7ubhTT75I7Xp0TglArGgcwCg60ydohVH7mBEXzQ4EBC/Y05wCFSgGnSHnuYSxCiiDzu43pAWyxV35IGjuWh fluffy@hogwarts
Binary file ./arlo/dfrws_arlo.img matches
Binary file ./samsung/blk0_sda.bin matches
```

The `fluffy@hogwarts` key appears in the wink `/database` and `/database_default/db_backup` directories, which implies it was injected onto the device using the backup/restore tools.

# TODO

Investigate appearances of `fluffy` in the Arlo and Samsung images.

Investigate http://www.dial-multiscreen.org/
   * SSDP traffic referencing dial-multiscreen-org appears in proximity to `Fluffy` in `dfrws_arlo.img`