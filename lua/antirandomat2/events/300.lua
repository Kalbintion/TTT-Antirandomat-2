local EVENT = {}

EVENT.Title = "Random Damage for Everyone!"
EVENT.id = "300"

CreateConVar("ttt_antirandomat_300_time", "300", {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "How much time to give when 300 event is picked.")

function EVENT:Begin()
	local duration = GetConVar("ttt_antirandomat_300_time"):GetInt()
	
	-- Fall back in the event the conversion attempt failed, otherwise it would end the round immediately from death
	if duration == 0 then
		duration = 300
	end

	AntiRandomatBroadcast("Anti-Randomat: ", COLOR_WHITE, duration .. " Seconds left to Live!")
	timer.Create(
		"AntiRandomat300TTL",
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

function EVENT:End()
	time.Remove("AntiRandomat300TTL")
end

AntiRandomat:register(EVENT)

