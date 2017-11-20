local cwCombCams = cwCombCams;

function cwCombCams:HUDPaintEntityTargetID(entity, info)
	local colorTargetID = Clockwork.option:GetColor("target_id");
	local colorWhite = Clockwork.option:GetColor("white");
	if (entity:GetClass() == "cw_camtv") then
			info.y = Clockwork.kernel:DrawInfo("<:: Overwatch Monitoring Station ::>", info.x, info.y, colorTargetID, info.alpha);
			info.y = Clockwork.kernel:DrawInfo("This machine can view Combine Camera feeds.", info.x, info.y, colorWhite, info.alpha);
	end;
end;

-- Called when an entity's menu options are needed.
function cwCombCams:GetEntityMenuOptions(entity, options)
	if (entity:GetClass() == "cw_camtv") then
		for k, v in ipairs(ents.GetAll()) do
			if v:GetClass() == "cw_npc_cam" then
				local npcCam = v:GetParent();
				local camName = "";
				
				if npcCam:IsValid() then
					camName = npcCam:GetNetworkedString("cw_Name")
				else
					camName = v:GetNWString("Cam_Name");
				end;
				
				if camName != "" then
					options["Access "..camName] = "cwCamFeed-"..tostring(v:EntIndex());
				else
					options["Access MPF-AUTO.CAM."..tostring(v:EntIndex())] = "cwCamFeed-"..tostring(v:EntIndex());
				end;
			end;
		end;
	end;
end;

--[[ Called when screen space effects should be rendered.
function PLUGIN:RenderScreenspaceEffects()
	local viewCam = Clockwork.Client:GetSharedVar("watchingCam");
	if ( viewCam ) then
		DrawMaterialOverlay( "models/props_combine/com_shield001a", 0 );
	end;
end;
]]