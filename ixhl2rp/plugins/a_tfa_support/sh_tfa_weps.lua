
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




--=== 9MM ===--
PLUGIN.GunData[ "aus_w_9mmpistol" ] = {
	BlackList = false,
	ID = "9mmpistol",
	Name = "9mm Pistol",
	Desc = "A Browning Hi-Power, common among civillians and law enforcement before the war, and these days wastelanders looking for protection. Also the service pistol for the NCRA.",
	Slot = "secondary",
	Model = "models/illusion/fwp/w_9mmpistol.mdl",
	condition = 100,
	strengthReq = 1,
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
	},
	
	--Sec == Secondary
	Sec = {}
}

PLUGIN.GunData[ "tfa_maria" ] = {
	BlackList = false,
	ID = "9mmpistolunqiue",
	Name = "La Santa",
	Desc = "A Browning Hi-Power, common among civillians and law enforcement before the war, and these days wastelanders looking for protection. Also the service pistol for the NCRA.\nA truly exquisite handgun plated with fine nickel, sporting decorated pearl grips, and bearing fine engraving work, this pistol is the definition of perfection. Match sights and a custom barrel make this true work of art into a deadly weapon; truly, a one of a kind piece.",
	Slot = "secondary",
	Model = "models/illusion/fwp/w_9mmpistol.mdl",
	condition = 100,
	strengthReq = 1,
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
	},
	
	--Sec == Secondary
	Sec = {}
}

PLUGIN.GunData["tfa_9mm_smg"] = {
	BlackList = false,
	ID = "9mmsmg",
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
	strengthReq = 3,
	
	Prim = {
		Ammo = "9mmammo",
	},
	
	--Sec == Secondary
	Sec = {
	}
}


--=== 22LR ===--

PLUGIN.GunData["tfa_22mm_pistol"] = {
	BlackList = false,
	ID = "22pistol",
	Name = "Silenced .22 Pistol",
	Desc = "An integrally suppressed pistol with a very small report when firing. Its compact size and low noise make it very popular for assassinations, but it doesn't really hold up in open combat.",
	Slot = "secondary",
	Model = "models/weapons/tfa_fallout/w_fallout_silenced_22.mdl",
	Width = 1,
	iconCam = {
		pos = Vector(2.75, 191.95, 56.09),
		ang = Angle(16.18, -90.88, 0),
		fov = 9.31
	},
	Height = 1,
	Weight = 3,
	Price = 2000,
	condition = 100,
	strengthReq = 1,
	
	Prim = {
		Ammo = "22lrammo",
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["aus_w_22_smg"] = {
	BlackList = false,
	ID = "22lrsmg",
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
	strengthReq = 3,
	
	Prim = {
		Ammo = "22lrammo",

	},
	
	--Sec == Secondary
	Sec = {
	}
}



PLUGIN.GunData["aus_w_varmintrifle_22"] = {
	BlackList = false,
	ID = "22rifle",
	Name = ".22 Rifle",
	Desc = "A bolt action, ten shot rifle chambered in .22, used for hunting small critters before the war. Nowadays critters may be a bit too big for the small caliber, but its not without its uses.",
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
	strengthReq = 2,
	
	Prim = {
		Ammo = "22lrammo",
		ClipSize = 10,
	},
	
	--Sec == Secondary
	Sec = {
	}
}


--=== .38 SPECIAL ===--
PLUGIN.GunData["aus_w_piperevolver"] = {
	BlackList = false,
	Name = "Pipe Pistol",
	ID = "pipepistol",
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
	strengthReq = 1,
	NoAutomatic = true,
	
	Prim = {
		Ammo = "38specialammo",
	},
	
	--Sec == Secondary
	Sec = {

	},
}

PLUGIN.GunData["tfa_32mm_pistol"] = {
	BlackList = false,
	Name = ".38 Revolver",
	ID = "38revolver",
	conditionDrainFactor = 1,
	Desc = "A snubnose revolver chambering .38 Special, used as a close range self defense weapon. While only holding 5 shots, it offers a sturdier construction and much smaller size than other weapons of the caliber.",
	Slot = "secondary",
	Model = "models/weapons/tfa_fallout/w_fallout_32_snubnose.mdl",
	Width = 1,
	iconCam = {
		pos = Vector(2.75, 191.95, 56.09),
		ang = Angle(16.18, -90.88, 0),
		fov = 9.31
	},
	Height = 1,
	Weight = 3,
	Price = 2000,
	condition = 100,
	strengthReq = 1,
	NoAutomatic = true,
	
	Prim = {
		Ammo = "38specialammo",
	},
	
	--Sec == Secondary
	Sec = {

	},
}

PLUGIN.GunData["aus_w_pipebolt"] = {
	BlackList = false,
	Name = "Bolt Action Pipe Rifle",
	ID = "pipeboltactionrifle",
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
	strengthReq = 3,
	Automatic = false,
	
	Prim = {
		Ammo = "38specialammo",
		ClipSize = 10
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["aus_w_pipeboltscoped"] = {
	BlackList = false,
	Name = "Scoped Bolt Action Pipe Rifle",
	ID = "pipeboltactionriflescoped",
	conditionDrainFactor = 1.50,
	Desc = "A handmade bolt-action rifle with a 'Scope' of a metal tube and two screws installed for sighting. Probably better than relying on just irons, but not by a whole lot.",
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
	strengthReq = 3,
	Automatic = false,
	
	Prim = {
		Ammo = "38specialammo",
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["aus_w_piperiflesemi"] = {
	BlackList = false,
	ID = "pipesemiautorifle",
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
	strengthReq = 3,
	NoAutomatic = true,
	
	Prim = {
		Ammo = "38specialammo",
		ClipSize = 25
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["aus_w_piperifleauto"] = {
	BlackList = false,
	ID = "pipeautorifle",
	Name = "Automatic Pipe Rifle",
	conditionDrainFactor = 1.25,
	Desc = "A handmade pipe gun with improved internals and an auto sear, allowing it to fire in fully automatic - with a slightly bigger drum magazine to boot.",
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
	strengthReq = 3,
	NoAutomatic = true,
	
	Prim = {
		Ammo = "38specialammo",
		ClipSize = 30
	},
	
	--Sec == Secondary
	Sec = {
	}
}




--=== .45 Auto ===--
PLUGIN.GunData["aus_w_45pistol"] = {
	BlackList = false,
	ID = "45autopistol",
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
	strengthReq = 2,
	
	Prim = {
		Ammo = "45autoammo",
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["tfaat_dual_45mm_pistol"] = {
	BlackList = false,
	ID = "45autopistoldual",
	Name = "Truth and Consequences",
	conditionDrainFactor = 1,
	Desc = "A pair of customized 1911s, with a shorter barrel and curved frame so as to not get snagged on clothing. Fine pieces of gunsmithing that look as great as they function. You simply cannot imagine using them seperately.",
	Slot = "secondary",
	Model = "models/halokiller38/fallout/weapons/pistols/45autopistolunique.mdl",
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
	strengthReq = 3,
	
	Prim = {
		Ammo = "45autoammo",
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["aus_w_combatrifle"] = {
	BlackList = false,
	ID = "combatrifle",
	Name = "Combat Rifle",
	conditionDrainFactor = 1,
	Desc = "A chunky, dependable rifle that was once popular primarily among civillian shooters and reserve troops, now having a niche as an accurate, but cheap to feed semi automatic.",
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
	strengthReq = 3,
	
	Prim = {
		Ammo = "45autoammo",
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["aus_w_submachinegun"] = {
	BlackList = false,
	ID = "45autosmg",
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
	strengthReq = 4,
	
	
	Prim = {
		Ammo = "45autoammo",
	},
	
	--Sec == Secondary
	Sec = {
	}
}


--=== 10mm ===--
PLUGIN.GunData["tfa_10mm_pistol"] = {
	BlackList = false,
	ID = "10mmpistol",
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
	strengthReq = 2,
	
	Prim = {
		Ammo = "10mmammo",
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["tfaat_10mm_smg"] = {
	BlackList = false,
	Name = "10mm Submachine Gun",
	ID = "10mmsmg",
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
	strengthReq = 4,
	
	Prim = {
		Ammo = "10mmammo",
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["aus_w_smmg"] = {
	BlackList = false,
	ID = "smmg",
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
	strengthReq = 7,
	
	Prim = {
		Ammo = "10mmammo",
	},
	
	--Sec == Secondary
	Sec = {
	}
}

--=== .357 ===--
PLUGIN.GunData["tfa_357mm_pistol"] = {
	BlackList = false,
	ID = "357magnumrevolver",
	Name = ".357 Magnum Revolver",
	conditionDrainFactor = 0.8,
	Desc = "A reproduction Colt Single Action Army, an iconic firearm of the old west, chambered in the more modern .357 magnum. Though its fixed cynlinder and single action make it outdated compared to more modern weapons, it's still often carried for style and for self defense by farmers and townies.",
	Slot = "secondary",
	Model = "models/weapons/tfa_fallout/w_fallout_357_revolver.mdl",
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
	strengthReq = 2,
	
	Prim = {
		Ammo = "357magnumammo",
	},
	
	--Sec == Secondary
	Sec = {
	}
}

--=== .357 ===--
PLUGIN.GunData["tfa_police_pistol"] = {
	BlackList = false,
	ID = "policepistol",
	Name = "Police Pistol",
	conditionDrainFactor = 0.8,
	Desc = "A double-action revolver often used by American police departments. It is known for its reliability, accuracy, and compact size.",
	Slot = "secondary",
	Model = "models/halokiller38/fallout/weapons/pistols/policepistol.mdl",
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
	strengthReq = 2,
	
	Prim = {
		Ammo = "357magnumammo",
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["tfa_cowboy_repeater"] = {
	BlackList = false,
	ID = "cowboyrepeater",
	Name = "Cowboy Repeater",
	conditionDrainFactor = 0.8,
	Desc = "A lever action rifle firing .357 Magnum, a common fixture around homesteads, to both defend against opportunistic bandits and aggressive pests.",
	Model = "models/weapons/tfa_fallout/w_fallout_cowboy_repeater.mdl",
	Width = 3,
	iconCam = {
		pos = Vector(2.75, 191.95, 56.09),
		ang = Angle(16.18, -90.88, 0),
		fov = 9.31
	},
	Height = 1,
	Weight = 4,
	Price = 2000,
	condition = 100,
	strengthReq = 3,
	
	Prim = {
		Ammo = "357magnumammo",
	},
	
	--Sec == Secondary
	Sec = {
	}
}


--=== .44 Magnum ===--
PLUGIN.GunData["aus_w_44magnum"] = {
	BlackList = false,
	Name = ".44 Magnum Revolver",
	ID = ".44magnumrevolver",
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
	strengthReq = 3,
	Prim = {
		Ammo = "44magnumammo",
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["tfa_trail_carbine"] = {
	BlackList = false,
	Name = "Trail Carbine",
	ID = "trailcarbine",
	conditionDrainFactor = 1,
	Desc = "A lever action rifle with generous tube magazine. Once used for hunting bigger game like Buck, it's now a favorite of the New California Republic Rangers.",
	Slot = "primary",
	Model = "models/weapons/tfa_fallout/w_fallout_trail_carbine.mdl",
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
	strengthReq = 4,
	Prim = {
		Ammo = "44magnumammo",
	},
	
	--Sec == Secondary
	Sec = {
	}
}

--=== 12.7 ===--
PLUGIN.GunData["aus_w_127pistol"] = {
	BlackList = false,
	Name = "12.7mm Pistol",
	ID = "127mmpistol",
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
	strengthReq = 6,
	Prim = {
		Ammo = "127mmammo",
	},
	
	--Sec == Secondary
	Sec = {
	}
}



--=== 5.56 ===--

PLUGIN.GunData["aus_w_varmintrifle"] = {
	BlackList = false,
	ID = "varmintrifle",
	Name = "Varmint Rifle",
	Desc = "A bolt action, five shot rifle chambered in 5.56. Effective as a defensive tool for the home.. or the body.",
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
	strengthReq = 2,
	
	Prim = {
		Ammo = "556ammo",
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["aus_w_servicerifle"] = {
	BlackList = false,
	Name = "Service Rifle",
	ID = "servicerifle",
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
	strengthReq = 2,
	Prim = {
		Ammo = "556ammo",
		ClipSize = 20,
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["tfa_556mm_pistol"] = {
	BlackList = false,
	Name = "5.56 Pistol",
	ID = "556pistol",
	conditionDrainFactor = 1,
	Desc = "An curious 5-shot revolver loading 5.56 rounds normally meant for rifles. Quite hard to find, but the end result is the power of the round in a compact package. Its small size and short barrel also translate to hefty recoil and less accuracy, however.",
	Slot = "secondary",
	Model = "models/weapons/tfa_fallout/w_fallout_556_pistol.mdl",
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
	strengthReq = 3,
	Prim = {
		Ammo = "556ammo",
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["aus_w_hmar"] = {
	BlackList = false,
	Name = "Homemade Assault Rifle",
	ID = "homemadeassaultrifle",
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
	strengthReq = 4,
	Prim = {
		Ammo = "556ammo",
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["aus_w_r91"] = {
	BlackList = false,
	Name = "R91 Assault Rifle",
	ID = "r91assaultrifle",
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
	strengthReq = 5,
	Prim = {
		Ammo = "556ammo",
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["aus_w_chinesear"] = {
	BlackList = false,
	Name = "Chinese Assault Rifle",
	ID = "chineseassaultrifle",
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
	strengthReq = 5,
	Prim = {
		Ammo = "556ammo",
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["aus_w_marksmancarbine"] = {
	BlackList = false,
	Name = "Marksman Carbine",
	ID = "marksmancarbine",
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
	strengthReq = 4,
	Prim = {
		Ammo = "556ammo",
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["aus_w_assaultrifle"] = {
	BlackList = false,
	Name = "Light Machine Gun",
	ID = "lightmachinegun",
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
	strengthReq = 7,
	Prim = {
		Ammo = "556ammo",
		ClipSize = 60,
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["tfa_bozar"] = {
	BlackList = false,
	Name = "Bozar",
	ID = "bozar",
	conditionDrainFactor = 1,
	Desc = "A bizarre crossover of a weapon, this rarity offers the blazing fast fire rate of an LMG combined with the high-spec parts and scope of a sniper rifle, making it quite good at both tasks, but is offset by its rather standard magazine capacity." ,
	Slot = "primary",
	Model = "models/weapons/tfa_fallout/w_fallout_bozar.mdl",
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
	strengthReq = 6,
	Prim = {
		Ammo = "556ammo",
	},
	
	--Sec == Secondary
	Sec = {
	}
}


--=== Buckshot ===--

PLUGIN.GunData["tfa_single_shotgun"] = {
	BlackList = false,
	ID = "singleshotgun",
	Name = "Single Shotgun",
	conditionDrainFactor = 1,
	Desc = "An break action, single-shot shotgun using the smaller 20 Gauge shell. Tends to be used by homesteaders as a tool against critters or thieves on a strict budget." ,
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
	strengthReq = 5,
	MultiAmmo = "true",
	Prim = {
		Ammo = "20gaugeammo",
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["aus_w_caravanshotgun"] = {
	BlackList = false,
	ID = "caravanshotgun",
	Name = "Caravan Shotgun",
	conditionDrainFactor = 1,
	Desc = "An under-over double barreled shotgun generaly used by trade caravan guards, bartenders, and farmers. Effective, and simple. Loads 20 Gauge buckshot." ,
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
	strengthReq = 5,
	Prim = {
		Ammo = "20gaugeammo",
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["tfa_lever_action_shotgun"] = {
	BlackList = false,
	ID = "leveractionshotgun",
	Name = "Lever Action Shotgun",
	conditionDrainFactor = 1,
	Desc = "An chunky but compact lever action shotgun that loads and dispenses 20 Gauge buckshot. Relatively easy to handle when you get used to it and dependable, it makes a fine addition to any loadout." ,
	Slot = "primary",
	Model = "models/weapons/tfa_fallout/w_fallout_lever_action_shotgun.mdl",
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
	strengthReq = 5,
	Prim = {
		Ammo = "20gaugeammo",
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["tfa_sawedoff_shotgun"] = {
	BlackList = false,
	Name = "Sawnoff Shotgun",
	ID = "sawnoffshotgun",
	conditionDrainFactor = 1,
	Desc = "A double barrel 12 gauge shotgun, cut down to about half length. The result is very concealable and even a solid backup weapon, but has horrible accuracy beyond very close range." ,
	Slot = "secondary",
	Model = "models/weapons/tfa_fallout/w_fallout_sawedoff_shotgun.mdl",
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
	strengthReq = 4,
	Prim = {
		Ammo = "12gaugeammo",
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["aus_w_huntingshotgun"] = {
	BlackList = false,
	Name = "Hunting Shotgun",
	ID = "huntingshotgun",
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
	strengthReq = 5,
	Prim = {
		Ammo = "12gaugeammo",
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["aus_w_combatshotgundrum"] = {
	BlackList = false,
	Name = "Combat Shotgun",
	ID = "combatshotgun",
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
	strengthReq = 6,
	Prim = {
		Ammo = "12gaugeammo",
	},
	
	--Sec == Secondary
	Sec = {
	}
}


--=== 5mm ===--
PLUGIN.GunData["aus_w_assaultcarbine"] = {
	BlackList = false,
	Name = "Assault Carbine",
	ID = "assaultcarbine",
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
	strengthReq = 4,
	Prim = {
		Ammo = "5mmammo",
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["aus_w_minigun"] = {
	BlackList = false,
	ID = "minigun",
	Name = "Minigun",
	conditionDrainFactor = 0.50,
	Desc = "A massive rotary cannon, capable of swiftly tearing through damn near anything. Nearly impossible to use without power armor or some other form of enhanced strength. Requires 5mm rounds linked together on a disintegrating belt to load." ,
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
	strengthReq = 8,
	Prim = {
		Ammo = "5mmboxammo",
	},
	
	--Sec == Secondary
	Sec = {
	}
}

--=== .308 ===--
PLUGIN.GunData["aus_w_huntingrifle"] = {
	BlackList = false,
	ID = "huntingrifle",
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
	strengthReq = 6,
	Prim = {
		Ammo = "308ammo",
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["aus_w_battle_rifle"] = {
	BlackList = false,
	ID = "battlerifle",
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
	strengthReq = 6,
	Prim = {
		Ammo = "308ammo",
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["aus_w_sniperrifle"] = {
	BlackList = false,
	ID = "sniperrifle",
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
	strengthReq = 6,
	Prim = {
		Ammo = "308ammo",
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["aus_w_bar"] = {
	BlackList = false,
	ID = "automaticrifle",
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
	strengthReq = 6,
	Prim = {
		Ammo = "308ammo",
	},
	
	--Sec == Secondary
	Sec = {
	}
}


--=== .50MG ===--
PLUGIN.GunData["aus_w_amr"] = {
	BlackList = false,
	ID = "antimat",
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
	strengthReq = 7,
	Prim = {
		Ammo = "50mgammo",
	},
	
	--Sec == Secondary
	Sec = {
	}
}

--=== 2mmEC ===--
PLUGIN.GunData["aus_w_gauss"] = {
	BlackList = false,
	ID = "gaussrifle",
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
	strengthReq = 5,
	Prim = {
		Ammo = "2mmecammo",
	},
	
	--Sec == Secondary
	Sec = {
	}
}


--=== 40mm Grenade ===--
PLUGIN.GunData["aus_w_launcher_nade"] = {
	BlackList = false,
	ID = "grenadelauncher",
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
	},
	
	--Sec == Secondary
	Sec = {
	}
}

--=== Laser Canister ===--

PLUGIN.GunData["tfa_laser_revolver"] = {
	BlackList = false,
	ID = "homemadelaserpistol",
	Name = "Homemade Laser Pistol",
	conditionDrainFactor = 1.50,
	Desc = "A homemade laser pistol fashioned from a conventional firearm, but made to expend low-wattage 'laser canisters'. Often in the hands of enterprising eggheads that have an interest in energy weapons but cannot find any manufactured options and thus make their own. " ,
	Slot = "secondary",
	Model = "models/destiny/props/lasrev.mdl",
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
	strengthReq = 2,
	Prim = {
		Ammo = "lasercanisterammo",
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["aus_w_lasermusket"] = {
	BlackList = false,
	ID = "homemadelaserrifle",
	Name = "Homemade Laser Rifle",
	conditionDrainFactor = 1.50,
	Desc = "Made out of salvaged laser rifle parts and whatever could be found, loading makeshift 'laser canisters' that can be self-made but at the cost of power, capacity and durability." ,
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
	strengthReq = 4,
	Prim = {
		Ammo = "lasercanisterammo",
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["aus_w_lasermusket_sixshot"] = {
	BlackList = false,
	ID = "sixshothomemadelaserrifle",
	Name = "Six-Shot Homemade Laser Rifle",
	conditionDrainFactor = 1.25,
	Desc = "A homemade laser rifle with an improved capacitator, allowing six shots before a reload." ,
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
	strengthReq = 4,
	Prim = {
		Ammo = "lasercanisterammo",
	},
	
	--Sec == Secondary
	Sec = {
	}
}

--=== MFC ===--
PLUGIN.GunData["tfa_laser_pistol"] = {
	BlackList = false,
	Name = "Laser Pistol",
	ID = "laserpistol",
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
	strengthReq = 2,
	Prim = {
		Ammo = "mfcammo",
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["aus_w_laserrifle"] = {
	BlackList = false,
	ID = "laserrifle",
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
	strengthReq = 4,
	Prim = {
		Ammo = "mfcammo",
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["aus_w_tribeam"] = {
	BlackList = false,
	ID = "tribeamlaserrifle",
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
	strengthReq = 4,
	Prim = {
		Ammo = "mfcammo",
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["tfa_laer"] = {
	BlackList = false,
	ID = "laer",
	Name = "LAER",
	conditionDrainFactor = 2.25,
	Desc = "The LAER, or Laser-Assisted Electrical Rifle, is a rare energy rifle that fires a much more intense beam than the common laser rifle, but tends to be less accurate. It's also extremely finicky with repairs." ,
	Slot = "primary",
	Model = "models/fallout/fonv/laer/w_fallout_laer.mdl",
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
	strengthReq = 4,
	Prim = {
		Ammo = "mfcammo",
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["aus_w_wattzlasergun"] = {
	BlackList = false,
	ID = "wattzlasersniperrifle",
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
	strengthReq = 4,
	Prim = {
		Ammo = "mfcammo",
	},
	
	--Sec == Secondary
	Sec = {
	}
}

--=== MFC Breeder ===--
PLUGIN.GunData["tfa_recharger_rifle"] = {
	BlackList = false,
	Name = "Recharger Rifle",
	ID = "rechargerrifle",
	conditionDrainFactor = 1.50,
	Desc = "The Recharger Rifle is the first of a line of self-charging rifles. Though having theoretically infinite ammo, it cannot be quickly reloaded and sports a low wattage for a commercially made laser weapon." ,
	Slot = "primary",
	Model = "models/fallout/fonv/rechargerrifle/c_fallout_recharger_rifle.mdl",
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
	strengthReq = 4,
	Prim = {
		ClipSize = 7
	},
	
}

PLUGIN.GunData["tfa_recharger_pistol"] = {
	BlackList = false,
	Name = "Recharger Pistol",
	ID = "rechargerpistol",
	conditionDrainFactor = 1.50,
	Desc = "The second in a line of self-charging rifles, the Recharger Pistol offers acceptable laserpower in a smaller package comparable to an AEP-7, but the lack of stock to steady one's aim make it less viable over range compared to the older Rifle model.",
	Slot = "secondary",
	Model = "models/fallout/fonv/rechargerpistol/w_fallout_recharger_pistol.mdl",
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
	strengthReq = 2,
}

PLUGIN.GunData["tfa_hyperbreeder"] = {
	BlackList = false,
	Name = "MF Hyperbreeder Alpha",
	ID = "hyperbreeder",
	conditionDrainFactor = 1.50,
	Desc = "The newest and rarest version of the self-charging weapon line, the Hyperbreeder is able to fire in automatic and sports a higher wattage than even its regular counterpart, but has a small, quicker charging capacity, almost serving as an energy machine pistol.",
	Slot = "secondary",
	Model = "models/fallout/fonv/rechargerpistol/w_fallout_fhyperbreeder.mdl",
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
	strengthReq = 3,
}


--=== ECP ===--
PLUGIN.GunData["aus_w_rcw"] = {
	BlackList = false,
	ID = "laserrcw",
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
	strengthReq = 5,
	Prim = {
		Ammo = "ecpammo",
		ClipSize = 35
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["aus_w_gatlinglaser"] = {
	BlackList = false,
	ID = "gatlinglaser",
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
	strengthReq = 7,
	Prim = {
		Ammo = "ecpammo",

	},
	
	--Sec == Secondary
	Sec = {
	}
}

--=== Plasma ===--
PLUGIN.GunData["aus_w_plasmapistol"] = {
	BlackList = false,
	ID = "plasmapistol",
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
	strengthReq = 2,
	Prim = {
		Ammo = "plasmaammo",
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["aus_w_plasmarifle"] = {
	BlackList = false,
	ID = "plasmarifle",
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
	strengthReq = 4,
	Prim = {
		Ammo = "plasmaammo",
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["tfa_multiplas"] = {
	BlackList = false,
	ID = "multiplas",
	Name = "Multiplas",
	conditionDrainFactor = 1.35,
	Desc = "The Plasma answer to the tri-beam laser rifle, the Multiplas splits a single plasma glob into several. Capable of putting out more damage than a typical plasma rifle, at the cost of spread rendering it quite inaccurate over longer distances.",
	Slot = "primary",
	Model = "models/fallout/fonv/plasmarifle/w_fallout_multiplas_rifle.mdl",
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
	strengthReq = 5,
	Prim = {
		Ammo = "plasmaammo",
		ClipSize = 10
	},
	
	--Sec == Secondary
	Sec = {
	}
}

PLUGIN.GunData["tfa_plasma_caster"] = {
	BlackList = false,
	ID = "plasmacaster",
	Name = "Plasma Caster",
	conditionDrainFactor = 1,
	Desc = "The origonal plasma rifle, an industrial model. While it is very bulky and holds less shots per cartridge, its plasma projectiles are much more potent and fast. Not very common even among the few factions capable of fielding it due to its upsides being better served by other options.",
	Slot = "primary",
	Model = "models/fallout/fonv/plasmacaster/w_fallout_plasma_caster.mdl",
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
	strengthReq = 8,
	Prim = {
		Ammo = "plasmaammo",
	},
	
	--Sec == Secondary
	Sec = {
	}
}




