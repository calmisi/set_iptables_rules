#!/bin/bash


iptables -A FORWARD -s 192.168.0.0/24 -j ACCEPT
iptables -A FORWARD -d 192.168.0.0/24 -j ACCEPT
iptables -t nat -A POSTROUTING -o ens5 -s 192.168.0.0/24 -j MASQUERADE

nodeid=1;
vnc_port=1;
while [ $nodeid -lt 11 ];
do
	vnc_port=1;
	while [ $vnc_port -lt 10 ];
	do
		node_no=$nodeid;
		if [ $node_no -lt 10 ];then
			node_no="0${node_no}"
		fi

		#for vnc port transfer
		iptables -t nat -A PREROUTING -d 202.114.10.157 -p tcp --dport 59${node_no}${vnc_port} -j DNAT --to-destination 192.168.0.1${node_no}:590${vnc_port}
		#for ssh port transfer
		iptables -t nat -A PREROUTING -d 202.114.10.157 -p tcp --dport 22${node_no} -j DNAT --to-destination 192.168.0.1${node_no}:22
		let vnc_port+=1; 
	done

	let nodeid+=1;
done
