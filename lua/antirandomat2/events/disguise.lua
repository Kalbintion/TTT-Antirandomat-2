local EVENT = {}

EVENT.Title = "Do you think you can only recognize your fellow players by the model? We will see."
EVENT.id = "disguise"

CreateConVar("ttt_antirandomat_disguise", "1", {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "Do you think you can only recognize your fellow players by the model? We will see.", 0, 1)
CreateConVar("ttt_antirandomat_disguise_force_model", "1", {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "Should disguise force a model on everyone?", 0, 1)
CreateConVar("ttt_antirandomat_disguise_model", "", {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "The model to use", 0, 1)

function EVENT:Begin()
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

function EVENT:End()
	timer.Remove("DisguiseForceModelSetting")
	for k, ply in pairs(player.GetAll()) do
		if v.PrevModel ~= nil then
			v:SetModel(v.PrevModel)
			v.PrevModel = nil
		end
	end
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

AntiRandomat:register(EVENT)