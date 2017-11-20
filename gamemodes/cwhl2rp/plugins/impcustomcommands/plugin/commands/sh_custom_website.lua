local COMMAND = Clockwork.command:New("Website");
COMMAND.tip = "Link to the server website.";	
COMMAND.flags = CMD_DEFAULT;

-- Thanks to NightAngel for showing me this function instead of me making my own!
function COMMAND:OnRun(player)
     player:SendLua([[gui.OpenURL("https://impera.mistforums.com/")]])
end;

COMMAND:Register();
