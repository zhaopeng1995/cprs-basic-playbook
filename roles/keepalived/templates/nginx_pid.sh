#!/bin/bash

A=`ps -C nginx --no-header |wc -l` 

if [ $A -eq 0 ];then 

{{nginx_sbin_path}}

sleep 3

if [ `ps -C nginx --no-header |wc -l` -eq 0 ];then

service keepalived stop

fi

fi
