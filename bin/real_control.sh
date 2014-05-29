#!/bin/bash

PIDFILE="${OPENSHIFT_TMP_DIR}/seafile.pid"
LOGFILE="${OPENSHIFT_TMP_DIR}/seafile.log"

date > $LOGFILE
echo "Running control" >> $LOGFILE

case $1 in
  start)
    echo "Running start" >> $LOGFILE
   # while true ; do 
   #   ncat -l -p 8080 -c 'echo -e "HTTP/1.1 200 OK\n\n $(date)"'
   # done &
   # echo $! > $PIDFILE
    echo "Ran start" >> $LOGFILE
  ;;
  stop)
    echo "Running stop" >> $LOGFILE
    if xargs -a $PIDFILE kill; then
      echo -n "Killed " >> $LOGFILE
      cat $PIDFILE >> $LOGFILE
    else
      echo "Kill didn't work." >> $LOGFILE
      echo -n "Trying kill -9 " >> $LOGFILE
      cat $PIDFILE >> $LOGFILE
      xargs -a $PIDFILE kill -9
    fi
    rm $PIDFILE
    echo "Ran stop" >> $LOGFILE
  ;;
esac
