#!/bin/sh
module="completion"
device="completion"
mode="666"
group=0


    insmod ./$module.ko $* || exit 1

    rm -f /dev/${device}

    major=$(awk -v device="$device" '$2==device {print $1}' /proc/devices)
    mknod /dev/${device} c $major 0

    chgrp $group /dev/$device
    chmod $mode /dev/$device


