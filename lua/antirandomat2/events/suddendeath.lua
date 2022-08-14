local EVENT = {}

EVENT.Title = "Everybody has only 1HP! Of course nobody can heal himself."
EVENT.id = "suddendeath"

function EVENT:Begin()
	for k, v in pairs(player.GetAll()) do
		v:SetHealth(1)
	end
	
	timer.Create(
		"SuddenDeathmatchHealAntiRandomat",
		1,
		0,
		function()
			for k, v in pairs(player.GetAll()) do
				if v:Health() > 1 then
					v:SetHealth(1)
				end
			end
		end
	)
end

function EVENT:End()
	timer.Remove("SuddenDeathmatchHealAntiRandomat")

	for k, v in pairs(player.GetAll()) do
		v:SetHealth(100)
	end
end

AntiRandomat:register(EVENT)