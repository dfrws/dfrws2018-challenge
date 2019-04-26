#!/bin/bash

#!/bin/bash

TZ=Europe/Zurich # from userdata/property/persist.sys.timezone, GMT+2 during the summer
MNT="/mnt/userdata"
L2T=`which log2timeline.py`

function make_plaso_timeline() {
	"${L2T}" -z "${TZ}" --parsers sqlite "${plaso_db}" "${MNT}"
  "${L2T}" -z "${TZ}" "${plaso_db}" "${MNT}"
}

# "Main"
# bail on any error
set -e

plaso_db="dfrws-plaso.db"

make_plaso_timeline
