local PLUGIN = PLUGIN;

Clockwork.kernel:IncludePrefixed("cl_plugin.lua");
Clockwork.kernel:IncludePrefixed("sv_hooks.lua");
Clockwork.kernel:IncludePrefixed("sv_plugin.lua");

-- A function to get if a faction is Vortigaunt.
function PLUGIN:IsVortigauntFaction(faction)
	return (faction == FACTION_VORT or faction == FACTION_VORTSLAVE);
end;

if (CLIENT) then
	local fluxColor = Color(0, 180, 0, 255);

	Clockwork.chatBox:RegisterClass("flux", "ic", function(info)
		Clockwork.chatBox:Add(info.filtered, nil, fluxColor, "[Flux] "..info.name..": "..info.text);
	end);
end;