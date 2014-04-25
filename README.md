iptables.sh内の
ALLOW_IPに許可するIPを記述
LOCAL_IPにそのマシンのIPを記述

/etc/rsyslog.conf
内に
kern.info     /var/log/iptables.log
を追加して保存。
/etc/init.d/rsyslog restart
を実行する。
