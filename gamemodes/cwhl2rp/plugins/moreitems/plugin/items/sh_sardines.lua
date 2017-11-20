--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();
ITEM.name = "Sardines";
ITEM.cost = 12;
ITEM.model = "models/bioshockinfinite/cardine_can_open.mdl";
ITEM.weight = 0.5;
ITEM.access = "u";
ITEM.useText = "Consume";
ITEM.category = "Food";
ITEM.business = true;
ITEM.description = "An unopened can of Sardines..";
ITEM.uniqueID = "uu_sardines";

function ITEM:OnUse(player, itemEntity)
	player:SetHealth( math.Clamp( player:Health() + 6, 0, player:GetMaxHealth() ) );
	
	-- Crisps is a British word.
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) 

end;


ITEM:Register();