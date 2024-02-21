#!/bin/bash
#set -e

function fdfs_start() {
    FASTDFS_LOG_FILE="${FASTDFS_BASE_PATH}/logs/${FASTDFS_MODE}d.log"
    PID_NUMBER="${FASTDFS_BASE_PATH}/data/fdfs_${FASTDFS_MODE}d.pid"
    
    echo "try to start the $FASTDFS_MODE node..."
    #rm -f "$FASTDFS_LOG_FILE"
    rm -f "$PID_NUMBER"
    fdfs_${FASTDFS_MODE}d /etc/fdfs/${FASTDFS_MODE}.conf start
    TIMES=30
    while [ ! -f "$PID_NUMBER" -a $TIMES -gt 0 ]
    do
        sleep 1s
        TIMES=`expr $TIMES - 1`
    done

    tail -f "$FASTDFS_LOG_FILE"
}

function health_check() {
    if [ $HOSTNAME = "localhost.localdomain" ]; then
        return 0
    fi
    # Storage OFFLINE, restart storage.
    monitor_log=/tmp/monitor.log
    check_log=/tmp/health_check.log
    while true; do
        fdfs_monitor /etc/fdfs/client.conf 1>$monitor_log 2>&1
        cat $monitor_log|grep $HOSTNAME > $check_log 2>&1
        error_log=$(egrep "OFFLINE" "$check_log")
        if [ ! -z "$error_log" ]; then
            cat /dev/null > "$FASTDFS_LOG_FILE"
            fdfs_start
        fi
        sleep 10
    done
}

if [ "$1" = "monitor" ] ; then
    fdfs_monitor /etc/fdfs/client.conf
    exit 0
elif [ "$FASTDFS_MODE" = "storage" ] ; then
    fdfs_start
elif [ "$FASTDFS_MODE" = "tracker" ] ; then
    fdfs_start
else
    echo "No mode parameters were received."
    exit 1
fi
