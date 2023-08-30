#!/bin/bash
#Vars from Configmap
domain="$clusterfqdn"
email="$admin_email"

#Start Apache
service apache2 start && sleep 10

#run certbot in automode
certbot certonly --webroot -w /var/www/html --non-interactive --agree-tos -d "$domain" --email "$email"
sleep 30
#Create the secret
./kubectl delete secret sitecert
./kubectl create secret tls sitecert --cert=/etc/letsencrypt/live/"$domain"/fullchain.pem --key=/etc/letsencrypt/live/"$domain"/privkey.pem
