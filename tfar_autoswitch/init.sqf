#include "init.hpp"

compile preprocessFileLineNumbers "\task_force_radio\functions\common.sqf";

waitUntil { isDedicated || isServer; };

_getTsChannel = {
        _rawResponse = ("reflection" callExtension "arg(port)");
        _channel = "TFAR";
        if (count _rawResponse > 0) then {
                _response =  call compile _rawResponse;
                _responseCode = (_response select 0);
                _returnValue = (_response select 1);
                if (_responseCode == 0) then {
                        _channel = _channel + "-" + _returnValue;
                } else {
                        diag_log "could not get game server port: " + _returnValue;
                };
        } else {
                diag_log "no answer for reflection.so call :(";
        };

        _channel;
};

TF_RADIO_CHANNEL_NAME = call _getTsChannel;
TF_RADIO_CHANNEL_PASSWORD = "helium";

publicVariable "TF_RADIO_CHANNEL_NAME";
publicVariable "TF_RADIO_CHANNEL_PASSWORD";
