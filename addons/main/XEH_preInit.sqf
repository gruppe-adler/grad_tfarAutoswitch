#include "script_component.hpp"

if (!isServer) exitWith {};

private _category = "tfar_autoswitch";
[
    QGVAR(channelFormat),
    "EDITBOX",
    ["Teamspeak channel format string", "Channel name with one parameter for the port number. Example: 'TFAR-%1'"],
    _category,
    "",
    2,
    {
        if (GVAR(channelFormat) == "") exitWith {
                WARNING("CBA setting is empty, will not set channel name.")
        };
        tf_radio_channel_name = format [GVAR(channelFormat), call arma3_reflection_args_fnc_port];
        INFO_1("broadcasting TS channel name %1...", tf_radio_channel_name);
        publicVariable "tf_radio_channel_name"; // yes deprecated, but that way I can circumvent CBA settings
    },
    true
] call CBA_fnc_addSetting;

[
    QGVAR(channelPassword),
    "EDITBOX",
    "Teamspeak channel password",
    _category,
    "",
    2,
    {
        if (GVAR(channelPassword) == "") exitWith {
                WARNING("CBA setting is empty, will not set channel password.")
        };
        INFO_1("broadcasting TS channel password %1...", GVAR(channelPassword));
        tf_radio_channel_password = GVAR(channelPassword);
        publicVariable "tf_radio_channel_password";
    },
    true
] call CBA_fnc_addSetting;
