# Data Extraction of Wink Hub Evidence
  File Format: Filesystem TAR archive
  
  File/Folder: wink/wink.tar.gz
  
  SHA256: 083e7428dc1d0ca335bbcfc11c6263720ab8145ffc637954a7733afc7b23e8c6
  
## Download and verify the integrity of downloaded artifact

First we downloaded and verified the integrity of the downloaded artifact to the SHA256 hash provided by the challenge.
```
# sha256sum wink.tar.gz 
083e7428dc1d0ca335bbcfc11c6263720ab8145ffc637954a7733afc7b23e8c6 wink.tar.gz
```

## Extract the zip file contents for analysis

During the next step we extracted the archived file and listed the contents.

```
# mkdir wink_data
# tar -xvf wink.tar.gz -C wink_data
```

Then we listed the extracted files.
```
# ls wink_data/
bin                 lib32       root
database            linuxrc     run
database_default    media       sbin
dev                 mfgtests    sys
etc                 mnt         tmp
home                opt         usr
lib                 proc        var
```


## As an alternative to extracting, we used the avfs tool (which is a virtual filesystem that allows browsing of compressed files) to mount the file system and review contents
```
# sudo apt install -y avfs
# mountavfs
# cd /home/sift/.avfs/mnt/hgfs/vmshare/DFRWS/wink.tar.gz#
```
## Creds
db at `wink.tar.gz\database\lutron-db.sqlite` contains creds admin:1988

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
SSDP traffic referencing dial-multiscreen-org appears in proximity to `Fluffy` in `dfrws_arlo.img`

# Utility to review data
We wrote a python script to review data from the persistencedb called [DumpWinkPersistenceDB.py](Wink/DumpWinkPersistenceDB.py). The script outputs key data to a text file and includes timestamps for may 17th from smoke detector and camera. Below is the output:

```
Name: None Type: local_hub

{
    "mHubData": null, 
    "object_type": null, 
    "mUrl": "https://10.20.30.22:8888", 
    "name": null, 
    "icon_id": null, 
    "mVersion": null, 
    "mId": "421391", 
    "object_id": "a278021c-6c79-48f9-b05b-d850b5df4cf0", 
    "mOAuth": {
        "access_token": "a-VqLJPyXkVjoaArwmBS5jrT9ZgU1b0O", 
        "mAuthHeaders": null, 
        "token_type": "bearer", 
        "password": null, 
        "access_token_secret": null, 
        "refresh_token": "G5n8t5W263vk75m7SX0e_NNht_8wpu-g"
    }, 
    "mKeyHash": "B7:DB:5A:AC:59:4A:12:B9:C5:E7:46:3C:09:B5:21:70:35:E1:96:C1:19:C1:54:E8:C4:C0:71:A5:E5:66:CD:DA", 
    "subscription": null
}
-------------------------------------------------------------------------------------


Name: Lausanne Type: geofence

{
    "geofence_id": "369340", 
    "name": "Lausanne", 
    "icon_id": null, 
    "object_type": "geofence", 
    "object_id": "369340", 
    "radius": 250.0, 
    "location": "Universit\u00e9 de Lausanne, 1015 Lausanne, Switzerland", 
    "lat_lng": [
        46.519278, 
        6.57233
    ], 
    "subscription": {
        "pubnub": {
            "subscribe_key": "sub-c-f7bf7f7e-0542-11e3-a5e8-02ee2ddab7fe", 
            "channel": "ee0dad1e2fac834349357c814b6389eeb47d59a8"
        }
    }
}
-------------------------------------------------------------------------------------


Name: None Type: linked_service

{
    "account": null, 
    "name": null, 
    "service": "google_now", 
    "invalidated_at": null, 
    "facets": [], 
    "object_type": "linked_service", 
    "linked_service_id": "815083", 
    "updated_at": 1507106544, 
    "object_id": "815083", 
    "verified_at": null, 
    "relink_method": "none", 
    "credentials": null, 
    "icon_id": null, 
    "third_party_realtime": null, 
    "subscription": {
        "pubnub": {
            "subscribe_key": "sub-c-f7bf7f7e-0542-11e3-a5e8-02ee2ddab7fe", 
            "channel": "8696805a066c4b191a4f67c6404b642407b711fe"
        }
    }
}
-------------------------------------------------------------------------------------


Name: jpinkman2018@gmail.com Type: linked_service

{
    "account": "arlo:A79GZN-316-31881729", 
    "name": "jpinkman2018@gmail.com", 
    "service": "arlo", 
    "invalidated_at": null, 
    "facets": [], 
    "object_type": "linked_service", 
    "linked_service_id": "1044126", 
    "updated_at": 1526431792, 
    "object_id": "1044126", 
    "verified_at": 1526431792, 
    "relink_method": "oauth", 
    "credentials": null, 
    "icon_id": null, 
    "third_party_realtime": null, 
    "subscription": {
        "pubnub": {
            "subscribe_key": "sub-c-f7bf7f7e-0542-11e3-a5e8-02ee2ddab7fe", 
            "channel": "c9a837a5f79c93ee5fff877bd5ff5f7e024d8e29"
        }
    }
}
-------------------------------------------------------------------------------------


Name: None Type: linked_service

{
    "account": "f8896851a03a1cd6ad84f0a4f23f774f196cee8e", 
    "name": null, 
    "service": "nest", 
    "invalidated_at": null, 
    "facets": [], 
    "object_type": "linked_service", 
    "linked_service_id": "1044132", 
    "updated_at": 1526374419, 
    "object_id": "1044132", 
    "verified_at": 1526374419, 
    "relink_method": "oauth", 
    "credentials": null, 
    "icon_id": null, 
    "third_party_realtime": null, 
    "subscription": {
        "pubnub": {
            "subscribe_key": "sub-c-f7bf7f7e-0542-11e3-a5e8-02ee2ddab7fe", 
            "channel": "747fb0b5099f240895c85d73e15a1ccd796bf7e5"
        }
    }
}
-------------------------------------------------------------------------------------


Name: None Type: linked_service

{
    "account": null, 
    "name": null, 
    "service": "amazon_alexa", 
    "invalidated_at": null, 
    "facets": [], 
    "object_type": "linked_service", 
    "linked_service_id": "1044134", 
    "updated_at": 1526376237, 
    "object_id": "1044134", 
    "verified_at": 1526376237, 
    "relink_method": "provisioning_flow", 
    "credentials": null, 
    "icon_id": null, 
    "third_party_realtime": null, 
    "subscription": {
        "pubnub": {
            "subscribe_key": "sub-c-f7bf7f7e-0542-11e3-a5e8-02ee2ddab7fe", 
            "channel": "3976617df12089700365638638c07a11c03f7cf2"
        }
    }
}
-------------------------------------------------------------------------------------


Name: Wink Type: hub

{
    "locale": "en_us", 
    "icon_id": null, 
    "upc_code": "840410102358", 
    "object_id": "421391", 
    "device_manufacturer": "wink", 
    "serial": null, 
    "verified_at": null, 
    "upc_id": "15", 
    "uuid": "fa608f62-a137-4745-beb5-210fcd6721af", 
    "capabilities": {
        "fields": null, 
        "configuration": null, 
        "key_codes": false
    }, 
    "location": "North Atlantic Ocean", 
    "mac_address": null, 
    "object_type": "hub", 
    "desired_state": {}, 
    "bridge_id": null, 
    "linked_service_id": null, 
    "last_reading": {
        "desired_ota_window_start_changed_at": 1525784295, 
        "connection_updated_at": 1526377141, 
        "connection_changed_at": 1526377141, 
        "pairing_mode_updated_at": 1525784121, 
        "pairing_mode_duration": 0, 
        "update_needed_updated_at": 1479359244, 
        "desired_pairing_mode_duration_changed_at": 1525784120, 
        "desired_ota_window_start_updated_at": 1525784295, 
        "updating_firmware_updated_at": 1469484401, 
        "pairing_device_type_selector_updated_at": null, 
        "local_control_id_updated_at": 1525785797, 
        "desired_pairing_mode_duration_updated_at": 1525784120, 
        "desired_enabled_http_modules_updated_at": 1525784278, 
        "firmware_version": "2.66.0", 
        "ip_address_changed_at": 1526284296, 
        "desired_pairing_mode_changed_at": 1525784121, 
        "update_needed": true, 
        "desired_pairing_mode_updated_at": 1525784121, 
        "desired_ota_enabled_updated_at": 1526288724, 
        "desired_pairing_device_type_selector_updated_at": 1525784278, 
        "ip_address": "10.20.30.22", 
        "transfer_mode": null, 
        "ota_enabled": null, 
        "local_control_public_key_hash_updated_at": 1463338021, 
        "remote_pairable_updated_at": null, 
        "pairing_mode": "zwave_network_rediscovery", 
        "desired_ota_window_end_updated_at": 1525784295, 
        "pairing_device_type_selector": null, 
        "enabled_http_modules": null, 
        "desired_enabled_http_modules_changed_at": 1525784278, 
        "desired_ota_enabled_changed_at": 1526288724, 
        "mac_address_updated_at": 1463337709, 
        "ip_address_updated_at": 1526284296, 
        "remote_pairable": null, 
        "kidde_radio_code": 0, 
        "ota_enabled_updated_at": null, 
        "desired_kidde_radio_code_updated_at": 1525784278, 
        "pairing_mode_changed_at": 1525784121, 
        "mac_address": "B4:79:A7:25:02:FA", 
        "desired_pairing_device_type_selector_changed_at": 1525784278, 
        "ota_window_start_updated_at": null, 
        "local_control_id_changed_at": 1525785797, 
        "desired_ota_window_end_changed_at": 1525784295, 
        "present_devices_updated_at": null, 
        "local_control_public_key_hash": "B7:DB:5A:AC:59:4A:12:B9:C5:E7:46:3C:09:B5:21:70:35:E1:96:C1:19:C1:54:E8:C4:C0:71:A5:E5:66:CD:DA", 
        "desired_kidde_radio_code_changed_at": 1525784278, 
        "transfer_mode_updated_at": null, 
        "kidde_radio_code_updated_at": 1463337708, 
        "firmware_version_updated_at": 1469484403, 
        "ota_window_end_updated_at": null, 
        "connection": true, 
        "updating_firmware": false, 
        "ota_window_start": null, 
        "ota_window_end": null, 
        "enabled_http_modules_updated_at": null, 
        "local_control_id": "a278021c-6c79-48f9-b05b-d850b5df4cf0", 
        "present_devices": null, 
        "pairing_mode_duration_updated_at": 1471054399
    }, 
    "radio_type": null, 
    "user_ids": [
        "470654"
    ], 
    "lat_lng": [
        0.0, 
        0.0
    ], 
    "manufacturer_device_id": null, 
    "manufacturer_device_model": "wink_hub", 
    "hidden_at": null, 
    "subscription": {
        "pubnub": {
            "subscribe_key": "sub-c-f7bf7f7e-0542-11e3-a5e8-02ee2ddab7fe", 
            "channel": "f6ac0e566951fb7d91fc2ad5eb16c4d2e648a219|hub-421391|user-470654"
        }
    }, 
    "gang_id": null, 
    "name": "Wink", 
    "hub_id": "421391", 
    "created_at": 1463337707, 
    "order": 0, 
    "local_id": null, 
    "primary_upc_code": "wink_hub", 
    "model_name": "Hub"
}
-------------------------------------------------------------------------------------


Name: Piano Type: light_bulb

{
    "locale": "en_us", 
    "object_type": "light_bulb", 
    "upc_code": "cree_zigbee7", 
    "object_id": "1700816", 
    "device_manufacturer": "cree", 
    "serial": null, 
    "verified_at": null, 
    "upc_id": "199", 
    "icon_id": "262", 
    "light_bulb_id": "1700816", 
    "capabilities": {
        "fields": null, 
        "configuration": null, 
        "key_codes": false
    }, 
    "location": "21218", 
    "mac_address": null, 
    "desired_state": {}, 
    "bridge_id": null, 
    "linked_service_id": null, 
    "last_reading": {
        "desired_brightness_changed_at": 1525784158, 
        "connection_updated_at": 1526377144, 
        "powered": true, 
        "brightness": 1.0, 
        "firmware_version_updated_at": 1463344679, 
        "desired_powered_changed_at": 1525784158, 
        "connection": false, 
        "powered_updated_at": 1471798912, 
        "desired_brightness_updated_at": 1525784158, 
        "brightness_updated_at": 1463617299, 
        "desired_powered_updated_at": 1525784158, 
        "firmware_version": "0.0b00 / 0.1bf4"
    }, 
    "radio_type": "zigbee", 
    "user_ids": [
        "470654"
    ], 
    "lat_lng": [
        39.325074, 
        -76.612164
    ], 
    "manufacturer_device_id": null, 
    "manufacturer_device_model": "cree_light_bulb", 
    "hidden_at": null, 
    "subscription": {
        "pubnub": {
            "subscribe_key": "sub-c-f7bf7f7e-0542-11e3-a5e8-02ee2ddab7fe", 
            "channel": "487dc57a49183d96469319853ecb4f524e2fc84d|light_bulb-1700816|user-470654"
        }
    }, 
    "gang_id": null, 
    "name": "Piano", 
    "hub_id": "421391", 
    "created_at": 1463343015, 
    "order": 0, 
    "local_id": "2", 
    "primary_upc_code": "cree_zigbee", 
    "model_name": "Cree light bulb"
}
-------------------------------------------------------------------------------------


Name: Upstairs Type: light_bulb

{
    "locale": "en_us", 
    "object_type": "light_bulb", 
    "upc_code": "cree_zigbee7", 
    "object_id": "1889042", 
    "device_manufacturer": "cree", 
    "serial": null, 
    "verified_at": null, 
    "upc_id": "199", 
    "icon_id": "36", 
    "light_bulb_id": "1889042", 
    "capabilities": {
        "fields": null, 
        "configuration": null, 
        "key_codes": false
    }, 
    "location": "3010 Abell Ave", 
    "mac_address": null, 
    "desired_state": {}, 
    "bridge_id": null, 
    "linked_service_id": null, 
    "last_reading": {
        "desired_brightness_changed_at": 1526121338, 
        "connection_updated_at": 1526377144, 
        "connection_changed_at": 1521194194, 
        "powered": true, 
        "brightness": 1.0, 
        "firmware_version_updated_at": 1526377144, 
        "desired_powered_changed_at": 1526121338, 
        "connection": true, 
        "powered_updated_at": 1526377144, 
        "desired_brightness_updated_at": 1526121338, 
        "brightness_updated_at": 1526377144, 
        "desired_powered_updated_at": 1526121338, 
        "firmware_version": "0.0b00 / 0.1bf4"
    }, 
    "radio_type": "zigbee", 
    "user_ids": [
        "470654"
    ], 
    "lat_lng": [
        39.325655, 
        -76.6122
    ], 
    "manufacturer_device_id": null, 
    "manufacturer_device_model": "cree_light_bulb", 
    "hidden_at": null, 
    "subscription": {
        "pubnub": {
            "subscribe_key": "sub-c-f7bf7f7e-0542-11e3-a5e8-02ee2ddab7fe", 
            "channel": "a778a81430b3520bee3f1ee042cd9e86990c67ac|light_bulb-1889042|user-470654"
        }
    }, 
    "gang_id": null, 
    "name": "Upstairs", 
    "hub_id": "421391", 
    "created_at": 1469704691, 
    "order": 0, 
    "local_id": "4", 
    "primary_upc_code": "cree_zigbee", 
    "model_name": "Cree light bulb"
}
-------------------------------------------------------------------------------------


Name: SuperLab Kitchen Nest Protect (LabSmoker) Type: smoke_detector

{
    "locale": "en_us", 
    "object_type": "smoke_detector", 
    "upc_code": "nest_protect", 
    "object_id": "212474", 
    "device_manufacturer": "nest", 
    "serial": null, 
    "verified_at": null, 
    "upc_id": "558", 
    "icon_id": null, 
    "capabilities": {
        "fields": null, 
        "configuration": null, 
        "key_codes": false
    }, 
    "location": "", 
    "mac_address": null, 
    "desired_state": null, 
    "bridge_id": null, 
    "linked_service_id": "1044132", 
    "smoke_detector_id": "212474", 
    "radio_type": null, 
    "last_reading": {
        "co_detected": false, 
        "co_severity": 0.0, 
        "battery_changed_at": 1526374419, 
        "co_severity_updated_at": 1526578297, 
        "connection_changed_at": 1526374419, 
        "battery_updated_at": 1526578297, 
        "battery": 1.0, 
        "test_activated_updated_at": 1526578297, 
        "test_activated_changed_at": 1526478067, 
        "co_detected_updated_at": 1526578297, 
        "smoke_severity": 0.0, 
        "connection": true, 
        "co_detected_changed_at": 1526374419, 
        "co_severity_changed_at": 1526374419, 
        "test_activated": false, 
        "connection_updated_at": 1526578297, 
        "smoke_detected_changed_at": 1526546180, 
        "smoke_detected": false, 
        "smoke_severity_updated_at": 1526578297, 
        "smoke_detected_updated_at": 1526578297, 
        "smoke_severity_changed_at": 1526546180
    }, 
    "user_ids": [
        "470654"
    ], 
    "lat_lng": [
        null, 
        null
    ], 
    "manufacturer_device_id": "VpXN4GQ7MUDNDjAjS-6y80xx11Qobba_", 
    "manufacturer_device_model": "nest_thermostat", 
    "hidden_at": null, 
    "subscription": {
        "pubnub": {
            "subscribe_key": "sub-c-f7bf7f7e-0542-11e3-a5e8-02ee2ddab7fe", 
            "channel": "3536b5b611bc3989a3808bc311b221edd2a257f9|smoke_detector-212474|user-470654"
        }
    }, 
    "gang_id": null, 
    "name": "SuperLab Kitchen Nest Protect (LabSmoker)", 
    "hub_id": null, 
    "created_at": 1526374419, 
    "order": 0, 
    "local_id": null, 
    "primary_upc_code": "nest_protect", 
    "model_name": "Protect"
}
-------------------------------------------------------------------------------------


Name: SuperLab Tabletting Camera Type: camera

{
    "locale": "en_us", 
    "object_type": "camera", 
    "upc_code": "nest_cam", 
    "object_id": "235946", 
    "camera_id": "235946", 
    "device_manufacturer": "nest", 
    "serial": null, 
    "verified_at": null, 
    "upc_id": "754", 
    "icon_id": null, 
    "capabilities": {
        "fields": [
            {
                "placement": null, 
                "mutability": "read-only", 
                "choices": null, 
                "field": "connection", 
                "range": null, 
                "attribute_id": null, 
                "type": "boolean"
            }, 
            {
                "placement": null, 
                "mutability": "read-only", 
                "choices": null, 
                "field": "capturing_audio", 
                "range": null, 
                "attribute_id": null, 
                "type": "boolean"
            }, 
            {
                "placement": null, 
                "mutability": "read-write", 
                "choices": null, 
                "field": "capturing_video", 
                "range": null, 
                "attribute_id": null, 
                "type": "boolean"
            }, 
            {
                "placement": null, 
                "mutability": "read-only", 
                "choices": null, 
                "field": "motion", 
                "range": null, 
                "attribute_id": null, 
                "type": "boolean"
            }, 
            {
                "placement": null, 
                "mutability": "read-only", 
                "choices": null, 
                "field": "loudness", 
                "range": null, 
                "attribute_id": null, 
                "type": "boolean"
            }, 
            {
                "placement": null, 
                "mutability": "read-only", 
                "choices": null, 
                "field": "has_recording_plan", 
                "range": null, 
                "attribute_id": null, 
                "type": "boolean"
            }, 
            {
                "placement": null, 
                "mutability": "read-only", 
                "choices": null, 
                "field": "snapshot_url", 
                "range": null, 
                "attribute_id": null, 
                "type": "string"
            }
        ], 
        "configuration": null, 
        "key_codes": false
    }, 
    "location": "", 
    "mac_address": null, 
    "desired_state": {}, 
    "bridge_id": null, 
    "linked_service_id": "1044132", 
    "last_reading": {
        "connection_updated_at": 1526578297, 
        "connection_changed_at": 1526552219, 
        "capturing_audio": true, 
        "loudness_changed_at": 1526546141, 
        "motion_true_changed_at": 1526567230, 
        "has_recording_plan": true, 
        "loudness_true": null, 
        "motion_changed_at": 1526567275, 
        "capturing_audio_changed_at": 1526374420, 
        "desired_capturing_video_changed_at": 1526390161, 
        "capturing_video_updated_at": 1526578297, 
        "loudness_true_updated_at": null, 
        "motion_true_updated_at": 1526377177, 
        "has_recording_plan_changed_at": 1526374420, 
        "capturing_video": true, 
        "has_recording_plan_updated_at": 1526578297, 
        "capturing_audio_updated_at": 1526578297, 
        "motion_updated_at": 1526578297, 
        "motion_true": false, 
        "desired_capturing_video_updated_at": 1526390161, 
        "motion": false, 
        "connection": true, 
        "loudness_updated_at": 1526578297, 
        "loudness": false, 
        "capturing_video_changed_at": 1526552219
    }, 
    "radio_type": null, 
    "user_ids": [
        "470654"
    ], 
    "lat_lng": [
        null, 
        null
    ], 
    "manufacturer_device_id": "fEj8x-PFe3i4k9MauZ21gZB4q_a4CvdO7D-4t8QO_-dMcddUKG22vw", 
    "manufacturer_device_model": "nest_thermostat", 
    "hidden_at": null, 
    "subscription": {
        "pubnub": {
            "subscribe_key": "sub-c-f7bf7f7e-0542-11e3-a5e8-02ee2ddab7fe", 
            "channel": "2ee82e5c77167fa1072e831ae1f3ee04eb8e2243|camera-235946|user-470654"
        }
    }, 
    "gang_id": null, 
    "name": "SuperLab Tabletting Camera", 
    "hub_id": null, 
    "created_at": 1526374420, 
    "order": 0, 
    "local_id": null, 
    "primary_upc_code": "nest_cam", 
    "model_name": "Nest Cam"
}
-------------------------------------------------------------------------------------


Name: Kitchen's camera Type: camera

{
    "locale": "en_us", 
    "object_type": "camera", 
    "upc_code": "arlo_pro", 
    "object_id": "237267", 
    "camera_id": "237267", 
    "device_manufacturer": "netgear", 
    "serial": null, 
    "verified_at": null, 
    "upc_id": "1130", 
    "icon_id": null, 
    "capabilities": {
        "fields": [
            {
                "placement": null, 
                "mutability": "read-only", 
                "choices": null, 
                "field": "connection", 
                "range": null, 
                "attribute_id": null, 
                "type": "boolean"
            }, 
            {
                "placement": null, 
                "mutability": "read-only", 
                "choices": null, 
                "field": "battery", 
                "range": null, 
                "attribute_id": null, 
                "type": "percentage"
            }, 
            {
                "placement": null, 
                "mutability": "read-only", 
                "choices": null, 
                "field": "signal", 
                "range": null, 
                "attribute_id": null, 
                "type": "percentage"
            }, 
            {
                "placement": null, 
                "mutability": "read-only", 
                "choices": null, 
                "field": "loudness", 
                "range": null, 
                "attribute_id": null, 
                "type": "boolean"
            }, 
            {
                "placement": null, 
                "mutability": "read-only", 
                "choices": null, 
                "field": "noise", 
                "range": null, 
                "attribute_id": null, 
                "type": "boolean"
            }, 
            {
                "placement": null, 
                "mutability": "read-only", 
                "choices": null, 
                "field": "motion", 
                "range": null, 
                "attribute_id": null, 
                "type": "boolean"
            }, 
            {
                "placement": null, 
                "mutability": "read-write", 
                "choices": null, 
                "field": "flip", 
                "range": null, 
                "attribute_id": null, 
                "type": "boolean"
            }, 
            {
                "placement": null, 
                "mutability": "read-write", 
                "choices": null, 
                "field": "mirror", 
                "range": null, 
                "attribute_id": null, 
                "type": "boolean"
            }, 
            {
                "placement": null, 
                "mutability": "read-write", 
                "choices": [
                    "armed", 
                    "disarmed"
                ], 
                "field": "mode", 
                "range": null, 
                "attribute_id": null, 
                "type": "string"
            }, 
            {
                "placement": null, 
                "mutability": "read-write", 
                "choices": null, 
                "field": "capturing_video", 
                "range": null, 
                "attribute_id": null, 
                "type": "boolean"
            }, 
            {
                "placement": null, 
                "mutability": "read-write", 
                "choices": null, 
                "field": "capturing_video_duration", 
                "range": [
                    10.0, 
                    120.0
                ], 
                "attribute_id": null, 
                "type": "integer"
            }, 
            {
                "placement": null, 
                "mutability": "read-write", 
                "choices": null, 
                "field": "last_image_cuepoint_id", 
                "range": null, 
                "attribute_id": null, 
                "type": "string"
            }, 
            {
                "placement": null, 
                "mutability": "read-write", 
                "choices": null, 
                "field": "last_recording_cuepoint_id", 
                "range": null, 
                "attribute_id": null, 
                "type": "string"
            }
        ], 
        "configuration": null, 
        "key_codes": false
    }, 
    "location": "", 
    "mac_address": null, 
    "desired_state": {}, 
    "bridge_id": null, 
    "linked_service_id": "1044126", 
    "last_reading": {
        "desired_capturing_video": null, 
        "battery_changed_at": 1526431795, 
        "connection_updated_at": 1526431793, 
        "connection_changed_at": 1526431793, 
        "battery": 0.21, 
        "mode_changed_at": 1526431795, 
        "desired_mode": null, 
        "motion_true_changed_at": 1526546332, 
        "battery_updated_at": 1526431795, 
        "desired_mode_updated_at": null, 
        "loudness_true": null, 
        "motion_changed_at": 1526546374, 
        "capturing_video_updated_at": null, 
        "loudness_true_updated_at": null, 
        "motion_true_updated_at": 1526477566, 
        "capturing_video": null, 
        "motion_updated_at": 1526546374, 
        "motion_true": false, 
        "mode_updated_at": 1526431795, 
        "desired_capturing_video_updated_at": null, 
        "motion": false, 
        "connection": true, 
        "mode": "armed", 
        "loudness_updated_at": null, 
        "loudness": null
    }, 
    "radio_type": null, 
    "user_ids": [
        "470654"
    ], 
    "lat_lng": [
        null, 
        null
    ], 
    "manufacturer_device_id": "arlo:59U17B7BB8B46", 
    "manufacturer_device_model": "netgear_arlo_pro", 
    "hidden_at": null, 
    "subscription": {
        "pubnub": {
            "subscribe_key": "sub-c-f7bf7f7e-0542-11e3-a5e8-02ee2ddab7fe", 
            "channel": "63f69b46ea782370da507347c94fd1bb2c438b88|camera-237267|user-470654"
        }
    }, 
    "gang_id": null, 
    "name": "Kitchen's camera", 
    "hub_id": null, 
    "created_at": 1526431793, 
    "order": 0, 
    "local_id": null, 
    "primary_upc_code": "arlo_pro", 
    "model_name": "Arlo Pro"
}
```



