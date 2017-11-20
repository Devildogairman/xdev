--[[
	� 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();
ITEM.name = "Medium Grade Loyalty Ration";
ITEM.model = "models/weapons/w_packatl.mdl";
ITEM.weight = 2;
ITEM.uniqueID = "medium_grade_ration";
ITEM.useText = "Open";
ITEM.description = "A Glowing Red Packet, its contents seem to be of decent quality.";

ITEM.food = {"uu_beans", "uu_beer_2", "uu_champagne", "uu_cider", "uu_doughnuts", "uu_hotchocolate", 
	"uu_peanuts", "uu_pickles", "uu_wine", "uu_sardines", "uu_soup", "uu_vegetable_oil", "uu_milk_jug",
	"uu_milk_carton", "uu_melon", "uu_large_soda", "uu_beer"};
ITEM.book = {"book_c", "book_zotu", "book_tsod"};
ITEM.misc = {"uu_bandage", "request_device", "boxed_bag"};

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
	Clockwork.player:GiveCash(player, 120, "medium grade ration packet");
	
	player:GiveItem(Clockwork.item:CreateInstance("citizen_supplements"), true);
	player:GiveItem(Clockwork.item:CreateInstance("smooth_breens_water"), true);
	-- Give random items if lucky.
	if (math.random(1,3) == 3) then
		local item = Clockwork.item:CreateInstance(self.food[math.random(1, #self.food)]);
		player:GiveItem(item, true);
	elseif (math.random(1,3) == 3) then
		local item = Clockwork.item:CreateInstance(self.food[math.random(1, #self.food)]);
		player:GiveItem(item, true);
	elseif (math.random(1,5) == 2) then
		local item = Clockwork.item:CreateInstance(self.book[math.random(1, #self.book)]);
		player:GiveItem(item, true);
	elseif (math.random(1,10) == 2) then
		local item = Clockwork.item:CreateInstance(self.misc[math.random(1, #self.misc)]);
		player:GiveItem(item, true);
	end;
	
	Clockwork.plugin:Call("PlayerUseRation", player);
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();