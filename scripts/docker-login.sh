#!/usr/bin/expect -f  
set username docker
set password docker
set timeout 10  

spawn docker login docker.***.com.cn 
expect {  
"Username*:" { send "$username\r"; exp_continue}  
"Password:" { send "$password\r" }  
}  
expect eof  
