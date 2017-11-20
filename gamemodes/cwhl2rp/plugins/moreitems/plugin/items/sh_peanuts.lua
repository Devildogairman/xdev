--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();
ITEM.name = "Peanuts";
ITEM.cost = 18;
ITEM.model = "models/bioshockinfinite/rag_of_peanuts.mdl";
ITEM.weight = 0.7;
ITEM.access = "u";
ITEM.useText = "Consume";
ITEM.category = "Food";
ITEM.business = true;
ITEM.description = "A ripped bag of peanuts. There is an allergy warning on the side.";
ITEM.uniqueID = "uu_peanuts";

function ITEM:OnUse(player, itemEntity)
	player:SetHealth( math.Clamp( player:Health() + 5, 0, player:GetMaxHealth() ) );

	player:BoostAttribute(self.name, ATB_ACCURACY, 2, 120);
	
	-- Peanuts
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) 

end;


ITEM:Register();