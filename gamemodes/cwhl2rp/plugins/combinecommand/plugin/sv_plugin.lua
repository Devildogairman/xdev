local PLUGIN = PLUGIN;

--[[
Functions to add:

*NPC Kill Target (npc, target)
	Combine nearby should kill the target, given as the target input
*NPC Follow (npc, leader)
	Combine should be set to follow the target
*NPC Clear area (leader, sphere size)
	This one should run Kill Target for all Non combine in an area


--]]

function PLUGIN:NPCkillTarget( npc, target )
	npc:AddEntityRelationship(target,D_HT,100)
	npc:SetEnemy(target)
	if (target:IsNPC()) then 
		target:AddEntityRelationship(npc,D_HT,100)
	end
	npc:EmitSound("npc/metropolice/vo/copy.wav");
end;

function PLUGIN:NPCclearArea(leader, npc, sphere)
	for k, v in ipairs(ents.FindInSphere(leader, sphere))	do
		if v:IsPlayer() then
			if !Schema:PlayerIsCombine(v) then
				PLUGIN:NPCkillTarget(npc, v);
			end;
		end;
	end;
	npc:EmitSound("npc/metropolice/vo/copy.wav");
end;
--[[
function PLUGIN:NPCfollow(npc, leader)
	npc.following = true
	npc.followTarget = leader
	npc:EmitSound("npc/metropolice/vo/copy.wav");
end;

function PLUGIN:NPCstopFollow(npc)
	npc.following = false
	npc:ClearSchedule()
	npc:StopMoving()
	npc:EmitSound("npc/metropolice/vo/copy.wav");
end;
--]]

function PLUGIN:StartFollowing(src,tgt)
	self:StopFollowing(src)
	self.m_tbDisp = self.m_tbDisp || {}
	local hk = "npctool_follower" .. src:EntIndex() .. tgt:EntIndex()
	self.m_tbDisp[src] = self.m_tbDisp[src] || {}
	self.m_tbDisp[src][tgt] = src:Disposition(tgt)
	if(tgt:IsNPC()) then
		self.m_tbDisp[tgt] = self.m_tbDisp[tgt] || {}
		self.m_tbDisp[tgt][src] = tgt:Disposition(src)
		tgt:AddEntityRelationship(src,D_LI,100)
	end
	if(tgt:IsNPC() || tgt:IsPlayer()) then src:AddEntityRelationship(tgt,D_LI,100) end
	if(src.bScripted) then src.fFollowDistance = 200; src:SetBehavior(1,tgt); return end
	local nextUpdate = CurTime()
	local last
	hook.Add("Think",hk,function()
		if(!src:IsValid() || !tgt:IsValid()) then hook.Remove("Think",hk)
		elseif(CurTime() >= nextUpdate) then
			nextUpdate = CurTime() +0.5
			local posSrc = src:GetPos()
			local posTgt = tgt:GetPos()
			if(!last || !src:IsCurrentSchedule(SCHED_FORCED_GO_RUN) || posTgt:Distance(last) > 200) then
				last = posTgt
				local d = math.max(posSrc:Distance(posTgt) -(src:OBBMaxs().x +tgt:OBBMaxs().x),0)
				local schd = SCHED_FORCED_GO_RUN
				if(d > 200) then
					src:SetLastPosition(posTgt)
					src:SetSchedule(schd)
				elseif(src:IsCurrentSchedule(schd)) then src:ClearSchedule(); src:StopMoving() end
			end
		end
	end)
end

function PLUGIN:StopFollowing(src)
	if(!self.m_tbDisp) then return end
	if(!self.m_tbDisp[src]) then return end
	for tgt,disp in pairs(self.m_tbDisp[src]) do
		if(tgt:IsValid()) then
			hook.Remove("Think","npctool_follower" .. src:EntIndex() .. tgt:EntIndex())
			src:AddEntityRelationship(tgt,disp,100)
			self.m_tbDisp[src][tgt] = nil
			if(!tgt:IsPlayer()) then
				if(self.m_tbDisp[tgt] && self.m_tbDisp[tgt][src]) then
					tgt:AddEntityRelationship(src,self.m_tbDisp[tgt][src],100)
					self.m_tbDisp[tgt][src] = nil
				else tgt:AddEntityRelationship(src,disp,100) end
			end
		end
	end
end