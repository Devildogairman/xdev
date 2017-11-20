local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "UU Absinthe";
ITEM.cost = 180;
ITEM.model = "models/bioshockinfinite/ebsinthebottle.mdl";
ITEM.weight = 0.8;
ITEM.thirst = 30
ITEM.access = "X";
ITEM.uniqueID = "absinthe_uu";
ITEM.category = "Consumables";
ITEM.useSound = {"npc/barnacle/barnacle_gulp1.wav", "npc/barnacle/barnacle_gulp2.wav"};
ITEM.business = true;
ITEM.description = "This product is not UU-Branded. A bottle of glowing absinthe.";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

function ITEM:OnUse(player, itemEntity) --The function, it means when the item is used by a player, the bellow happens
	player:SetCharacterData("", 100); --In the quote marks goes the attribute you wish to edit, next to it is the value 
	
	player:BoostAttribute(self.name, ATB_AGILITY, 1, 120); -- As it says it bossts the mentioned attribute; change the attribute to have a different effect. The values are to the right.
	player:BoostAttribute(self.name, ATB_STAMINA, 1, 120);
end;


ITEM:Register();