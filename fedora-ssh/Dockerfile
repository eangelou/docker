FROM fedora 
MAINTAINER eangelou

EXPOSE 22

RUN dnf -y install \
	openssh-server \
	stress \
	htop \	
	iotop \ 
	bwm-ng \
	passwd \
	byobu \
	psmisc \
	; dnf clean all

RUN sed -i s/PasswordAuthentication\ yes/PasswordAuthentication\ no/g /etc/ssh/sshd_config

COPY authorized_keys /authorized_keys
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/sbin/sshd", "-D"]
