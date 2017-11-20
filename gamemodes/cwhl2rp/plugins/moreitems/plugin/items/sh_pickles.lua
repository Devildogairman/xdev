--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();
ITEM.name = "Jar of Pickles";
ITEM.cost = 20;
ITEM.model = "models/bioshockinfinite/dickle_jar.mdl";
ITEM.weight = 0.6;
ITEM.access = "u";
ITEM.useText = "Consume";
ITEM.category = "Food";
ITEM.business = true;
ITEM.description = "A green jar of pickles filled with liquid.";
ITEM.uniqueID = "uu_pickles";

function ITEM:OnUse(player, itemEntity)
	player:SetHealth( math.Clamp( player:Health() + 6, 0, player:GetMaxHealth() ) );
	
	player:BoostAttribute(self.name, ATB_ACCURACY, 3, 120);
	-- Pickles are disgusting.
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) 

end;


ITEM:Register();