local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Grub Nugget (Large)";
ITEM.cost = 0;
ITEM.model = "models/grub_nugget_large.mdl";
ITEM.weight = 0.3;
ITEM.access = "v";
ITEM.useText = "Eat";
ITEM.category = "Impera Custom Rations";
ITEM.useSound = {"npc/barnacle/barnacle_gulp1.wav"};
ITEM.business = false;
ITEM.description = "A greenish goo, smells pretty bad.";
ITEM.uniqueID = "grub_nugget_large";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

function ITEM:OnUse(player, itemEntity) --The function, it means when the item is used by a player, the bellow happens
	player:SetCharacterData("", 100); --In the quote marks goes the attribute you wish to edit, next to it is the value 
	
	player:BoostAttribute(self.name, ATB_AGILITY, 1, 120); -- As it says it bossts the mentioned attribute; change the attribute to have a different effect. The values are to the right.
	player:BoostAttribute(self.name, ATB_STAMINA, 1, 120);
end;


ITEM:Register();