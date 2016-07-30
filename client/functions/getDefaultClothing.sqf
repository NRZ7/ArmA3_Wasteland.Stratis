// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: getDefaultClothing.sqf
//	@file Author: AgentRev
//	@file Created: 22/12/2013 22:04

private ["_unit", "_item", "_side", "_isMedic", "_isSniper", "_isDiver", "_isExplosive", "_defaultVest", "_result"];

_unit = _this select 0;
_item = _this select 1;

if (typeName _unit == "OBJECT") then
{
	_side = if (_unit == player) then { playerSide } else { side _unit };
	_unit = typeOf _unit;
}
else
{
	_side = _this select 2;
};

_isMedic = (["_medic_", _unit] call fn_findString != -1);
_isSniper = (["_sniper_", _unit] call fn_findString != -1);
_isDiver = (["_diver_", _unit] call fn_findString != -1);
_isExplosive (["_soldier_exp_", _unit] call fn_findString != -1);

_defaultVest = "V_Rangemaster_Belt";

_result = "";

switch (_side) do
{
	case BLUFOR:
	{
		switch (true) do
		{
			case (_isMedic):
			{
				if (_item == "uniform") then { _result = "U_B_CombatUniform_mcam" };
				if (_item == "vest") then { _result = "V_BandollierB_khk" };
			};
			case (_isSniper):
			{
				if (_item == "uniform") then { _result = "U_B_Ghilliesuit" };
				if (_item == "vest") then { _result = "V_PlateCarrier2_rgr" };
			};
			case (_isDiver):
			{
				if (_item == "uniform") then { _result = "U_B_Wetsuit" };
				if (_item == "vest") then { _result = "V_RebreatherB" };
				if (_item == "goggles") then { _result = "G_Diving" };
			};
			case (_isExplosive):
			{
				if (_item == "uniform") then { _result = "U_B_CombatUniform_mcam" };
				if (_item == "vest") then { _result = "V_PlateCarrierGL_rgr" };
			};
			default
			{
				if (_item == "uniform") then { _result = "U_B_CombatUniform_mcam" };
				if (_item == "vest") then { _result = _defaultVest };
			};
		};

		if (_item == "headgear") then { _result = "H_MilCap_mcamo" };
	};
	case OPFOR:
	{
		switch (true) do
		{
			case (_isMedic):
			{
				if (_item == "uniform") then { _result = "U_O_OfficerUniform_ocamo" };
				if (_item == "vest") then { _result = "V_BandollierB_khk" };
			};
			case (_isSniper):
			{
				if (_item == "uniform") then { _result = "U_O_Ghilliesuit" };
				if (_item == "vest") then { _result = "V_PlateCarrier2_rgr" };
			};
			case (_isDiver):
			{
				if (_item == "uniform") then { _result = "U_O_Wetsuit" };
				if (_item == "vest") then { _result = "V_RebreatherIR" };
				if (_item == "goggles") then { _result = "G_Diving" };
			};
			case (_isExplosive):
			{
				if (_item == "uniform") then { _result = "U_O_OfficerUniform_ocamo" };
				if (_item == "vest") then { _result = "V_PlateCarrierGL_rgr" };
			};
			default
			{
				if (_item == "uniform") then { _result = "U_O_OfficerUniform_ocamo" };
				if (_item == "vest") then { _result = _defaultVest };
			};
		};

		if (_item == "headgear") then { _result = "H_MilCap_ocamo" };
	};
	default
	{
		switch (true) do
		{
			case (_isMedic):
			{
				if (_item == "uniform") then { _result = "U_I_CombatUniform" };
				if (_item == "vest") then { _result = "V_BandollierB_khk" };
			};
			case (_isSniper):
			{
				if (_item == "uniform") then { _result = "U_I_Ghilliesuit" };
				if (_item == "vest") then { _result = "V_PlateCarrier2_rgr" };
			};
			case (_isDiver):
			{
				if (_item == "uniform") then { _result = "U_I_Wetsuit" };
				if (_item == "vest") then { _result = "V_RebreatherIA" };
				if (_item == "goggles") then { _result = "G_Diving" };
			};
			case (_isExplosive):
			{
				if (_item == "uniform") then { _result = "U_I_CombatUniform" };
				if (_item == "vest") then { _result = "V_PlateCarrierGL_rgr" };
			};
			default
			{
				if (_item == "uniform") then { _result = "U_I_CombatUniform" };
				if (_item == "vest") then { _result = _defaultVest };
			};
		};

		if (_item == "headgear") then { _result = "H_MilCap_dgtl" };
	};
};

_result
