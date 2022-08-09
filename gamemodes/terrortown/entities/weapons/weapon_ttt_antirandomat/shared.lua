SWEP.Base = "weapon_tttbase"
SWEP.Spawnable = true
SWEP.AutoSpawnable = false
SWEP.HoldType = "slam"
SWEP.AdminSpawnable = true
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false
SWEP.Kind = WEAPON_EQUIP2

if SERVER then
    AddCSLuaFile()
    resource.AddFile("materials/VGUI/ttt/icon_antirandomat.vmt")
    util.AddNetworkString("AntiRandomatMessage")
    util.AddNetworkString("AntiRandomatOverrideTargetID")
    util.AddNetworkString("AntiRandomatHooks1")
    util.AddNetworkString("AntiRandomatHooks2")
    util.AddNetworkString("AntiRandomatBlur")

	-- -----------------------------
	-- ConVar Configuration Creation
	-- -----------------------------

	-- Event: Bein Flash
    CreateConVar("antirandomat_beinflash", "1", FCVAR_NOTIFY, "Normal Speed is bleakly, isn´t it?", 0, 1)
	CreateConVar("antirandomat_beinflash_speed", "500", FCVAR_NOTIFy, "New walk speed")

	-- Event: 300
    CreateConVar("antirandomat_300", "1", FCVAR_NOTIFY, "300 Seconds left to Live!", 0, 1)
	CreateConVar("antirandomat_300_time", "300", FCVAR_NOTIFY, "How much time to give when 300 event is picked.")

	-- Event: Disguise
    CreateConVar("antirandomat_disguise", "1", FCVAR_NOTIFY, "Do you think you can only recognize your fellow players by the model? We will see.", 0, 1)
	CreateConVar("antirandomat_disguise_force_model", "1", FCVAR_NOTIFY, "Should disguise force a model on everyone?", 0, 1)
	CreateConVar("antirandomat_disguise_model", "models/player/eli.mdl", FCVAR_NOTIFY, "The model to use", 0, 1)

	-- Event: Random Damage
    CreateConVar("antirandomat_rngdamage", "1", FCVAR_NOTIFY, "Random Damage for Everyone!", 0, 1)
	CreateConVar("antirandomat_rngdamage_min", "1", FCVAR_NOTIFY, "Minimum damage for random")
	CreateConVar("antirandomat_rngdamage_max", "50", FCVAR_NOTIFY, "Maximum damage for random")

	-- Event: Jump
    CreateConVar("antirandomat_jump", "1", FCVAR_NOTIFY, "Some of you jump up normally. The rest is unlucky!", 0, 1)
	CreateConVar("antirandomat_jump_normal", "150", FCVAR_NOTIFY, "Jump power for regular jumps. GMOD default is 150")
	CreateConVar("antirandomat_jump_unlucky", "0", FCVAR_NOTIFY, "Jump power for unlucky players.")

	-- Event: Sudden Death
    CreateConVar("antirandomat_suddendeath", "1", FCVAR_NOTIFY, "Everybody has only 1HP! Of course nobody can heal himself.", 0, 1)
	CreateConVar("antirandomat_suddendeath_hp", "1", FCVAR_NOTIFY, "What HP to set everybody for sudden death event.")

	-- Event: Screen Flip
    CreateConVar("antirandomat_screenflip", "1", FCVAR_NOTIFY, "What do you think happens when we flip the Screen? Let's try it out!", 0, 1)

	-- Event: Nausea Effect
	CreateConVar("antirandomat_nauseaeffect", "1", FCVAR_NOTIFY, "", 0, 1)

	-- Event: No Detective
    CreateConVar("antirandomat_nodetective", "1", FCVAR_NOTIFY, "", 0, 1)
	CreateConVar("antirandomat_nodetective_role", ROLE_INNOCENT, FCVAR_NOTIFY, "Role to default detectives to.\nFor list of all roles run console command: lua_find ROLE_\nOnce role is found use the number found in the parenthesis")

	-- Event: Hail The King
    CreateConVar("antirandomat_hailtheking", "1", FCVAR_NOTIFY, "", 0, 1)
	CreateConVar("antirandomat_hailtheking_hp", "200", FCVAR_NOTIFY, "How much HP should the detective be set to")
	CreateConVar("antirandomat_hailtheking_penalty_hp", "25", FCVAR_NOTIFY, "What HP should be in the event detective was already killed.")
	CreateConVar("antirandomat_hailtheking_use_model", "1", FCVAR_NOTIFY, "Whether or not the kings model is changed", 0, 1)
	CreateConVar("antirandomat_hailtheking_model", "models/player/riot.mdl", FCVAR_NOTIFY, "The model to use")

	-- Event: Collapsing
    CreateConVar("antirandomat_collapsing", "1", FCVAR_NOTIFY, "", 0, 1)
	CreateConVar("antirandomat_collapsing_time_to_fade", "3", FCVAR_NOTIFY, "Time before screen is full black in seconds")
	CreateConVar("antirandomat_collapsing_time_to_hold", "10", FCVAR_NOTIFY, "Time to hold fade")
	CreateConVar("antirandomat_collapsing_time_to_move", "8", FCVAR_NOTIFY, "Time before moving players happen")
	CreateConVar("antirandomat_collapsing_time_to_wake", "12", FCVAR_NOTIFY, "Time before wake-up happens")

	-- Event: Bugs Bunny
    CreateConVar("antirandomat_bugsbunny", "1", FCVAR_NOTIFY, "Let´s turn you all into Bugs Bunny.", 0, 1)
	CreateConVar("antirandomat_bugsbunny_jump_power", "750", FCVAR_NOTIFY, "")

	-- Event: Invert
    CreateConVar("antirandomat_invert", "1", FCVAR_NOTIFY, "", 0, 1)

	-- Event: Sidways
    CreateConVar("antirandomat_sideways", "1", FCVAR_NOTIFY, "Try to move Forwards!", 0, 1)

	-- Event: No Explosion Damage
	CreateConVar("antirandomat_noexpldmg", "1", FCVAR_NOTIFY, "No explosion damage", 0, 1)
	CreateConVar("antirandomat_noexpldmg_roll_type", "0", FCVAR_NOTIFY, "Changes how the code handles the event.\n0 - Always do nothing\n1 - Roll 50/50 on normal or no damage\n2 - Generate random number between mult_min and mult_max to multiply damage")
	CreateConVar("antirandomat_noexpldmg_likelihood", "50", FCVAR_NOTIFY, "Roll Type 1: How likely it is to prevent damage", 0, 100)
	CreateConVar("antirandomat_noexpldmg_mult_max", "150", FCVAR_NOTIFY, "Roll Type 2: Max damage multiplier as percentage")
	CreateConVar("antirandomat_noexpldmg_mult_min", "-150", FCVAR_NOTIFY, "Roll Type 2: Min damage multiplier as percentage")

	-- Event: No Fall Damage
	CreateConVar("antirandomat_nofalldmg", "1", FCVAR_NOTIFY, "No fall damage", 0, 1)
	CreateConVar("antirandomat_nofalldmg_roll_type", "0", FCVAR_NOTIFY, "Changes how the code handles the event.\n0 - Always do nothing\n1 - Roll 50/50 on normal or no damage\n2 - Generate random number between mult_min and mult_max to multiply damage")
	CreateConVar("antirandomat_nofalldmg_likelihood", "50", FCVAR_NOTIFY, "Roll Type 1: How likely it is to prevent damage", 0, 100)
	CreateConVar("antirandomat_nofalldmg_mult_max", "150", FCVAR_NOTIFY, "Roll Type 2: Max damage multiplier as percentage")
	CreateConVar("antirandomat_nofalldmg_mult_min", "-150", FCVAR_NOTIFY, "Roll Type 2: Min damage multiplier as percentage")

	-- Event: Bike
	CreateConVar("antirandomat_bike", "1", FCVAR_NOTIFY, "", 0, 1)
	CreateConVar("antirandomat_bike_timer", "3", FCVAR_NOTIFY, "Time between being given bikes")
	CreateConVar("antirandomat_bike_strip", "1", FCVAR_NOTIFY, "The event strips your other weapons")
	CreateConVar("antirandomat_bike_weaponid", "weapon_ttt_bike", FCVAR_NOTIFY, "ID of the weapon given")

	-- Event: Roles
	CreateConVar("antirandomat_roles", "1", FCVAR_NOTIFY, "", 0, 1)

	-- Event: Lost Credits
	CreateConVar("antirandomat_wallet", "1", FCVAR_NOTIFY, "", 0, 1)

	-- Function for handling sending of a message
    function AntiRandomatBroadcast(...)
        local msg = {...}
        net.Start("AntiRandomatMessage")
        net.WriteTable(msg)
        net.Broadcast()
    end
end

if CLIENT then
    SWEP.PrintName = "Anti-Randomat-4808"
    SWEP.Slot = 8

    SWEP.ViewModelFOV = 60
    SWEP.ViewModelFlip = false

    SWEP.Icon = "VGUI/ttt/icon_antirandomat"
    SWEP.EquipMenuData = {
        type = "weapon",
        desc = "Does Something. \nMostly negative Things."
    }
    net.Receive(
        "AntiRandomatMessage",
        function(len)
            local msg = net.ReadTable()
            chat.AddText(unpack(msg))
            chat.PlaySound()
            surface.PlaySound("weapons/c4_initiate.wav")
        end
    )

    net.Receive(
        "AntiRandomatOverrideTargetID",
        function()
            hook.Add(
                "HUDDrawTargetID",
                "AntiRandomatOverrideTargetID",
                function()
                    local trace = LocalPlayer():GetEyeTrace(MASK_SHOT)
                    local ent = trace.Entity
                    if IsValid(ent) and IsPlayer(ent) and ent:GetNWBool("AntiRandomatDisguise") then
                        return false
                    end
                end
            )
        end
    )
    function SWEP:PrimaryAttack()
    end
end

SWEP.Primary.Delay = 10
SWEP.Primary.Recoil = 0
SWEP.Primary.Automatic = false
SWEP.Primary.NumShots = 1
SWEP.Primary.Damage = 0
SWEP.Primary.Cone = 0
SWEP.Primary.Ammo = nil
SWEP.Primary.ClipSize = -1
SWEP.Primary.ClipMax = -1
SWEP.Primary.DefaultClip = -1
SWEP.AmmoEnt = nil

SWEP.InLoadoutFor = nil
SWEP.AllowDrop = true
SWEP.IsSilent = false
SWEP.NoSights = true
SWEP.UseHands = true
SWEP.HeadshotMultiplier = 0
SWEP.CanBuy = {ROLE_TRAITOR}
SWEP.LimitedStock = true
SWEP.Primary.Sound = ""

SWEP.ViewModel = "models/weapons/gamefreak/c_csgo_c4.mdl"
SWEP.WorldModel = "models/weapons/gamefreak/w_c4_planted.mdl"
SWEP.Weight = 2

function SWEP:OnRemove()
    if CLIENT and IsValid(self.Owner) and self.Owner == LocalPlayer() and self.Owner:Alive() then
        RunConsoleCommand("lastinv")
    end
end

function SWEP:Initialize()
    util.PrecacheSound("weapons/c4_initiate.wav")
end

local NofalldamageAntiRandomat = false
local AntiRandomatFallDmg = false
local AntiRandomatExplDmg = false

if SERVER then
    function SWEP:PrimaryAttack()
		if AntiRandomEvent() then
			DamageLog(
				"AntiRandomat: " .. self.Owner:Nick() .. " [" .. self.Owner:GetRoleString() .. "] used his AntiRandomat"
			)
			self:SetNextPrimaryFire(CurTime() + 10)
			self:Remove()
		else
			DamageLog(
				"AntiRandomat: Attempted to generate a random event but failed! Are there any events active?"
			)
		end
    end

    function AntiRandomEvent()
		local AntiRandomEvents = {}

		if GetConVar("antirandomat_beinflash"):GetBool() then
			table.insert(AntiRandomEvents, AntiRandomatBeinFlash)
		end

		if GetConVar("antirandomat_300"):GetBool() then
			table.insert(AntiRandomEvents, AntiRandomat300)
		end

		if GetConVar("antirandomat_disguise"):GetBool() then
			table.insert(AntiRandomEvents, AntiRandomatDisguise)
		end

		if GetConVar("antirandomat_rngdamage"):GetBool() then
			table.insert(AntiRandomEvents, AntiRandomatDamagy)
		end

		if GetConVar("antirandomat_jump"):GetBool() then
			table.insert(AntiRandomEvents, AntiRandomatJump)
		end

		if GetConVar("antirandomat_suddendeath"):GetBool() then
			table.insert(AntiRandomEvents, AntiRandomatSuddenDeath)
		end

		if GetConVar("antirandomat_screenflip"):GetBool() then
			table.insert(AntiRandomEvents, AntiRandomatScreenFlip)
		end

		if GetConVar("antirandomat_nauseaeffect"):GetBool() then
			table.insert(AntiRandomEvents, AntiRandomatNauseaEffect)
		end

		if GetConVar("antirandomat_nodetective"):GetBool() then
			table.insert(AntiRandomEvents, AntiRandomatNoDete)
		end

		if GetConVar("antirandomat_hailtheking"):GetBool() then
			table.insert(AntiRandomEvents, AntiRandomatHailtheKing)
		end

		if GetConVar("antirandomat_collapsing"):GetBool() then
			table.insert(AntiRandomEvents, AntiRandomatCollapsing)
		end

		if GetConVar("antirandomat_bugsbunny"):GetBool() then
			table.insert(AntiRandomEvents, AntiRandomatBugsBunny)
		end

		if GetConVar("antirandomat_invert"):GetBool() then
			table.insert(AntiRandomEvents, AntiRandomatInvert)
		end

		if GetConVar("antirandomat_sideways"):GetBool() then
			table.insert(AntiRandomEvents, AntiRandomatSideWays)
		end

		if GetConVar("antirandomat_noexpldmg"):GetBool() then
			table.insert(AntiRandomEvents, AntiRandomatNoExplDmg)
		end

		if GetConVar("antirandomat_nofalldmg"):GetBool() then
			table.insert(AntiRandomEvents, AntiRandomatNoFallDmg)
		end

		if GetConVar("antirandomat_bike"):GetBool() then
			table.insert(AntiRandomEvents, AntiRandomatBike)
		end

		if GetConVar("antirandomat_roles"):GetBool() then
			table.insert(AntiRandomEvents, AntiRandomatRoles)
		end

		if #AntiRandomEvents > 0 then
			AntiRandomEvents[math.random(1, #AntiRandomEvents)]()
			return true
		else
			return false
		end
    end

    -- --------------
    -- EVENTS
    -- --------------

    function AntiRandomatBeinFlash()
        AntiRandomatBroadcast("Anti-Randomat: ", COLOR_WHITE, "Normal Speed is bleakly, isn´t it?")
		
		local speed = GetConVar("antirandomat_beinflash_speed"):GetInt()
		
        for k, ply in pairs(player.GetAll()) do
			ply.OldWalkSpeed = ply:GetWalkSpeed()
            ply:SetWalkSpeed(speed)
        end
		
        hook.Add(
            "TTTPrepareRound",
            "UndoFlashingSpeed",
            function()
                for k, ply in pairs(player.GetAll()) do
                    ply:SetWalkSpeed(ply.OldWalkSpeed)
                end
            end
        )
    end

    function AntiRandomatBugsBunny()
        AntiRandomatBroadcast("Anti-Randomat: ", COLOR_WHITE, "Let´s turn you all into Bugs Bunny.")
        NofalldamageAntiRandomat = true

		local jumpPower = GetConVar("antirandomat_bugsbunny_jump_power"):GetInt()

        for k, ply in pairs(player.GetAll()) do
            ply:SetJumpPower(jumpPower)
            hook.Add(
                "EntityTakeDamage",
                "TTTRandomatFall",
                function(ent, dmginfo)
                    if IsValid(ent) and ent:IsPlayer() and dmginfo:IsFallDamage() and NofalldamageAntiRandomat == true then
                        return true
                    end
                end
            )
        end
    end

	function AntiRandomatFalldamage()
		AntiRandomatBroadcast("Anti-Randomat: ", COLOR_WHITE, "No more fall damage!")
		AntiRandomatFallDmg = true

		for k, ply in pairs(player.GetAll()) do
			hook.Add(
				"EntityTakeDamage",
				"TTTAntirandomatFallDmg",
				function(ent, dmginfo)
					if IsValid(ent) and ent:IsPlayer() and dmginfo:IsFallDamage() and AntiRandomatFallDmg then
						local rollType = GetConVar("antirandomat_nofalldmg_roll_type"):GetInt()
						print("ROLL TYPE: " .. rollType)
						if rollType == 0 then
							return false
						elseif rollType == 1 then
							local likelihood = GetConVar("antirandomat_nofalldmg_likelihood"):GetInt()
							local rngRoll = math.random() * 100
							if rngRoll > likelihood then
								return true -- Negate Damage
							else
								return false -- Full Damage
							end
						elseif rollType == 2 then
							local minMult = GetConVar("antirandomat_nofalldmg_mult_min"):GetInt()
							local maxMult = GetConVar("antirandomat_nofalldmg_mult_max"):GetInt()
							local rngRoll = math.random(minMult, maxMult)
							dmginfo:ScaleDamage(rngRoll / 100)
							return false
						end
					end
				end
			)
		end
	end

	function AntiRandomatExplosion()
		AntiRandomatBroadcast("Anti-Randomat: ", COLOR_WHITE, "No more explosion damage!")
		AntiRandomatExplDmg = true

		for k, ply in pairs(player.GetAll()) do
			hook.Add(
				"EntityTakeDamage",
				"TTTAntirandomatExplDmg",
				function(ent, dmginfo)
					if IsValid(ent) and ent:IsPlayer() and dmginfo:IsExplosionDamage() and AntiRandomatExplDmg then
						local rollType = GetConVar("antirandomat_noexpldmg_roll_type"):GetInt()
						if rollType == 0 then
							return false
						elseif rollType == 1 then
							local likelihood = GetConVar("antirandomat_noexpldmg_likelihood"):GetInt()
							local rngRoll = math.random() * 100
							if rngRoll > likelihood then
								return true -- Negate Damage
							else
								return false -- Full Damage
							end
						elseif rollType == 2 then
							local minMult = GetConVar("antirandomat_noexpldmg_mult_min"):GetInt()
							local maxMult = GetConVar("antirandomat_noexpldmg_mult_max"):GetInt()
							local rngRoll = math.random(minMult, maxMult)
							dmginfo:ScaleDamage(rngRoll / 100)
							return false
						end
					end
				end
			)
		end
	end

    function AntiRandomatJump()
        AntiRandomatBroadcast("Anti-Randomat: ", COLOR_WHITE, "Some of you jump up normally. The rest is unlucky!")
		
		local jumpNormal = GetConVar("antirandomat_jump_normal"):GetInt()
		local jumpAbnormal = GetConVar("antirandomat_jump_unlucky"):GetInt()
		
        for k, v in pairs(player.GetAll()) do
            v.AntiRandomatjump = math.random(1, 2)
            if v.AntiRandomatjump == 1 then
                v:SetJumpPower(jumpNormal)
            elseif v.AntiRandomatjump == 2 then
                v:SetJumpPower(jumpAbnormal)
            end
        end
    end

    function AntiRandomatSuddenDeath()
        AntiRandomatBroadcast("Anti-Randomat: ", COLOR_WHITE, "Everybody has only 1HP! Of course nobody can heal himself.")
		
		local suddenHP = GetConVar("antirandomat_suddendeath_hp"):GetInt()
		if suddenHP <= 0 then
			suddenHP = 1
		end
		
        for key, ply in pairs(player.GetAll()) do
            ply:SetHealth(suddenHP)
        end
        timer.Create(
            "SuddenDeathmatchHealAntiRandomat",
            1,
            0,
            function()
				local suddenHP = GetConVar("antirandomat_suddendeath_hp"):GetInt()
				
                for k, v in pairs(player.GetAll()) do
                    if v:Health() > 1 then
                        v:SetHealth(suddenHP)
                    end
                end
            end
        )
    end

    function AntiRandomatDisguise()
        AntiRandomatBroadcast("Anti-Randomat: ", COLOR_WHITE, "Do you think you can only recognize your fellow players by the model? We will see.")

		AntiRandomatDisguiseEnforcer()
		
		timer.Create(
			"DisguiseForceModelSetting",
			1,
			0,
			AntiRandomatDisguiseEnforcer
		)

        net.Start("AntiRandomatOverrideTargetID")
        net.Broadcast()
    end

	function AntiRandomatDisguiseEnforcer()
		local forceModel = GetConVar("antirandomat_disguise_force_model"):GetBool()
		local modelPath = GetConVar("antirandomat_disguise_model"):GetString()

		for k, v in pairs(player.GetAll()) do
			v:SetNWBool("AntiRandomatDisguise", true)
			if forceModel then
				print("Cur Model: " .. v:GetModel())
				if v.PrevModel == nil then
					v.PrevModel = v:GetModel()
					print("Orig Model: " .. v.PrevModel)
				end
				print("New Model: " .. modelPath)
				v:SetModel(modelPath)
			end
		end
	end

    function AntiRandomatScreenFlip()
        AntiRandomatBroadcast("Anti-Randomat: ", COLOR_WHITE, "What do you think happens when we flip the Screen? Let's try it out!")
        for k, ply in pairs(player.GetAll()) do
            local Ang = ply:EyeAngles()
            ply:SetEyeAngles(Angle(Ang.x, Ang.y, Ang.z + 180))
        end
    end

    function AntiRandomatInvert()
        AntiRandomatBroadcast("Anti-Randomat: ", COLOR_WHITE, "Did the Server get stuck on your Control Options?")

        hook.Add(
            "SetupMove",
            "AntiRandomatInvertEverything",
            function(ply, mv, cmd)
                if ply:IsTerror() then
                    local forwardspeed = mv:GetForwardSpeed()
                    local sidespeed = mv:GetSideSpeed()
                    mv:SetForwardSpeed(-forwardspeed)
                    mv:SetSideSpeed(-sidespeed)
                end
            end
        )

        net.Start("AntiRandomatHooks1")
        net.Broadcast()
    end

    function AntiRandomatSideWays()
        AntiRandomatBroadcast("Anti-Randomat: ", COLOR_WHITE, "Try to move forward!")
        hook.Add(
            "SetupMove",
            "AntiRandomatSideWays",
            function(ply, mv, cmd)
                if ply:IsTerror() then
                    mv:SetForwardSpeed(0)
                end
            end
        )
        net.Start("AntiRandomatHooks2")
        net.Broadcast()
    end

    function AntiRandomatDamagy()
        AntiRandomatBroadcast("Anti-Randomat: ", COLOR_WHITE, "Random Damage for Everyone!")

		local dMin = GetConVar("antirandomat_rngdamage_min"):GetInt()
		local dMax = GetConVar("antirandomat_rngdamage_max"):GetInt()

        for k, v in pairs(player.GetAll()) do
            v:TakeDamage(math.random(dMin, dMax))
        end
    end

    function AntiRandomat300()
		local duration = GetConVar("antirandomat_300_time"):GetInt()

		-- Fall back in the event the conversion attempt failed, otherwise it would end the round immediately from death
		if duration == 0 then
			duration = 300
		end

        AntiRandomatBroadcast("Anti-Randomat: ", COLOR_WHITE, duration .. " Seconds left to Live!")
        timer.Create(
            "TimeLeft2Live",
            duration,
            1,
            function()
                for _, ply in pairs(player.GetAll()) do
                    if ply:Alive() then
                        ply:TakeDamage(ply:Health())
                    end
                end
            end
        )
    end

    function AntiRandomatNauseaEffect()
        AntiRandomatBroadcast("Anti-Randomat: ", COLOR_WHITE, "That was too much of the good Drugs....")
        net.Start("AntiRandomatBlur")
        net.Broadcast()
    end

    function AntiRandomatNoDete()
        AntiRandomatBroadcast(
            "Anti-Randomat: ",
            COLOR_WHITE,
            "Having a Detective is so a big Advantage for the Innocents, isn´t it?"
        )
		
		local roleID = GetConVar("antirandomat_nodetective_role"):GetInt()

        for k, ply in pairs(player.GetAll()) do
            if (ply:IsDetective()) then
                ply:SetRole(roleID)
            end
        end
    end

    function AntiRandomatHailtheKing()
        AntiRandomatBroadcast("Anti-Randomat: ", COLOR_WHITE, "LONG LIVE THE KING!")

		local hp = GetConVar("antirandomat_hailtheking_hp"):GetInt()
		local hpPenalty = GetConVar("antirandomat_hailtheking_penalty_hp"):GetInt()
		local useModel = GetConVar("antirandomat_hailtheking_use_model"):GetBool()
		local modelPath = GetConVar("antirandomat_hailtheking_model"):GetString()

        for k, ply in pairs(player.GetAll()) do
            if ply:IsDetective() and ply:Alive() and not ply:IsTraitor() then
				if useModel then
					ply:SetModel(modelPath)
				end
                ply:SetHealth(hp)
            else
                return
            end
        end

        for k, ply in pairs(player.GetAll()) do
            if (ply:IsDetective() and not ply:Alive()) then
                if (ply == ROLE_INNOCENT) then
                    ply:SetHealth(hpPenalty)
                    AntiRandomatBroadcast(
                        "Anti-Randomat: ",
                        COLOR_WHITE,
                        "The King was killed by the Traitors. It´s time to impose a penalty!"
                    )
                end
            end
        end
    end

    function AntiRandomatCollapsing()
        AntiRandomatBroadcast("Anti-Randomat: ", COLOR_WHITE, "You fall collapse. Your View fades away...")
        local allspawnsofmap = {}

        allspawnsofmap = table.Add(allspawnsofmap, ents.FindByClass("info_player_start"))
        allspawnsofmap = table.Add(allspawnsofmap, ents.FindByClass("info_player_deathmatch"))
        allspawnsofmap = table.Add(allspawnsofmap, ents.FindByClass("info_player_combine"))
        allspawnsofmap = table.Add(allspawnsofmap, ents.FindByClass("info_player_rebel"))

        -- CS Maps
        allspawnsofmap = table.Add(allspawnsofmap, ents.FindByClass("info_player_counterterrorist"))
        allspawnsofmap = table.Add(allspawnsofmap, ents.FindByClass("info_player_terrorist"))

        -- DOD Maps
        allspawnsofmap = table.Add(allspawnsofmap, ents.FindByClass("info_player_axis"))
        allspawnsofmap = table.Add(allspawnsofmap, ents.FindByClass("info_player_allies"))

        -- (Old) GMod Maps
        allspawnsofmap = table.Add(allspawnsofmap, ents.FindByClass("gmod_player_start"))

		-- Grab convars
		local durFade = GetConVar("antirandomat_collapsing_time_to_fade"):GetInt()
		local durHold = GetConVar("antirandomat_collapsing_time_to_hold"):GetInt()
		local durMove = GetConVar("antirandomat_collapsing_time_to_move"):GetInt()
		local durWake = GetConVar("antirandomat_collapsing_time_to_wake"):GetInt()

        for _, c in pairs(player.GetAll()) do
            if c:IsTerror() and c:Alive() and c:IsInWorld() then
                c:ScreenFade(SCREENFADE.OUT, COLOR_BLACK, durFade, durHold)
                timer.Simple(
                    durMove,
                    function()
                        if allspawnsofmap and #allspawnsofmap > 0 then
                            c:SetPos(allspawnsofmap[math.random(1, #allspawnsofmap)]:GetPos())
                        else
                            return
                        end
                    end
                )
            end
        end

        timer.Simple(
            durWake,
            function()
                PrintMessage(HUD_PRINTTALK, "You´re waking up & cannot remember what happened. But the Game goes on.")
            end
        )
    end

	function AntiRandomatBike()
        AntiRandomatBroadcast("Anti-Randomat: ", COLOR_WHITE, "Vivez toute l’intensité du Tour De France grâce au jeu officiel")

		timer.Create("AntirandomatBikeTimer", GetConVar("antirandomat_bike_timer"):GetInt(), 0,
			function()
				local weaponID = GetConVar("antirandomat_bike_weaponid"):GetString()
				for i, ply in pairs(player.GetAll()) do
					if ply:IsTerror() and ply:Alive() and ply:IsInWorld() then
						local wepCount = table.Count(ply:GetWeapons())
						local wepActive = ply:GetActiveWeapon()
						local wepActiveClass

						if wepActive:IsValid() then
							wepActiveClass = wepActive:GetClass()
						else
							wepActiveClass = ""
						end

						if wepCount ~= 1 or (wepCount == 1 and wepActiveClass ~= weaponID) then
							if GetConVar("antirandomat_bike_strip"):GetBool() then
								ply:StripWeapons()
							end
							ply:Give(weaponID)
						end
					end
				end
			end
		)
	end

	function AntiRandomatRoles()
        AntiRandomatBroadcast("Anti-Randomat: ", COLOR_WHITE, "Did you forget who you were?")

		local isTTT2 = false

		if(GAMEMODE.Name != "Trouble in Terrorist Town") then
			isTTT2 = true
		end

		if isTTT2 then
			-- Prevent premature checks
			StopWinChecks()
			-- Reset role list
			GAMEMODE.LastRole = {}
			-- Select new roles
			roleselection.SelectRoles()
			
			-- Re-enable win checking
			StartWinChecks()
		else
			SetRoundState(ROUND_PREP)
			SelectRoles()
			SetRoundState(ROUND_ACTIVE)
		end
	end

	function AntiRandomatLostCredits()
        AntiRandomatBroadcast("Anti-Randomat: ", COLOR_WHITE, "Whoops, you lost your wallet.")

		for i, ply in pairs(player.GetAll()) do
			if ply:IsTerror() and ply:Alive() and ply:IsInWorld() then
				ply:SetCredits(0)
			end
		end
	end
end

-- Reset player health
hook.Add(
    "TTTPrepareRound",
    "HPReset",
    function()
        for k, ply in pairs(player.GetAll()) do
            ply:SetHealth(100)
        end
    end
)

function ResettinAntiRandomat()
    NofalldamageAntiRandomat = false
	AntiRandomatFallDmg = false
	AntiRandomatExplDmg = false
    for k, v in pairs(player.GetAll()) do
        v.AntiRandomatSuperSpeed = false
        v:SetGravity(1)
        v:SetModelScale(1, 1)
        v.AntiRandomatSpeed = false
        v:SetEyeAngles(Angle(v:EyeAngles().x, v:EyeAngles().y, 0))
        v:SetNWBool("AntiRandomatDisguise", false)
        v.Modelchanged = false
        v:SetHealth(100)
        v:SetJumpPower(150)

		if v.PrevModel ~= nil then
			v:SetModel(v.PrevModel)
			v.PrevModel = nil
		end
    end
    for k, ply in pairs(player.GetAll()) do
        local Ang = ply:EyeAngles()
        ply:SetEyeAngles(Angle(Ang.x, Ang.y, 0))
    end

	timer.Remove("AntirandomatBikeTimer")
    timer.Remove("TimeLeft2Live")
	timer.Remove("DisguiseForceModelSetting")
    timer.Remove("SuddenDeathmatchHealAntiRandomat")
    hook.Remove("HUDDrawTargetID", "AntiRandomatOverrideTargetID")
    hook.Remove("EntityTakeDamage", "TTTAntiRandomatFall")
    hook.Remove("SetupMove", "AntiRandomatInvertEverything")
    hook.Remove("SetupMove", "AntiRandomatSideWays")
    hook.Remove("RenderScreenspaceEffects", "AntiRandomatWhiskeySblur")
end

hook.Add("TTTPrepareRound", "AntiRandomatReset", ResettinAntiRandomat)

if CLIENT then
    local tab = {
        ["$pp_colour_addr"] = 0.02,
        ["$pp_colour_addg"] = 0.02,
        ["$pp_colour_addb"] = 0,
        ["$pp_colour_brightness"] = 0,
        ["$pp_colour_contrast"] = 1,
        ["$pp_colour_colour"] = 3,
        ["$pp_colour_mulr"] = 0,
        ["$pp_colour_mulg"] = 0.02,
        ["$pp_colour_mulb"] = 0
    }

    net.Receive(
        "AntiRandomatHooks1",
        function()
            hook.Add(
                "SetupMove",
                "AntiRandomatInvertEverything",
                function(ply, mv, cmd)
                    if ply:IsTerror() then
                        local forwardspeed = mv:GetForwardSpeed()
                        local sidespeed = mv:GetSideSpeed()
                        mv:SetForwardSpeed(-forwardspeed)
                        mv:SetSideSpeed(-sidespeed)
                    end
                end
            )
        end
    )
    net.Receive(
        "AntiRandomatHooks2",
        function()
            hook.Add(
                "SetupMove",
                "AntiRandomatSideWays",
                function(ply, mv, cmd)
                    if ply:IsTerror() then
                        mv:SetForwardSpeed(0)
                    end
                end
            )
        end
    )
    net.Receive(
        "AntiRandomatBlur",
        function()
            hook.Add(
                "RenderScreenspaceEffects",
                "AntiRandomatWhiskeySblur",
                function()
                    DrawMotionBlur(0.4, 0.8, 0.01)
                    DrawToyTown(2, ScrH() / 2)
                    DrawSharpen(1.2, 1.2)
                    DrawColorModify(tab)
                end
            )
        end
    )
end
