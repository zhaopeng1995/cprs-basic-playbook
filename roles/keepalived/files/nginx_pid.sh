#!/bin/bash

A=`ps -C nginx --no-header |wc -l` 

if [ $A -eq 0 ];then 

/usr/local/nginx/sbin/nginx

sleep 3

if [ `ps -C nginx --no-header |wc -l` -eq 0 ];then

service keepalived stop

fi

fi
