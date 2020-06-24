/home/pi/.dotnet/dotnet --version
if [ $? -eq 127 ] 
then {
    curl https://dotnet.microsoft.com/download/dotnet-core/scripts/v1/dotnet-install.sh > dotnet-install.sh
    chmod 777 dotnet-install.sh
    ./dotnet-install.sh

    # TODO: Add this to .profile automatically
    # # set PATH so it includes dotnet
    # if [ -d "$HOME/.dotnet" ] ; then
    #     PATH="$HOME/.dotnet:$PATH"
    # fi

    echo "======================================================================================================"
    echo "================================ installed dotnet at /home/pi/.dotnet ================================"
    echo "======================================================================================================"
}

fi

# install node + npm
npm --version
if [ $? -eq 127 ] 
then {
    sudo apt-get update
    sudo apt-get upgrade
    sudo apt-get install nodejs npm
    sudo npm install -g npm@latest
    echo "======================================================================================================"
    echo "====================================== installed nodejs + npm ========================================"
    echo "======================================================================================================"
}

# Install Vue
vue --version
if [ $? -eq 127 ] 
then {
    sudo npm install -g @vue/cli
    sudo npm install -g @vue/cli-service-global
    echo "======================================================================================================"
    echo "=========================================== installed vue ============================================"
    echo "======================================================================================================"
}

# Install RaspAP
    echo "======================================================================================================"
    echo "========================================== installed RaspAP =========================================="
    echo "======================================================================================================"


# if [ vue-lifx-server doesnt exist]
git clone https://github.com/OriNachum/vue-lifx-server.git
    echo "======================================================================================================"
    echo "======================================= Cloned vue-lifx-server ======================================="
    echo "======================================================================================================"

# fi

cd ./LifxWebClient/LifxLanController
dotnet publish LifxLanController.sln -f netcoreapp2.2 -r linux-arm
./Git/LifxWebClient/LifxLanController/ActionService/bin/Debug/netcoreapp2.2/linux-arm/ActionService &
./Git/LifxWebClient/LifxLanController/LifxWebApi/bin/Debug/netcoreapp2.2/linux-arm/LifxWebApi &
./Git/LifxWebClient/LifxLanController/Bishop/bin/Debug/netcoreapp2.2/linux-arm/Bishop console &
cd ../..

# if [LifxWebClient doesn't exist]
git clone https://github.com/OriNachum/LifxWebClient.git
    echo "======================================================================================================"
    echo "======================================== Cloned LifxWebClient ========================================"
    echo "======================================================================================================"


cd ./vue-lifx-server/hello-world
#Fix max number of watchers
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
npm install
# cd ./Git/vue-lifx-server/hello-world/
vue serve src/main.js
cd ../..

