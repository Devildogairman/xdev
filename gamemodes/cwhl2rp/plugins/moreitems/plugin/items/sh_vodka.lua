--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("alcohol_base");
ITEM.name = "Vodka";
ITEM.cost = 45;
ITEM.model = "models/props_junk/garbage_glassbottle003a.mdl";
ITEM.weight = 1.1;
ITEM.access = "U";
ITEM.useText = "Drink";
ITEM.category = "Alcohol";
ITEM.business = true;
ITEM.description = "A translucent bottle of Vodka.";
ITEM.uniqueID = "uu_vodka";

function ITEM:OnUse(player, itemEntity)
	player:SetSharedVar("antidepressants", CurTime() + 600);
	
	-- This won't get you drunk. Meh.
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) 

end;


ITEM:Register();