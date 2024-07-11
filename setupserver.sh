# installing SteamCMD if it's not installed
if [ "$(command -v steamcmd)" = "" ]
then
    sudo add-apt-repository multiverse; sudo dpkg --add-architecture i386; sudo apt update
    sudo apt install steamcmd
fi

echo "Enter steam user, which will run arma 3 server:"
read steam_user
export STEAM_USER=$steam_user

echo "Enter user's password"
read steam_password
export STEAM_PASSWORD=$steam_password

mkdir arma3
server_dir=$(realpath ./arma3)
export SERVER_DIR=$server_dir

# installing arma 3 server
steamcmd +force_install_dir $server_dir +login $steam_user $steam_password +app_update 233780 validate +quit

mkdir arma3/mods
mkdir -p ~/".local/share/Arma 3" && mkdir -p ~/".local/share/Arma 3 - Other Profiles"

# downloading mods
echo "Do you want to use mods preset? y/n"
read mods_preset_enabled
if [ $mods_preset_enabled = "y" ]
then
    echo "Enter a link to the mods preset you want to play with:"
    read mod_preset
    export MOD_PRESET=$mod_preset

    sudo apt install rename
    python3 a3update.py
fi

# setting up and running web interface

if [ "$(command -v npm)" = "" ]
then
    sudo apt install nodejs
    sudo apt install npm
fi

if [ ! -d web_interface ]
then
    git clone https://github.com/Dahlgren/arma-server-web-admin web_interface
    cp config.js.template web_interface/config.js
else
    echo "web_interface directory already exists, skipping cloning arma-server-web-admin..."
fi

npm install --prefix web_interface
npm start --prefix web_interface