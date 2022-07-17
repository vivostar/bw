FROM centos:7

RUN yum -y install hostname curl sudo unzip wget rubygems git net-tools openssh-clients openssh-server
RUN gem install --bindir /usr/bin --no-ri --no-rdoc json_pure:2.5.1 puppet:3.6.2
RUN puppet module install puppetlabs-stdlib --version 4.12.0
ADD . /bigtop_home
RUN cp -f /bigtop_home/bigtop-deploy/puppet/hiera.yaml /etc/puppet
RUN mkdir -p /etc/puppet/hieradata
RUN rsync -a --delete /bigtop_home/bigtop-deploy/puppet/hieradata /etc/puppet


RUN /bin/sed -i 's,#   StrictHostKeyChecking ask,StrictHostKeyChecking no,g' /etc/ssh/ssh_config

RUN ssh-keygen -f "/root/.ssh/id_rsa" -N ""

RUN wget -O /etc/yum.repos.d/bigtop.repo https://downloads.apache.org/bigtop/bigtop-3.1.0/repos/centos-7/bigtop.repo
EXPOSE 1-65535
