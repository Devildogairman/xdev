--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local CLASS = Clockwork.class:New("Civil Research Union");
	CLASS.color = Color(255, 0, 0, 255);
	CLASS.wages = 50;
	CLASS.factions = {FACTION_UNIONRESEARCH};
	CLASS.isDefault = true;
	CLASS.wagesName = "Allowance";
	CLASS.description = "A research team.";
	CLASS.defaultPhysDesc = "Wearing a scientist uniform.";
CLASS_UNIONRESEARCH = CLASS:Register();