#! /bin/sh
module="seeking"
device="seeking"
mode="666"
group=0

load() {
    insmod ./$module.ko $* || exit 1

    rm -f /dev/${device}

    major=$(awk -v device="$device" '$2==device {print $1}' /proc/devices)
    mknod /dev/${device} c $major 0

    chgrp $group /dev/$device
    chmod $mode /dev/$device
}

unload() {
    rm -f /dev/${device}
    rmmod $module || exit 1
}

arg=${1:-"load"}
case $arg in
    load)
        load ;;
    unload)
        unload ;;
    reload)
        ( unload )
        load
        ;;
    *)
        echo "Usage: $0 {load | unload | reload}"
        echo "Default is load"
        exit 1
        ;;
esac

