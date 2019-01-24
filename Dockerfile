FROM debian:buster

LABEL maintainer "forte <forte.evolution@gmail.com>"

ENV DEBIAN_FRONTEND=noninteractive \
	DEBCONF_NOWARNINGS=yes \
	DEBCONF_NONINTERACTIVE_SEEN=true

RUN rm -f /etc/localtime && \
	echo "Asia/Tokyo" > /etc/timezone && \
	dpkg-reconfigure --frontend noninteractive tzdata 2>&1 && \
	rm -f /etc/apt/sources.list && \
	echo "deb http://ftp.pw2.org/debian/ buster main contrib non-free" > /etc/apt/sources.list && \
	echo "deb-src http://ftp.pw2.org/debian/ buster main contrib non-free" >> /etc/apt/sources.list && \
	echo "deb http://ftp.pw2.org/debian/ buster-updates main contrib non-free" >> /etc/apt/sources.list && \
	echo "deb-src http://ftp.pw2.org/debian/ buster-updates main contrib non-free" >> /etc/apt/sources.list && \
	cat /etc/apt/sources.list && \
	apt-get update && \
	apt-get dist-upgrade -y && \
	apt-get install -y zsh screen wget procps && \
	apt-get autoclean && \
	rm -rf /var/lib/apt/lists/\*

