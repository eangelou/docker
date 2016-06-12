#!/bin/bash

: ${SSH_USERNAME:=ubuntu}
: ${SSH_USERPASS:=$(dd if=/dev/urandom bs=1 count=15 | base64)}

__create_rundir() {
	mkdir -p /var/run/sshd
}

__create_user() {
# Create a user to SSH into as.
useradd $SSH_USERNAME
#echo -e "$SSH_USERPASS\n$SSH_USERPASS" | (passwd --stdin $SSH_USERNAME)
#echo ssh user password: $SSH_USERPASS
mkdir -p /home/$SSH_USERNAME/.ssh
cp /authorized_keys /home/$SSH_USERNAME/.ssh/
chmod 700 /home/$SSH_USERNAME/.ssh
chmod 600 /home/$SSH_USERNAME/.ssh/authorized_keys
chown -R $SSH_USERNAME  /home/$SSH_USERNAME/.ssh
mkdir -p /root/.ssh
cp /authorized_keys /root/.ssh/
chmod 700 /root/.ssh
chmod 600 /root/.ssh/authorized_keys
}

__create_hostkeys() {
ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' 
}

# Call all functions
__create_rundir
__create_hostkeys
__create_user

exec "$@"

