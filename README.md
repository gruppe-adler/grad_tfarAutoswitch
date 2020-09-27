# tfar_autoswitch

Switch to different Teamspeak Channels based on server port. 
Depends on 
* [TFAR](https://github.com/michail-nikolaev/task-force-arma-3-radio) 
* [arma3-reflection](https://github.com/Fusselwurm/arma3-reflection)

## How it works

* use as server mod
* mod asks arma3_reflection for the server's "port" command line parameter
* mod will use this to move players to correct channel depending on port

## Configuration 

these CBA settings exist:

### tfar_autoswitch_main_channelFormat

Teamspeak channel to move players to. SQF format string with one parameter for the server port, example: "TFAR-%1"

### tfar_autoswitch_main_channelPassword

Teamspeak password for target channel(s)
