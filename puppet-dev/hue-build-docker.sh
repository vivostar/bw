echo -e "\033[32mBuild hue docker\033[0m"
(cd ~/hue; git checkout release-4.10.0)
(cd ~; echo y | cp -f hue-config/hue.ini hue/desktop/conf.dist)
(cd ~/hue; docker build -t hue:4.10.1 -f tools/docker/hue/Dockerfile .)