#!/bin/bash


echo "1. Home Directory:"
echo "   $(getent passwd $(whoami) | cut -d: -f6)"

echo "2. List of all usernames:"
cut -d: -f1 /etc/passwd

echo "3. Number of users:"
cut -d: -f1 /etc/passwd | wc -l

read -p "4. Enter username to find home directory: " username
echo "   Home directory of $username:"
grep "^$username:" /etc/passwd | cut -d: -f6

echo "5. Users with UID range 1000-1010:"
awk -F: '$3 >= 1000 && $3 <= 1010 {print $1}' /etc/passwd

echo "6. Users with standard shells (/bin/bash or /bin/sh):"
grep -E "/bin/(bash|sh)" /etc/passwd | cut -d: -f1

echo "7. Replacing '/' with '\' character in /etc/passwd file..."
sed 's/\//\\/g' /etc/passwd > passwd_modified.txt
echo "   Modified passwd file saved as passwd_modified.txt"

echo "8. Private IP:"
hostname -I | cut -d' ' -f1

echo "9. Public IP:"
curl -s ifconfig.me

echo "10. Switching to john user..."
su - John

echo "11. Home Directory of john user:"
echo "    $HOME"
