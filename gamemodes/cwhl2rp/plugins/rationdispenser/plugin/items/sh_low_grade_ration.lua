--[[
	� 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();
ITEM.name = "Low Grade Loyalty Ration";
ITEM.model = "models/weapons/w_packatc.mdl";
ITEM.weight = 2;
ITEM.uniqueID = "low_grade_ration";
ITEM.useText = "Open";
ITEM.description = "A Shiny Blue Packet, its contents seem to be of low loyalty quality.";

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
	Clockwork.player:GiveCash(player, 90, "low grade ration packet");
	
	player:GiveItem(Clockwork.item:CreateInstance("citizen_supplements"), true);
	player:GiveItem(Clockwork.item:CreateInstance("breens_water"), true);
	
	-- Give random items if lucky.
	if (math.random(1,3) == 3) then
		local item = Clockwork.item:CreateInstance(self.food[math.random(1, #self.food)]);
		player:GiveItem(item, true);
	elseif (math.random(1,10) == 8) then
		local item = Clockwork.item:CreateInstance(self.book[math.random(1, #self.book)]);
		player:GiveItem(item, true);
	elseif (math.random(1,20) == 5) then
		local item = Clockwork.item:CreateInstance(self.misc[math.random(1, #self.misc)]);
		player:GiveItem(item, true);
	end;
	
	Clockwork.plugin:Call("PlayerUseRation", player);
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();