FROM debian:buster

LABEL maintainer "forte <forte.evolution@gmail.com>"

ADD ./sources.list /etc/apt

RUN 	apt-get update && \
	apt-get install -y aptitude && \
	aptitude update && \
	aptitude dist-upgrade -y && \
	aptitude install -y zsh screen wget procps && \
	aptitude autoclean

