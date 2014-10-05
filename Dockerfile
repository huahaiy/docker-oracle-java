#
# The latest stable Oracle Java for the latest Debian Stable 
#
# Version     0.1
#

# base image from docker hub
FROM debian:latest

MAINTAINER Huahai Yang <hyang@juji.io>

RUN \
  echo "===> add webupd8 repository..."  && \ 
  echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee \ 
    /etc/apt/sources.list.d/webupd8team-java.list  && \ 
  echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a \ 
    /etc/apt/sources.list.d/webupd8team-java.list  && \ 
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886  && \
  apt-get update  && \
  \
  \
  echo "===> install Java"  && \
  echo debconf shared/accepted-oracle-license-v1-1 select true | \
    debconf-set-selections  && \
  echo debconf shared/accepted-oracle-license-v1-1 seen true | \
    debconf-set-selections  && \
  apt-get install -y --force-yes oracle-java8-installer oracle-java8-set-default  && \
  \
  \
  echo "===> install CA certificates"  && \
  apt-get install ca-certificates && \ 
  \
  \
  echo "===> clean up..."  && \
  apt-get clean
