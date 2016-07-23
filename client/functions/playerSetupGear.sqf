// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: playerSetupGear.sqf
//	@file Author: [GoT] JoSchaap, AgentRev

private ["_player", "_uniform", "_vest", "_headgear", "_goggles"];
_player = _this;

// Clothing is now defined in "client\functions\getDefaultClothing.sqf"

_uniform = [_player, "uniform"] call getDefaultClothing;
_vest = [_player, "vest"] call getDefaultClothing;
_headgear = [_player, "headgear"] call getDefaultClothing;
_goggles = [_player, "goggles"] call getDefaultClothing;

if (_uniform != "") then { _player addUniform _uniform };
if (_vest != "") then { _player addVest _vest };
if (_headgear != "") then { _player addHeadgear _headgear };
if (_goggles != "") then { _player addGoggles _goggles };

sleep 0.1;

// Remove GPS
_player unlinkItem "ItemGPS";

// Remove radio
//_player unlinkItem "ItemRadio";

// Remove NVG
if (hmd _player != "") then { _player unlinkItem hmd _player };

// Add NVG
_player linkItem "NVGoggles";


_player addMagazine "9Rnd_45ACP_Mag";
_player addWeapon "hgun_ACPC2_F";
_player addMagazine "9Rnd_45ACP_Mag";
_player addItem "FirstAidKit";
_player addItem "FirstAidKit";
_player addItem "FirstAidKit";
_player selectWeapon "hgun_ACPC2_F";
_player addMagazine "HandGrenade";

switch (true) do
{
	case (["_medic_", typeOf _player] call fn_findString != -1):
	{
		_player addBackpack "B_FieldPack_oli";
		_player addMagazine "30Rnd_556x45_Stanag";
		_player addMagazine "30Rnd_556x45_Stanag";
		_player addWeapon "arifle_TRG20_F";
		_player addPrimaryWeaponItem "acc_flashlight";
		_player addPrimaryWeaponItem "optic_Aco";
		_player removeItem "FirstAidKit";
		_player removeItem "FirstAidKit";
		_player removeItem "FirstAidKit";
		_player addItem "Medikit";
		_player selectWeapon "arifle_TRG20_F";
		_player addMagazine "HandGrenade";
		_player addMagazine "SmokeShell";
		_player addMagazine "SmokeShell";
	};
	case (["_engineer_", typeOf _player] call fn_findString != -1):
	{
		_player addBackpack "B_Kitbag_sgg";
		_player addMagazine "30Rnd_556x45_Stanag";
		_player addMagazine "30Rnd_556x45_Stanag";
		_player addWeapon "arifle_Mk20_F";
		_player addPrimaryWeaponItem "acc_flashlight";
		_player addPrimaryWeaponItem "optic_Holosight";
		_player addMagazine "RPG32_F";
		_player addMagazine "RPG32_F";
		_player addWeapon "launch_RPG32_F";
		_player addItem "MineDetector";
		_player addItem "Toolkit";
		_player selectWeapon "arifle_Mk20_F";
	};
	case (["_sniper_", typeOf _player] call fn_findString != -1):
	{
		_player addBackpack "B_AssaultPack_rgr";
		_player addMagazine "30Rnd_65x39_caseless_mag";
		_player addMagazine "30Rnd_65x39_caseless_mag";
		_player addWeapon "arifle_MXM_F";
		_player addPrimaryWeaponItem "acc_flashlight";
		_player addPrimaryWeaponItem "optic_MRCO";
		_player addWeapon "Rangefinder";
		_player addItem "ClaymoreDirectionalMine_Remote_Mag";
		_player addItem "ClaymoreDirectionalMine_Remote_Mag";
		_player selectWeapon "arifle_MXM_F";
	};
	case (["_diver_", typeOf _player] call fn_findString != -1):
	{
		_player addBackpack "B_FieldPack_oli";
		_player addMagazine "20Rnd_556x45_UW_mag";
		_player addMagazine "20Rnd_556x45_UW_mag";
		_player addMagazine "20Rnd_556x45_UW_mag";
		_player addWeapon "arifle_SDAR_F";
		_player addItem "DemoCharge_Remote_Mag";
		_player addItem "DemoCharge_Remote_Mag";
		_player selectWeapon "arifle_SDAR_F";
		_player addMagazine "HandGrenade";
	};
};

if (_player == player) then
{
	thirstLevel = 100;
	hungerLevel = 100;
};
