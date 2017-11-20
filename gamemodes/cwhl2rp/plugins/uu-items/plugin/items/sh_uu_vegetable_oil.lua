--[[
	� 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();
ITEM.name = "UU-Branded Vegetable Oil";
ITEM.cost = 10;
ITEM.model = "models/props_junk/garbage_plasticbottle002a.mdl";
ITEM.weight = 0.6;
ITEM.access = "u";
ITEM.useText = "Drink";
ITEM.business = false;
ITEM.category = "UU-Branded Items";
ITEM.description = "A bottle of vegetable oil, it isn't very tasty.";
ITEM.uniqueID = "uu_vegetable_oil";

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	player:TakeDamage(5, player, player);
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();