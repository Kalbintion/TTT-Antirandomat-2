local EVENT = {}

EVENT.Title = "Random Damage for Everyone!"
EVENT.id = "rngdmg"

CreateConVar("ttt_antirandomat_rngdamage_min", "1", {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "Minimum damage for random")
CreateConVar("ttt_antirandomat_rngdamage_max", "50", {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "Maximum damage for random")

function EVENT:Begin()
	AntiRandomatBroadcast("Anti-Randomat: ", COLOR_WHITE, "Random Damage for Everyone!")
	
	local dMin = GetConVar("ttt_antirandomat_rngdamage_min"):GetInt()
	local dMax = GetConVar("ttt_antirandomat_rngdamage_max"):GetInt()
	
	for k, v in pairs(player.GetAll()) do
		v:TakeDamage(math.random(dMin, dMax))
	end
end

function EVENT:End()
	
end

AntiRandomat:register(EVENT)