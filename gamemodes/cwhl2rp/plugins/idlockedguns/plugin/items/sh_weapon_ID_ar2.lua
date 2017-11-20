--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("id_weapon_base");
	ITEM.name = "ID Locked Pulse-Rifle";
	ITEM.cost = 400;
	ITEM.model = "models/weapons/w_irifle.mdl";
	ITEM.weight = 4;
	ITEM.classes = {CLASS_EOW};
	ITEM.uniqueID = "id_weapon_ar2";
	ITEM.weaponClass = "weapon_ar2";
	ITEM.business = false;
	ITEM.description = "A weapon which does not seem to have been crafted on Earth.";
	ITEM.isAttachment = true;
	ITEM.hasFlashlight = false;
	ITEM.loweredOrigin = Vector(3, 0, -4);
	ITEM.loweredAngles = Angle(0, 45, 0);
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
	ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
	ITEM.attachmentOffsetVector = Vector(-3.96, 4.95, -2.97);
ITEM:Register();