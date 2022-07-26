echo -e "\033[32mCreating docker cluster hue\033[0m"
docker run -d --name hue -p 8888:8888 --hostname hue --network bigtop --privileged -e "container=docker" -v /sys/fs/cgroup:/sys/fs/cgroup:ro hue:4.10.1
MASTER_IP=`docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' master`
WORKER01_IP=`docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' worker01`
WORKER02_IP=`docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' worker02`

echo -e "\033[32mConfiguring hue hosts file\033[0m"
docker exec --user root hue bash -c "echo '$MASTER_IP      master' >> /etc/hosts"
docker exec --user root hue bash -c "echo '$WORKER01_IP      worker01' >> /etc/hosts"
docker exec --user root hue bash -c "echo '$WORKER02_IP      worker02' >> /etc/hosts"
