#!/usr/bin/expect -f
# auto ssh script
# provide port as command line argument
# credits: http://casual-effects.blogspot.in/2013/05/ssh-with-command-line-password-on-os-x.html

set host "host"
set password "password"
set portnum [lindex $argv 0]

spawn ssh $host -p $portnum
 
expect {
"(yes/no)?"	{
	send -- "yes\r"
	exp_continue
	}
"*password:*" {
	send -- "$password\r"
	}
}

interact
