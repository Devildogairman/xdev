--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("alcohol_base");
ITEM.name = "Red Wine";
ITEM.cost = 260;
ITEM.model = "models/bioshockinfinite/ebsinthebottle.mdl";
ITEM.weight = 1.2;
ITEM.access = "X";
ITEM.useText = "Drink";
ITEM.category = "Alcohol";
ITEM.business = true;
ITEM.description = "This does not have a UU-Brand on it. A rather large bottle of Red Wine.";
ITEM.uniqueID = "uu_wine";

function ITEM:OnUse(player, itemEntity)
	player:SetSharedVar("antidepressants", CurTime() + 600);
	
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) 

end;


ITEM:Register();