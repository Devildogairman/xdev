--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("id_weapon_base");
	ITEM.name = "ID Locked MP7";
	ITEM.cost = 3500;
	ITEM.batch = 1;
	ITEM.model = "models/weapons/w_smg1.mdl";
	ITEM.weight = 2.5;
	ITEM.access = "V";
	ITEM.uniqueID = "id_weapon_smg1kk";
	ITEM.weaponClass = "weapon_smg1";
	ITEM.business = false;
	ITEM.description = "A compact weapon coated in a dark grey, it has a convenient handle.";
	ITEM.isAttachment = true;
	ITEM.hasFlashlight = false;
	ITEM.loweredOrigin = Vector(3, 0, -4);
	ITEM.loweredAngles = Angle(0, 45, 0);
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
	ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
	ITEM.attachmentOffsetVector = Vector(-2, 5, 4);
ITEM:Register();