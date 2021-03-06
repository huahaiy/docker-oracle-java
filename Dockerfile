#
# The latest stable Oracle Java for the latest Debian Stable 
#
# Version     0.2
#

FROM huahaiy/debian

MAINTAINER Huahai Yang <hyang@juji-inc.com>

RUN \
  apt-get update  && \
  apt-get -y install software-properties-common && \
  add-apt-repository "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" && \
  apt-get update && \
  \
  \
  echo "===> install Java"  && \
  echo debconf shared/accepted-oracle-license-v1-1 select true | \
    debconf-set-selections  && \
  echo debconf shared/accepted-oracle-license-v1-1 seen true | \
    debconf-set-selections  && \
  apt-get -y --force-yes install oracle-java8-installer oracle-java8-set-default  && \
  \
  \
  echo "===> clean up..."  && \
  apt-get -y --purge remove software-properties-common && \
  apt-get -y --purge autoremove && \
  apt-get clean && \
  rm -rf /var/cache/oracle-jdk8-installer  && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
