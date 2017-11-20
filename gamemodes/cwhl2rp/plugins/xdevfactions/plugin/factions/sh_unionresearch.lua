--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local FACTION = Clockwork.faction:New("Civil Research Union");

FACTION.useFullName = true;
FACTION.whitelist = true;
FACTION.models = {
	female = {
		"models/humans/group17/female_01.mdl"
	},
	male = {
		"models/humans/group17/male_01.mdl"
	};
};

-- Called when a player is transferred to the faction.
function FACTION:OnTransferred(player, faction, name)
	if (faction.name != FACTION_CITIZEN) then
		return false;
	end;
end;

FACTION_UNIONRESEARCH = FACTION:Register();