/home/pi/.dotnet/dotnet --version
if [ $? -eq 127 ] 
then {
    curl https://dotnet.microsoft.com/download/dotnet-core/scripts/v1/dotnet-install.sh > dotnet-install.sh
    chmod 777 dotnet-install.sh
    ./dotnet-install.sh
    echo "======================================================================================================"
    echo "================================ installed dotnet at /home/pi/.dotnet ================================"
    echo "======================================================================================================"
}

fi


