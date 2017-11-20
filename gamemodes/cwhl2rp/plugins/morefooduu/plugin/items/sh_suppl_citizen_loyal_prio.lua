local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Priority Loyalist Citizen Supplement";
ITEM.cost = 0;
ITEM.model = "models/probs_misc/tobdcco_box-1.mdl";
ITEM.uniqueID = "suppl_citizen_loyal_prio";
ITEM.weight = 0.5;
ITEM.access = "v";
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.business = true;
ITEM.description = "A yellow and gray box with a soft and whitish paste accompany strange piece of meat.";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

function ITEM:OnUse(player, itemEntity) --The function, it means when the item is used by a player, the bellow happens
	player:SetCharacterData("", 100); --In the quote marks goes the attribute you wish to edit, next to it is the value 
	
	player:BoostAttribute(self.name, ATB_AGILITY, 1, 120); -- As it says it bossts the mentioned attribute; change the attribute to have a different effect. The values are to the right.
	player:BoostAttribute(self.name, ATB_STAMINA, 1, 120);
end;

ITEM:Register();