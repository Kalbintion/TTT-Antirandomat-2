util.AddNetworkString("antirandomat_message")
util.AddNetworkString("antirandomat_message_silent")

AntiRandomat.Events = AntiRandomat.Events or {}
AntiRandomat.ActiveEvents = {}

local AntiRandomat_meta =  {}
AntiRandomat_meta.__index = AntiRandomat_meta

concommand.Add("antirandomat_safetrigger", function(ply, cc , arg)
	local cmd = arg[1]
	if AntiRandomat.Events[cmd] ~= nil then
		local event = AntiRandomat.Events[cmd]
		if event:Condition() and event:Enabled() then
			local index = #AntiRandomat.ActiveEvents + 1
			AntiRandomat.ActiveEvents[index] = AntiRandomat.Events[cmd]

			local rdmply = {}
			for k, v in RandomPairs(player.GetAll()) do
				if v:Alive() and not v:IsSpec() then
					table.insert(rdmply, v)
				end
			end

			AntiRandomat.ActiveEvents[index].owner = rdmply[1]
			AntiRandomat:EventNotify(AntiRandomat.ActiveEvents[index].Title)
			AntiRandomat.ActiveEvents[index]:Begin()
		else
			error("Conditions for event not met")
		end
	else
		error("Could not find event '"..cmd.."'")
	end
end,"Triggers a specific Antirandomat event with conditions",FCVAR_SERVER_CAN_EXECUTE)

concommand.Add("antirandomat_trigger", function(ply, cc , arg)
	local cmd = arg[1]
	if AntiRandomat.Events[cmd] ~= nil then
		local index = #AntiRandomat.ActiveEvents + 1
		AntiRandomat.ActiveEvents[index] = AntiRandomat.Events[cmd]

		local rdmply = {}
		for k, v in RandomPairs(player.GetAll()) do
			if v:Alive() and not v:IsSpec() then
				table.insert(rdmply, v)
			end
		end

		AntiRandomat.ActiveEvents[index].owner = rdmply[1]
		AntiRandomat:EventNotify(AntiRandomat.ActiveEvents[index].Title)
		AntiRandomat.ActiveEvents[index]:Begin()
	else
		error("Could not find event '"..cmd.."'")
	end
end,"Triggers a specific AntiRandomat event without conditions",FCVAR_SERVER_CAN_EXECUTE)

concommand.Add("antirandomat_clearevents",function(ply)
	if AntiRandomat.ActiveEvents != {} then
		for _, evt in pairs(AntiRandomat.ActiveEvents) do
			evt:End()
		end

		AntiRandomat.ActiveEvents = {}
	end
end)

local function shuffleTable(t)
	math.randomseed(os.time())
	local rand = math.random

	local interactions = #t
	local j

	for i = interactions, 2, -1 do
		j = rand(i)
		t[i], t[j] = t[j], t[i]
	end
end

local function eventIndex()
	math.randomseed(os.time())
	local length = math.random(1, 10)

	if length < 1 then return end

	local result = ""

	for i = 1, length do
		result = result .. string.char(math.random(32, 126))
	end

	return result
end

function AntiRandomat:register(tbl)
	local id = tbl.id
	tbl.Id = id
	tbl.__index = tbl
	setmetatable(tbl, AntiRandomat_meta)

	AntiRandomat.Events[id] = tbl

	CreateConVar("antirandomat_"..id, 1, {FCVAR_ARCHIVE, FCVAR_NOTIFY})
end

function AntiRandomat:unregister(id)
	if not AntiRandomat.Events[id] then return end
	AntiRandomat.Events[id] = nil
end

function AntiRandomat:TriggerRandomEvent(ply)

	local events = AntiRandomat.Events

	shuffleTable(events)

	local x = 0

	for k, v in pairs(events) do
		if v:Condition() and v:Enabled() then
			x = 1
		end
	end

	if x == 0 then
		error("Could not find valid event, consider enabling more")
	end

	local event = table.Random(events)

	while not event:Condition() or not event:Enabled() do 
		event = table.Random(events)
	end

	local index = #AntiRandomat.ActiveEvents + 1

	AntiRandomat.ActiveEvents[index] = event
	AntiRandomat.ActiveEvents[index].owner = ply

	AntiRandomat:EventNotify(AntiRandomat.ActiveEvents[index].Title)
	AntiRandomat.ActiveEvents[index]:Begin()
end

function AntiRandomat:ReturnRandomEvent(ply)

	local events = AntiRandomat.Events

	shuffleTable(events)

	local x = 0

	for k, v in pairs(events) do
		if v:Condition() and v:Enabled() then
			x = 1
		end
	end

	if x == 0 then
		error("Could not find valid event, consider enabling more")
	end

	local event = table.Random(events)

	while not event:Condition() do 
		event = table.Random(events)
	end

	local index = #AntiRandomat.ActiveEvents + 1

	AntiRandomat.ActiveEvents[index] = event
	AntiRandomat.ActiveEvents[index].owner = ply

	AntiRandomat:EventNotify(AntiRandomat.ActiveEvents[index].Title)
	AntiRandomat.ActiveEvents[index]:Begin()
end

function AntiRandomat:TriggerEvent(event, ply)
	local cmd = event
	if AntiRandomat.Events[cmd] ~= nil then
		local index = #AntiRandomat.ActiveEvents + 1
		AntiRandomat.ActiveEvents[index] = AntiRandomat.Events[cmd]


		AntiRandomat.ActiveEvents[index].owner = ply
		AntiRandomat:EventNotify(AntiRandomat.ActiveEvents[index].Title)
		AntiRandomat.ActiveEvents[index]:Begin()
	else
		error("Could not find event '"..cmd.."'")
	end
end

function AntiRandomat:SilentTriggerEvent(event, ply)
	local cmd = event
	if AntiRandomat.Events[cmd] ~= nil then
		local index = #AntiRandomat.ActiveEvents + 1
		AntiRandomat.ActiveEvents[index] = AntiRandomat.Events[cmd]


		AntiRandomat.ActiveEvents[index].owner = ply
		AntiRandomat.ActiveEvents[index]:Begin()
	else
		error("Could not find event '"..cmd.."'")
	end
end

concommand.Add("antirandomat_triggerrandom", function()
	local events = AntiRandomat.Events

	shuffleTable(events)

	local x = 0

	for k, v in pairs(events) do
		if v:Condition() and v:Enabled() then
			x = 1
		end
	end

	if x == 0 then
		error("Could not find valid event, consider enabling more")
	end

	local event = table.Random(events)

	while not event:Condition() do 
		event = table.Random(events)
	end

	local index = #AntiRandomat.ActiveEvents + 1

	local rdmply = {}
	for k, v in RandomPairs(player.GetAll()) do
		if v:Alive() and not v:IsSpec() then
			table.insert(rdmply, v)
		end
	end

	AntiRandomat.ActiveEvents[index] = event
	AntiRandomat.ActiveEvents[index].owner = rdmply[1]

	AntiRandomat:EventNotify(AntiRandomat.ActiveEvents[index].Title)
	AntiRandomat.ActiveEvents[index]:Begin()
end)

function AntiRandomat:EventNotify(title)
	net.Start("AntiRandomat_message")
	net.WriteBool(true)
	net.WriteString(title)
	net.WriteUInt(0, 8)
	net.Broadcast()
end

function AntiRandomat:EventNotifySilent(title)
	net.Start("AntiRandomat_message_silent")
	net.WriteBool(true)
	net.WriteString(title)
	net.WriteUInt(0, 8)
	net.Broadcast()
end

/**
 * AntiRandomat Meta
 */

-- Valid players not spec
function AntiRandomat_meta:GetPlayers(shuffle)
	return self:GetAlivePlayers(shuffle)
end

function AntiRandomat_meta:GetAlivePlayers(shuffle)
	local plys = {}

	for _, ply in pairs(player.GetAll()) do
		if IsValid(ply) and (not ply:IsSpec()) and ply:Alive() then
			table.insert(plys, ply)
		end
	end

	if shuffle then
		shuffleTable(plys)
	end

	return plys
end

if SERVER then
	function AntiRandomat_meta:SmallNotify(msg, length, targ)
		if !isnumber(length) then length = 0 end
		net.Start("AntiRandomat_message")
		net.WriteBool(false)
		net.WriteString(msg)
		net.WriteUInt(length, 8)
		if not targ then net.Broadcast() else net.Send(targ) end
	end
end

function AntiRandomat_meta:AddHook(hooktype, callbackfunc)
	callbackfunc = callbackfunc or self[hooktype]

	hook.Add(hooktype, "AntiRandomatEvent." .. self.Ident .. "." .. self.Id .. ":" .. hooktype, function(...)
		return callbackfunc(...)
	end)

	self.Hooks = self.Hooks or {}

	table.insert(self.Hooks, {hooktype, "AntiRandomatEvent." .. self.Ident .. "." .. self.Id .. ":" .. hooktype})
end

function AntiRandomat_meta:CleanUpHooks()
	if not self.Hooks then return end

	for _, ahook in pairs(self.Hooks) do
		hook.Remove(ahook[1], ahook[2])
	end

	table.Empty(self.Hooks)
end

function AntiRandomat_meta:Begin() end

function AntiRandomat_meta:End()
	self:CleanUpHooks()
end

function AntiRandomat_meta:Condition()
	return true
end

function AntiRandomat_meta:Enabled()
	if GetConVar("ttt_AntiRandomat_"..self.id):GetBool() then
		return true
	else
		return false
	end
end

RDMT_BOOL = 0
RDMT_INT = 1
RDMT_FLOAT = 2

function AntiRandomat_meta:CreateCmd(str, val, desc, slider)
	CreateConVar("AntiRandomat_"..self.id..str, val, {FCVAR_ARCHIVE, FCVAR_NOTIFY}, desc)
	if not self.cmds then
		self.cmds = {}
	end
	
	table.insert(self.cmds, {})
end


/*
 * Override TTT Stuff
 */
hook.Add("TTTEndRound", "AntiRandomatEndRound", function()
	if AntiRandomat.ActiveEvents != {} then
		for _, evt in pairs(AntiRandomat.ActiveEvents) do
			evt:End()
		end

		AntiRandomat.ActiveEvents = {}
	end
end)

hook.Add("TTTPrepareRound", "AntiRandomatEndRound", function()
	if AntiRandomat.ActiveEvents != {} then
		for _, evt in pairs(AntiRandomat.ActiveEvents) do
			evt:End()
		end

		AntiRandomat.ActiveEvents = {}
	end
end)

