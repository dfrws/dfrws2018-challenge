# iSmartAlarm Server Stream Analysis

## Overview

Artifact description from challenge details:
```
iSmartAlarm – Diagnostic logs
File/Folder: ismartalarm/diagnostics/2018-05-17T10_54_28/server_stream
SHA256: 8033ba6d37ad7f8ba22587ae560c04dba703962ed16ede8c36a55c9553913736
```

## Strings

Running the strings command on the file shows binary data, HTTP headers, JSON data, and messages some of which conatin time stamps. The earliest timestampl in the file is and 1526289981 (Monday May 14, 2018 11:26:21 am CEST) and the latest is 1526546272 (Thursday May 17, 2018 10:37:52 am CEST).

Among these commands you can find english message (debug notes) such as "door is open, all the siren need doorbell" and "Begin search sensor, change the LED to white". This along with their timestamps could be collated to get the times of when the door is open. 

For example, Times when "door is open, all the siren need doorbell" message is played:

* 1526290387832 Monday    May 14, 2018 11:33:08 (am)
* 1526375425600 Tuesday   May 15, 2018 11:10:26 (am)
* 1526389866297 Tuesday   May 15, 2018 15:11:06 (pm)
* 1526477537403 Wednesday May 16, 2018 15:32:17 (pm)
* 1526477685719 Wednesday May 16, 2018 15:34:46 (pm)
* 1526546076051 Thursday  May 17, 2018 10:34:36 (am) 

If this is when the system is armed and the door is open, it could add credit to events on May 15th or 16th. 

## Internet search

Found CVEs related to ismartalarm vulnerabilities.  These CVEs linked to security researcher blog sites, which included reverse-engineering information of ismartalarm artifacts:

https://www.cvedetails.com/vulnerability-list/vendor_id-16660/Ismartalarm.html

https://dojo.bullguard.com/dojo-by-bullguard/blog/burglar-hacker-when-a-physical-security-is-compromised-by-iot-vulnerabilities/

https://poppopretn.com/2017/11/30/public-disclosure-firmware-vulnerabilities-in-ismartalarm-cubeone/

