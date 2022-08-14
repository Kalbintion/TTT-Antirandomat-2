local EVENT = {}

EVENT.Title = "Let´s turn you all into Bugs Bunny."
EVENT.id = "bugsbunny"

CreateConVar("ttt_antirandomat_bugsbunny", "1", {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "Let´s turn you all into Bugs Bunny.", 0, 1)
CreateConVar("ttt_antirandomat_bugsbunny_jump_power", "750", {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "")

function EVENT:Begin()
	local jumpPower = GetConVar("ttt_antirandomat_bugsbunny_jump_power"):GetInt()
	
	for k, ply in pairs(player.GetAll()) do
		ply:SetJumpPower(jumpPower)
		hook.Add(
			"EntityTakeDamage",
			"TTTAntiRandomatFall",
			function(ent, dmginfo)
				if IsValid(ent) and ent:IsPlayer() and dmginfo:IsFallDamage() then
					return true
				end
			end
		)
	end
end

function EVENT:End()
	hook.Remove("EntityTakeDamage", "TTTAntiRandomatFall")
end

AntiRandomat:register(EVENT)