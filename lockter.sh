#!/bin/bash
file=$1
  
while read files ; do

 expect << EOF
   set timeout 100
   spawn zip -er $files.zip $files 
   expect "Enter password:"
   send "password\r"
   expect "Verify password:"
   send "password\r"
   sleep 4
   interact

EOF
done < $file
