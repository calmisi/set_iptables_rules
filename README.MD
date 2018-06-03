# save the current rules of iptables to a sepcified files
iptables-save >> path-to-file/filename

# if the rules of iptables are cleared after reboot,
# you can run this to restore the rules from a specified file
iptables-restore < path-to-file/filename

# if you run `iptables-save` it just print the current iptables rules,

# otherwise, you can run
service iptables save 
# to save the rules to /etc/sysconfig/iptables
# form which it can reload the configuration after reboot 
