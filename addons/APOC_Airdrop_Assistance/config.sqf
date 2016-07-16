//Configuration for Airdrop Assistance
//Author: Apoc

APOC_AA_coolDownTime = 900; //Expressed in sec

APOC_AA_VehOptions =
[//["Menu Text","ItemClassname",Price,"Drop Type"]
["Quadbike", "C_Quadbike_01_F", 3000,  "vehicle"],
["Offroad HMG", "B_G_Offroad_01_armed_F", 7000, "vehicle"],
["Strider",  "I_MRAP_03_F",     12000, "vehicle"],
["Strider HMG", "I_MRAP_03_hmg_F", 33000, "vehicle"],
["AMV-7 Marshall", "B_APC_Wheeled_01_cannon_F", 45000, "vehicle"],
["Zamak Ammo", "I_Truck_02_ammo_F", 50000, "vehicle"],
["WY-55 Hellcat (Unarmed)", "I_Heli_light_03_unarmed_F", 25000, "vehicle"] // AW159
];

APOC_AA_SupOptions =
[//["stringItemName", "Crate Type for fn_refillBox ,Price,"drop type"]
//["Launchers", "mission_USLaunchers", 35000, "supply"],
//["Assault Rifle", "mission_USSpecial", 35000, "supply"],

//"Menu Text","Crate Type","Cost","drop type"
//["Base Building","Land_Pod_Heli_Transport_04_box_F",7500,"base"],
["Food",  "Land_Sacks_goods_F",	3000, "picnic"],
["Water", "Land_BarrelWater_F",	3000, "picnic"]
];
