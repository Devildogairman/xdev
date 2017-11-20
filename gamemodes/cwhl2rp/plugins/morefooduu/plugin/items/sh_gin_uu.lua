local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "UU Gin";
ITEM.cost = 80;
ITEM.model = "models/bioshockinfinite/jin_bottle.mdl";
ITEM.weight = 0.7;
ITEM.access = "u";
ITEM.thirst = 20;
ITEM.category = "Consumables";
ITEM.uniqueID = "gin_uu";
ITEM.useSound = {"npc/barnacle/barnacle_gulp1.wav", "npc/barnacle/barnacle_gulp2.wav"};
ITEM.business = true;
ITEM.description = "A bottle of gin from the Universal Union.";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

function ITEM:OnUse(player, itemEntity) --The function, it means when the item is used by a player, the bellow happens
	player:SetCharacterData("", 100); --In the quote marks goes the attribute you wish to edit, next to it is the value 
	
	player:BoostAttribute(self.name, ATB_AGILITY, 1, 120); -- As it says it bossts the mentioned attribute; change the attribute to have a different effect. The values are to the right.
	player:BoostAttribute(self.name, ATB_STAMINA, 1, 120);
end;


ITEM:Register();