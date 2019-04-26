# Data Extraction of Arlo Evidence
  Evidence: TAR archive of the folder /tmp/media/nand on Arlo
  File/Folder: arlo/arlo_nand.tar.gz
  SHA256: 857455859086cd6face6115e72cb1c63d2befe11db92beec52d1f70618c5e421
  
  Evidence: Arlo memory image
  File/Folder: arlo/dfwrs_arlo.img
  SHA256: 3b957a90a57e5e4485aa78d79c9a04270a2ae93f503165c2a0204de918d7ac70
  
  Evidence: Arlo NVRAM settings
  File/Folder: arlo/nvram.log
  SHA256: f5d680d354a261576dc8601047899b5173dbbad374a868a20b97fbd963dca798

## Download and verify the integrity of downloaded artifacts

First we downloaded and verified the integrity of the downloaded artifact to the SHA256 hash provided by the challenge.
```
# sha256sum arlo/arlo_nand.tar.gz
857455859086cd6face6115e72cb1c63d2befe11db92beec52d1f70618c5e421 arlo/arlo_nand.tar.gz
# sha256sum arlo/dfwrs_arlo.img
3b957a90a57e5e4485aa78d79c9a04270a2ae93f503165c2a0204de918d7ac70 arlo/dfwrs_arlo.img
# sha256sum arlo/nvram.log
f5d680d354a261576dc8601047899b5173dbbad374a868a20b97fbd963dca798 arlo/nvram.log
```

## Extract the archive contents of nand for analysis

During the next step we extracted the zip file and began reviewing the contents.

```
# mkdir arlo_nand_data
# tar -xvf arlo/arlo_nand.tar.gz -C arlo_nand_data
# cd /tmp/media/nand
# ls
# eventlog	eventlog.0	log-archive	updatelog	vzdaemon
```

## Evidence Details - arlo_nand.tar.gz
### From `arlo_nand.tar.gz#/tmp/media/nand/vzdaemon/conf/cameras/59U17B7BB8B46.json`
    * id: 59U17B7BB8B46
    * MAC: 08:02:8E:FD:BD:CD
### From `arlo_nand.tar.gz#/tmp/media/nand/vzdaemon/conf/activemodeov.json`
    * active mode id: mode2
### From `arlo_nand.tar.gz#/tmp/media/nand/vzdaemon/conf/automation/Automation.json`
    * Truncated...
    ```json
    {
            "devices": {
                "59U17B7BB8B46": {
                    "audioStart": {
                        "enabled": true,
                        "pushNotification": {
                            "enabled": true
                        },
                        "recordVideo": {
                            "enabled": true,
                            "fixedTime": {
                                "duration": 10
                            },
                            "stopCondition": "motionStop"
                        },
                        "sensitivity": 3,
                        "sirenAlert": {
                            "duration": 180,
                            "enabled": false,
                            "pattern": "alarm",
                            "sirenState": "off",
                            "volume": 8
                        }
                    },
                    "id": "59U17B7BB8B46",
                    "motionStart": {
                        "enabled": true,
                        "pushNotification": {
                            "enabled": true
                        },
                        "recordVideo": {
                            "enabled": true,
                            "fixedTime": {
                                "duration": 10
                            },
                            "stopCondition": "motionStop"
                        },
                        "sensitivity": 80,
                        "sirenAlert": {
                            "duration": 180,
                            "enabled": false,
                            "pattern": "alarm",
                            "sirenState": "off",
                            "volume": 8
                        }
                    },
                    "name": "**_DEFAULT_RULE_**"
                }
            },
            "id": "mode2",
            "name": "Always",
            "type": "custom"
    }
    ```

## Analyze log file

During the next step we reviewed contents of the log file.

```
# cat nvram.log | more
```

## Evidence Details - nvram.log
### Wifi passphrases from the arlo's `nvram.log` file:
wl_wpa_psk=55B6BAA31C58FA339E32BE25AE332BF1EA1F09F0D0FE5A620A7EE5D650B7B7E3EBB2F385656D4DA757DC924F1D88AD6C3392E12066A6F9C9C902E1CF90D9B70200000000000000000000000000000000
wl0_wpa_psk=55B6BAA31C58FA339E32BE25AE332BF1EA1F09F0D0FE5A620A7EE5D650B7B7E3EBB2F385656D4DA757DC924F1D88AD6C3392E12066A6F9C9C902E1CF90D9B70200000000000000000000000000000000

