// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: fn_refillbox.sqf  "fn_refillbox"
//	@file Author: [404] Pulse , [404] Costlyy , [404] Deadbeat, AgentRev
//	@file Created: 22/1/2012 00:00
//	@file Args: [OBJECT (Weapons box that needs filling), STRING (Name of the fill to give to object)]

if (!isServer) exitWith {};

#define RANDOM_BETWEEN(START,END) ((START) + floor random ((END) - (START) + 1))
#define RANDOM_ODDS(ODDS) ([0,1] select (random 1 < (ODDS))) // between 0.0 and 1.0

private ["_box", "_boxType", "_boxItems", "_item", "_qty", "_mag"];
_box = _this select 0;
_boxType = _this select 1;

_box setVariable [call vChecksum, true];

_box allowDamage false; // No more fucking busted crates
_box setVariable ["allowDamage", false, true];
_box setVariable ["A3W_inventoryLockR3F", true, true];

// Clear pre-existing cargo first
//clearBackpackCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearWeaponCargoGlobal _box;
clearItemCargoGlobal _box;

if (_boxType == "mission_USSpecial2") then { _boxType = "mission_USSpecial" };

switch (_boxType) do
{
	case "mission_USLaunchers":
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			["wep", ["Laserdesignator", "Laserdesignator_02", "Laserdesignator_03"], 1, 1],
			["wep", ["launch_RPG32_F", "launch_NLAW_F", "launch_Titan_short_F"], RANDOM_BETWEEN(2,5), RANDOM_BETWEEN(1,2)],
			["wep", "launch_Titan_F", RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(1,2)],
			["mag", ["APERSTripMine_Wire_Mag", "APERSBoundingMine_Range_Mag", "APERSMine_Range_Mag", "ClaymoreDirectionalMine_Remote_Mag"], RANDOM_BETWEEN(2,5)],
			["mag", ["SLAMDirectionalMine_Wire_Mag", "ATMine_Range_Mag", "DemoCharge_Remote_Mag", "SatchelCharge_Remote_Mag"], RANDOM_BETWEEN(2,5)],
			["mag", "HandGrenade", RANDOM_BETWEEN(5,10)],
			["mag", "1Rnd_HE_Grenade_shell", RANDOM_BETWEEN(5,10)],
			["itm", [["H_HelmetB", "H_HelmetIA"], ["H_HelmetSpecB", "H_HelmetSpecO_ocamo"], "H_HelmetLeaderO_ocamo"], RANDOM_BETWEEN(1,4)],
			["itm", [["V_PlateCarrier1_rgr", "V_PlateCarrier1_blk", "V_PlateCarrierIA1_dgtl"], // Lite
			         ["V_PlateCarrier2_rgr", "V_PlateCarrier2_blk", "V_PlateCarrierIA2_dgtl"], // Rig
			         ["V_PlateCarrierSpec_rgr", "V_PlateCarrierSpec_blk", "V_PlateCarrierSpec_mtp"], // Special
			         ["V_PlateCarrierGL_rgr", "V_PlateCarrierGL_blk", "V_PlateCarrierGL_mtp", "V_PlateCarrierIAGL_dgtl", "V_PlateCarrierIAGL_oli"]] /* GL */, RANDOM_BETWEEN(1,4)],
					 ["itm", "NVGoggles", RANDOM_BETWEEN(1,2)]
		];
	};
	case "mission_USSpecial":
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			//["itm", "NVGoggles", 5],
			["wep", ["Binocular", "Rangefinder"], RANDOM_BETWEEN(0,3)],
			["itm", "Medikit", RANDOM_BETWEEN(1,3)],
			["itm", "Toolkit", RANDOM_BETWEEN(1,3)],
			["itm", ["optic_Aco", "optic_Aco_grn", "optic_MRCO", "optic_Hamr", "optic_Arco"], RANDOM_BETWEEN(2,4)],
			["itm", ["muzzle_snds_M", "muzzle_snds_H", "muzzle_snds_H_MG", "muzzle_snds_B", "muzzle_snds_acp", ["muzzle_snds_338_black", "muzzle_snds_338_green", "muzzle_snds_338_sand"], ["muzzle_snds_93mmg", "muzzle_snds_93mmg_tan"]], RANDOM_BETWEEN(1,5)],
			["wep", [["MMG_02_sand_F", "MMG_02_camo_F", "MMG_02_black_F"], ["MMG_01_tan_F", "MMG_01_hex_F"]], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(2,4)],
			["wep", ["LMG_Mk200_F", "LMG_Zafir_F"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(2,4)],
			["wep", ["srifle_EBR_F", "srifle_DMR_01_F"], RANDOM_BETWEEN(0,2), RANDOM_BETWEEN(4,8)],
			["wep", "arifle_SDAR_F", RANDOM_BETWEEN(0,2), RANDOM_BETWEEN(3,5)],
			["wep", ["hgun_Pistol_heavy_01_F", "hgun_Pistol_heavy_01_MRD_F", "hgun_Pistol_heavy_02_F", "hgun_Pistol_heavy_02_Yorris_F"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(4,8)],
			["mag", "30Rnd_556x45_Stanag", RANDOM_BETWEEN(5,10)],
			["mag", "30Rnd_65x39_caseless_mag", RANDOM_BETWEEN(5,10)],
			["mag", "30Rnd_65x39_caseless_green", RANDOM_BETWEEN(5,10)],
			["mag", "9Rnd_45ACP_Mag", RANDOM_BETWEEN(5,10)],
			["mag", "16Rnd_9x21_Mag", RANDOM_BETWEEN(5,10)],
			["itm", "NVGoggles", RANDOM_BETWEEN(1,2)]
		];
	};
	case "mission_Main_A3snipers":
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			["wep", "Rangefinder", RANDOM_BETWEEN(1,4)],
			["wep", ["srifle_LRR_LRPS_F", "srifle_LRR_camo_LRPS_F", "srifle_GM6_LRPS_F", "srifle_GM6_camo_LRPS_F"], RANDOM_BETWEEN(1,4), RANDOM_BETWEEN(5,10)],
			["wep", [["srifle_DMR_02_F", "srifle_DMR_02_camo_F", "srifle_DMR_02_sniper_F"], // MAR-10
			         ["srifle_DMR_03_F", "srifle_DMR_03_multicam_F", "srifle_DMR_03_khaki_F", "srifle_DMR_03_tan_F", "srifle_DMR_03_woodland_F"], // Mk-I
			         ["srifle_DMR_05_blk_F", "srifle_DMR_05_hex_F", "srifle_DMR_05_tan_f"], // Cyrus
			         ["srifle_DMR_06_camo_F", "srifle_DMR_06_olive_F"]] /* Mk14 */, RANDOM_BETWEEN(0,3), RANDOM_BETWEEN(5,10)],
			["wep", ["srifle_EBR_F", "srifle_DMR_01_F"], RANDOM_BETWEEN(0,3), RANDOM_BETWEEN(5,10)],
			["itm", ["optic_SOS", "optic_DMS", "optic_LRPS"], RANDOM_BETWEEN(2,4)],
			["itm", ["optic_AMS", "optic_AMS_khk", "optic_AMS_snd", "optic_KHS_blk", "optic_KHS_hex", "optic_KHS_tan"], RANDOM_BETWEEN(1,3)],
			//["itm", ["optic_tws", "optic_tws_mg", "optic_Nightstalker"], RANDOM_ODDS(0.5)], // o shit waddup!!
			["itm", "optic_NVS", RANDOM_BETWEEN(0,2)],
			["itm", ["bipod_01_F_blk", "bipod_01_F_mtp", "bipod_01_F_snd", "bipod_02_F_blk", "bipod_02_F_hex", "bipod_02_F_tan", "bipod_03_F_blk", "bipod_03_F_oli"], RANDOM_BETWEEN(1,4)],
			["itm", ["muzzle_snds_B", ["muzzle_snds_338_black", "muzzle_snds_338_green", "muzzle_snds_338_sand"], ["muzzle_snds_93mmg", "muzzle_snds_93mmg_tan"]], RANDOM_BETWEEN(1,4)],
			["itm", "NVGoggles", RANDOM_BETWEEN(1,2)]
		];
	};
	case "mission_Main_A3snipersTWS":
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			["wep", "Rangefinder", RANDOM_BETWEEN(1,4)],
			["wep", ["srifle_LRR_LRPS_F", "srifle_LRR_camo_LRPS_F", "srifle_GM6_LRPS_F", "srifle_GM6_camo_LRPS_F"], RANDOM_BETWEEN(1,4), RANDOM_BETWEEN(5,10)],
			["wep", [["srifle_DMR_02_F", "srifle_DMR_02_camo_F", "srifle_DMR_02_sniper_F"], // MAR-10
			         ["srifle_DMR_03_F", "srifle_DMR_03_multicam_F", "srifle_DMR_03_khaki_F", "srifle_DMR_03_tan_F", "srifle_DMR_03_woodland_F"], // Mk-I
			         ["srifle_DMR_05_blk_F", "srifle_DMR_05_hex_F", "srifle_DMR_05_tan_f"], // Cyrus
			         ["srifle_DMR_06_camo_F", "srifle_DMR_06_olive_F"]] /* Mk14 */, RANDOM_BETWEEN(0,3), RANDOM_BETWEEN(5,10)],
			["wep", ["srifle_EBR_F", "srifle_DMR_01_F"], RANDOM_BETWEEN(0,3), RANDOM_BETWEEN(5,10)],
			["itm", ["optic_SOS", "optic_DMS", "optic_LRPS"], RANDOM_BETWEEN(2,4)],
			["itm", ["optic_AMS", "optic_AMS_khk", "optic_AMS_snd", "optic_KHS_blk", "optic_KHS_hex", "optic_KHS_tan"], RANDOM_BETWEEN(1,3)],
			//["itm", ["optic_tws", "optic_tws_mg", "optic_Nightstalker"], RANDOM_ODDS(0.5)], // o shit waddup!!
			["itm", "optic_NVS", RANDOM_BETWEEN(0,2)],
			["itm", ["bipod_01_F_blk", "bipod_01_F_mtp", "bipod_01_F_snd", "bipod_02_F_blk", "bipod_02_F_hex", "bipod_02_F_tan", "bipod_03_F_blk", "bipod_03_F_oli"], RANDOM_BETWEEN(1,4)],
			["itm", ["muzzle_snds_B", ["muzzle_snds_338_black", "muzzle_snds_338_green", "muzzle_snds_338_sand"], ["muzzle_snds_93mmg", "muzzle_snds_93mmg_tan"]], RANDOM_BETWEEN(1,4)],
			["itm", "NVGoggles", RANDOM_BETWEEN(1,2)],
			["itm", "optic_TWS", RANDOM_BETWEEN(1,1)]
		];
	};
	case "mission_Custom_1":
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			["wep", ["arifle_Katiba_GL_ACO_pointer_snds_F", "srifle_DMR_05_DMS_F"], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(3,4)],
			["wep", ["arifle_MX_GL_Hamr_pointer_F", "MMG_02_camo_F"], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(3,4)],
			["wep", ["Binocular", "Rangefinder"], RANDOM_BETWEEN(1,3)],
			["wep", "Laserdesignator_02", RANDOM_BETWEEN(0,1)],
			["itm", "optic_DMS", RANDOM_BETWEEN(1,3)],
			["itm", "optic_Hamr", RANDOM_BETWEEN(2,5)],
			["mag", "30Rnd_65x39_caseless_mag", RANDOM_BETWEEN(8,9)],
			["mag", "30Rnd_65x39_caseless_green", RANDOM_BETWEEN(3,7)],
			["mag", "10Rnd_93x64_DMR_05_Mag", RANDOM_BETWEEN(4,9)],
			["mag", "10Rnd_93x64_DMR_05_Mag", RANDOM_BETWEEN(2,4)],
			["mag", "HandGrenade", RANDOM_BETWEEN(2,5)],
			["itm", "B_Kitbag_rgr", RANDOM_BETWEEN(1,2)],
			["itm", "H_HelmetB_Enh_tna_F", RANDOM_BETWEEN(1,2)],
			["itm", "B_ViperHarness_blk_F", RANDOM_BETWEEN(0,1)],
			["itm", "B_ViperHarness_oli_F", RANDOM_BETWEEN(0,1)]
		];
	};
	case "mission_Custom_LMG":
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			["wep", "LMG_Zafir_ARCO_F", RANDOM_BETWEEN(1,2)],
			["wep", "LMG_Mk200_MRCO_F", RANDOM_BETWEEN(1,2)],
			["wep", "arifle_MX_SW_F", RANDOM_BETWEEN(1,2)],
			["wep", "MMG_01_tan_F", RANDOM_BETWEEN(1,2)], //Navid
			["wep", "MMG_02_sand_RCO_LP_F", RANDOM_BETWEEN(1,2)], //SPMG
			["itm", "optic_DMS", RANDOM_BETWEEN(1,3)],
			["itm", "optic_Hamr", RANDOM_BETWEEN(2,5)],
			["mag", "150Rnd_762x54_Box", RANDOM_BETWEEN(3,8)], //Zafir
			["mag", "200Rnd_65x39_cased_Box", RANDOM_BETWEEN(2,6)], //MK200
			["mag", "100Rnd_65x39_caseless_mag", RANDOM_BETWEEN(2,5)], // MX SW
			["mag", "150Rnd_93x64_Mag", RANDOM_BETWEEN(2,4)], // Navid
			["mag", "MMG_02_sand_RCO_LP_F", RANDOM_BETWEEN(2,5)], // SPMG
			["mag", "HandGrenade", RANDOM_BETWEEN(2,5)],
			["itm", "NVGoggles", RANDOM_BETWEEN(1,2)]
		];
	};
	case "mission_Custom_Explosives":
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			["mag", "MiniGrenade", RANDOM_BETWEEN(2,10)],
			["mag", "HandGrenade", RANDOM_BETWEEN(2,10)],
			["mag", "SmokeShell", RANDOM_BETWEEN(2,10)],
			["mag", "SmokeShellYellow", RANDOM_BETWEEN(2,10)],
			["mag", "DemoCharge_Remote_Mag", RANDOM_BETWEEN(2,8)],
			["mag", "SatchelCharge_Remote_Mag", RANDOM_BETWEEN(1,4)],
			["mag", "ClaymoreDirectionalMine_Remote_Mag", RANDOM_BETWEEN(1,6)], 
			["mag", "ATMine_Range_Mag", RANDOM_BETWEEN(1,4)],
			["mag", "SLAMDirectionalMine_Wire_Mag", RANDOM_BETWEEN(1,5)],
			["mag", "APERSTripMine_Wire_Mag", RANDOM_BETWEEN(1,5)],
			["mag", "APERSMine_Range_Mag", RANDOM_BETWEEN(1,5)],
			["mag", "APERSBoundingMine_Range_Mag", RANDOM_BETWEEN(0,4)]
		];
	};
	case "mission_Custom_Wear":
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			["itm", "U_I_GhillieSuit", RANDOM_BETWEEN(1,1)],
			["itm", "U_O_GhillieSuit", RANDOM_BETWEEN(1,1)],
			["itm", "U_B_GhillieSuit", RANDOM_BETWEEN(1,1)],
			["itm", "U_B_Protagonist_VR", RANDOM_BETWEEN(0,1)],
			["itm", "U_O_Protagonist_VR", RANDOM_BETWEEN(0,1)],
			["itm", "U_I_Protagonist_VR", RANDOM_BETWEEN(0,1)],
			["itm", "V_PlateCarrierIAGL_dgtl", RANDOM_BETWEEN(0,1)],
			["itm", "V_PlateCarrierSpec_mtp", RANDOM_BETWEEN(0,1)],
			["itm", "V_PlateCarrierGL_blk", RANDOM_BETWEEN(0,1)],
			["itm", "V_PlateCarrierH_CTRG", RANDOM_BETWEEN(0,1)], 
			["itm", "V_PlateCarrier2_blk", RANDOM_BETWEEN(0,1)],
			["itm", "V_PlateCarrierIA2_dgtl", RANDOM_BETWEEN(0,1)],
			["itm", "V_PlateCarrier1_tna_F", RANDOM_BETWEEN(0,1)],
			["itm", "V_HarnessOSpec_gry", RANDOM_BETWEEN(0,1)],
			["itm", "V_HarnessOGL_brn", RANDOM_BETWEEN(0,1)],
			["itm", "B_Bergen_mcamo_F", RANDOM_BETWEEN(0,1)],
			["itm", "B_Bergen_tna_", RANDOM_BETWEEN(0,1)],
			["itm", "B_Carryall_mcamo", RANDOM_BETWEEN(0,1)],
			["itm", "B_Carryall_khk", RANDOM_BETWEEN(0,1)],
			["itm", "B_ViperHarness_blk_F", RANDOM_BETWEEN(0,1)],
			["itm", "B_ViperHarness_oli_F", RANDOM_BETWEEN(0,1)],
			["itm", "B_Kitbag_mcamo", RANDOM_BETWEEN(0,1)],
			["itm", "B_Kitbag_rgr", RANDOM_BETWEEN(0,1)],
			["itm", "B_Kitbag_cbr", RANDOM_BETWEEN(0,1)],
			["itm", "B_UavTerminal", RANDOM_BETWEEN(1,3)],
			["itm", "H_CrewHelmetHeli_O", RANDOM_BETWEEN(1,2)],
			["itm", "H_HelmetSpecB_blk", RANDOM_BETWEEN(1,2)],
			["itm", "H_HelmetB_Enh_tna_F", RANDOM_BETWEEN(1,2)],
			["itm", "H_HelmetLeaderO_oucamo", RANDOM_BETWEEN(1,2)]
		];
	};
};

[_box, _boxItems] call processItems;
