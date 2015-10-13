#!/bin/bash

: ${SSH_USERNAME:=fedora}
: ${SSH_USERPASS:=$(dd if=/dev/urandom bs=1 count=15 | base64)}
: ${SSH_USERPUBKEY:="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCsUC166NFA8cc3zOtifJ3zPnEHZzgDMSbzFoXBx57Ba7W31vZEJfEPNS12Q3SImg32OTTNH5NqY4JhvSXCFHZbEstV+8kt2ocDzWsVkvMGRcr5N+XAzG1aIT1uA+X3EYDbXnhnrvM92EIee56XrC7yObeuyOq2gkQJn5XVe+0BUpVIf8KJu0Zgun+o9D1oM9qweTdJN8GM9rHmiTquIJbOuHUnmv50U7t/P8eFeIqVDLTkBjLEfECZuTapZveNnKbLO2p14oLjvfJqxLK9mKFTis0azCD5iKYmblq0SSRWhfX96j0xK2M66U9hPdgFGsMLGvO6MHjOx69tLiaIcr97 vagos@vagospc"}

__create_rundir() {
	mkdir -p /var/run/sshd
}

__create_user() {
# Create a user to SSH into as.
useradd $SSH_USERNAME
echo -e "$SSH_USERPASS\n$SSH_USERPASS" | (passwd --stdin $SSH_USERNAME)
echo ssh user password: $SSH_USERPASS
mkdir -p ~$SSH_USERNAME/.ssh
echo -e "$SSH_USERPUBKEY" >> ~$SSH_USERNAME/.ssh/authorized_keys
chmod 700 ~$SSH_USERNAME/.ssh
chmod 600 ~$SSH_USERNAME/.ssh/authorized_keys
chown -R $SSH_USERNAME.$SSH_USERNAME  ~$SSH_USERNAME/.ssh
}

__create_hostkeys() {
ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' 
}

# Call all functions
__create_rundir
__create_hostkeys
__create_user

exec "$@"

