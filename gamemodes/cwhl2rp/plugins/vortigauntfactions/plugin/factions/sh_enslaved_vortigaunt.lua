local FACTION = Clockwork.faction:New("Enslaved Vortigaunt");

FACTION.useFullName = true;
FACTION.whitelist = true;
FACTION.material = "halfliferp/factions/vort";
FACTION.models = {
	female = {"models/vortigaunt_slave.mdl"},
	male = {"models/vortigaunt_slave.mdl"}
};

-- Called when a player is transferred to the faction.
function FACTION:OnTransferred(player, faction, name)
	if (faction.name == FACTION_VORT) then
		if (player:QueryCharacter("gender") == GENDER_MALE) then
			player:SetCharacterData("model", self.models.male[1], true);
		else
			player:SetCharacterData("model", self.models.female[1], true);
		end;
	else
		return false;
	end;
end;

-- Checked for rations
FACTION.canGetRations = true;
FACTION.noIDCard = true;
FACTION.canUseRationToken = true;
FACTION.rationUniqueID = "biotic_grade_ration";

FACTION_VORTSLAVE = FACTION:Register();