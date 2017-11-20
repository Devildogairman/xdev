--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();
ITEM.name = "Newspaper";
ITEM.cost = 15;
ITEM.model = "models/props_junk/garbage_newspaper001a.mdl";
ITEM.weight = 0.3;
ITEM.access = "u"
ITEM.category = "Reusables";
ITEM.business = true;
ITEM.description = "A damp newspaper with 'City Daily' written on the front.";

function ITEM:OnUse(player, itemEntity)

end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) 

end;


ITEM:Register();