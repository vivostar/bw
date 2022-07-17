echo -e "\033[32mPrint RSA Private Key\033[0m"
docker exec master bash -c "cat ~/.ssh/id_rsa"