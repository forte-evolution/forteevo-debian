FROM debian:stretch-slim

LABEL maintainer "forte <forte.evolution@gmail.com>"

ENV DEBIAN_FRONTEND=noninteractive \
	DEBCONF_NOWARNINGS=yes \
	DEBCONF_NONINTERACTIVE_SEEN=true

RUN rm -f /etc/localtime && \
	echo "Asia/Tokyo" > /etc/timezone && \
	dpkg-reconfigure --frontend noninteractive tzdata 2>&1

ADD ./sources.list /etc/apt
RUN apt-get update && \
#	apt-get dist-upgrade -y && \
	apt-get install -y zsh wget procps vim-tiny && \
	apt-get autoclean && \
	rm -rf /var/lib/apt/lists/\*

ADD ./.zshrc /root/.zshrc

CMD ["/bin/zsh"]
