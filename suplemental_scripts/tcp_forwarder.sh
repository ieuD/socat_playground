#!/bin/bash


var=$(hostname -I)
read -ra VALUES <<< "$var" 
echo "IP is: ${VALUES[0]}"
read str && current_time=$(date "+%Y.%m.%d-%H.%M.%S.%N") 



echo ${str} | socat -u - TCP:"${VALUES[0]}:20002" 2>> ../log/router_err.txt 
echo "{ROUTER}-->{TCP}:[${str}] {${current_time}}" | tee -a ../log/route.txt

