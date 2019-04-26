# Data Extraction of Amazon Echo Evidence
  Evidence Collection Method: Extraction of cloud data obtained via CIFT
  
  File/Folder: echo/(2018-07-01_13.17.01)_CIFT_RESULT.zip
  
  SHA256: 7ee2d77a3297bb7ea4030444be6e0e150a272b3302d4f68453e8cfa11ef3241f
  
## Download and verify the integrity of downloaded artifact

First we downloaded and verified the integrity of the downloaded artifact to the SHA256 hash provided by the challenge.
```
# sha256sum echo/\(2018-07-01_13.17.01)_CIFT_RESULT.zip 
7ee2d77a3297bb7ea4030444be6e0e150a272b3302d4f68453e8cfa11ef3241f echo/\(2018-07-01_13.17.01)_CIFT_RESULT.zip
```


## Extract the zip file contents for analysis

During the next step we extracted the zip file and began reviewing the contents.

```
# mkdir echo_data
# unzip echo/\(2018-07-01_13.17.01)_CIFT_RESULT.zip -d echo_data

Archive:  (2018-07-01_13.17.01)_CIFT_RESULT.zip
   creating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/cift_amazon_alexa_ACQUIRED_FILE.csv  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/cift_amazon_alexa_SKILL.csv  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/last_progress_log.txt  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/cift_amazon_alexa_ALEXA_DEVICE.csv  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/cift_amazon_alexa_SETTING_WIFI.csv  
   creating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/
   creating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/084999a0377632eae8e752c5f564e9108dd980db.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/a8bec2729885261ae45b0b306352b7db27303318.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/e57ffcac7e6b60a6f6c051a1a65d03744e495fd0.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/bdde773a520fc4d5b491e372752a437630d899b6.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/3cc4a8a03e0e06e7a2454ea8455604fc646b9c79.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/1bbb7f1246f1d4f50318a36b6e489e5cf75195a0.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/d1f67950cd0d4ed2a07d605cd07e18ea74c4ef22.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/58ebf604db8e4af5baec444c2bc029671b5473fd.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/897863f10ad87ee20d4a6420b391dbd7c145e772.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/781617e8e36540434807546e17097fcaae3d177b.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/99ad924cb599bbe93b67364e336b5f28e424474b.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/1840d4712abb8ed67fd2acf76f7c3e1d2b56a11d.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/2b8c27e2807996578e4baa0954d0340e632f3b6d.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/d9d5c9a5892dd94d4e1497ee5932d0a6a02d0a50.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/0fa8eab961d947113d0b7a946e192bd1230db1a6.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/70c7f283c560829fd1d221786c7d8d9f59a71c6b.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/211b100d593a50d4085a469a968a8d4e5a09b3fd.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/a93aecd622e1781ecf4713cdf2b5209f69e547a4.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/9fb911aa86480a4600715742cd9999dc3bae4223.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/3407d82d529e01bdafc6c721d4e88b73de4d0149.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/5a293239f1fe9ba165020113bd6e07e3dbc4cf73.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/0305c1b97c035364db7251e540c2cb39b9976091.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/7fad5de908aa8eed6c7c3e7c0a12b0935c48deef.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/f498518b586fbece8365c2e949ba52404aa52f68.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/7893eada8583fdcdb08b04ccc7d4729b51b2079b.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/ed391cf05fd263af1fefa3ecf632cb16bcd84508.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/cdb677cdc99f6b8bf361aadffd7a067ca80f24dc.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/0f0e6bf70d4162f51c53371ca04c8814f04d010d.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/6a1f0552a49d4adc55af0b7a5947fed9b6eb9138.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/ce9240f8f4e8944dfec2ca8f607e451e4d03a474.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/a586bfe14661258f0953aba910cd83519d890bfc.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/d79a708013b29d0388bea6f317bd8e4f03c9cd7e.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/ab1537414fd9ea14c86eff957fea0034a6f95bcf.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/060029277bfe4dbb5fbf4d98c6f797cecf5ce32a.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/80a7ae31b87ab557ab217822223909e12f06e2f9.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/c6177afb7ae9f3705bd933ae959a8d4aea200847.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/bc300ad077a7e42c57dafe3a3880c10ca3190207.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/e79edf779e8b655006960e5fdfbdb96e8964586e.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/639f82826aa814e3faa8dad3617c54b9c42589aa.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/8c5aa6d137058e2b9abb0993c113db02992be864.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/cee9e603b9c1ee58fa32d3e47797da7cfb996fa7.json  
   creating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/VOICE/
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/VOICE/(2018-05-15T15_07_41+0200)_TEXT(well i see you soon).wav  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/VOICE/(2018-05-15T15_07_07+0200)_TEXT(yes).wav  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/VOICE/(2018-05-15T15_05_43+0200)_TEXT(alexa).wav  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/VOICE/(2018-05-17T10_22_18+0200)_TEXT(yes).wav  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/VOICE/(2018-05-15T15_07_28+0200)_TEXT(did you have another story).wav  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/VOICE/(2018-05-16T15_35_18+0200)_TEXT(what's friendsgiving).wav  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/VOICE/(2018-05-30T11_09_58+0200)_TEXT(TRANSCRIPT NOT AVAILABLE).wav  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/VOICE/(2018-05-15T15_07_28+0200)_TEXT(alexa).wav  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/VOICE/(2018-05-16T15_34_58+0200)_TEXT(incredible).wav  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/VOICE/(2018-05-16T15_36_00+0200)_TEXT(what's four and six).wav  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/VOICE/(2018-05-15T15_07_48+0200)_TEXT(Bye).wav  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/VOICE/(2018-05-16T15_35_18+0200)_TEXT(What's friendsgiving_).wav  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/VOICE/(2018-05-15T15_07_34+0200)_TEXT(TRANSCRIPT NOT AVAILABLE).wav  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/VOICE/(2018-05-15T11_28_54+0200)_TEXT(Mode Changed (iSmartAlarm)).wav  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/VOICE/(2018-05-17T10_22_08+0200)_TEXT(Mode Changed (iSmartAlarm)).wav  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/VOICE/(2018-05-17T10_16_15+0200)_TEXT(Unknown).wav  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/VOICE/(2018-05-15T15_06_08+0200)_TEXT(TRANSCRIPT NOT AVAILABLE).wav  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/VOICE/(2018-05-16T15_35_27+0200)_TEXT(TRANSCRIPT NOT AVAILABLE).wav  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/VOICE/(2018-05-15T11_28_54+0200)_TEXT(tell i. smart alarm to arm my system).wav  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/VOICE/(2018-05-17T10_22_24+0200)_TEXT(TRANSCRIPT NOT AVAILABLE).wav  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/VOICE/(2018-05-15T15_06_12+0200)_TEXT(what's the weather for today).wav  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/VOICE/(2018-05-16T15_36_00+0200)_TEXT(alexa).wav  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/VOICE/(2018-05-15T11_27_05+0200)_TEXT(alexa tell i smart alarm to arm my system).wav  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/VOICE/(2018-05-17T10_16_07+0200)_TEXT(alexa play led zeppelin).wav  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/VOICE/(2018-05-15T15_06_03+0200)_TEXT(How are you_).wav  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/VOICE/(2018-05-15T15_06_12+0200)_TEXT(alexa).wav  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/VOICE/(2018-05-15T15_06_47+0200)_TEXT(what's up).wav  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/VOICE/(2018-05-15T15_05_43+0200)_TEXT(what time is it).wav  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/VOICE/(2018-05-15T15_07_48+0200)_TEXT(alexa).wav  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/VOICE/(2018-05-16T15_34_16+0200)_TEXT(what's up).wav  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/VOICE/(2018-05-15T15_05_54+0200)_TEXT(alexa say hello).wav  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/VOICE/(2018-05-17T10_22_18+0200)_TEXT(Mode Changed (iSmartAlarm)).wav  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/VOICE/(2018-05-16T15_34_37+0200)_TEXT(yes).wav  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/VOICE/(2018-05-15T15_07_18+0200)_TEXT(TRANSCRIPT NOT AVAILABLE).wav  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/VOICE/(2018-05-16T15_35_18+0200)_TEXT(alexa).wav  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/VOICE/(2018-05-16T15_34_16+0200)_TEXT(alexa).wav  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/VOICE/(2018-05-15T11_29_03+0200)_TEXT(no).wav  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/VOICE/(2018-05-17T10_22_08+0200)_TEXT(tell i. smart alarm to arm my system).wav  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/VOICE/(2018-05-15T15_06_12+0200)_TEXT(Weather in Le Pigeon, Switzerland (AccuWeather.com)).wav  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/VOICE/(2018-05-16T15_36_10+0200)_TEXT(TRANSCRIPT NOT AVAILABLE).wav  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/VOICE/(2018-05-15T15_06_28+0200)_TEXT(TRANSCRIPT NOT AVAILABLE).wav  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/VOICE/(2018-05-15T15_05_54+0200)_TEXT(Say hello).wav  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/VOICE/(2018-05-17T10_16_07+0200)_TEXT(Link Spotify).wav  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/VOICE/(2018-05-15T15_06_47+0200)_TEXT(TRANSCRIPT NOT AVAILABLE).wav  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/VOICE/(2018-05-15T11_27_12+0200)_TEXT(TRANSCRIPT NOT AVAILABLE).wav  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/VOICE/(2018-05-15T11_28_54+0200)_TEXT(alexa).wav  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/VOICE/(2018-05-15T15_06_47+0200)_TEXT(alexa).wav  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/VOICE/(2018-05-16T15_36_00+0200)_TEXT(What's four and six_).wav  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/VOICE/(2018-05-15T15_06_03+0200)_TEXT(alexa how are you).wav  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/VOICE/(2018-05-15T11_29_07+0200)_TEXT(TRANSCRIPT NOT AVAILABLE).wav  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/VOICE/(2018-05-17T10_22_08+0200)_TEXT(alexa).wav  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/VOICE/(2018-05-15T15_07_41+0200)_TEXT(alexa).wav  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/b7aae84f094d1b181eb654bb45657782b696c047.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/42b703c962fe38621a93ee478ea811f6c6060c40.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/2022746dc0a62a8969d352a39e76556e1860e404.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/184e9709ab299e08987e67ec7beb262d4056aa24.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/67acbf4f548be653f0be0755b1866c0a51d69ef4.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/70877451c52cb6708cb7bb5010a72ae1b2fc2450.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/690f40fd0a6c6c1a38f32b97b16cec05d1c22cc0.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/28040c96180a98560cc9457ed170fdd1456b9192.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/449f72e38f53962c99e69a37696999042de94719.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/ff23998fe7551c6396aee843a6321f6762267072.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/e6f9a864ba9f2afd73237748cb1b896924ea135f.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/082a17905eb233a9863b97ec9f6b5b8970191fbf.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/d0e340d9c12f404110c3dc737e2c6a16378045fe.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/93265231b9f2e19675bd048508bde11462f08c9a.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/7faff2d92632146d6a66994a0dcb69af83a761f5.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/d11061e75bb4ede10f9d7502c372df528f0203c4.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/f907e0abeaa1713c73d8e7e2c992e61696cbb079.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/afdd06417c5f1c8e07e7356412191fed05e57779.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/87aa2640b1a44e216f34f7b17257960676189d88.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/e880a49c888ede11b80bd5269f92bf68b33d562b.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/a4c633e05a3713bf9065460ad952db9079caf888.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/d0197feb4ffd41eff65264a1e5f8b8b248e8b431.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/81e823f529d4889073c5b4cc2028ca0445f0cc0a.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/a63936fe6724ba5cc86e195f09124cc093e135ea.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/a46e094e3393eb968dd447853520939b77b5bf7a.json  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/cift_amazon_alexa.db  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/cift_amazon_alexa_ACCOUNT.csv  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/cift_amazon_alexa_SETTING_MISC.csv  
  inflating: echo_data/(2018-07-01_13.17.01)_CIFT_RESULT/cift_amazon_alexa_TIMELINE.csv  
```
Then we set permissions on extracted files to read-only to ensure we don't accidentally modify any of the files.
```
# chmod -R 444 \(2018-07-01_13.17.01\)_CIFT_RESULT/
```

Then we listed the extracted files.
```
# ls echo_data/\(2018-07-01_13.17.01)_CIFT_RESULT
cift_amazon_alexa_ACCOUNT.csv        cift_amazon_alexa_SETTING_WIFI.csv
cift_amazon_alexa_ACQUIRED_FILE.csv  cift_amazon_alexa_SKILL.csv
cift_amazon_alexa_ALEXA_DEVICE.csv   cift_amazon_alexa_TIMELINE.csv
cift_amazon_alexa.db                 Evidence_Library
cift_amazon_alexa_SETTING_MISC.csv   last_progress_log.txt


# ls echo_data/\(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library
AmazonAlexaCloud

# ls echo_data/\(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud
0305c1b97c035364db7251e540c2cb39b9976091.json
060029277bfe4dbb5fbf4d98c6f797cecf5ce32a.json
082a17905eb233a9863b97ec9f6b5b8970191fbf.json
084999a0377632eae8e752c5f564e9108dd980db.json
0f0e6bf70d4162f51c53371ca04c8814f04d010d.json
0fa8eab961d947113d0b7a946e192bd1230db1a6.json
1840d4712abb8ed67fd2acf76f7c3e1d2b56a11d.json
184e9709ab299e08987e67ec7beb262d4056aa24.json
1bbb7f1246f1d4f50318a36b6e489e5cf75195a0.json
2022746dc0a62a8969d352a39e76556e1860e404.json
211b100d593a50d4085a469a968a8d4e5a09b3fd.json
28040c96180a98560cc9457ed170fdd1456b9192.json
2b8c27e2807996578e4baa0954d0340e632f3b6d.json
3407d82d529e01bdafc6c721d4e88b73de4d0149.json
3cc4a8a03e0e06e7a2454ea8455604fc646b9c79.json
42b703c962fe38621a93ee478ea811f6c6060c40.json
449f72e38f53962c99e69a37696999042de94719.json
58ebf604db8e4af5baec444c2bc029671b5473fd.json
5a293239f1fe9ba165020113bd6e07e3dbc4cf73.json
639f82826aa814e3faa8dad3617c54b9c42589aa.json
67acbf4f548be653f0be0755b1866c0a51d69ef4.json
690f40fd0a6c6c1a38f32b97b16cec05d1c22cc0.json
6a1f0552a49d4adc55af0b7a5947fed9b6eb9138.json
70877451c52cb6708cb7bb5010a72ae1b2fc2450.json
70c7f283c560829fd1d221786c7d8d9f59a71c6b.json
781617e8e36540434807546e17097fcaae3d177b.json
7893eada8583fdcdb08b04ccc7d4729b51b2079b.json
7fad5de908aa8eed6c7c3e7c0a12b0935c48deef.json
7faff2d92632146d6a66994a0dcb69af83a761f5.json
80a7ae31b87ab557ab217822223909e12f06e2f9.json
81e823f529d4889073c5b4cc2028ca0445f0cc0a.json
87aa2640b1a44e216f34f7b17257960676189d88.json
897863f10ad87ee20d4a6420b391dbd7c145e772.json
8c5aa6d137058e2b9abb0993c113db02992be864.json
93265231b9f2e19675bd048508bde11462f08c9a.json
99ad924cb599bbe93b67364e336b5f28e424474b.json
9fb911aa86480a4600715742cd9999dc3bae4223.json
a46e094e3393eb968dd447853520939b77b5bf7a.json
a4c633e05a3713bf9065460ad952db9079caf888.json
a586bfe14661258f0953aba910cd83519d890bfc.json
a63936fe6724ba5cc86e195f09124cc093e135ea.json
a8bec2729885261ae45b0b306352b7db27303318.json
a93aecd622e1781ecf4713cdf2b5209f69e547a4.json
ab1537414fd9ea14c86eff957fea0034a6f95bcf.json
afdd06417c5f1c8e07e7356412191fed05e57779.json
b7aae84f094d1b181eb654bb45657782b696c047.json
bc300ad077a7e42c57dafe3a3880c10ca3190207.json
bdde773a520fc4d5b491e372752a437630d899b6.json
c6177afb7ae9f3705bd933ae959a8d4aea200847.json
cdb677cdc99f6b8bf361aadffd7a067ca80f24dc.json
ce9240f8f4e8944dfec2ca8f607e451e4d03a474.json
cee9e603b9c1ee58fa32d3e47797da7cfb996fa7.json
d0197feb4ffd41eff65264a1e5f8b8b248e8b431.json
d0e340d9c12f404110c3dc737e2c6a16378045fe.json
d11061e75bb4ede10f9d7502c372df528f0203c4.json
d1f67950cd0d4ed2a07d605cd07e18ea74c4ef22.json
d79a708013b29d0388bea6f317bd8e4f03c9cd7e.json
d9d5c9a5892dd94d4e1497ee5932d0a6a02d0a50.json
e57ffcac7e6b60a6f6c051a1a65d03744e495fd0.json
e6f9a864ba9f2afd73237748cb1b896924ea135f.json
e79edf779e8b655006960e5fdfbdb96e8964586e.json
e880a49c888ede11b80bd5269f92bf68b33d562b.json
ed391cf05fd263af1fefa3ecf632cb16bcd84508.json
f498518b586fbece8365c2e949ba52404aa52f68.json
f907e0abeaa1713c73d8e7e2c992e61696cbb079.json
ff23998fe7551c6396aee843a6321f6762267072.json
VOICE

# ls echo_data/\(2018-07-01_13.17.01)_CIFT_RESULT/Evidence_Library/AmazonAlexaCloud/VOICE
(2018-05-15T11_27_05+0200)_TEXT(alexa tell i smart alarm to arm my system).wav
(2018-05-15T11_27_12+0200)_TEXT(TRANSCRIPT NOT AVAILABLE).wav
(2018-05-15T11_28_54+0200)_TEXT(alexa).wav
(2018-05-15T11_28_54+0200)_TEXT(Mode Changed (iSmartAlarm)).wav
(2018-05-15T11_28_54+0200)_TEXT(tell i. smart alarm to arm my system).wav
(2018-05-15T11_29_03+0200)_TEXT(no).wav
(2018-05-15T11_29_07+0200)_TEXT(TRANSCRIPT NOT AVAILABLE).wav
(2018-05-15T15_05_43+0200)_TEXT(alexa).wav
(2018-05-15T15_05_43+0200)_TEXT(what time is it).wav
(2018-05-15T15_05_54+0200)_TEXT(alexa say hello).wav
(2018-05-15T15_05_54+0200)_TEXT(Say hello).wav
(2018-05-15T15_06_03+0200)_TEXT(alexa how are you).wav
(2018-05-15T15_06_03+0200)_TEXT(How are you_).wav
(2018-05-15T15_06_08+0200)_TEXT(TRANSCRIPT NOT AVAILABLE).wav
(2018-05-15T15_06_12+0200)_TEXT(alexa).wav
(2018-05-15T15_06_12+0200)_TEXT(Weather in Le Pigeon, Switzerland (AccuWeather.com)).wav
(2018-05-15T15_06_12+0200)_TEXT(what's the weather for today).wav
(2018-05-15T15_06_28+0200)_TEXT(TRANSCRIPT NOT AVAILABLE).wav
(2018-05-15T15_06_47+0200)_TEXT(alexa).wav
(2018-05-15T15_06_47+0200)_TEXT(TRANSCRIPT NOT AVAILABLE).wav
(2018-05-15T15_06_47+0200)_TEXT(what's up).wav
(2018-05-15T15_07_07+0200)_TEXT(yes).wav
(2018-05-15T15_07_18+0200)_TEXT(TRANSCRIPT NOT AVAILABLE).wav
(2018-05-15T15_07_28+0200)_TEXT(alexa).wav
(2018-05-15T15_07_28+0200)_TEXT(did you have another story).wav
(2018-05-15T15_07_34+0200)_TEXT(TRANSCRIPT NOT AVAILABLE).wav
(2018-05-15T15_07_41+0200)_TEXT(alexa).wav
(2018-05-15T15_07_41+0200)_TEXT(well i see you soon).wav
(2018-05-15T15_07_48+0200)_TEXT(alexa).wav
(2018-05-15T15_07_48+0200)_TEXT(Bye).wav
(2018-05-16T15_34_16+0200)_TEXT(alexa).wav
(2018-05-16T15_34_16+0200)_TEXT(what's up).wav
(2018-05-16T15_34_37+0200)_TEXT(yes).wav
(2018-05-16T15_34_58+0200)_TEXT(incredible).wav
(2018-05-16T15_35_18+0200)_TEXT(alexa).wav
(2018-05-16T15_35_18+0200)_TEXT(what's friendsgiving).wav
(2018-05-16T15_35_18+0200)_TEXT(What's friendsgiving_).wav
(2018-05-16T15_35_27+0200)_TEXT(TRANSCRIPT NOT AVAILABLE).wav
(2018-05-16T15_36_00+0200)_TEXT(alexa).wav
(2018-05-16T15_36_00+0200)_TEXT(what's four and six).wav
(2018-05-16T15_36_00+0200)_TEXT(What's four and six_).wav
(2018-05-16T15_36_10+0200)_TEXT(TRANSCRIPT NOT AVAILABLE).wav
(2018-05-17T10_16_07+0200)_TEXT(alexa play led zeppelin).wav
(2018-05-17T10_16_07+0200)_TEXT(Link Spotify).wav
(2018-05-17T10_16_15+0200)_TEXT(Unknown).wav
(2018-05-17T10_22_08+0200)_TEXT(alexa).wav
(2018-05-17T10_22_08+0200)_TEXT(Mode Changed (iSmartAlarm)).wav
(2018-05-17T10_22_08+0200)_TEXT(tell i. smart alarm to arm my system).wav
(2018-05-17T10_22_18+0200)_TEXT(Mode Changed (iSmartAlarm)).wav
(2018-05-17T10_22_18+0200)_TEXT(yes).wav
(2018-05-17T10_22_24+0200)_TEXT(TRANSCRIPT NOT AVAILABLE).wav
(2018-05-30T11_09_58+0200)_TEXT(TRANSCRIPT NOT AVAILABLE).wav
```

# Analysis of Amazon Echo Evidence

## Review of extracted files
Below is a summary of each CSV file that represents the normalized database tables CIFT pulled from the alexa database. We analyzed the contents of the extracted files and noted any items of interest.

| Filename | Columns | Notable Items |
| - | - | - |
| cift_amazon_alexa_ACCOUNT.csv | customer_email<br>customer_name<br>phone_number<br>customer_id<br>comms_id<br>authenticated<br>source  | Jessie Pinkman, email jpinkman2018@gmail.com, is the customer for this Alexa device (customer id A2F07N8TDIAK5U) |
| cift_amazon_alexa_ACQUIRED_FILE.csv | id<br>operation_type<br>src_path<br>desc<br>saved_path<br>sha1<br>saved_timestamp<br>modified_timestamp<br>timezone | Provides mapping of information to json files in Evidence Library and wav audio files in Voice. <br> |
| cift_amazon_alexa_ALEXA_DEVICE.csv | device_account_name<br>device_family<br>device_account_id<br>customer_id<br>device_serial_number<br>device_type<br>sw_version<br>mac_address<br>address<br>postal_code<br>locale<br>search_customer_id<br>timezone<br>region<br>source | 2 Registered Alexa Devices:<br>1. Echo deviceAccountId:"A0529216353ZKG8WU9M6O" lists postal code: 98109, time zone Id of Europe/Zurich<br>2. Jessie's Alexa App's deviceAccountId:"AGQS6C6RFOZF" lists address Avenue Forel, Lausanne, VD, CH 1015 and time zone id of Europe/Paris |
| cift_amazon_alexa_SETTING_MISC.csv | name<br>value<br>device_serial_number<br>source<br>traffic_origin_address | <br>- Traffic Setting has an origin address of: 4204 Colby Ave, Everett WA 98203<br>- Third_party_services: I_HEART_RADIO, TUNE_IN, AMBER |
| cift_amazon_alexa_SETTING_WIFI.csv | ssid<br>security_method<br>pre_shared_key<br>source | Alexa device was connected to Wifi with SSID "ESC-IoT" (using WPA_PSK with preshared key "esc_iot_2018") |
| cift_amazon_alexa_SKILL.csv | title<br>developer_name<br>account_linked<br>release_date<br>short<br>desc<br>vendor_id<br>skill_id<br>source | Skills linked: Arlo, Nest Camera, Wink, iSmartAlarm |
| cift_amazon_alexa_TIMELINE.csv | date<br>time<br>timezone<br>MACB<br>source<br>sourcetype<br>type<br>user<br>host<br>short<br>desc<br>version<br>filename<br>inode<br>notes<br>format<br>extra | Provides integrating listing of events by data/time |


## Review of voice data
We correlated the src_path field of cift_amazon_alexa_ACQUIRED_FILE.csv to the contents of the extra field of cift_amazon_alexa_TIMELINE.csv (matching on the text after "User's voice: ") then listed what was actually human-audible to compare to waht Alexa thought it heard. The table below describes all relevant captures. The time is in UTC+02:00 (Kaliningrad Time).

| Date | Time | Audible Speaker(s) | Audible content | Alexa Summary | Supporting files |
| - | - | - | - | - | - |
| 1970-01-01 | 01:00:00.000 | Person 2 | Laughing | - | -(2018-05-15T15_06_08+0200)_TEXT(TRANSCRIPT NOT AVAILABLE).wav<br>-9fb911aa86480a4600715742cd9999dc3bae4223.json |
| 1970-01-01 | 01:00:00.000 | Jessie, Person 2 | <can’t decipher> | - | -(2018-05-15T15_06_28+0200)_TEXT(TRANSCRIPT NOT AVAILABLE).wav<br>-bc300ad077a7e42c57dafe3a3880c10ca3190207.json |
| 1970-01-01 | 01:00:00.000 | Jessie, Person 2 | “wow wonderful story I’m so impressed” | | -(2018-05-15T15_07_18+0200)_TEXT(TRANSCRIPT NOT AVAILABLE).wav<br>-d9d5c9a5892dd94d4e1497ee5932d0a6a02d0a50.json |
| 1970-01-01 | 01:00:00.000 | ? | “oooooh” (sounds like despair) | | - (2018-05-15T15_07_34+0200)_TEXT(TRANSCRIPT NOT AVAILABLE).wav<br>-5a293239f1fe9ba165020113bd6e07e3dbc4cf73.json |
| 1970-01-01 | 01:00:00.000 | Jessie, background voice singing or praying | “Alexa what forensic mean for you?" | | -(2018-05-16T15_35_27+0200)_TEXT(TRANSCRIPT NOT AVAILABLE).wav<br>-d1f67950cd0d4ed2a07d605cd07e18ea74c4ef22.json |
| 1970-01-01 | 01:00:00.000 | ? | "four and six cards” | | - (2018-05-16T15_36_10+0200)_TEXT(TRANSCRIPT NOT AVAILABLE).wav<br>-c6177afb7ae9f3705bd933ae959a8d4aea200847.json |
| 1970-01-01 | 01:00:00.000 | hear a voice (can’t make out what saying) and a beep | <can't decipher>, beep | | -(2018-05-17T10_22_24+0200)_TEXT(TRANSCRIPT NOT AVAILABLE).wav<br>-ab1537414fd9ea14c86eff957fea0034a6f95bcf.json |
| 1970-01-01 | 01:00:00.000 | - | - | - | - (2018-05-30T11_09_58+0200)_TEXT(TRANSCRIPT NOT AVAILABLE).wav<br>-449f72e38f53962c99e69a37696999042de94719.json |
| 2018-05-15 | 11:27:07.576 | Jessie | “Alexa tell ismart alarm to arm my system” | alexa tell i smart alarm to arm my system | -(2018-05-15T11_27_05+0200)_TEXT(alexa tell i smart alarm to arm my system).wav<br>-d11061e75bb4ede10f9d7502c372df528f0203c4.json |
| 2018-05-15 | 11:27:08.893	| [Alexa] | - | your home info error please relink | -d11061e75bb4ede10f9d7502c372df528f0203c4.json |
| 2018-05-15 | 11:27:17.142 | - | - | <not audible> | -81e823f529d4889073c5b4cc2028ca0445f0cc0a.json |
| 2018-05-15 | 11:28:54.246 | Jessie | “Alexa tell ismart alarm to arm my system” | alexa | -(2018-05-15T11_28_54+0200)_TEXT(alexa).wav<br>-42b703c962fe38621a93ee478ea811f6c6060c40.json |
| 2018-05-15 | 11:28:56.725 | Jessie | “tell ismart alarm to arm my system” | "tell i. smart alarm to arm my system" | -(2018-05-15T11_28_54+0200)_TEXT(tell i. smart alarm to arm my system).wav<br> -2022746dc0a62a8969d352a39e76556e1860e404.json |
| 2018-05-15 | 11:28:58.127 | [Alexa] | - | "Your Door is open, Are you sure you want to arm your system?" | -2022746dc0a62a8969d352a39e76556e1860e404.json |
| 2018-05-15 | 11:29:03.585 | Jessie | "no" | "no" | -(2018-05-15T11_29_03+0200)_TEXT(no).wav<br>-58ebf604db8e4af5baec444c2bc029671b5473fd.json |
| 2018-05-15 | 11:29:04.983 | [Alexa] | - | "Arming canceled" | -58ebf604db8e4af5baec444c2bc029671b5473fd.json | 
| 2018-05-15 | 11:29:12.264	| - | <nothing audible> | - | -(2018-05-15T11_29_07+0200)_TEXT(TRANSCRIPT NOT AVAILABLE).wav<br>-bdde773a520fc4d5b491e372752a437630d899b6.json |
| 2018-05-15 | 13:38:46.440	| [Alexa] | - | "Amazon is excited to bring you Alexa on your mobile device <br>so you can use voice to ask for weather, check traffic, control <br>your smart home, and more. Follow the link below to customize your settings." | -1840d4712abb8ed67fd2acf76f7c3e1d2b56a11d.json | 
| 2018-05-15 | 15:05:43.976	| other voice at the beginning, voice saying something in foreign language | “Alexa” then hear door shut...”Alexa”...then says something in another language...then says “what time is it" | alexa | -(2018-05-15T15_05_43+0200)_TEXT(alexa).wav<br>-80a7ae31b87ab557ab217822223909e12f06e2f9.json |
| 2018-05-15 | 15:05:50.362 | other voice at the beginning, voice saying something in foreign language and what time is it may be different? “Alexa” then hear door shut...”Alexa”...then says something in another language...then says “what time is it”	| "what time is it"	| - | -(2018-05-15T15_05_43+0200)_TEXT(alexa).wav<br>-e880a49c888ede11b80bd5269f92bf68b33d562b.json |
| 2018-05-15 | 15:05:50.982 | [Alexa] | - | "The time is 3:05 PM" | -e880a49c888ede11b80bd5269f92bf68b33d562b.json |
| 2018-05-15 | 15:06:00.501	| Jessie | “alexa say hello” | "alexa say hello" | -(2018-05-15T15_05_54+0200)_TEXT(alexa say hello).wav<br>-70877451c52cb6708cb7bb5010a72ae1b2fc2450.json |
| 2018-05-15 | 15:06:01.196 | [Alexa] | - | "Hi!" | -70877451c52cb6708cb7bb5010a72ae1b2fc2450.json |
| 2018-05-15 | 15:06:05.529 | Jessie | "alexa how are you" | "alexa how are you" | -(2018-05-15T15_06_03+0200)_TEXT(alexa how are you).wav<br>-a8bec2729885261ae45b0b306352b7db27303318.json |
| 2018-05-15 | 15:06:06.156 | [Alexa] | - | "All systems go!" | -a8bec2729885261ae45b0b306352b7db27303318.json |
| 2018-05-15 | 15:06:10.358 | [Discarded Recording] | Sounds like a strangers voice laughing | - | -(2018-05-15T15_06_08+0200)_TEXT(TRANSCRIPT NOT AVAILABLE).wav | 
| 2018-05-15 | 15:06:12.915 | Jessie, Person 2 | Voice 1: ?table for two? Voice 2: “Alexa what is the weather for today?” Voice 1: “?are you a beach?” | "alexa" | -(2018-05-15T15_06_12+0200)_TEXT(alexa).wav<br>-b7aae84f094d1b181eb654bb45657782b696c047.json<br>-(2018-05-15T15_06_12+0200)_TEXT(Weather in Le Pigeon, Switzerland (AccuWeather.com)).wav<br>-(2018-05-15T15_06_12+0200)_TEXT(what's the weather for today).wav | 
| 2018-05-15 | 15:06:15.124 | [Alexa] | - | "Right now in Le Pigeon, it's 16 degrees Celsius with mostly cloudy skies. Today's forecast has lots of clouds and thunderstorms, with a high of 17 degrees and a low of 9 degrees." | f907e0abeaa1713c73d8e7e2c992e61696cbb079.json |
| 2018-05-15 | 15:06:29.681 | [Discarded Recording] | Sounds like 2 voices, can't make out what they are saying | - | -(2018-05-15T15_06_28+0200)_TEXT(TRANSCRIPT NOT AVAILABLE).wav | 
| 2018-05-15 | 15:06:47.480 | Jessie, Person 2 | Voice 1: “Alexa” Voice ?: “you’re sleeping” Voice ?: “what’s up” | "alexa" | -(2018-05-15T15_06_47+0200)_TEXT(alexa).wav<br>-7faff2d92632146d6a66994a0dcb69af83a761f5.json |
| 2018-05-15 | 15:06:49.499 | Jessie, Person 2 | Voice 1: “Alexa” Voice ?: “you’re sleeping” Voice ?: “what’s up” | "what's up" | -(2018-05-15T15_06_47+0200)_TEXT(what's up).wav<br>-afdd06417c5f1c8e07e7356412191fed05e57779.json | 
| 2018-05-15 | 15:06:50.543 | [Alexa] | - | "Good afternoon" | -afdd06417c5f1c8e07e7356412191fed05e57779.json |
| 2018-05-15 | 15:06:50.544 | [Alexa] | - | "It's 3:06 PM." | -afdd06417c5f1c8e07e7356412191fed05e57779.json |
| 2018-05-15 | 15:06:50.545 | [Alexa] | - | "Here's what's up." | -afdd06417c5f1c8e07e7356412191fed05e57779.json | 
| 2018-05-15 | 15:06:50.546 | [Alexa] | - | "By the way, I just read an interesting story. Canadian actress Margot Kidder, famous for playing Lois Lane, is dead at 69.. Do you want to hear more about that?" | -afdd06417c5f1c8e07e7356412191fed05e57779.json |
| 2018-05-15 | 15:07:08.267 | Jessie, Person 2 |“Yes yes” | "yes"| -(2018-05-15T15_07_07+0200)_TEXT(yes).wav<br>-afdd06417c5f1c8e07e7356412191fed05e57779.json | 
| 2018-05-15 | 15:07:08.796 | [Alexa] | - | "Canadian actress Margot Kidder, famous for playing Lois Lane alongside Christopher Reeve's Superman, has passed away. She was 69.." | -afdd06417c5f1c8e07e7356412191fed05e57779.json | 
| 2018-05-15 | 15:07:25.106 | [Discarded Recording] | Possibly two voices “wow wonderful story I’m so impressed” | - | -(2018-05-15T15_07_18+0200)_TEXT(TRANSCRIPT NOT AVAILABLE).wav | 
| 2018-05-15 | 15:07:29.082 | Jessie | “Alexa did you have another story” | "alexa" | -(2018-05-15T15_07_28+0200)_TEXT(alexa).wav<br>-70c7f283c560829fd1d221786c7d8d9f59a71c6b.json<br>-(2018-05-15T15_07_28+0200)_TEXT(did you have another story).wav<br>-a63936fe6724ba5cc86e195f09124cc093e135ea.json | 
| 2018-05-15 | 15:07:31.390 | [Alexa] | - | "Sorry, I don't know that one." | -a63936fe6724ba5cc86e195f09124cc093e135ea.json |
| 2018-05-15 | 15:07:36.174 | [Discarded Recording] | Sounds like despair "oooooooh" | - | -(2018-05-15T15_07_34+0200)_TEXT(TRANSCRIPT NOT AVAILABLE).wav |
| 2018-05-15 | 15:07:41.402 | ?Jessie | “Alexa bye I see you soon” | "alexa" | -(2018-05-15T15_07_41+0200)_TEXT(alexa).wav<br>-639f82826aa814e3faa8dad3617c54b9c42589aa.json<br>-(2018-05-15T15_07_41+0200)_TEXT(well i see you soon).wav<br>-0fa8eab961d947113d0b7a946e192bd1230db1a6.json |
| 2018-05-15 | 15:07:43.791 | [Alexa] | - | - | 0fa8eab961d947113d0b7a946e192bd1230db1a6.json |
| 2018-05-15 | 15:07:48.861 | ?Jessie | “Alexa bye see you” | "alexa" | -(2018-05-15T15_07_48+0200)_TEXT(alexa).wav<br>-d0197feb4ffd41eff65264a1e5f8b8b248e8b431.json<br>-7893eada8583fdcdb08b04ccc7d4729b51b2079b.json | 
| 2018-05-15 | 15:07:50.605 | [Alexa] | - | "Goodbye." | -7893eada8583fdcdb08b04ccc7d4729b51b2079b.json | 
| 2018-05-16 | 15:34:16.981 | ? | Background voice sounds like “….dead to me” | “Alexa”….”What’s up” | -(2018-05-16T15_34_16+0200)_TEXT(alexa).wav<br>-184e9709ab299e08987e67ec7beb262d4056aa24.json<br>-(2018-05-16T15_34_16+0200)_TEXT(what's up).wav<br>-3cc4a8a03e0e06e7a2454ea8455604fc646b9c79.json | 
| 2018-05-16 | 15:34:19.230 | [Alexa] | - | "Good afternoon" | -3cc4a8a03e0e06e7a2454ea8455604fc646b9c79.json | 
| 2018-05-16 | 15:34:19.231 | [Alexa] | - | "It's 3:34 PM." | -3cc4a8a03e0e06e7a2454ea8455604fc646b9c79.json | 
| 2018-05-16 | 15:34:19.232 | [Alexa] | - | "Here's what's up." | -3cc4a8a03e0e06e7a2454ea8455604fc646b9c79.json |
| 2018-05-16 | 15:34:19.233 | [Alexa] | - | "By the way, I just read an interesting story. the cost of chicken wings has slumped 37% since fall, and now sits at a seasonal 4-year low. Do you want to hear more about that?" | -3cc4a8a03e0e06e7a2454ea8455604fc646b9c79.json |
| 2018-05-16 | 15:34:38.067 | Jessie, background voice | “yes” | “yes” | -(2018-05-16T15_34_37+0200)_TEXT(yes).wav<br>-3cc4a8a03e0e06e7a2454ea8455604fc646b9c79.json | 
| 2018-05-16 | 15:34:38.933 | [Alexa] | - | "Wholesale chicken wing prices in the U.S. reached as high as $2 a pound in September, the highest ever in U.S. Department of Agriculture data for the past 7 years. Since then, the cost has slumped about 37% and sits at a seasonal 4-year low. The popularity of wings tends to peak during Super Bowl season.." | -3cc4a8a03e0e06e7a2454ea8455604fc646b9c79.json | 
| 2018-05-16 | 15:35:01.260 | Jessie | “incredible” | “incredible” | -(2018-05-16T15_34_58+0200)_TEXT(incredible).wav<br>-a4c633e05a3713bf9065460ad952db9079caf888.json | 
| 2018-05-16 | 15:35:02.489 | [Alexa] | - | "I'm not quite sure how to help you with that." | -a4c633e05a3713bf9065460ad952db9079caf888.json | 
| 2018-05-16 | 15:35:18.380 | Jessie | Background voice sounds like praying or singing “what Alexa what’s forensic means for you? | "alexa what's friendsgiving" | -(2018-05-16T15_35_18+0200)_TEXT(alexa).wav<br>-781617e8e36540434807546e17097fcaae3d177b.json<br>-(2018-05-16T15_35_18+0200)_TEXT(what's friendsgiving).wav<br>-cee9e603b9c1ee58fa32d3e47797da7cfb996fa7.json | 
| 2018-05-16 | 15:35:21.507 | [Alexa] | - | "'friendsgiving' is usually defined as a thanksgiving feast held by and for someone's friends." | -cee9e603b9c1ee58fa32d3e47797da7cfb996fa7.json | 
| 2018-05-16 | 15:36:00.257 | Jessie, background voice | “Alexa….what’s forensic?” | "alexa what's four and six" | -(2018-05-16T15_36_00+0200)_TEXT(alexa).wav<br>-f498518b586fbece8365c2e949ba52404aa52f68.json<br>-(2018-05-16T15_36_00+0200)_TEXT(what's four and six).wav<br>-3407d82d529e01bdafc6c721d4e88b73de4d0149.json | 
| 2018-05-16 | 15:36:06.600 | [Alexa] | - | "4 plus 6 equals 10." | -3407d82d529e01bdafc6c721d4e88b73de4d0149.json | 
| 2018-05-16 | 15:36:12.761 | [Discarded Recording] | Sounds like saying….“four and six cards” | - | -(2018-05-16T15_36_10+0200)_TEXT(TRANSCRIPT NOT AVAILABLE).wav |
| 2018-05-17 | 10:16:08.742 | Jessie, background noise | “Alexa play Led Zepplin” | "alexa play led zeppelin" | -(2018-05-17T10_16_07+0200)_TEXT(alexa play led zeppelin).wav<br>-082a17905eb233a9863b97ec9f6b5b8970191fbf.json |
| 2018-05-17 | 10:16:09.458 |  [Alexa] | - | "To play Spotify, link your premium account first using the Alexa App." | -082a17905eb233a9863b97ec9f6b5b8970191fbf.json | 
| 2018-05-17 | 10:16:20.470 | Background noise | background noise maybe laughing | unknown | -(2018-05-17T10_16_15+0200)_TEXT(Unknown).wav | 
| 2018-05-17 | 10:22:08.869 | Jessie | “Alexa tell ismart alarm to arm my system” | "alexa tell i. smart alarm to arm my system" | -(2018-05-17T10_22_08+0200)_TEXT(alexa).wav<br>-a586bfe14661258f0953aba910cd83519d890bfc.json<br>-(2018-05-17T10_22_08+0200)_TEXT(tell i. smart alarm to arm my system).wav<br>-0305c1b97c035364db7251e540c2cb39b9976091.json | 
| 2018-05-17 | 10:22:13.530 | [Alexa] | - | "Your Door is open, Are you sure you want to arm your system?" | -0305c1b97c035364db7251e540c2cb39b9976091.json |
| 2018-05-17 | 10:22:19.409 | Jessie | "yes" | "yes" | -(2018-05-17T10_22_18+0200)_TEXT(yes).wav<br>-2b8c27e2807996578e4baa0954d0340e632f3b6d.json | 
| 2018-05-17 | 10:22:20.720 | [Alexa] | - | "Your system will set to Arm in 30 seconds." | -2b8c27e2807996578e4baa0954d0340e632f3b6d.json |
| 2018-05-17 | 10:22:25.439 | [Discarded Recording] | hear a voice (can’t make out what saying) and a beep | - | -(2018-05-17T10_22_24+0200)_TEXT(TRANSCRIPT NOT AVAILABLE).wav |
| 2018-05-30 | 11:10:01.989 | [Discarded Recording] | hear 2-3 voices can’t make out what they are saying | - | -(2018-05-30T11_09_58+0200)_TEXT(TRANSCRIPT NOT AVAILABLE).wav | 




The 1970 dates are odd, but we can tell by the created date/time on the wav file when these audios were captured by Alexa. 

Also, notable is Alexa is told to set the iSmartAlarm the day of the incident even though the door is open. It should be noted from the challenge details that Jessie Pinkman had the IoT security systems installed because he feared attacks from a rival gang and that Jessie kept the alarm engaged in “Home” mode whenever he was inside the drug lab.
So what is "Home" mode?
> Home - Only Contact Sensors Sensors are activated when the system is set to Home. Set your system to this mode when you're home. Pets will not trigger the alarm when they move around in the house.

