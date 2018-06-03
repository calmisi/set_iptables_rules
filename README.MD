# How to use `iptables-set-ports-transfer.sh`
The `iptables-set-ports-transfer.sh` script is used to setup the iptables rules for our group's server node0, which gives the node1 ~ node10 the ability to access Internet by NAT and map the their vnc ports to node0.

- If the server node0 has rebooted and the iptables are empty, you can just run the script `iptables-set-ports-transfer.sh`.
```shell
/bin/bash iptables-set-ports-transfer.sh
```

- If the iptables is not empty, you need to firstly clear the existing rules by running `iptables -F`,
then run the script `iptables-set-ports-transfer.sh`.
```shell
iptables -F
/bin/bash iptables-set-ports-transfer.sh
```


# More about iptables
1. save the current rules of iptables to a sepcified files
```shell
iptables-save >> path-to-file/filename
```

2. if the rules of iptables are cleared after reboot, you can run this to restore the rules from a specified file
```shell
iptables-restore < path-to-file/filename
```

3. if you run `iptables-save` it just print the current iptables rules. 
Otherwise, you can run `service iptables save` to save the rules to `/etc/sysconfig/iptables`, form which it can reload the configuration after reboot 
