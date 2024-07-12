# A collection of scripts and tools to quickly set up an Arma 3 Server on Ubuntu or Debian, managed by one bash script

*This project was tested on Ubuntu only, but should work on Debian.*

*You should be able to use this project on other Linux distributions if you change apt package manager to the package manager available in your distro.*

## Tools this project uses

- SteamCMD
- [a3update](https://gist.github.com/marceldev89/12da69b95d010c8a810fd384cca8d02a#file-a3update-py) script to automatically download or update all mods from a given mod preset
- [arma-server-web-admin](https://github.com/Dahlgren/arma-server-web-admin) for a web interface that lets you manage created servers

## Usage

Clone this repository

`git clone https://github.com/NectoT/arma3-server-quick-start arma`

Go to the created directory

`cd arma`

Give execution rights to the `setupserver.sh` (Not sure if needed)

`chmod +x setupserver.sh`

Start the script using `source` command

`source setupserver.sh`

You will be prompted to enter various inputs throughout the script. When you see the line `webpack: Compiled successfully.`, you can open up the web interface, located at `<server-ip>:3000`. You'll need to enter the steam username and password you entered in console beforehand.

## Remarks

- The steam account that you use for setting up server **must have two-factor authentication *disabled***
- If you're using a mod preset the steam account you use **must have arma3 in its library**
- From the [Valve Developer Community Wiki](https://developer.valvesoftware.com/wiki/SteamCMD#SteamCMD_Login): "*For security reasons, it is recommended that you **create a new Steam account** just for your dedicated servers.*"