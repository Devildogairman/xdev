--[[
	© 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local Clockwork = Clockwork;

local ITEM = Clockwork.item:New("weapon_base", true);
ITEM.name = "ID Weapon Base";
ITEM.useText = "Equip";
ITEM.useSound = false;
ITEM.category = "Weapons";
ITEM.useInVehicle = false;

local defaultWeapons = {
	["weapon_357"] = {"357", nil, true},
	["weapon_ar2"] = {"ar2", "ar2altfire", 30},
	["weapon_rpg"] = {"rpg_round", nil, 3},
	["weapon_smg1"] = {"smg1", "smg1_grenade", true},
	["weapon_slam"] = {"slam", nil, 2},
	["weapon_frag"] = {"grenade", nil, 1},
	["weapon_pistol"] = {"pistol", nil, true},
	["weapon_shotgun"] = {"buckshot", nil, true},
	["weapon_crossbow"] = {"xbowbolt", nil, 4}
};

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	local weaponClass = self("weaponClass");
	
	if ( !Schema:PlayerIsCombine(player) and !Clockwork.player:HasFlags(player, "I") ) then
        Clockwork.player:Notify(player, "<:: Unauthorized Access Detected, engaging Security Protocol Alpha-729 ::>");
        return false;
    end;
	if (!player:HasWeapon(weaponClass)) then
		player:Give(weaponClass, self);
		
		local weapon = player:GetWeapon(weaponClass);
		
		if (IsValid(weapon)) then
			if (self.OnEquip) then
				self:OnEquip(player);
			end;
			
			player:RebuildInventory();
		else
			return false;
		end;
	else
		local weapon = player:GetWeapon(weaponClass);
		
		if (IsValid(weapon) and self.OnAlreadyHas) then
			if (Clockwork.item:GetByWeapon(weapon) == self) then
				self:OnAlreadyHas(player);
			end;
		end;
		
		return false;
	end;
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

Clockwork.item:Register(ITEM);