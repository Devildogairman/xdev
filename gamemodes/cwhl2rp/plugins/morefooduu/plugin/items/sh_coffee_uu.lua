local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "UU Coffee";
ITEM.cost = 80;
ITEM.model = "models/bioshockinfinite/xoffee_mug_closed.mdl";
ITEM.weight = 0.3;
ITEM.thirst = 30;
ITEM.sleep = 50;
ITEM.access = "u";
ITEM.category = "Consumables";
ITEM.uniqueID = "coffee_uu";
ITEM.useSound = {"npc/barnacle/barnacle_gulp1.wav", "npc/barnacle/barnacle_gulp2.wav"};
ITEM.business = true;
ITEM.description = "A cardboard mug containing cold coffee from the Universal Union.";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

function ITEM:OnUse(player, itemEntity) --The function, it means when the item is used by a player, the bellow happens
	player:SetCharacterData("", 100); --In the quote marks goes the attribute you wish to edit, next to it is the value 
	
	player:BoostAttribute(self.name, ATB_AGILITY, 1, 120); -- As it says it bossts the mentioned attribute; change the attribute to have a different effect. The values are to the right.
	player:BoostAttribute(self.name, ATB_STAMINA, 1, 120);
end;


ITEM:Register();