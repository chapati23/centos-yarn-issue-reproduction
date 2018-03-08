FROM centos:7

RUN yum update -y
RUN yum install yum-utils -y
RUN yum install jq wget unzip kubectl yum-utils device-mapper-persistent-data lvm2 -y
RUN yum groupinstall 'Development Tools' -y
RUN curl -sL https://rpm.nodesource.com/setup_9.x | bash -
RUN yum install nodejs -y
RUN npm install --global yarn@1.5.1
RUN echo 'net.ipv4.ip_forward = 1' | tee --append /etc/sysctl.conf
RUN echo 'StrictHostKeyChecking no' | tee --append /etc/ssh/ssh_config
RUN echo 'net.ipv4.ip_forward = 1' | tee --append /etc/sysctl.conf
COPY .npmrc ./
RUN npm install @brickblock/eslint-config-base
