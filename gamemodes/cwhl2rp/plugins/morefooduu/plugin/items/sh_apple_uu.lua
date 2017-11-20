local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "UU Apple";
ITEM.uniqueID = "apple_uu";
ITEM.cost = 10;
ITEM.model = "models/bioshockinfinite/hext_apple.mdl";
ITEM.thirst = 10;
ITEM.hunger = 20;
ITEM.weight = 0.3;
ITEM.access = "u";
ITEM.category = "Consumables";
ITEM.business = true;
ITEM.description = "An apple of the Universal Union remains to know if you remember its taste.";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

function ITEM:OnUse(player, itemEntity) --The function, it means when the item is used by a player, the bellow happens
	player:SetCharacterData("", 100); --In the quote marks goes the attribute you wish to edit, next to it is the value 
	
	player:BoostAttribute(self.name, ATB_AGILITY, 1, 120); -- As it says it bossts the mentioned attribute; change the attribute to have a different effect. The values are to the right.
	player:BoostAttribute(self.name, ATB_STAMINA, 1, 120);
end;

ITEM:Register();