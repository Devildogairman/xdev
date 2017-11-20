local PLUGIN = PLUGIN;

local COMMAND = Clockwork.command:New("GetViewEntity");
COMMAND.tip = "Debugging, please ignore.";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "a";
-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local viewEnt = tostring(player:GetViewEntity());
	Clockwork.player:Notify(player, "You're view entity is "..viewEnt);
end;

COMMAND:Register();