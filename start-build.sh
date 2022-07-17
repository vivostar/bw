echo -e "\033[32mBuild bigtop image\033[0m"
docker build -t bigtop:3.1.0 -f puppet-dev/Dockerfile .