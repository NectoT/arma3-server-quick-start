# installing docker
curl -fsSL https://get.docker.com -o get-docker.sh
chmod +x get-docker.sh
bash get-docker.sh

# installing docker compose
mkdir -p ~/.docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/download/v2.28.1/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose

# setting up .env

echo "Enter steam user, which will run arma 3 server"
read steam_user
echo "Enter user's password"
read steam_password
sed -e "s/{steam_user}/$steam_user/;s/{steam_password}/$steam_password/" .env-template > .env

echo "Do you want to use mods preset? y/n"
read mods_preset_enabled
if [ $mods_preset_enabled = "y" ]
then
    echo "Enter a link to the mods preset you want to play with"
    read mods_preset
fi
sed -i -e "s/{mods_preset}/$mods_preset/" .env

# running docker compose for the first time
docker compose up

echo "Server setup is ready. Now you can use docker compose to start the server"