local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Citizen Supplement";
ITEM.cost = 0;
ITEM.model = "models/mres/consumables/tag_mre.mdl";
ITEM.uniqueID = "suppl_citizen";
ITEM.weight = 0.8;
ITEM.access = "v";
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.business = true;
ITEM.description = "A transparent gray pocket with a whitish soft paste.";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

function ITEM:OnUse(player, itemEntity) --The function, it means when the item is used by a player, the bellow happens
	player:SetCharacterData("", 100); --In the quote marks goes the attribute you wish to edit, next to it is the value 
	
	player:BoostAttribute(self.name, ATB_AGILITY, 1, 120); -- As it says it bossts the mentioned attribute; change the attribute to have a different effect. The values are to the right.
	player:BoostAttribute(self.name, ATB_STAMINA, 1, 120);
end;

ITEM:Register();