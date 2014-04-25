/etc/rsyslog.conf
内に
kern.info     /var/log/iptables.log
を追加して保存。
/etc/init.d/rsyslog restart
を実行する。
