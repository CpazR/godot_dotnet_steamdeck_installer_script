# godot_dotnet_steamdeck_installer_script
A set of scripts to install and configure running the dotnet version of the godot editor on steam deck.

## To run install script:
In your terminal, run:
```
chmod +x dotnet-installer.sh
```

And simply run the script. This will do the following:

- Download and execute the dotnet installer script provided by Microsoft
- Download an rename the godot binaries
- Copy the start script and apply the correct permissions

You will be prompted for your root password during this process, as the dotnet installer requires root access.


## To run dotnet version of godot
Once the depencencies have installed, simply navigate to the newly installed version of godot, and run the `start_godot_dotnet.sh` script. This will run godot with the required dotnet environment variables.
