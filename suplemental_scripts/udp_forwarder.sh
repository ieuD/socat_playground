#!/bin/bash


var=$(hostname -I)
read -ra VALUES <<< "$var" 
echo "IP is: ${VALUES[0]}"
read str && current_time=$(date "+%Y.%m.%d-%H.%M.%S.%N") 



echo ${str} | socat -u - UDP:"${VALUES[0]}:10001" 2>> ../log/router_err.txt 
echo "{ROUTER}-->{UDP}:[${str}] {${current_time}}" | tee -a ../log/route.txt

