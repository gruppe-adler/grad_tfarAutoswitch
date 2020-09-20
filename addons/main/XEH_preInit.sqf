#include "script_component.hpp"

if (!isServer) exitWith {};

tfar_autoswitch_main_fnc_getPort = {
        private _rawResponse = ("reflection" callExtension "arg(port)");
        private _port = "0";
        if (count _rawResponse == 0) exitWith {
                ERROR("no answer for reflection.so call :(");
                0
        };

        (call compile _rawResponse) params [
                ["_responseCode", 0, [0]],
                ["_returnValue", "", [""]]
        ];
        if (_responseCode != 0) exitWith {
                ERROR_1("could not get game server port from extension return value '%1'", _rawResponse);
                0
        };
                   
        parseNumber _returnValue;
};

[
    "TFAR_Teamspeak_Channel_Format",
    "EDITBOX",
    ["Teamspeak channel format string", "Channel name with one parameter for the port number. Example: 'TFAR-%1'"],
    "tfar_autoswitch",
    "",
    2,
    {
        if (TFAR_Teamspeak_Channel_Format == "") exitWith {
                WARNING("CBA setting is empty, will not set channel name.")
        };
        tf_radio_channel_name = format [TFAR_Teamspeak_Channel_Format, call tfar_autoswitch_main_fnc_getPort];
        INFO_1("broadcasting TS channel name %1...", tf_radio_channel_name);
        publicVariable "tf_radio_channel_name"; // yes deprecated, but that way I can circumvent CBA settings
    },
    true
] call CBA_fnc_addSetting;

[
    "TFAR_Teamspeak_Channel_Password",
    "EDITBOX",
    "Teamspeak channel password",
    "tfar_autoswitch",
    "",
    2,
    {
        if (TFAR_Teamspeak_Channel_Password == "") exitWith {
                WARNING("CBA setting is empty, will not set channel password.")
        };
        INFO_1("broadcasting TS channel password %1...", TFAR_Teamspeak_Channel_Password);
        tf_radio_channel_password = TFAR_Teamspeak_Channel_Password;
        publicVariable "tf_radio_channel_password";
    },
    true
] call CBA_fnc_addSetting;