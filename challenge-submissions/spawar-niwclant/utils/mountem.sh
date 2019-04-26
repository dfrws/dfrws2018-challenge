#!/bin/bash

# Function:
#     Mounts the USERDATA partition from android disk image and creates a user-readable mirror of it
#     (Partition offset is automatically found via "mmls")
# Requirements:
#     Path to disk image (default ~/dfrws/samsung/blk0_sda.bin)
#     caller must be a sudoer

IMG=~/dfrws/samsung/blk0_sda.bin
RAWMNT=/mnt/userdata_raw
NICEMNT=/mnt/userdata

# Change to "" if you don't use sudo (e.g. when running this script as root)
SUDO_CMD=sudo


#
# Prints program usage, then exits nonzero
function usage() {
	cat >&2 << EOF
Usage: $0 [ OPTION | FILE ]
Finds and mounts the USERDATA partition in an Android raw disk image.

Caller must have root privileges or be a sudoer

   -h, --help, -?   print this help
   -u               unmount partitions instead of mounting them
   [FILE]           the name of the raw disk image containing a partition named USERDATA
EOF
	exit 1
}

#
# Computes the offset of the "USERDATA" partition in a disk image file
# Arguments:
#   $1: the name of the disk image file to search
# Output:
#   The offset of the USERDATA partition, in bytes, from the beginning of the file, or no text
# Returns 0 if image was parsed, nonzero otherwise
function get_userdata_offset() {
	local img="$1"
	mmls "${img}" | awk '/Units are in/ { blksiz=$4; gsub("-byte","", blksiz); } /USERDATA$/ { if (blksiz != "") print $3*blksiz }'
}


#
# Unmount $NICEMNT and $RAWMNT
# Arguments: none
# Returns 0 on success, 1 on failure
function do_unmount() {
	${SUDO_CMD} umount "${NICEMNT}"
	local r1=$?
	${SUDO_CMD} umount "${RAWMNT}"
	local r2=$?
	if [[ "${r1}" != 0 || "${r2}" != 0 ]] ; then
		echo "unmount failed."
		return 1
	fi
	return 0
}



#
#
# "Main" function
if [[ "$#" > 1 ]] ; then
	echo "$0: Too many arguments." >&2
	usage

elif [[ "$#" == 1 ]] ; then
	case "$1" in
	# help
	"-h"|"--help"|"-?")
		usage
		;;

	# unmount switch
	"-u")
		do_unmount
		exit $?
		;;

	# Filename argument
	*)
		IMG="$1"
		;;
	esac
fi

if [[ -d "${IMG}" || ! -r "${IMG}" ]] ; then
	echo "$0: Unable to read image file '${IMG}'." >&2
	exit 1
fi

# exit on fail
set -e

${SUDO_CMD} mkdir -p "${RAWMNT}"
${SUDO_CMD} mkdir -p "${NICEMNT}"

USERDATA_OFFSET=$(get_userdata_offset "${IMG}")
if [[ -z "${USERDATA_OFFSET}" ]] ; then
	echo "$0: unable to find the USERDATA partition in '${IMG}' with mmls." >&2
fi

sudo mount -o loop,offset=${USERDATA_OFFSET},ro "${IMG}" "${RAWMNT}"
sudo bindfs -u ${USER} -p 555 "${RAWMNT}" "${NICEMNT}"

echo "USERDATA volume is user-readable at '${NICEMNT}' and root-readable at '${RAWMNT}'"
