--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();
ITEM.name = "Cider";
ITEM.cost = 52;
ITEM.model = "models/bioshockinfinite/hext_bottle_lager.mdl";
ITEM.weight = 1.1;
ITEM.access = "U";
ITEM.useText = "Drink";
ITEM.category = "Alcohol";
ITEM.business = true;
ITEM.description = "A medium sized translucent bottle of Cider.";
ITEM.uniqueID = "uu_cider";

function ITEM:OnUse(player, itemEntity)
	player:SetHealth( math.Clamp( player:Health() + 1, 0, player:GetMaxHealth() ) );
	
	-- This won't get you drunk. Meh.
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) 

end;


ITEM:Register();