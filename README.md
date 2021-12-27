# Gruppe Adler TFAR Autoswitch

Gruppe Adler TFAR Autoswitch enables automatic Teamspeak channel selection based on game server port.

Depends on 
* [TFAR](https://github.com/michail-nikolaev/task-force-arma-3-radio) 
* [arma3-reflection](https://github.com/Fusselwurm/arma3-reflection)

## How it works

* use as server mod
* mod asks arma3_reflection for the server's "port" command line parameter
* mod will use this to move players to correct channel depending on port

## Configuration 

these CBA settings exist:

### grad_tfarAutoswitch_main_channelFormat

Teamspeak channel to move players to. SQF format string with one parameter for the server port, example: "TFAR-%1"

### grad_tfarAutoswitch_main_channelPassword

Teamspeak password for target channel(s)

## For Developers

We're using [HEMTT](https://github.com/synixebrett/HEMTT).

### Releasing
- Update `addons\main\script_version.hpp`
- Commit your changes
- Create tag on GitHub
- NO NEED to upload the built mod. A GitHub Action workflow will take care of that

### Building
On Linux:
```
hemtt build --release
```
On Windows:
```
hemtt.exe build --release
```
