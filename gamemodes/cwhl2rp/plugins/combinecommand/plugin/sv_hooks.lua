local PLUGIN = PLUGIN;

-- Make Combines Friendly on spawn
function PLUGIN:PlayerSpawnedNPC( player, npc )
	if npc:GetClass() == "npc_combine_s" or npc:GetClass() == "npc_metropolice" then
		for k, v in ipairs( _player.GetAll() ) do	
			npc:AddEntityRelationship(v, D_LI, 100);
		end;
	end;
end

function PLUGIN:PostPlayerSpawn(player, lightSpawn, changeClass, firstSpawn)
	for k, v in ipairs(ents.GetAll()) do
		if v:GetClass() == "npc_combine_s" or v:GetClass() == "npc_metropolice" then
			v:AddEntityRelationship(v, D_LI, 100);
		end;
	end;
end;

-- Called when chat box info should be adjusted.
function PLUGIN:ChatBoxAdjustInfo(info)
	local talkRadius = Clockwork.config:Get("talk_radius"):Get();
	
	if Schema:PlayerIsCombine(info.speaker) then
		if (IsValid(info.speaker) and info.speaker:HasInitialized()) then
			if (info.class == "ic") then
				if string.lower(info.text) == "overwatch" then
					info.speaker:SetSharedVar("command", (CurTime() + 7));
				end;
			end;
		end;
		
		-- Commands
		if (IsValid(info.speaker) and info.speaker:HasInitialized()) then
			if (info.speaker:GetSharedVar("command") != 0) and (CurTime() <= info.speaker:GetSharedVar("command")) then
				if string.lower(info.text) == "shadow" then
					for k, v in ipairs(ents.FindInSphere(info.speaker:GetPos(), talkRadius)) do
						if v:GetClass() == "npc_combine_s" or v:GetClass() == "npc_metropolice" then
							--PLUGIN:NPCfollow(v, info.speaker);
							PLUGIN:StartFollowing(v, info.speaker)
						end;
					end;
				elseif string.lower(info.text) == "lock position" then
					for k, v in ipairs(ents.FindInSphere(info.speaker:GetPos(), talkRadius)) do
						if v:GetClass() == "npc_combine_s" or v:GetClass() == "npc_metropolice" then
							--PLUGIN:NPCstopFollow(v);
							PLUGIN:StopFollowing(v)
						end;
					end;
				elseif string.lower(info.text) == "amputate" then
					local target = info.speaker:GetEyeTraceNoCursor().Entity;
					for k, v in ipairs(ents.FindInSphere(info.speaker:GetPos(), talkRadius)) do
						if v:GetClass() == "npc_combine_s" or v:GetClass() == "npc_metropolice" then
							PLUGIN:NPCkillTarget( v, target );
						end;
					end;
				elseif string.lower(info.text) == "sterilize" then
					for k, v in ipairs(ents.FindInSphere(info.speaker:GetPos(), talkRadius)) do
						if v:GetClass() == "npc_combine_s" or v:GetClass() == "npc_metropolice" then
							PLUGIN:NPCclearArea(info.speaker, v, talkRadius*2)
						end;
					end;
				end;
			end;
		end;
	end;
end;
--[[
function PLUGIN:PlayerThink(player, curTime, infoTable)
	local nextUpdate = CurTime();
	local last
	for k, v in ipairs(ents.GetAll()) do
		if v:GetClass() == "npc_combine_s" or v:GetClass() == "npc_metropolice" then
			if (v.following == true) and (v.followTarget == player) then
				if (CurTime() >= nextUpdate) then
				nextUpdate = CurTime() +0.5
				local posSrc = v:GetPos()
				local posTgt = player:GetPos()
					if(!last || !v:IsCurrentSchedule(SCHED_FORCED_GO_RUN) || posTgt:Distance(last) > 200) then
						last = posTgt
						local d = posSrc:Distance(posTgt)
						local schd = SCHED_FORCED_GO_RUN
						if(d > 200) then
							v:SetLastPosition(posTgt)
							v:SetSchedule(schd)
						elseif(v:IsCurrentSchedule(schd)) then 
							v:ClearSchedule(); 
							v:StopMoving();
						end;
					end;
				end;
			end;
		end;
	end;
end;
--]]