local PLUGIN = PLUGIN;

local COMMAND = Clockwork.command:New("Flux");
COMMAND.tip = "Allows Vortigaunts to communicate over long distances.";
COMMAND.text = "<string Msg>";
COMMAND.flags = bit.bor(CMD_DEFAULT, CMD_DEATHCODE, CMD_FALLENOVER);
COMMAND.arguments = 1;

local soundTable = {
	"vortcall01",
	"vortcall02c",
	"vortresp01",
	"vortresp04"
};

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	if(string.find(player:GetFaction(),"Vortigaunt")) then
		local words = table.concat(arguments, " ");

		for k, v in pairs(_player.GetAll()) do
			if (string.find(v:GetFaction(), "Vortigaunt")) then
				Clockwork.chatBox:SetMultiplier(1.5);
				Clockwork.chatBox:Add(v, player, "flux", words);
			end;
		end;

		player:EmitSound("vo/outland_01/intro/ol01_"..soundTable[math.random(1,#soundTable)]..".wav", 100);
	else
		Clockwork.player:Notify("You're not a Vortigaunt!");
	end;
end;

COMMAND:Register();