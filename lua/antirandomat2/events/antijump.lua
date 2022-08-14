local EVENT = {}

EVENT.Title = "Some of you jump up normally. The rest is unlucky!"
EVENT.id = "antijump"

CreateConVar("antirandomat_jump_normal", "150", {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "Jump power for regular jumps. GMOD default is 150")
CreateConVar("antirandomat_jump_unlucky", "0", {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "Jump power for unlucky players.")

function EVENT:Begin()
	for k, v in pairs(player.GetAll()) do
		v.AntiRandomatjump = math.random(1, 2)
		if v.AntiRandomatjump == 1 then
			v:SetJumpPower(1)
		elseif v.AntiRandomatjump == 2 then
			v:SetJumpPower(0)
		end
	end
end

function EVENT:End()
	for k, v in pairs(player.GetAll()) do
		v.AntiRandomatSpeed = false
		v:SetJumpPower(150)
	end
end

AntiRandomat:register(EVENT)