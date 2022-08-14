AntiRandomat = AntiRandomat or {}

local function AddServer(fil)
	if SERVER then include(fil) end
end

local function AddClient(fil)
	if SERVER then AddCSLuaFile(fil) end
	if CLIENT then include(fil) end
end

AddServer("antirandomat2/antirandomat_base.lua")
AddClient("antirandomat2/cl_message.lua")

local files, _ = file.Find("antirandomat2/events/*.lua", "LUA")

for _, fil in pairs(files) do
	AddServer("antirandomat2/events/" .. fil)
end

if SERVER then
	concommand.Add("ttt_antirandomat_disableall", function()
		for _, fil in pairs(files) do

			local asrt = fil:match("(.+)%..+")
			RunConsoleCommand("ttt_antirandomat_"..asrt, 0)

		end
	end)

	concommand.Add("ttt_antirandomat_enableall", function()
		for _, fil in pairs(files) do

			local asrt = fil:match("(.+)%..+")
			RunConsoleCommand("ttt_antirandomat_"..asrt, 1)

		end
	end)

	CreateConVar("ttt_antirandomat_auto", 0, {FCVAR_NOTIFY, FCVAR_ARCHIVE}, "Whether the antirandomat should automatically trigger on round start.")
	CreateConVar("antirandomat_auto_chance", 1, {FCVAR_NOTIFY, FCVAR_ARCHIVE}, "Chance of the auto-antirandomat triggering.")
	CreateConVar("ttt_antirandomat_rebuyable", 0, {FCVAR_NOTIFY, FCVAR_ARCHIVE}, "Whether you can buy more than one antirandomat")

	hook.Add("TTTBeginRound", "AutoAntiRandomat", function()
		if GetConVar("ttt_antirandomat_auto"):GetBool() and math.random() <= GetConVar("randomat_auto_chance"):GetFloat() then
			local ply 
			for k, v in RandomPairs(player.GetAll()) do
				ply = v
			end
			Randomat:TriggerRandomEvent(ply)
		end
	end)
end

local files, _ = file.Find("antirandomat2/cl_events/*.lua", "LUA")

for _, fil in pairs(files) do
	AddClient("antirandomat2/cl_events/" .. fil)
end