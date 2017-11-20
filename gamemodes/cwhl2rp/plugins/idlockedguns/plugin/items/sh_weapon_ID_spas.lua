--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("id_weapon_base");
	ITEM.name = "ID Locked Spas-12 Shotgun";
	ITEM.cost = 4000;
	ITEM.batch = 1;
	ITEM.model = "models/weapons/w_shotgun.mdl";
	ITEM.weight = 4;
	ITEM.access = "V";
	ITEM.uniqueID = "weapon_ID_shotty";
	ITEM.weaponClass = "weapon_shotgun";
	ITEM.business = false;
	ITEM.description = "A moderately sized weapon coated in a dull grey.";
	ITEM.isAttachment = true;
	ITEM.hasFlashlight = true;
	ITEM.loweredOrigin = Vector(3, 0, -4);
	ITEM.loweredAngles = Angle(0, 45, 0);
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
	ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
	ITEM.attachmentOffsetVector = Vector(-4, 4, 4);
ITEM:Register();