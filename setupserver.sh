# installing docker
curl -fsSL https://get.docker.com -o get-docker.sh
chmod +x get-docker.sh
bash get-docker.sh

# installing docker compose
mkdir -p ~/.docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/download/v2.28.1/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose

# setting up .env

cp .env-template .env

echo "Enter steam user, which will run arma 3 server:"
read steam_user
echo "Enter user's password"
read steam_password
sed -i -e "s|{steam_user}|$steam_user|;s|{steam_password}|$steam_password|" .env

echo "Do you want to use mods preset? y/n"
read mods_preset_enabled
if [ $mods_preset_enabled = "y" ]
then
    echo "Enter a link to the mods preset you want to play with:"
    read mods_preset
fi
sed -i -e "s|{mods_preset}|$mods_preset|" .env

# setting up main.cfg
cp configs/main-template.cfg configs/main.cfg

echo "Enter the password that will be used to log in as admin in-game:"
read password_admin
sed -i -e "s|{password_admin}|$password_admin|" configs/main.cfg

echo "Do you want BattlEye enabled? y/n"
read battleye_enabled
if [ $battleye_enabled = "y" ]
then
    sed -i -e "s|{battleye_enabled}|1|" configs/main.cfg
else
    sed -i -e "s|{battleye_enabled}|0|" configs/main.cfg
fi

# running docker compose for the first time
docker compose up