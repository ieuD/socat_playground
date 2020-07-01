#!/bin/bash

#global values
client="A1"
var=$(hostname -I)
read -ra VALUES <<< "$var" 
echo "IP is: ${VALUES[0]}"




generate_and_send_packages(){
    arr=() # Array definition for packets
    numbers=($(shuf -i 1-20 -n 21))

    # creating packages NOTE: time_stamp must be must include a metric format that catches processor packet creation time.
    #otherwise timestamp will be same. that's why i used sleep command.
    
    count=0
    len=${#numbers[@]}
    while [ $count -lt $len ];
    do
    current_time=$(date "+%Y.%m.%d-%H.%M.%S.%N") # to alternative for timestamp. epoch can be used for time stamping. 
    sleep 0.3
    message="{id:”131213035”,no:”${numbers[$count]}”,msg:”packet from client:$client”,timestamp:$current_time}"

     if [[ ${numbers[$count]} -le 10 ]]
        then
        echo ${message} | socat -u -d  - TCP:"${VALUES[0]}:5001"  2>> ../log/client_err.txt  
        echo "{CLIENT}-->{TCP}:${message}" | tee -a ../log/client.txt
        else     
        echo ${message} | socat -u -d -x - UDP-SENDTO:"${VALUES[0]}:5001" | 2>> ../log/client_err.txt
        echo "{CLIENT}-->{UDP}:${message}" | tee -a ../log/client.txt
      
        fi
    count=$(( $count + 1 ))
    done
} 

generate_and_send_packages #execute func

#

