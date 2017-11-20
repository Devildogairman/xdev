--[[
	� 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();
ITEM.name = "Civil Workers' Union Grade Loyalty Ration";
ITEM.model = "models/weapons/w_packatl.mdl";
ITEM.weight = 2;
ITEM.uniqueID = "cwu_grade_ration";
ITEM.useText = "Open";
ITEM.category = "Impera Custom Rations";
ITEM.description = "A Glowing Red Packet, its contents seem to be of decent quality.";

ITEM.food = {"peanut_uu", "banana_uu", "orange_uu", "cereal_uu", "crisps_uu",
			 "corn_uu", "bread_uu"};
ITEM.book = {"book_c"};
ITEM.misc = {"request_device", "uu_bandage"};

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
	Clockwork.player:GiveCash(player, 100, "CWU Ration Packet");

	player:GiveItem(Clockwork.item:CreateInstance("suppl_citizen_loyal"), true);
	player:GiveItem(Clockwork.item:CreateInstance("smooth_breens_water"), true);
	player:GiveItem(Clockwork.item:CreateInstance("peanut_uu"), true);
	player:GiveItem(Clockwork.item:CreateInstance("apple_uu"), true);
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