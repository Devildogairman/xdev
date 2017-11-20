local COMMAND = Clockwork.command:New("Content");
COMMAND.tip = "Link to the server content.";	
COMMAND.flags = CMD_DEFAULT;

-- Thanks to NightAngel for showing me this function instead of me making my own!
function COMMAND:OnRun(player)
     player:SendLua([[gui.OpenURL("http://steamcommunity.com/sharedfiles/filedetails/?id=1194943565")]])
end;

COMMAND:Register();
