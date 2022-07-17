#!/bin/bash
echo -e "\033[32mUpdate hieradata\033[0m"
docker exec $1 bash -c "(cd /bigtop_home; git pull origin master)"
echo -e "\033[32mUpdate hieradata\033[0m"
docker exec $1 rsync -a --delete /bigtop_home/bigtop-deploy/puppet/hieradata /etc/puppet
echo -e "\033[32mStarting deploy bigtop cluster $1\033[0m"
docker exec $1 bash -c "puppet apply --detailed-exitcodes --parser future --hiera_config=/etc/puppet/hiera.yaml --modulepath=/bigtop_home/bigtop-deploy/puppet/modules:/etc/puppet/modules:/usr/share/puppet/modules:/etc/puppetlabs/code/modules:/etc/puppet/code/modules /bigtop_home/bigtop-deploy/puppet/manifests"