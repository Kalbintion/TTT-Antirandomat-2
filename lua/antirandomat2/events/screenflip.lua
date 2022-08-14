local EVENT = {}

EVENT.Title = "Random Damage for Everyone!"
EVENT.id = "300"

CreateConVar("ttt_antirandomat_300_time", "300", {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "How much time to give when 300 event is picked.")

function EVENT:Begin()
	AntiRandomatBroadcast("Anti-Randomat: ", COLOR_WHITE, "What do you think happens when we flip the Screen? Let's try it out!")
	for k, ply in pairs(player.GetAll()) do
		local Ang = ply:EyeAngles()
		ply:SetEyeAngles(Angle(Ang.x, Ang.y, Ang.z + 180))
	end
end

function EVENT:End()
	time.Remove("AntiRandomat300TTL")
end

AntiRandomat:register(EVENT)

