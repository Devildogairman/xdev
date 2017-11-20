local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Grub Nugget (Small)";
ITEM.cost = 0;
ITEM.model = "models/grub_nugget_small.mdl";
ITEM.weight = 0.1;
ITEM.access = "v";
ITEM.useText = "Eat";
ITEM.category = "Impera Custom Rations";
ITEM.useSound = {"npc/barnacle/barnacle_gulp1.wav"};
ITEM.uniqueID = "grub_nugget_small";
ITEM.business = false;
ITEM.description = "A greenish goo, smells pretty bad.";

function ITEM:OnUse(player, itemEntity) --The function, it means when the item is used by a player, the bellow happens
	player:SetCharacterData("", 100); --In the quote marks goes the attribute you wish to edit, next to it is the value 
	
	player:BoostAttribute(self.name, ATB_AGILITY, 1, 120); -- As it says it bossts the mentioned attribute; change the attribute to have a different effect. The values are to the right.
	player:BoostAttribute(self.name, ATB_STAMINA, 1, 120);
end;


-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();