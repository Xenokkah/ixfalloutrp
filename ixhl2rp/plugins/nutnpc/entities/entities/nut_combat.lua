-- "gamemodes\\halorp\\plugins\\combat\\entities\\entities\\ix_combat.lua"

-- Retrieved by https://github.com/c4fe/glua-steal

local PLUGIN = PLUGIN



ix.util.Include("sh_anim.lua")

-- ix.util.include("sh_buffs.lua")

ix.util.Include("sh_helpers.lua")

-- ix.util.include("sh_cd.lua")



ENT.Type = "nextbot"

ENT.Base = "base_nextbot"

ENT.PrintName = "Combat Base"

ENT.Category = "ixScript"

ENT.Spawnable = false

ENT.AdminOnly = true

ENT.combat = true



ENT.model = "models/Humans/Group01/male_02.mdl"



--ENT.name = "Bob"



--ENT.hpMax = 0

--ENT.mpMax = 0



--[[

ENT.dmg = {

	["Slash"] = 0,

}



ENT.armor = 0



ENT.attribs = {

	["stm"] = 0,

	["str"] = 0,

	["accuracy"] = 0,

	["medical"] = 0,

	["end"] = 0,

	["luck"] = 0,

	["perception"] = 0,

	["fortitude"] = 0,

}



ENT.res = {

	["Pierce"] = 0,

	["Slash"] = 0,

	["Blunt"] = 0,

	

	["Ichor"] = 0,

	["Blight"] = 0,

	["Shard"] = 0,

	["Distort"] = 0,

	

	["Cold"] = 0,

	["Fire"] = 0,

	["Explosion"] = 0,

	["Acid"] = 0,

	["Poison"] = 0,

	["Electric"] = 0,

}



ENT.tags = {

	["Humanoid"] = true,

}



ENT.tagsBonus = {

	["Humanoid"] = 1,

}

--]]



ENT.RenderGroup = RENDERGROUP_TRANSLUCENT



--ENT.material = "phoenix_storms/mrref2"



function ENT:Initialize()

	self:basicSetup()

end



--this is just here because it's a nextbot

function ENT:RunBehaviour()

	while (true) do

		coroutine.wait(60)

		

		coroutine.yield()

	end

end



function ENT:basicSetup()

	self:SetRenderMode(RENDERMODE_TRANSALPHA)

	self:UseClientSideAnimation() --UR WELCOME FAGS

	if (SERVER) then

		--self.attribs = self.savedAttribs or self.attribs or {}

		--self.inv = self.inv or {}

	

		local model

		if (self.models) then

			model = table.Random(self.models)

		else

			model = self.model

		end



		self:SetModel(self.savedModel or model)

		self:SetMaterial(self.savedMat or self.material or self:GetMaterial())

		self:SetColor(self.savedColor or self.color)

		self:SetSkin(self.savedskin or self:GetSkin())

		if (istable(self.savedbodygroups)) then

			for k2, v2 in pairs(self.savedbodygroups) do

				self:SetBodygroup(k2, v2)

			end

		end

		

		self:SetUseType(SIMPLE_USE)

		

		if (!self.saveKey) then

			self:DropToFloor()

		end

		

		--self:SetNetVar("name", self:GetNetVar("name", self.name or self.PrintName))

		--self:SetNetVar("desc", self:GetNetVar("desc", self.desc or ""))

	end

	

	self:physicsSetup()

	

	timer.Simple(0.5, function()

		if (IsValid(self)) then

			self:DrawShadow(true)
			self:setAnim()

		end

	end)

end



function ENT:physicsSetup()

	self:DrawShadow(true)
	
	if (SERVER) then

		--self:SetMoveType(MOVETYPE_STEP)

		self:DrawShadow(true)

		self:PhysicsInit(SOLID_VPHYSICS)

		self:SetSolid(SOLID_BBOX)



		local physObj = self:GetPhysicsObject()

			

		if (IsValid(physObj)) then

			physObj:EnableMotion(false)

			physObj:EnableGravity(false)

			--physObj:Sleep()

			physObj:EnableCollisions(false)

		end

		

		if(self.loco) then

			self.loco:SetAcceleration(900)

			self.loco:SetDeceleration(100000)

			self.loco:SetGravity(0)

			

			self:SetGravity(0)

		end

	end

	

	self:SetCollisionBounds(Vector(-20,-20,0), Vector(20,20,100))

	self:SetCollisionGroup(COLLISION_GROUP_WEAPON)

end



function ENT:getSaveData()

	local saveData = {}

	saveData.name = self:Name() or "Name Corrupted"

	saveData.desc = self:Desc() or "Desc Corrupted"

	--saveData.hp = self:getHP()

	--saveData.hpMax = self:getMaxHP()

	--saveData.mp = self:getMP()

	--saveData.mpMax = self:getMaxMP()

	--saveData.attribs = self.attribs

	--saveData.actions = self.actions

	--saveData.dmg = self.dmg

	--saveData.res = self:GetNetVar("res")

	--saveData.amp = self:GetNetVar("amp")

	if self.curbonegun then

		saveData.gunmodel = self.curbonegun
		
	end

	saveData.model = self:GetModel()

	saveData.mat = self:GetMaterial()

	saveData.anim = self:GetSequence()

	saveData.color = self:GetColor()

	saveData.skin = self:GetSkin()

	

	saveData.bodygroups = {

		self:GetBodygroup(1),

		self:GetBodygroup(2),

		self:GetBodygroup(3),

		self:GetBodygroup(4),

		self:GetBodygroup(5),

		self:GetBodygroup(6),

		self:GetBodygroup(7),

		self:GetBodygroup(8),

		self:GetBodygroup(9),

		self:GetBodygroup(10),

		self:GetBodygroup(11),

		self:GetBodygroup(12),

	}

	

	return saveData

end



function ENT:Think()
	--self:CustomThink()

	if (CLIENT) then
		--self:SetNextClientThink( CurTime() + 0.025 )
	end

	if (SERVER) then

		--self:NextThink( CurTime() + 0.025 )


		if (self.loco) then

			if (self:IsPlayerHolding()) then

				--if held with physgun while moving, will teleport to end when hold ends

				if (self.desiredPos) then 

					self.nudged = true

				end

			else

				local physObj = self:GetPhysicsObject()

				

				if (IsValid(physObj) and !physObj:IsAsleep()) then

					physObj:Sleep()

				end

				

				--if held with physgun while moving, will teleport to end when hold ends

				if (self.nudged and self.desiredPos) then

					self:SetPos(self.desiredPos)

					self.desiredPos = nil

					self.nudged = nil

					

					self:resetAnim()

				end

				

				if (!self.desiredPos) then

					if self:GetVelocity():LengthSqr() > 0 then

						self.loco:SetVelocity(Vector(0,0,0))

					end

				end
				
				if (self.desiredPos and !self.loco:IsOnGround()) then --basically they drift off into the sunset if you dont do this

					self:SetPos(self.desiredPos)

					self.desiredPos = nil

					

					self:resetAnim()

				end

			end

			

			if (self.desiredPos) then

				self.loco:Approach(self.desiredPos, 1)


				local stuck = self.loco:IsStuck()
				--128
				if (self:GetRangeSquaredTo(self.desiredPos) < 32 or stuck) then

					self.loco:SetVelocity(Vector(0,0,0))

					self:SetPos(self.desiredPos)

					self.desiredPos = nil

					self:resetAnim()

				end

			end



			if (IsValid(self.follow) and !self.desiredPos and !(self.follow and self.follow:InVehicle())) then

				local followPos = self.follow:GetPos() + self.follow:GetRight() * -50

			

				local range = self:GetRangeSquaredTo(followPos)

			

				if (range > 32768 and !stuck) then

					self:movementStart(followPos)

				

					self.desiredPos2 = followPos
					--256
				elseif ((self.desiredPos2 and range < 64) or stuck) then

					self.loco:SetVelocity(Vector(0,0,0))



					self:SetPos(followPos)

					

					self.desiredPos2 = nil

					

					self:resetAnim()

				end

				

				if (self.desiredPos2) then

					self.loco:Approach(followPos, 1)

				end

			end

		end

	end


	return true 
end


--[[function ENT:CustomThink()end]]

function ENT:HandleStuck() end


--death

function ENT:die()

	if(!self.noRag) then

		local ragdoll = ents.Create("prop_ragdoll")

		if IsValid(ragdoll) then 

			ragdoll:SetPos(self:GetPos())

			ragdoll:SetModel(self:GetModel())

			ragdoll:SetAngles(self:GetAngles())

			ragdoll:Spawn()

			ragdoll:SetSkin(self:GetSkin())

			ragdoll:SetColor(self:GetColor())

			ragdoll:SetMaterial(self:GetMaterial())

			ragdoll:SetBloodColor(self:GetBloodColor())

				

			local num = ragdoll:GetPhysicsObjectCount()-1

	   

			for i=0, num do

				local bone = ragdoll:GetPhysicsObjectNum(i)



				if IsValid(bone) then

					local bp, ba = self:GetBonePosition(ragdoll:TranslatePhysBoneToBone(i))

					if bp and ba then

						bone:SetPos(bp)

						bone:SetAngles(ba)

					end

				end

			end

				

			--I hate this

			ragdoll:SetBodygroup(1, self:GetBodygroup(1))

			ragdoll:SetBodygroup(2, self:GetBodygroup(2))

			ragdoll:SetBodygroup(3, self:GetBodygroup(3))

			ragdoll:SetBodygroup(4, self:GetBodygroup(4))

			ragdoll:SetBodygroup(5, self:GetBodygroup(5))

			ragdoll:SetBodygroup(6, self:GetBodygroup(6))

			ragdoll:SetBodygroup(7, self:GetBodygroup(7))

			ragdoll:SetBodygroup(8, self:GetBodygroup(8))

			ragdoll:SetBodygroup(9, self:GetBodygroup(9))

			ragdoll:SetBodygroup(10, self:GetBodygroup(10))

			ragdoll:SetBodygroup(11, self:GetBodygroup(11))

			ragdoll:SetBodygroup(12, self:GetBodygroup(12))

			

			ragdoll:SetCollisionGroup(COLLISION_GROUP_DEBRIS_TRIGGER)

			

			if (self:IsOnFire()) then --if the npc is on fire, set the ragdoll on fire too.

				ragdoll:Ignite(10,20)

			end

			

			ragdoll.hasMenu = true

		end

	

		--gets rid of ragdolls that dont have phys objects, just a cautionary thing.

		if(!IsValid(ragdoll:GetPhysicsObject())) then

			SafeRemoveEntity(ragdoll)

		end		

	end

	

	--[[if(self.inv) then

		for k, v in pairs(self.inv) do

			ix.item.Spawn(v, self:GetPos())

		end

	end]]

	

	SafeRemoveEntity( self )

end



function ENT:movementStart(position)

	if (SERVER) then

		local tempEnt = ents.Create("info_particle_system")

		tempEnt:SetParent(self)

		tempEnt:SetPos(position)

		

		self:PointAtEntity(tempEnt)

		local angle = self:GetAngles()

		self:SetAngles(Angle(0, angle.y, 0))

		

		SafeRemoveEntity(tempEnt)

		

		self.desiredPos = position

		

		self:walkAnims(self:GetPos():Distance(position))

	end

end


--dont do anything
function ENT:OnTakeDamage(dmginfo) end

--dont do it
function ENT:OnTraceAttack( dmginfo, dir, trace ) end

--no
function ENT:OnKilled( dmginfo ) end


--[[function ENT:turnProcess(turn, you)

	if (you) then		

		for k, v in pairs(self:getBuffs()) do

			if(v.func) then

			

			end

		
			if(v.dmg) then --damaging spells

				local dmgT = v.dmgT or "Blunt"

				local dmg = self:receiveDamage(v.dmg, dmgT) --gets the damage based on their resistances

				self:addHP(dmg * -1) --reduce their hp by the dmg

			end


			if(v.duration) then --counts down the duration

				v.duration = v.duration - 1

				if(v.duration <= 0) then

					self:removeBuff(v, v.uid)

				else



				end

			end

		end		

	else



	end

end]]



--adds a weapon model to a CEnt's hands

function ENT:EquipWeapon(modelPath, materialPath)

	if(IsValid(self.weapon)) then 

		SafeRemoveEntity(self.weapon)

	end



	self.WeaponMount = self:LookupAttachment("anim_attachment_RH")

	self.WeaponPosition = self:GetAttachment(self.WeaponMount)



	self.weapon = ents.Create("prop_dynamic")

	self.weapon:SetModel(modelPath)

	

	if(materialPath) then

		self.weapon:SetMaterial(materialPath)

	end

	

	self.weapon:Spawn()

	self.weapon:SetParent(self, self.WeaponMount)

	self.weapon:SetMoveType(MOVETYPE_NONE)

	

	if(self.weapon:GetBoneCount() > 1) then

		self.weapon:AddEffects(EF_BONEMERGE)

	elseif(self.WeaponPosition) then

		self.weapon:SetPos(self.WeaponPosition.Pos)

		self.weapon:SetAngles(self.WeaponPosition.Ang)

	end

end


local niggertest = Color(88,88,88)
function ENT:OnPopulateEntityInfo(container)

	local name = container:AddRow("name")

	name:SetImportant()

	name:SetText(self:Name())

	name:SetTextColor(niggertest)

	name:SizeToContents()



	if (self:Desc()) then

		local description = container:AddRow("description")

		description:SetText(self:Desc())

		description:SizeToContents()

	end

end





PLUGIN.CEntBase = ENT

