local EVENT = {}

EVENT.Title = "No more explosion damage!"
EVENT.id = "noexpldamage"

CreateConVar("ttt_antirandomat_noexpldmg", "1", {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "No explosion damage", 0, 1)
CreateConVar("ttt_antirandomat_noexpldmg_roll_type", "0", {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "Changes how the code handles the event.\n0 - Always do nothing\n1 - Roll 50/50 on normal or no damage\n2 - Generate random number between mult_min and mult_max to multiply damage")
CreateConVar("ttt_antirandomat_noexpldmg_likelihood", "50", {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "Roll Type 1: How likely it is to prevent damage", 0, 100)
CreateConVar("ttt_antirandomat_noexpldmg_mult_max", "150", {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "Roll Type 2: Max damage multiplier as percentage")
CreateConVar("ttt_antirandomat_noexpldmg_mult_min", "-150", {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "Roll Type 2: Min damage multiplier as percentage")

function EVENT:Begin()
	for k, ply in pairs(player.GetAll()) do
		hook.Add(
			"EntityTakeDamage",
			"TTTAntirandomatExplDmg",
			function(ent, dmginfo)
				if IsValid(ent) and ent:IsPlayer() and dmginfo:IsExplosionDamage() and AntiRandomatExplDmg then
					local rollType = GetConVar("ttt_antirandomat_noexpldmg_roll_type"):GetInt()
					if rollType == 0 then
						return false
					elseif rollType == 1 then
						local likelihood = GetConVar("ttt_antirandomat_noexpldmg_likelihood"):GetInt()
						local rngRoll = math.random() * 100
						if rngRoll > likelihood then
							return true -- Negate Damage
						else
							return false -- Full Damage
						end
					elseif rollType == 2 then
						local minMult = GetConVar("ttt_antirandomat_noexpldmg_mult_min"):GetInt()
						local maxMult = GetConVar("ttt_antirandomat_noexpldmg_mult_max"):GetInt()
						local rngRoll = math.random(minMult, maxMult)
						dmginfo:ScaleDamage(rngRoll / 100)							
						return false
					end						
				end
			end
		)
	end
end

function EVENT:End()
	hook.Remove("EntityTakeDamage", "TTTAntirandomatExplDmg")
end

AntiRandomat:register(EVENT)