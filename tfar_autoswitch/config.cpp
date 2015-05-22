class CfgPatches
{
	class tfar_autoswitch
	{
		units[] = { };
		weapons[] = { };
		requiredVersion = 0.100000;
		requiredAddons[] = {"CBA_Extended_EventHandlers"};
		version = "1";
		projectName = "tfar_autoswitch";
		author[] = {
			"Fusselwurm <fusselwurm@gmail.com>"
		};
		authorUrl = "https://github.com/gruppe-adler/tfar_autoswitch";
	};
};

class Extended_PostInit_EventHandlers
{
	class tfar_autoswitch
	{
		Init = "call compile preprocessFileLineNumbers '\tfar_autoswitch\init.sqf'";
	};
};
