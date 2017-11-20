local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "UU Crisps";
ITEM.cost = 15;
ITEM.model = "models/bioshockinfinite/bag_of_hhips.mdl";
ITEM.weight = 0.3;
ITEM.access = "u";
ITEM.hunger = 10;
ITEM.category = "Consumables";
ITEM.uniqueID = "crisps_uu";
ITEM.business = true;
ITEM.description = "A pack of beige colored crisps with a Universal Union symbol on it.";

function ITEM:OnUse(player, itemEntity) --The function, it means when the item is used by a player, the bellow happens
	player:SetCharacterData("", 100); --In the quote marks goes the attribute you wish to edit, next to it is the value 
	
	player:BoostAttribute(self.name, ATB_AGILITY, 1, 120); -- As it says it bossts the mentioned attribute; change the attribute to have a different effect. The values are to the right.
	player:BoostAttribute(self.name, ATB_STAMINA, 1, 120);
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();