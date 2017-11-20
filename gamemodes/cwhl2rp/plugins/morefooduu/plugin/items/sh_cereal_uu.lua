local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "UU Cereal";
ITEM.cost = 15;
ITEM.model = "models/bioshockinfinite/hext_cereal_box_cornflakes.mdl";
ITEM.weight = 0.3;
ITEM.hunger = 40;
ITEM.access = "u";
ITEM.uniqueID = "cereal_uu";
ITEM.category = "Consumables";
ITEM.business = true;
ITEM.description = "A box of gray cereal with the effigy of a Milician who eats cereals, the shape of this one vaguely recalls the logo of the Union.";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

function ITEM:OnUse(player, itemEntity) --The function, it means when the item is used by a player, the bellow happens
	player:SetCharacterData("", 100); --In the quote marks goes the attribute you wish to edit, next to it is the value 
	
	player:BoostAttribute(self.name, ATB_AGILITY, 1, 120); -- As it says it bossts the mentioned attribute; change the attribute to have a different effect. The values are to the right.
	player:BoostAttribute(self.name, ATB_STAMINA, 1, 120);
end;

ITEM:Register();