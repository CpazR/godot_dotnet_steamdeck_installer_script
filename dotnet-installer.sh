#!/bin/sh
# sourced from: https://learn.microsoft.com/en-us/dotnet/core/install/linux-scripted-manual#scripted-install

# Install dependencies
echo WARNING: When Steam OS is updated, verify that installation is still valid. dotnet may need to be re-installed.

dotnet_version=8.0

wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh

chmod +x ./dotnet-install.sh

# dotnet dependency is currently installed in the steamOS filesystem
sudo steamos-readonly disable
echo Installing SDK...
./dotnet-install.sh --channel $dotnet_version
echo Installing runtime...
echo --------------------------------------
./dotnet-install.sh --channel $dotnet_version --runtime aspnetcore

sudo steamos-readonly enable

# Install godot at current script location
godot_version=4.2

wget https://github.com/godotengine/godot/releases/download/$godot_version-stable/Godot_v$godot_version-stable_mono_linux_x86_64.zip

unzip Godot_v$godot_version-stable_mono_linux_x86_64.zip

# Rename for easy compatability with start script
mv ./Godot_v$godot_version-stable_mono_linux_x86_64/Godot_v$godot_version-stable_mono_linux.x86_64 ./Godot_v$godot_version-stable_mono_linux_x86_64/Godot_stable_mono_linux.x86_64

# Configure start script to allow for easy execution
cp start_godot_dotnet.sh ./Godot_v$godot_version-stable_mono_linux_x86_64/start_godot_dotnet.sh

chmod +x ./Godot_v$godot_version-stable_mono_linux_x86_64/start_godot_dotnet.sh

echo Cleaning up install files...

rm dotnet-install.sh
rm Godot_v$godot_version-stable_mono_linux_x86_64.zip

echo Installation complete! Feel free to move godot install folder wherever.
echo To run godot with the dotnet environment accessible, use `start_godot_dotnet.sh`
