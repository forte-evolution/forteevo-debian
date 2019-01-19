FROM debian:buster

LABEL maintainer "forte <forte.evolution@gmail.com>"

ADD ./sources.list /etc/apt

RUN 	apt-get update && \
	apt-get dist-upgrade -y && \
	apt-get install -y zsh screen wget procps && \
	apt-get autoclean && \
        rm -rf /var/lib/apt/lists/\*

