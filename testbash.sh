#!/bin/bash
i=0
for line in `docker ps -a --format "table {{.ID}}\t{{.Image}}\t{{.Names}}\t{{.Status}}" |grep hyperledger/fabric-peer | sort -r | awk  '{print $3}'`
do 
    peer[${i}]=$line
    let i=${i}+1
done

beginStr='{"PeerNodes":['

for var in ${peer[@]};
do
    beginStr=$beginStr'"'$var'",'
done
beginStr=${beginStr%?}
beginStr=$beginStr'],"PeerNodesCount":"'${#peer[@]}'","OrderNodes":['

i=0

for line in `docker ps -a --format "table {{.ID}}\t{{.Image}}\t{{.Names}}\t{{.Status}}" |grep hyperledger/fabric-orderer | sort -r | awk  '{print $3}'`
do 
    order[${i}]=$line
    let i=${i}+1
done

for var2 in ${order[@]};
do
    beginStr=$beginStr'"'$var2'",'
done
beginStr=${beginStr%?}'],"OrderNodesCount":"'${#order[@]}'"}'
echo $beginStr


