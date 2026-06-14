#!/bin/bash
#scrpit that send a mail when device is turn on...

#setup instruction
<<comment
######################################
step 1: setup postfix to send emalis
######################################
-- mail service provided by smtp.gmail.com
-- postfix used as mail transfer agent
>  apt install postfix -y
>  nano /etc/postfix/main.cf
-- set relyhost as [smtp.gmail.com]:587
-- and hostname (your machine name) check hostname
---------- paste it end of file-------------
smtp_sasl_password_maps = hash:/etc/postfix/sasl/sasl_passwd
#Enables SASL authentication for postfix
smtp_sasl_auth_enable = yes
smtp_tls_security_level = encrypt
#Disallow methods that allow anonymous authentication
smtp_sasl_security_options = noanonymous
----------------------------------------------

-- create authentication of a gmail to send mail
>  mkdir sasl && cd sasl
>  nano sasl_passwd
------config like-------
[smtp.gmail.com]:587 your_gamil@gmail.com:XXXXXXXXXXXXXXXX  
------------------------
note:passwd is generated using app security passwd provided by google in app security not you account login passwd
>  postmap sasl_passwd #create a hash password database 

-- install mailutils for mail send command
>  apt install mailutils

################################################
step 2: make a service that run this_script when system on
################################################
-- create this_sript or paste this one
>  nano /usr/loacl/bin/this_script.sh # save this_script in this location
-- make sure it have executable pemission
>  chmod 700 /usr/local/bin/this_script.sh

-- create a systemd service that run when system on create service in
>  nano /etc/systemd/system/this_script.service
-------config like--------
INI

[Unit]
Description=this is a mail send script when system on
After=network.target

[Service]
Type=oneshot
ExecStart=/usr/local/bin/this_script.sh


[Install]
WantedBy=multi-user.target
----------------------------
-- network.target : run when all componet up(usb,network-interfaces,speakers,etc)
-- network-online.target : for run script when system online (connect to internet)
-- oneshot : run only one time then stop this_script.servcie

-- enable and start this_script.service 
> systemctl daemon-reload --> load all services
> systemctl enable this_script.service --> make this script run always when system up
> systemctl start this_script.service  --> starting this_script service
> systemctl status this_script.service  --> give status os this_service active/inactive enable/diable

--- now when system on this_script.service execute only one time and send mail
comment

#body of mail -- modify according to your need...
body="your device $(hostname) up on $(date)"


#used to give some time for network connectivety
#NOTE: If device not connect to internet then this_script fail to send mail and (exit 1) make sure connect to a wifi under 10 sec after power-on...
sleep 10

#MAIL_ADDDRESS= <your_mail_address@gmail.com> #where this mail have to send
#send mail using mail command
echo $body | mail -s "Login Alert!!" $MAIL_ADDRESS

