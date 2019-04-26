# Data Extraction of network capture
  Evidence Collection Method: Network capture taken once police arrived
  
  File/Folder: network/dfrws_police.pcap
  
  SHA256: 1837ee390e060079fab1e17cafff88a1837610ef951153ddcb7cd85ad478228e
  
## Download and verify the integrity of downloaded artifact

First we downloaded and verified the integrity of the downloaded artifact to the SHA256 hash provided by the challenge.
```
# sha256sum network/dfrws_policy.pcap
1837ee390e060079fab1e17cafff88a1837610ef951153ddcb7cd85ad478228e network/dfrws_policy.pcap
```


# Analysis of Contents

We used Wireshark to review the contents. Below are the notable items found.

## LAN Hosts

|Name|MAC|IP(s)|OUI|Notes|
|----|---|-----|---|-----|
|    |b8:27:eb:0e:3b:45|10.20.30.1|Raspberry PI|Gateway, "Pi-Pinapple" according to cellphone Chrome history|
|    |18:b4:30:61:c9:ef|10.20.30.13|NestLabs| |
|    |d8:fb:5e:e1:01:92|10.20.30.15| Askey Computer Corp | _most likely QBee camera_ |
|    |08:02:8e:ff:75:4f|10.20.30.17|Netgear | arlo |
|    | _unknown_ | 10.20.30.18 | _unknown_ | _not in pcap but ip present in device logs_ |
|    |18:b4:30:99:9f:85|10.20.30.19|NestLabs| |
|    |ac:5f:3e:73:e3:78|10.20.30.21| Samsung | |
| flex-dvt |b4:79:a7:25:02:fa|10.20.30.22| Samsung | wink |
|    | 74:75:48:96:23:24 | 10.20.30.23 | Amazon Technologies | _amazon echo?_ |
| Cthulhuuuu''s iPhone | a6:f1:e8:08:25:d7 | <unknown> | | _not in pcap but present in Samsung wifi logs_ |
|    | a6:f1:e8:80:85:64 | 172.20.10.1 | | recorded in tv.peel.app database on Samsung phone |
|    | <unknown> | 172.21.94.4 | | _was used to ssh into Wink as root_ |

## WAN Hosts

|Name|IP(s)| Whois | Notes|
|----|-----|-------|------|
| ec2-23-23-78-17.compute-1.amazonaws.com   |23.23.78.17 |  Amazon Inc | |
| ec2-23-23-189-37.compute-1.amazonaws.com   |23.23.189.37 |  Amazon Inc | |
| edge-star-mini-shv-01-amt2.facebook.com   |31.13.64.35 |  Facebook | |
| edge-star-shv-01-amt2.facebook.com   |31.13.64.16 | Facebook | |
| ec2-34-224-5-65.compute-1.amazonaws.com   |34.224.5.65 | Amazon Data Services | |
| 182.59.195.35.bc.googleusercontent.com   |35.195.59.182 | Google Cloud | |
| _none_   |52.46.156.66 | Amazon Data Services Canada | |
| ec2-54-72-123-194.eu-west-1.compute.amazonaws.com   |54.72.123.194 | Amazon Data Services Ireland | |
| ec2-54-152-107-0.compute-1.amazonaws.com   |54.152.107.0 | Amazon Inc | |
| mdnworldwide.com   |66.135.44.92 | ServerBeach | |
| _none_   |72.21.192.213 | Amazon | Served NTP to 10.20.30.23 |
| ins1.unil.ch   |130.223.8.20 | *Lausanne, Switzerland* | DNS for 10.20.30.21 and 10.20.30.15 |
| hma.vestiacom.com   |144.76.81.240 | Hetzner Online GmbH | |
| mil04s23-in-f10.1e100.net   |172.217.23.106 | Google | |
| zrh04s06-in-f142.1e100.net 	   |172.217.16.142 | Google | |
| mil04s28-in-f14.1e100.net   |216.58.205.174 | Google | |
| ns1.nexellent.net   |217.147.208.1 | Nexellent AG (Switzerland) | served NTP to 10.20.30.15 |
| _multicast_ |239.255.255.250| _none_ | SSDP NOTIFY (upnp) |

