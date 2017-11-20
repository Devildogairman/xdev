--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();
ITEM.name = "Soup";
ITEM.cost = 65;
ITEM.model = "models/props_junk/garbage_metalcan001a.mdl";
ITEM.weight = 0.4;
ITEM.access = "X";
ITEM.useText = "Consume";
ITEM.category = "Food";
ITEM.business = true;
ITEM.description = "This does not have a UU-Brand on it. An unopened can of tomato soup.";
ITEM.uniqueID = "uu_soup";

function ITEM:OnUse(player, itemEntity)
	player:SetHealth( math.Clamp( player:Health() + 3, 0, player:GetMaxHealth() ) );
	
	player:BoostAttribute(self.name, ATB_STRENGTH, 1, 120);
	-- Tomato Soup.
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) 

end;


ITEM:Register();