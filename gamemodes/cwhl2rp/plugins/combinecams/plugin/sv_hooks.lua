local cwCombCams = cwCombCams;

-- Called when OpenAura has loaded all of the entities.
function cwCombCams:ClockworkInitPostEntity()
	cwCombCams:LoadCamTerms();
	cwCombCams:LoadCameras();
	cwCombCams:LoadCams()
	for k, v in ipairs(ents.GetAll()) do
		if v:GetClass() == "npc_combine_camera" then
			cwCombCams:AddCameraEntity(v)
		end;
	end;
end;

-- Called when data should be saved.
function cwCombCams:SaveData() 
	cwCombCams:SaveCamTerms();
	cwCombCams:SaveCameras();
	cwCombCams:SaveCams()
end;

-- Make Combines Friendly on spawn
function cwCombCams:PlayerSpawnedNPC( player, npc )
	if npc:GetClass() == "npc_combine_camera" then
		cwCombCams:AddCameraEntity(npc);
	end;
end

-- Called just after a player spawns.
function cwCombCams:PostPlayerSpawn(player, lightSpawn, changeClass, firstSpawn)
	if (!lightSpawn) then
		player.watchingCam = false;
	end;
end;

-- Called when an entity's menu option should be handled.
function cwCombCams:EntityHandleMenuOption(player, entity, option, arguments)
	local class = entity:GetClass();
	if (class == "cw_camtv") then
		if string.find(arguments, "CamFeed", 1, true) then
			local camIDstring = string.sub(arguments, 11);
			local camID = tonumber(camIDstring);
			local camera = ents.GetByIndex( camID );
			local npcCam = camera:GetParent();
			if camera:IsValid() then
				if player:GetMoveType() != MOVETYPE_OBSERVER then
					player:SetViewEntity(camera);
					player.watchingCam = true;
					player:SetMoveType(MOVETYPE_NONE);
					Clockwork.player:Notify(player, "<:: Accessing Secure Network.. Access Granted.");
				end;
			else
				Clockwork.player:Notify(player, "ERROR: Camera "..camID.." not found");
			end;
		else
			Clockwork.player:Notify(player, "ERROR: Shit be fukd");
		end;
	end;
end;

function cwCombCams:KeyPress(player, key)
	if player.watchingCam == true then
		local viewEnt = player:GetViewEntity();
		local camera = viewEnt:GetParent();
		if camera:IsValid() then
			if ( key == IN_JUMP ) then
				camera:Fire("Toggle");
			elseif ( key == IN_ATTACK ) then
				if !camera.Angry or camera.Angry == false then
					camera:Fire("SetAngry");
					camera.Angry = true;
				else
					camera:Fire("SetIdle")
					camera.Angry = false;
				end;
			end;
		end;
		
		if ( key == IN_USE ) then
			player:SetViewEntity(player);
			player:SetMoveType(MOVETYPE_WALK);
			player.watchingCam = false
		end
	end;
end;