local EVENT = {}

EVENT.Title = "Normal Speed is bleakly, isn´t it?"
EVENT.id = "beinflash"

CreateConVar("ttt_antirandomat_beinflash", "1", {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "Normal Speed is bleakly, isn´t it?", 0, 1)

function EVENT:Begin()
	AntiRandomatBroadcast("Anti-Randomat: ", COLOR_WHITE, "Normal Speed is bleakly, isn´t it?")
	for k, ply in pairs(player.GetAll()) do
		ply:SetWalkSpeed(500)
	end
end

function EVENT:End()
	for k, ply in pairs(player.GetAll()) do
		ply:SetWalkSpeed(250)
	end
end

AntiRandomat:register(EVENT)