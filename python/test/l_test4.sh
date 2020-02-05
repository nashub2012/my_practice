#!/bin/sh

# Below, see a sample of /var/log/messages.
#
# ---------- begin sample log extract ----------
# Jan 20 03:25:08 fakehost logrotate: ALERT exited abnormally with [1]
# Jan 20 03:25:09 fakehost run-parts(/etc/cron.daily)[20447]: finished logrotate
# Jan 20 03:26:21 fakehost anacron[28969]: Job 'cron.daily' terminated
# Jan 20 03:26:22 fakehost anacron[28969]: Normal exit (1 job run)
# Jan 20 03:30:01 fakehost CROND[31462]: (root) CMD (/usr/lib64/sa/sa1 1 1)
# Jan 20 03:30:01 fakehost CROND[31461]: (root) CMD (/var/system/bin/sys-cmd -F > /dev/null 2>&1)
# Jan 20 05:03:03 fakehost ntpd[3705]: synchronized to time.faux.biz, stratum 2
# Jan 20 05:20:01 fakehost rsyslogd: [origin software="rsyslogd" swVersion="5.8.10" x-pid="20438" x-info="http://www.rsyslog.com"] start
# Jan 20 05:22:04 fakehost cs3[31163]:  Q: ".../bin/rsync -LD ": symlink has no referent: "/var/syscmds/fakehost/runit_scripts/etc/runit/service/superImportantService/run"#012Q: ".../bin/rsync -LD ": rsync error: some files/attrs were not transferred (see previous errors) (code 23) at main.c(1039) [sender=3.0.6]
# Jan 20 05:22:04 fakehost cs3[31163]:  I: Last 2 quoted lines were generated by "/usr/local/bin/rsync -LD --recursive --delete --password-file=/var/syscmds/modules/rsync_password /var/syscmds/fakehost syscmds@fakehost::syscmds_rsync"
# Jan 20 05:22:08 fakehost cs3[31163]:  Q: ".../sbin/sv restart": ok: run: /export/service/cool-service: (pid 32323) 0s
# Jan 20 05:22:08 fakehost cs3[31163]:  I: Last 1 quoted lines were generated by "/sbin/sv restart /export/service/cool-service"
# Jan 20 05:22:09 fakehost cs3[31163]:  R: cs3:  The cool service on fakehost does not appear to be communicating with the cool service leader.  Automating a restart of the cool service in attempt to resolve the communication problem.
# Jan 20 05:22:37 fakehost ACCT_ADD: WARNING: Manifest /var/syscmds/inputs/config-general/doit.txt has been processed already, bailing
# ---------- end sample log extract ----------
#
# Write a script which parses /var/log/messages and generates a CSV that looks like the following
#
# ---------- begin sample output ----------
# minute,total_messages,logrotate,run-parts,anacron,CROND,ntpd,rsyslogd,cs3,ACCT_ADD
# Jan 20 03:25,22,1,2,3,3,2,0,7,4
# Jan 20 03:26,2,0,0,0,0,0,0,0,2
# Jan 20 03:30,20,9,8,3,0,0,0,0,0
# Jan 20 05:03,10,4,6,0,0,0,0,0,0
# ---------- end sample output ------------

# NOTE: that the list of programs is not fixed, but needs to be dynamicly
# generated

# AWB NOTES: Again with bash here. Probably should have used python
# but again, I felt like stopping to google something would have been
# frowned upon

# I accidentally deleted my solution
# but it looked something like this