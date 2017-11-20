--[[
	� 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();
ITEM.name = "UU-Branded Chinese Takeout";
ITEM.cost = 15;
ITEM.model = "models/props_junk/garbage_takeoutcarton001a.mdl";
ITEM.weight = 0.8;
ITEM.access = "u";
ITEM.useText = "Eat";
ITEM.category = "UU-Branded Items";
ITEM.business = true;
ITEM.description = "A takeout carton, it's filled with cold noodles.";
ITEM.uniqueID = "uu_chinese_takeout";

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	player:SetHealth( math.Clamp( player:Health() + 10, 0, player:GetMaxHealth() ) );
	
	player:BoostAttribute(self.name, ATB_ENDURANCE, 2, 120);
	player:BoostAttribute(self.name, ATB_ACCURACY, 1, 120);
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();