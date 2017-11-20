--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();
ITEM.name = "Beans";
ITEM.cost = 32;
ITEM.model = "models/props_junk/garbage_metalcan001a.mdl";
ITEM.weight = 0.8;
ITEM.access = "X";
ITEM.useText = "Consume";
ITEM.category = "Food";
ITEM.business = true;
ITEM.description = "This does not have a UU-Brand on it. An unopened can of beans. These things last forever.";
ITEM.uniqueID = "uu_beans";

function ITEM:OnUse(player, itemEntity)
	player:SetHealth( math.Clamp( player:Health() + 3, 0, player:GetMaxHealth() ) );
	
	player:BoostAttribute(self.name, ATB_STRENGTH, 1, 120);
	-- Beans on toast.
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) 

end;


ITEM:Register();