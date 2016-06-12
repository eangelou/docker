FROM ubuntu:16.04
MAINTAINER eangelou

EXPOSE 11211

RUN apt-get -y update && apt-get -y install \
	openssh-server \
	stress \
	htop \	
	iotop \ 
	bwm-ng \
	passwd \
	byobu \
	psmisc \
	memcached \
	; apt-get clean all

RUN sed -i s/PasswordAuthentication\ yes/PasswordAuthentication\ no/g /etc/ssh/sshd_config

COPY authorized_keys /authorized_keys
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["memcached", "-t", "4", "-m", "4096", "-n", "550", "-u", "root"]
