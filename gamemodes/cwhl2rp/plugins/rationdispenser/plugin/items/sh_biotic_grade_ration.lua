--[[
	� 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();
ITEM.name = "Biotic Grade Loyalty Ration";
ITEM.model = "models/weapons/w_packatb.mdl";
ITEM.weight = 2;
ITEM.uniqueID = "biotic_grade_ration";
ITEM.useText = "Open";
ITEM.category = "Impera Custom Rations";
ITEM.description = "A Shiny Green Packet, its contents seem to be of strange loyalty quality.";

ITEM.food = {"grub_nugget_large", "grub_nugget_medium", "grub_nugget_small"};

-- Called when a player attempts to pick up the item.
function ITEM:CanPickup(player, quickUse, itemEntity)
	if (quickUse) then
		if (!player:CanHoldWeight(self.weight)) then
			Clockwork.player:Notify(player, "You do not have enough inventory space!");
			
			return false;
		end;
	end;
end;

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	Clockwork.player:GiveCash(player, 10, "Biotic Grade Ration Packet");
	player:GiveItem(Clockwork.item:CreateInstance("breens_water"), true);
	
	-- Give random items if lucky.
	if (math.random(1,1) == 1) then
		local item = Clockwork.item:CreateInstance(self.food[math.random(1, #self.food)]);
		player:GiveItem(item, true);
	end;
	
	Clockwork.plugin:Call("PlayerUseRation", player);
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();