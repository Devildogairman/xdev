--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("alcohol_base");
ITEM.name = "Champagne";
ITEM.cost = 190;
ITEM.model = "models/bioshockinfinite/jin_bottle.mdl";
ITEM.weight = 1.4;
ITEM.access = "X";
ITEM.useText = "Drink";
ITEM.category = "Alcohol";
ITEM.business = true;
ITEM.description = "This does not have a UU-Brand on it. A rather large bottle of champagne. It is sealed with a cork.";
ITEM.uniqueID = "uu_champagne";

function ITEM:OnUse(player, itemEntity)
	player:SetHealth( math.Clamp( player:Health() + 1, 0, player:GetMaxHealth() ) );
	
	-- This won't get you drunk. Meh.
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) 

end;


ITEM:Register();