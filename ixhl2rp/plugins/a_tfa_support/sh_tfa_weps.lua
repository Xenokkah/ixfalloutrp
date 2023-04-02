
--
-- Copyright (C) 2020 Taxin2012
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
--



--	Writed by Taxin2012
--	https://steamcommunity.com/id/Taxin2012/



PLUGIN.GunData[ "tfa_ins2_ak74m" ] = {
	--Weapon can be Blacklisted and item will be not auto-generated
	BlackList = true,
	
	Slot = "primary",
	Model = "path_to_model_of_item",
	iconCam = {
		tpos = Vector( 0, 0, 0 ),
		tang = Angle( 0, 0, 0 ),
		tfov = 0
	},
	Width = 4,
	Height = 2,
	Weight = 3,
	Price = 2000,
	
	--Weapon Parameters
	--Prim == Primary
	Prim = {
		Ammo = "assault",
		Damage = 31,
		KickUp = 0.4,
		KickDown = 0.4,
		KickHorizontal = 0.35,
		Spread = .021,
		IronAccuracy = .01
	},
	
	--Sec == Secondary
	Sec = {}
}





--=== 9MM ===--
PLUGIN.GunData[ "aus_w_9mmpistol" ] = {
	BlackList = false,
	Name = "9mm Pistol",
	Desc = "A Browning Hi-Power, common among civillians and law enforcement before the war, and these days wastelanders looking for protection. Also the service pistol for the NCRA.",
	Slot = "secondary",
	Model = "models/illusion/fwp/w_9mmpistol.mdl",
	condition = 100,
	iconCam = {
		pos = Vector(2.75, 191.95, 56.09),
		ang = Angle(16.18, -90.88, 0),
		fov = 3.31
	},
	Width = 2,
	Height = 1,
	Weight = 3,
	Price = 2000,
	
	Prim = {
		Ammo = "9mmammo",
		Damage = 31,
		KickUp = 0.4,
		KickDown = 0.4,
		KickHorizontal = 0.35,
		Spread = .021,
		IronAccuracy = .01
	},
	
	--Sec == Secondary
	Sec = {}
}

PLUGIN.GunData["aus_w_9mmsmg"] = {
	BlackList = false,
	Name = "9mm Submachine Gun",
	Desc = "A homemade machine gun firing 9mm from an open bolt, resembling a WW2-Era 'Grease Gun'. Notoriously inaccurate, but at close range such things tend to stop mattering so much. ",
	Slot = "primary",
	conditionDrainFactor = 1.25,
	Model = "models/illusion/fwp/w_9mmsmg.mdl",
	iconCam = {
		pos = Vector(2.75, 191.95, 56.09),
		ang = Angle(16.18, -90.88, 0),
		fov = 9.31
	},
	Width = 3,
	Height = 1,
	Weight = 3,
	Price = 2000,
	condition = 100,
	
	Prim = {
		Ammo = "9mmammo",
		Damage = 31,
		KickUp = 0.4,
		KickDown = 0.4,
		KickHorizontal = 0.35,
		Spread = .021,
		IronAccuracy = .01
	},
	
	--Sec == Secondary
	Sec = {
	}
}


--=== 22LR ===--
PLUGIN.GunData["aus_w_22_smg"] = {
	BlackList = false,
	Name = ".22LR Submachine Gun",
	Desc = "A curious weapon, the American 180 puts a crapton of lead down range very fast, fed from a high capacity pan magazine - offset by the lacking performance of the .22 cartridge unless it's against small game.",
	Slot = "primary",
	Model = "models/halokiller38/fallout/weapons/smgs/22smg.mdl",
	Width = 4,
	iconCam = {
		pos = Vector(2.75, 191.95, 56.09),
		ang = Angle(16.18, -90.88, 0),
		fov = 9.31
	},
	Height = 1,
	Weight = 3,
	Price = 2000,
	condition = 100,
	
	Prim = {
		Ammo = "22lrammo",
		Damage = 15,
		KickUp = 0.4,
		KickDown = 0.4,
		KickHorizontal = 0.35,
		Spread = .021,
		IronAccuracy = .01
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["aus_w_varmintrifle"] = {
	BlackList = false,
	Name = "Varmint Rifle",
	Desc = "A bolt action, five shot rifle chambered in .22, primarily for use against critters around the farm and house, hence the 'varmint'.",
	Slot = "primary",
	Model = "models/illusion/fwp/w_varmintrifle.mdl",
	Width = 3,
	iconCam = {
		pos = Vector(2.75, 191.95, 56.09),
		ang = Angle(16.18, -90.88, 0),
		fov = 9.31
	},
	Height = 1,
	Weight = 3,
	Price = 2000,
	condition = 100,
	
	Prim = {
		Ammo = "22lrammo",
		Damage = 15,
		KickUp = 0.4,
		KickDown = 0.4,
		KickHorizontal = 0.35,
		Spread = .021,
		IronAccuracy = .01
	},
	
	--Sec == Secondary
	Sec = {
	}
}


--=== .38 SPECIAL ===--
PLUGIN.GunData["aus_w_piperevolver"] = {
	BlackList = false,
	Name = "Pipe Pistol",
	conditionDrainFactor = 1.50,
	Desc = "A handmade revolver firing pistol rounds from an unrifled barrel, used by more desperate wasteland inhabitants for self defense or muggings. Its single-action fire rate, low capacity, and low power cartridge often have its owners seeking something more conventional.",
	Slot = "secondary",
	Model = "models/illusion/fwp/w_piperevolver.mdl",
	Width = 2,
	iconCam = {
		pos = Vector(2.75, 191.95, 56.09),
		ang = Angle(16.18, -90.88, 0),
		fov = 9.31
	},
	Height = 1,
	Weight = 3,
	Price = 2000,
	condition = 100,
	
	Prim = {
		Ammo = "38specialammo",
		Damage = 25,
		KickUp = 0.4,
		KickDown = 0.4,
		KickHorizontal = 0.35,
		Spread = .021,
		IronAccuracy = .01
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["aus_w_pipebolt"] = {
	BlackList = false,
	Name = "Bolt Action Pipe Rifle",
	conditionDrainFactor = 1.50,
	Desc = "A handmade bolt=action rifle. While generally being more accurate than its pistol counterpart due to a longer barrel and more comfortable ergonomics, its low fire rate makes it best for shooting pests and longer distance potshots.",
	Slot = "primary",
	Model = "models/illusion/fwp/w_pipebolt.mdl",
	Width = 3,
	iconCam = {
		pos = Vector(2.75, 191.95, 56.09),
		ang = Angle(16.18, -90.88, 0),
		fov = 9.31
	},
	Height = 1,
	Weight = 3,
	Price = 2000,
	condition = 100,
	
	Prim = {
		Ammo = "38specialammo",
		Damage = 25,
		KickUp = 0.4,
		KickDown = 0.4,
		KickHorizontal = 0.35,
		Spread = .021,
		IronAccuracy = .01
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["aus_w_pipeboltscoped"] = {
	BlackList = false,
	Name = "Scoped Bolt Action Pipe Rifle",
	conditionDrainFactor = 1.50,
	Desc = "A handmade bolt=action rifle with a 'Scope' of a metal tube and two screws installed for sighting. Probably better than relying on just irons, but not by a whole lot.",
	Slot = "primary",
	Model = "models/illusion/fwp/w_pipeboltscoped.mdl",
	Width = 3,
	iconCam = {
		pos = Vector(2.75, 191.95, 56.09),
		ang = Angle(16.18, -90.88, 0),
		fov = 9.31
	},
	Height = 1,
	Weight = 3,
	Price = 2000,
	condition = 100,
	
	Prim = {
		Ammo = "38specialammo",
		Damage = 25,
		KickUp = 0.4,
		KickDown = 0.4,
		KickHorizontal = 0.35,
		Spread = .021,
		IronAccuracy = .01
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["aus_w_piperiflesemi"] = {
	BlackList = false,
	Name = "Semi-Automatic Pipe Rifle",
	conditionDrainFactor = 1.25,
	Desc = "A handmade pipe gun with a bit more craftsmanship put into it, with scope, semi auto action, and drum magazine. The result is a decent firearm for light and medium use.",
	Slot = "primary",
	Model = "models/illusion/fwp/w_piperiflesemi.mdl",
	Width = 3,
	iconCam = {
		pos = Vector(2.75, 191.95, 56.09),
		ang = Angle(16.18, -90.88, 0),
		fov = 9.31
	},
	Height = 1,
	Weight = 3,
	Price = 2000,
	condition = 100,
	
	Prim = {
		Ammo = "38specialammo",
		Damage = 25,
		KickUp = 0.4,
		KickDown = 0.4,
		KickHorizontal = 0.35,
		Spread = .021,
		IronAccuracy = .01,
		ClipSize = 25
	},
	
	--Sec == Secondary
	Sec = {
	}
}


--=== .45 Auto ===--
PLUGIN.GunData["aus_w_45pistol"] = {
	BlackList = false,
	Name = ".45 Auto Pistol",
	conditionDrainFactor = 1,
	Desc = "The gift from John Moses Browning that keeps on giving. While beat in both power and capacity by more modern creations, the M1911 remains a classic due to its iconic style and feel, especially among the New Caananite Mormons.",
	Slot = "secondary",
	Model = "models/halokiller38/fallout/weapons/pistols/45pistol.mdl",
	Width = 2,
	iconCam = {
		pos = Vector(2.75, 191.95, 56.09),
		ang = Angle(16.18, -90.88, 0),
		fov = 9.31
	},
	Height = 1,
	Weight = 3,
	Price = 2000,
	condition = 100,
	
	Prim = {
		Ammo = "45autoammo",
		Damage = 35,
		KickUp = 0.4,
		KickDown = 0.4,
		KickHorizontal = 0.35,
		Spread = .021,
		IronAccuracy = .01,
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["aus_w_combatrifle"] = {
	BlackList = false,
	Name = "Combat Rifle",
	conditionDrainFactor = 1,
	Desc = "A chunky, dependable rifle that was once popular primarily among civillian shooters, now having a niche as an accurate, but cheap to feed semi automatic.",
	Slot = "primary",
	Model = "models/illusion/fwp/w_combatrifle.mdl",
	Width = 4,
	iconCam = {
		pos = Vector(2.75, 191.95, 56.09),
		ang = Angle(16.18, -90.88, 0),
		fov = 9.31
	},
	Height = 1,
	Weight = 3,
	Price = 2000,
	condition = 100,
	
	Prim = {
		Ammo = "45autoammo",
		Damage = 35,
		KickUp = 0.4,
		KickDown = 0.4,
		KickHorizontal = 0.35,
		Spread = .021,
		IronAccuracy = .01,
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["aus_w_submachinegun"] = {
	BlackList = false,
	Name = ".45 Auto Submachine Gun",
	conditionDrainFactor = 1,
	Desc = "The Thompson machine gun, or 'Tommygun', was in use during the second World War, and ever since has become a cultural icon. Performance wise, it fires fast but quickly gets out of control. Popular among wiseguys.",
	Slot = "primary",
	Model = "models/illusion/fwp/w_tommygun.mdl",
	Width = 4,
	iconCam = {
		pos = Vector(2.75, 191.95, 56.09),
		ang = Angle(16.18, -90.88, 0),
		fov = 9.31
	},
	Height = 1,
	Weight = 3,
	Price = 2000,
	condition = 100,
	
	Prim = {
		Ammo = "45autoammo",
		Damage = 35,
		KickUp = 0.4,
		KickDown = 0.4,
		KickHorizontal = 0.35,
		Spread = .021,
		IronAccuracy = .01,
	},
	
	--Sec == Secondary
	Sec = {
	}
}


--=== 10mm ===--
PLUGIN.GunData["aus_w_10mmpistol"] = {
	BlackList = false,
	Name = "10mm Pistol",
	conditionDrainFactor = 0.8,
	Desc = "The N99 10mm Pistol is a rugged, durable, and reliable pistol, serving as the United States Army's service pistol before the war. Its distinct brick-shaped profile hints at its simplified internals that make cleaning a cinch.",
	Slot = "secondary",
	Model = "models/illusion/fwp/w_10mmpistol.mdl",
	Width = 2,
	iconCam = {
		pos = Vector(2.75, 191.95, 56.09),
		ang = Angle(16.18, -90.88, 0),
		fov = 9.31
	},
	Height = 1,
	Weight = 3,
	Price = 2000,
	condition = 100,
	
	Prim = {
		Ammo = "10mmammo",
		Damage = 35,
		KickUp = 0.4,
		KickDown = 0.4,
		KickHorizontal = 0.35,
		Spread = .021,
		IronAccuracy = .01,
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["aus_w_10mmsmg"] = {
	BlackList = false,
	Name = "10mm Submachine Gun",
	conditionDrainFactor = 0.8,
	Desc = "The 10mm SMG is much like its younger sibling - a square shaped profile making a reliable, satisfying shoot with acceptable recoil control. ",
	Slot = "primary",
	Model = "models/illusion/fwp/w_10mmsmg.mdl",
	Width = 2,
	iconCam = {
		pos = Vector(2.75, 191.95, 56.09),
		ang = Angle(16.18, -90.88, 0),
		fov = 9.31
	},
	Height = 2,
	Weight = 3,
	Price = 2000,
	condition = 100,
	
	Prim = {
		Ammo = "10mmammo",
		Damage = 35,
		KickUp = 0.4,
		KickDown = 0.4,
		KickHorizontal = 0.35,
		Spread = .021,
		IronAccuracy = .01,
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["aus_w_smmg"] = {
	BlackList = false,
	Name = "Shoulder Mounted Machine Gun",
	conditionDrainFactor = 1,
	Desc = "The SMMG is very much an oddity, found only around the select few US Army sites to recieve them. Likened to an upside-down minigun, this hefty beast uses 10mm rounds at a very high rate of fire.",
	Slot = "primary",
	Model = "models/halokiller38/fallout/weapons/heavy weapons/shouldermountedmg.mdl",
	Width = 4,
	iconCam = {
		pos = Vector(2.75, 191.95, 56.09),
		ang = Angle(16.18, -90.88, 0),
		fov = 9.31
	},
	Height = 3,
	Weight = 3,
	Price = 2000,
	condition = 100,
	
	Prim = {
		Ammo = "10mmammo",
		Damage = 35,
		KickUp = 0.4,
		KickDown = 0.4,
		KickHorizontal = 0.35,
		Spread = .021,
		IronAccuracy = .01,
	},
	
	--Sec == Secondary
	Sec = {
	}
}

--=== .44 Magnum ===--
PLUGIN.GunData["aus_w_44magnum"] = {
	BlackList = false,
	Name = ".44 Magnum Revolver",
	conditionDrainFactor = 1,
	Desc = "A cultural classic - long barreled 6 shot revolver, 44 magnum - powerful enough to blow your head clean off. Careful, it kicks like a mule.",
	Slot = "secondary",
	Model = "models/illusion/fwp/w_44magnum.mdl",
	Width = 3,
	iconCam = {
		pos = Vector(2.75, 191.95, 56.09),
		ang = Angle(16.18, -90.88, 0),
		fov = 9.31
	},
	Height = 1,
	Weight = 3,
	Price = 2000,
	condition = 100,
	Prim = {
		Ammo = "44magnumammo",
		Damage = 35,
		KickUp = 0.4,
		KickDown = 0.4,
		KickHorizontal = 0.35,
		Spread = .021,
		IronAccuracy = .01,
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["aus_w_cowboyrepeater"] = {
	BlackList = false,
	Name = "Cowboy Repeater",
	conditionDrainFactor = 1,
	Desc = "A lever action rifle with generous tube magazine. Once used for hunting bigger game like Bucks, it's now a favorite of the New California Republic Rangers.",
	Slot = "primary",
	Model = "models/illusion/fwp/w_cowboyrepeater.mdl",
	Width = 4,
	iconCam = {
		pos = Vector(2.75, 191.95, 56.09),
		ang = Angle(16.18, -90.88, 0),
		fov = 9.31
	},
	Height = 1,
	Weight = 3,
	Price = 2000,
	condition = 100,
	Prim = {
		Ammo = "44magnumammo",
		Damage = 35,
		KickUp = 0.4,
		KickDown = 0.4,
		KickHorizontal = 0.35,
		Spread = .021,
		IronAccuracy = .01,
	},
	
	--Sec == Secondary
	Sec = {
	}
}

--=== 12.7 ===--
PLUGIN.GunData["aus_w_127pistol"] = {
	BlackList = false,
	Name = "12.7mm Pistol",
	conditionDrainFactor = 1,
	Desc = "A chunky pistol that's a trophy as much as anything else, using the massive 12.7mm cartridge. It rivals intermediate rifle rounds in power, and is only seen in the hands of well-off mercenaries or officers.",
	Slot = "secondary",
	Model = "models/illusion/fwp/w_127mmpistol.mdl",
	Width = 3,
	iconCam = {
		pos = Vector(2.75, 191.95, 56.09),
		ang = Angle(16.18, -90.88, 0),
		fov = 9.31
	},
	Height = 1,
	Weight = 3,
	Price = 2000,
	condition = 100,
	Prim = {
		Ammo = "127mmammo",
		Damage = 35,
		KickUp = 0.4,
		KickDown = 0.4,
		KickHorizontal = 0.35,
		Spread = .021,
		IronAccuracy = .01,
	},
	
	--Sec == Secondary
	Sec = {
	}
}



--=== 5.56 ===--
PLUGIN.GunData["aus_w_servicerifle"] = {
	BlackList = false,
	Name = "Service Rifle",
	conditionDrainFactor = 0.7,
	Desc = "A symbol of the Republic, this workhorse delivers steady firepower in a very mechanically simple, durable package, especially with multiple going off at once.",
	Slot = "primary",
	Model = "models/illusion/fwp/w_servicerifle.mdl",
	Width = 3,
	iconCam = {
		pos = Vector(2.75, 191.95, 56.09),
		ang = Angle(16.18, -90.88, 0),
		fov = 9.31
	},
	Height = 2,
	Weight = 3,
	Price = 2000,
	condition = 100,
	Prim = {
		Ammo = "556ammo",
		Damage = 35,
		KickUp = 0.4,
		KickDown = 0.4,
		KickHorizontal = 0.35,
		Spread = .021,
		IronAccuracy = .01,
		ClipSize = 20,
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["aus_w_hmar"] = {
	BlackList = false,
	Name = "Homemade Assault Rifle",
	conditionDrainFactor = 1.3,
	Desc = "An automatic rifle made by some enterprising mechanic in their backyard, this weapon dishes out steady rifle fire, but at the cost of accuracy and reliability due to their somewhat ramshackle assembly. Favored by raiders.",
	Slot = "primary",
	Model = "models/illusion/fwp/w_hmar.mdl",
	Width = 3,
	iconCam = {
		pos = Vector(2.75, 191.95, 56.09),
		ang = Angle(16.18, -90.88, 0),
		fov = 9.31
	},
	Height = 2,
	Weight = 3,
	Price = 2000,
	condition = 100,
	Prim = {
		Ammo = "556ammo",
		Damage = 35,
		KickUp = 0.4,
		KickDown = 0.4,
		KickHorizontal = 0.35,
		Spread = .021,
		IronAccuracy = .01,
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["aus_w_r91"] = {
	BlackList = false,
	Name = "R91 Assault Rifle",
	conditionDrainFactor = 1,
	Desc = "The ballistic service rifle option for the former US Army, the R91 is a fine rifle with consistent fire rate and recoil control.",
	Slot = "primary",
	Model = "models/illusion/fwp/w_r91.mdl",
	Width = 3,
	iconCam = {
		pos = Vector(2.75, 191.95, 56.09),
		ang = Angle(16.18, -90.88, 0),
		fov = 9.31
	},
	Height = 2,
	Weight = 3,
	Price = 2000,
	condition = 100,
	Prim = {
		Ammo = "556ammo",
		Damage = 35,
		KickUp = 0.4,
		KickDown = 0.4,
		KickHorizontal = 0.35,
		Spread = .021,
		IronAccuracy = .01,
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["aus_w_chinesear"] = {
	BlackList = false,
	Name = "Chinese Assault Rifle",
	conditionDrainFactor = 0.8,
	Desc = "This rifle is an uncommon sight in the wastes compared to its contemporaries, but was often secretly shipped to the US to chinese intiltrators, chambered in the more locally available 5.56. Compared to its western counterpart, it offers a more durable frame and increased mag capacity.",
	Slot = "primary",
	Model = "models/illusion/fwp/w_chineseassaultrifle.mdl",
	Width = 3,
	iconCam = {
		pos = Vector(2.75, 191.95, 56.09),
		ang = Angle(16.18, -90.88, 0),
		fov = 9.31
	},
	Height = 2,
	Weight = 3,
	Price = 2000,
	condition = 100,
	Prim = {
		Ammo = "556ammo",
		Damage = 35,
		KickUp = 0.4,
		KickDown = 0.4,
		KickHorizontal = 0.35,
		Spread = .021,
		IronAccuracy = .01,
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["aus_w_marksmancarbine"] = {
	BlackList = false,
	Name = "Marksman Carbine",
	conditionDrainFactor = 1.1,
	Desc = "A shortened carbine, usable only in semi automatic but equipped with higher quality parts and a scope, ideal for picking careful shots.",
	Slot = "primary",
	Model = "models/illusion/fwp/w_marksmancarbine.mdl",
	Width = 3,
	iconCam = {
		pos = Vector(2.75, 191.95, 56.09),
		ang = Angle(16.18, -90.88, 0),
		fov = 9.31
	},
	Height = 2,
	Weight = 3,
	Price = 2000,
	condition = 100,
	Prim = {
		Ammo = "556ammo",
		Damage = 35,
		KickUp = 0.4,
		KickDown = 0.4,
		KickHorizontal = 0.35,
		Spread = .021,
		IronAccuracy = .01,
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["aus_w_assaultrifle"] = {
	BlackList = false,
	Name = "Light Machine Gun",
	conditionDrainFactor = 1,
	Desc = "This chunky charlie is meant for suppressive and sustained fire, and has the extended magazine and heat dispersal to be up to task." ,
	Slot = "primary",
	Model = "models/illusion/fwp/w_machinegun.mdl",
	Width = 4,
	iconCam = {
		pos = Vector(2.75, 191.95, 56.09),
		ang = Angle(16.18, -90.88, 0),
		fov = 9.31
	},
	Height = 2,
	Weight = 3,
	Price = 2000,
	condition = 100,
	Prim = {
		Ammo = "556ammo",
		Damage = 35,
		KickUp = 0.4,
		KickDown = 0.4,
		KickHorizontal = 0.35,
		Spread = .021,
		IronAccuracy = .01,
		ClipSize = 60,
	},
	
	--Sec == Secondary
	Sec = {
	}
}


--=== Buckshot ===--
PLUGIN.GunData["aus_w_caravanshotgun"] = {
	BlackList = false,
	Name = "Caravan Shotgun",
	conditionDrainFactor = 1,
	Desc = "An under-over double barreled shotgun generaly used by trade caravan guards, bartenders, and farmers. Effective, and simple." ,
	Slot = "primary",
	Model = "models/illusion/fwp/w_caravanshotgun.mdl",
	Width = 4,
	iconCam = {
		pos = Vector(2.75, 191.95, 56.09),
		ang = Angle(16.18, -90.88, 0),
		fov = 9.31
	},
	Height = 1,
	Weight = 3,
	Price = 2000,
	condition = 100,
	Prim = {
		Ammo = "12gaugeammo",
		Damage = 35,
		KickUp = 0.4,
		KickDown = 0.4,
		KickHorizontal = 0.35,
		Spread = .021,
		IronAccuracy = .01,
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["aus_w_huntingshotgun"] = {
	BlackList = false,
	Name = "Hunting Shotgun",
	conditionDrainFactor = 1,
	Desc = "A pump action shotgun favored by hunters or other individuals that prefer to be up close and personal." ,
	Slot = "primary",
	Model = "models/illusion/fwp/w_huntingshotgun.mdl",
	Width = 4,
	iconCam = {
		pos = Vector(2.75, 191.95, 56.09),
		ang = Angle(16.18, -90.88, 0),
		fov = 9.31
	},
	Height = 1,
	Weight = 3,
	Price = 2000,
	condition = 100,
	Prim = {
		Ammo = "12gaugeammo",
		Damage = 35,
		KickUp = 0.4,
		KickDown = 0.4,
		KickHorizontal = 0.35,
		Spread = .021,
		IronAccuracy = .01,
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["aus_w_combatshotgundrum"] = {
	BlackList = false,
	Name = "Combat Shotgun",
	conditionDrainFactor = 1,
	Desc = "A drum-fed, quick-firing shotgun often employed by guards of more well-funded organizations." ,
	Slot = "primary",
	Model = "models/halokiller38/fallout/weapons/shotguns/combatshotgun.mdl",
	Width = 3,
	iconCam = {
		pos = Vector(2.75, 191.95, 56.09),
		ang = Angle(16.18, -90.88, 0),
		fov = 9.31
	},
	Height = 2,
	Weight = 3,
	Price = 2000,
	condition = 100,
	Prim = {
		Ammo = "12gaugeammo",
		Damage = 35,
		KickUp = 0.4,
		KickDown = 0.4,
		KickHorizontal = 0.35,
		Spread = .021,
		IronAccuracy = .01,
	},
	
	--Sec == Secondary
	Sec = {
	}
}


--=== 5mm ===--
PLUGIN.GunData["aus_w_assaultcarbine"] = {
	BlackList = false,
	Name = "Assault Carbine",
	conditionDrainFactor = 1,
	Desc = "A quite rare automatic rifle utilizing the 5mm round, a slightly smaller but much faster and more armor-piercing round, ideal for armored foes." ,
	Slot = "primary",
	Model = "models/weapons/w_m733.mdl",
	Width = 3,
	iconCam = {
		pos = Vector(2.75, 191.95, 56.09),
		ang = Angle(16.18, -90.88, 0),
		fov = 9.31
	},
	Height = 2,
	Weight = 3,
	Price = 2000,
	condition = 100,
	Prim = {
		Ammo = "5mmammo",
		Damage = 35,
		KickUp = 0.4,
		KickDown = 0.4,
		KickHorizontal = 0.35,
		Spread = .021,
		IronAccuracy = .01,
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["aus_w_minigun"] = {
	BlackList = false,
	Name = "Minigun",
	conditionDrainFactor = 0.50,
	Desc = "A massive rotary cannon, capable of swiftly tearing through damn near anything. Nearly impossible to use without the use of power armor, or some other form of enhanced strength. Requires 5mm rounds linked together on a disintegrating belt to load." ,
	Slot = "primary",
	Model = "models/weapons/w_ghost_minigun.mdl",
	Width = 4,
	iconCam = {
		pos = Vector(2.75, 191.95, 56.09),
		ang = Angle(16.18, -90.88, 0),
		fov = 9.31
	},
	Height = 3,
	Weight = 3,
	Price = 2000,
	condition = 100,
	Prim = {
		Ammo = "5mmboxammo",
		Damage = 35,
		KickUp = 0.4,
		KickDown = 0.4,
		KickHorizontal = 0.35,
		Spread = .021,
		IronAccuracy = .01,
	},
	
	--Sec == Secondary
	Sec = {
	}
}

--=== .308 ===--
PLUGIN.GunData["aus_w_huntingrifle"] = {
	BlackList = false,
	Name = "Hunting Rifle",
	conditionDrainFactor = 0.9,
	Desc = "A bolt action hunting rifle used for taking down big game, but also employed by many militaries or gangs due to its ease of use and stopping power." ,
	Slot = "primary",
	Model = "models/illusion/fwp/w_huntingrifle.mdl",
	Width = 4,
	iconCam = {
		pos = Vector(2.75, 191.95, 56.09),
		ang = Angle(16.18, -90.88, 0),
		fov = 9.31
	},
	Height = 1,
	Weight = 3,
	Price = 2000,
	condition = 100,
	Prim = {
		Ammo = "308ammo",
		Damage = 35,
		KickUp = 0.4,
		KickDown = 0.4,
		KickHorizontal = 0.35,
		Spread = .021,
		IronAccuracy = .01,
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["aus_w_battle_rifle"] = {
	BlackList = false,
	Name = "Battle Rifle",
	conditionDrainFactor = 0.9,
	Desc = "An antique even by wasteland standards, the M1 Garand nonetheless has its fans by those looking for the power of the .308 but with a higher rate of fire and capacity compared to more common hunting rifles. " ,
	Slot = "primary",
	Model = "models/halokiller38/fallout/weapons/rifles/thismachine.mdl",
	Width = 4,
	iconCam = {
		pos = Vector(2.75, 191.95, 56.09),
		ang = Angle(16.18, -90.88, 0),
		fov = 9.31
	},
	Height = 1,
	Weight = 3,
	Price = 2000,
	condition = 100,
	Prim = {
		Ammo = "308ammo",
		Damage = 35,
		KickUp = 0.4,
		KickDown = 0.4,
		KickHorizontal = 0.35,
		Spread = .021,
		IronAccuracy = .01,
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["aus_w_sniperrifle"] = {
	BlackList = false,
	Name = "Sniper Rifle",
	conditionDrainFactor = 0.9,
	Desc = "The DKS-501 Sniper Rifle was the US Army's standard sniper rifle before the war, and enjoys success by more elite units or fortunate wastelanders due to its near unrivaled ability to land several accurate shots in short periods over long distances." ,
	Slot = "primary",
	Model = "models/illusion/fwp/w_sniperrifle.mdl",
	Width = 4,
	iconCam = {
		pos = Vector(2.75, 191.95, 56.09),
		ang = Angle(16.18, -90.88, 0),
		fov = 9.31
	},
	Height = 1,
	Weight = 3,
	Price = 2000,
	condition = 100,
	Prim = {
		Ammo = "308ammo",
		Damage = 35,
		KickUp = 0.4,
		KickDown = 0.4,
		KickHorizontal = 0.35,
		Spread = .021,
		IronAccuracy = .01,
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["aus_w_bar"] = {
	BlackList = false,
	Name = "Automatic Rifle",
	conditionDrainFactor = 0.9,
	Desc = "The Browning Automatic Rifle was developed during WW1 and used primarily during the second, intended to serve as a squad support weapon, its success in that measure is questionable due to its heft and low capacity. Now, a functional BAR is both a token of prestige and a horrifying sight in the right hands." ,
	Slot = "primary",
	Model = "models/halokiller38/fallout/weapons/heavy weapons/automaticrifle.mdl",
	Width = 4,
	iconCam = {
		pos = Vector(2.75, 191.95, 56.09),
		ang = Angle(16.18, -90.88, 0),
		fov = 9.31
	},
	Height = 2,
	Weight = 3,
	Price = 2000,
	condition = 100,
	Prim = {
		Ammo = "308ammo",
		Damage = 35,
		KickUp = 0.4,
		KickDown = 0.4,
		KickHorizontal = 0.35,
		Spread = .021,
		IronAccuracy = .01,
	},
	
	--Sec == Secondary
	Sec = {
	}
}


--=== .50MG ===--
PLUGIN.GunData["aus_w_amr"] = {
	BlackList = false,
	Name = "Anti-Materiel Rifle",
	conditionDrainFactor = 0.9,
	Desc = "The PGM Hecate rifle is a massive gun firing an equally massive round. Capable of putting down all but the heaviest infantry targets in a single shot, it's still liable to break your shoulder unless fired with bipod deployed from a seated or prone position. An icon of the NCR's Veteran Rangers." ,
	Slot = "primary",
	Model = "models/illusion/fwp/w_amr.mdl",
	Width = 5,
	iconCam = {
		pos = Vector(2.75, 191.95, 56.09),
		ang = Angle(16.18, -90.88, 0),
		fov = 9.31
	},
	Height = 2,
	Weight = 3,
	Price = 2000,
	condition = 100,
	Prim = {
		Ammo = "50mgammo",
		Damage = 35,
		KickUp = 0.4,
		KickDown = 0.4,
		KickHorizontal = 0.35,
		Spread = .021,
		IronAccuracy = .01,
	},
	
	--Sec == Secondary
	Sec = {
	}
}

--=== 2mmEC ===--
PLUGIN.GunData["aus_w_gauss"] = {
	BlackList = false,
	Name = "Gauss Rifle",
	conditionDrainFactor = 1.2,
	Desc = "The Gauss Rifle was something of a prototype before the war, and now is only found in the hands of elite units of the wasteland's most technologically advanced factions. It will drop any infantry targets in a single well-placed shot, and is a threat to many vehicles too. " ,
	Slot = "primary",
	Model = "models/halokiller38/fallout/weapons/energy weapons/gaussrifle.mdl",
	Width = 5,
	iconCam = {
		pos = Vector(2.75, 191.95, 56.09),
		ang = Angle(16.18, -90.88, 0),
		fov = 9.31
	},
	Height = 2,
	Weight = 3,
	Price = 2000,
	condition = 100,
	Prim = {
		Ammo = "2mmecammo",
		Damage = 35,
		KickUp = 0.4,
		KickDown = 0.4,
		KickHorizontal = 0.35,
		Spread = .021,
		IronAccuracy = .01,
	},
	
	--Sec == Secondary
	Sec = {
	}
}


--=== 40mm Grenade ===--
PLUGIN.GunData["aus_w_launcher_nade"] = {
	BlackList = false,
	Name = "Grenade Launcher",
	conditionDrainFactor = 1,
	Desc = "A single-shot 40mm grenade launcher, not that common outside of certain well-armed groups but prized by many for its indirect fire capability." ,
	Slot = "primary",
	Model = "models/halokiller38/fallout/weapons/explosives/grenaderifle.mdl",
	Width = 4,
	iconCam = {
		pos = Vector(2.75, 191.95, 56.09),
		ang = Angle(16.18, -90.88, 0),
		fov = 9.31
	},
	Height = 2,
	Weight = 3,
	Price = 2000,
	condition = 100,
	Prim = {
		Ammo = "40mmammo",
		Damage = 35,
		KickUp = 0.4,
		KickDown = 0.4,
		KickHorizontal = 0.35,
		Spread = .021,
		IronAccuracy = .01,
	},
	
	--Sec == Secondary
	Sec = {
	}
}

--=== MFC ===--
PLUGIN.GunData["aus_w_laserpistol"] = {
	BlackList = false,
	Name = "Laser Pistol",
	conditionDrainFactor = 1.25,
	Desc = "The AEP-7 laser pistol sports a smaller wattage than its larger siblings, but offers all the benefits of laser weaponry in a compact package." ,
	Slot = "secondary",
	Model = "models/halokiller38/fallout/weapons/energy weapons/laserpistol.mdl",
	Width = 3,
	iconCam = {
		pos = Vector(2.75, 191.95, 56.09),
		ang = Angle(16.18, -90.88, 0),
		fov = 9.31
	},
	Height = 1,
	Weight = 3,
	Price = 2000,
	condition = 100,
	Prim = {
		Ammo = "mfcammo",
		Damage = 35,
		KickUp = 0.4,
		KickDown = 0.4,
		KickHorizontal = 0.35,
		Spread = .021,
		IronAccuracy = .01,
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["aus_w_lasermusket"] = {
	BlackList = false,
	Name = "Homemade Laser Rifle",
	conditionDrainFactor = 1.50,
	Desc = "Made out of salvaged laser rifle parts and whatever could be found, this weapon allows the less fortunate to have roughly the same power of a laser rifle even if an intact origonal cannot be found, but at the cost of capacity and durability." ,
	Slot = "primary",
	Model = "models/illusion/fwp/w_lasermusket.mdl",
	Width = 4,
	iconCam = {
		pos = Vector(2.75, 191.95, 56.09),
		ang = Angle(16.18, -90.88, 0),
		fov = 9.31
	},
	Height = 2,
	Weight = 3,
	Price = 2000,
	condition = 100,
	Prim = {
		Ammo = "mfcammo",
		Damage = 35,
		KickUp = 0.4,
		KickDown = 0.4,
		KickHorizontal = 0.35,
		Spread = .021,
		IronAccuracy = .01,
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["aus_w_laserrifle"] = {
	BlackList = false,
	Name = "Laser Rifle",
	conditionDrainFactor = 1.35,
	Desc = "The gold standard of laser weaponry, the AER-9 is lightweight and hits hard and accurate - but tends to be a bit finicky, needing repairs often." ,
	Slot = "primary",
	Model = "models/illusion/fwp/w_laserrifle.mdl",
	Width = 3,
	iconCam = {
		pos = Vector(2.75, 191.95, 56.09),
		ang = Angle(16.18, -90.88, 0),
		fov = 9.31
	},
	Height = 2,
	Weight = 3,
	Price = 2000,
	condition = 100,
	Prim = {
		Ammo = "mfcammo",
		Damage = 35,
		KickUp = 0.4,
		KickDown = 0.4,
		KickHorizontal = 0.35,
		Spread = .021,
		IronAccuracy = .01,
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["aus_w_tribeam"] = {
	BlackList = false,
	Name = "Tri-Beam Laser Rifle",
	conditionDrainFactor = 1.35,
	Desc = "A modified Laser Rifle, with a device on the end that is capable of expending three charges at once in a shotgun-style spread, increasing damage output while limiting range due to the spread quickly going off-target beyond close range." ,
	Slot = "primary",
	Model = "models/hub/weapons/tribeam/tribeam.mdl",
	Width = 3,
	iconCam = {
		pos = Vector(2.75, 191.95, 56.09),
		ang = Angle(16.18, -90.88, 0),
		fov = 9.31
	},
	Height = 2,
	Weight = 3,
	Price = 2000,
	condition = 100,
	Prim = {
		Ammo = "mfcammo",
		Damage = 35,
		KickUp = 0.4,
		KickDown = 0.4,
		KickHorizontal = 0.35,
		Spread = .021,
		IronAccuracy = .01,
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["aus_w_wattzlasergun"] = {
	BlackList = false,
	Name = "Wattz Laser-Sniper Rifle",
	conditionDrainFactor = 1.35,
	Desc = "A Wattz Consumer Electronics creation, this rifle is effectively the sniper rifle of energy weaponry - using up twice as many MFC charges as a regular laser rifle for a more focused, accurate beam with included scope for longer range work. Favored by lightweight scouting units of advanced factions." ,
	Slot = "primary",
	Model = "models/illusion/fwp/w_wattzlasergun.mdl",
	Width = 4,
	iconCam = {
		pos = Vector(2.75, 191.95, 56.09),
		ang = Angle(16.18, -90.88, 0),
		fov = 9.31
	},
	Height = 2,
	Weight = 3,
	Price = 2000,
	condition = 100,
	Prim = {
		Ammo = "mfcammo",
		Damage = 35,
		KickUp = 0.4,
		KickDown = 0.4,
		KickHorizontal = 0.35,
		Spread = .021,
		IronAccuracy = .01,
	},
	
	--Sec == Secondary
	Sec = {
	}
}


--=== ECP ===--
PLUGIN.GunData["aus_w_rcw"] = {
	BlackList = false,
	Name = "Laser RCW",
	conditionDrainFactor = 1.15,
	Desc = "The lovechild of a tommygun and laser rifle, the Laser RCW is one of the few fully automatic energy weapons around, using the slightly less powerful Electron Charge Pack to dish out many lasers at a high speed. Favored by Fiends, as more advanced factions tend to save their ECPs for heavy weapons, but not to be underestimated." ,
	Slot = "primary",
	Model = "models/hub/weapons/rcw/rcw.mdl",
	Width = 3,
	iconCam = {
		pos = Vector(2.75, 191.95, 56.09),
		ang = Angle(16.18, -90.88, 0),
		fov = 9.31
	},
	Height = 2,
	Weight = 3,
	Price = 2000,
	condition = 100,
	Prim = {
		Ammo = "ecpammo",
		Damage = 35,
		KickUp = 0.4,
		KickDown = 0.4,
		KickHorizontal = 0.35,
		Spread = .021,
		IronAccuracy = .01,
		ClipSize = 35
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["aus_w_gatlinglaser"] = {
	BlackList = false,
	Name = "Gatling Laser",
	conditionDrainFactor = 1,
	Desc = "A laser-tossing behemoth, the Gatling Laser is capable of sending out lasers provided by Electron Charge Packs at a blistering rate, swiftly melting most opposition without special protection. Almost unheard of outside of heavy units deployed by the most advanced groups in the wastes." ,
	Slot = "primary",
	Model = "models/hub/weapons/gatlinglaser/gatlinglaser.mdl",
	Width = 4,
	iconCam = {
		pos = Vector(2.75, 191.95, 56.09),
		ang = Angle(16.18, -90.88, 0),
		fov = 9.31
	},
	Height = 3,
	Weight = 3,
	Price = 2000,
	condition = 100,
	Prim = {
		Ammo = "ecpammo",
		Damage = 35,
		Spread = .021,
		IronAccuracy = .01,

	},
	
	--Sec == Secondary
	Sec = {
	}
}

--=== Plasma ===--
PLUGIN.GunData["aus_w_plasmapistol"] = {
	BlackList = false,
	Name = "Plasma Pistol",
	conditionDrainFactor = 1.35,
	Desc = "A chunky pistol throwing superheated goo. While somewhat oversized for a pistol and uncomfortably weighted towards the barrel, its raw effectiveness against most targets is well worth it." ,
	Slot = "secondary",
	Model = "models/illusion/fwp/w_plasmapistol.mdl",
	Width = 3,
	iconCam = {
		pos = Vector(2.75, 191.95, 56.09),
		ang = Angle(16.18, -90.88, 0),
		fov = 9.31
	},
	Height = 1,
	Weight = 3,
	Price = 2000,
	condition = 100,
	Prim = {
		Ammo = "plasmaammo",
		Damage = 35,
		KickUp = 0.4,
		KickDown = 0.4,
		KickHorizontal = 0.35,
		Spread = .021,
		IronAccuracy = .01,
	
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["aus_w_plasmarifle"] = {
	BlackList = false,
	Name = "Plasma Rifle",
	conditionDrainFactor = 1.35,
	Desc = "Perhaps most known as a symbol of the long gone Enclave due to the 'Urban' Plasma Rifle being their service rifle back in the day, it's now a very difficult find but highly prized by all energy enthusiasts." ,
	Slot = "primary",
	Model = "models/illusion/fwp/w_plasmarifle.mdl",
	Width = 3,
	iconCam = {
		pos = Vector(2.75, 191.95, 56.09),
		ang = Angle(16.18, -90.88, 0),
		fov = 9.31
	},
	Height = 2,
	Weight = 3,
	Price = 2000,
	condition = 100,
	Prim = {
		Ammo = "plasmaammo",
		Damage = 35,
		KickUp = 0.4,
		KickDown = 0.4,
		KickHorizontal = 0.35,
		Spread = .021,
		IronAccuracy = .01,
	
	},
	
	--Sec == Secondary
	Sec = {
	}
}




