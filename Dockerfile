FROM debian:buster

LABEL maintainer "forte <forte.evolution@gmail.com>"

ENV DEBIAN_FRONTEND=noninteractive \
	DEBCONF_NOWARNINGS=yes \
	DEBCONF_NONINTERACTIVE_SEEN=true

ADD ./sources.list /etc/apt

RUN rm -f /etc/localtime && \
	echo "Asia/Tokyo" > /etc/timezone && \
	dpkg-reconfigure --frontend noninteractive tzdata 2>&1 && \
	apt-get update && \
	apt-get dist-upgrade -y && \
	apt-get install -y zsh screen wget procps && \
	apt-get autoclean && \
	rm -rf /var/lib/apt/lists/\*

