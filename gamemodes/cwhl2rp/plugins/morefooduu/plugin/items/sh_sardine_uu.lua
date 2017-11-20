local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "UU Sardine";
ITEM.cost = 8;
ITEM.model = "models/bioshockinfinite/cardine_can_open.mdl";
ITEM.weight = 0.3;
ITEM.access = "u";
ITEM.category = "Consumables";
ITEM.hunger = 5;
ITEM.uniqueID = "saradine_uu";
ITEM.business = true;
ITEM.description = "Canned sardines produced by the Universal Union is sardines does not really resemble that of your memories.";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

function ITEM:OnUse(player, itemEntity) --The function, it means when the item is used by a player, the bellow happens
	player:SetCharacterData("", 100); --In the quote marks goes the attribute you wish to edit, next to it is the value 
	
	player:BoostAttribute(self.name, ATB_AGILITY, 1, 120); -- As it says it bossts the mentioned attribute; change the attribute to have a different effect. The values are to the right.
	player:BoostAttribute(self.name, ATB_STAMINA, 1, 120);
end;


ITEM:Register();