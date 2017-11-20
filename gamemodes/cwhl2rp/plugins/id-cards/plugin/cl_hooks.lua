local PLUGIN = PLUGIN;

function PLUGIN:HUDPaintEntityTargetID(entity, info)
	local colorTargetID = Clockwork.option:GetColor("target_id");
	local colorWhite = Clockwork.option:GetColor("white");
	if (entity:GetClass() == "cw_cardterm") then
			info.y = Clockwork.kernel:DrawInfo("<::Civil Identification Printer ::>", info.x, info.y, colorTargetID, info.alpha);
			info.y = Clockwork.kernel:DrawInfo("This machine can print CID Cards.", info.x, info.y, colorWhite, info.alpha);
	end;
end;

-- Called when an entity's menu options are needed.
function PLUGIN:GetEntityMenuOptions(entity, options)
	if (entity:GetClass() == "cw_cardterm") then
		if Schema:PlayerIsCombine(Clockwork.Client) and Schema:IsPlayerCombineRank(Clockwork.Client, {"DvL", "01", "CmD", "SeC", "02"}) then
			options["Print: CID Card"] = "cwCIDmake";
			options["Print: CWU Card"] = "cwCWUmake";
			options["Print: D6 Access License"] = "cwSlumsMake";
			options["Print: Business License"] = "cwBusMake";
			options["Print: Drivers License"] = "cwCarMake";
			options["Print: Medical License"] = "cwDocMake";
		elseif ( Schema:PlayerIsCombine(Clockwork.Client) and !Schema:IsPlayerCombineRank(Clockwork.Client, {"RCT", "05", "04"}) ) then
			options["Print: CID Card"] = "cwCIDmake";
			options["Print: CWU Badge"] = "cwCWUmake";
			options["Print: Slums Pass"] = "cwSlumsMake";
		end;
	end;
end;