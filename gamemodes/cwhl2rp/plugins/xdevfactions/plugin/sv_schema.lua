local PLUGIN = PLUGIN;

-- A function to load the research locks.
function PLUGIN:LoadResearchLocks()
	local researchLocks = Clockwork.kernel:RestoreSchemaData( "plugins/xdevfactions/"..game.GetMap() );
	
	for k, v in pairs(researchLocks) do
		local entity = ents.FindInSphere(v.doorPosition, 16)[1];
		
		if (IsValid(entity)) then
			local researchLock = self:ApplyResearchLock(entity);
			
			if (researchLock) then
				Clockwork.player:GivePropertyOffline(v.key, v.uniqueID, entity);
				
				researchLock:SetLocalAngles(v.angles);
				researchLock:SetLocalPos(v.position);
				
				if (!v.locked) then
					researchLock:Unlock();
				else
					researchLock:Lock();
				end;
			end;
		end;
	end;
end;

-- A function to save the research locks.
function PLUGIN:SaveResearchLocks()
	local researchLocks = {};
	
	for k, v in pairs( ents.FindByClass("cw_researchlock") ) do
		if (IsValid(v.entity)) then
			researchLocks[#researchLocks + 1] = {
				key = Clockwork.entity:QueryProperty(v, "key"),
				locked = v:IsLocked(),
				angles = v:GetLocalAngles(),
				position = v:GetLocalPos(),
				uniqueID = Clockwork.entity:QueryProperty(v, "uniqueID"),
				doorPosition = v.entity:GetPos()
			};
		end;
	end;
	
	Clockwork.kernel:SaveSchemaData("plugins/xdevfactions/"..game.GetMap(), researchLocks);
end;

-- A function to apply a research lock.
function PLUGIN:ApplyResearchLock(entity, position, angles)
	local researchLock = ents.Create("cw_researchlock");
	
	researchLock:SetParent(entity);
	researchLock:SetDoor(entity);
	
	if (position) then
		if (type(position) == "table") then
			researchLock:SetLocalPos( Vector(-1.0313, 43.7188, -1.2258) );
			researchLock:SetPos( researchLock:GetPos() + (position.HitNormal * 4) );
		else
			researchLock:SetPos(position);
		end;
	end;
	
	if (angles) then
		researchLock:SetAngles(angles);
	end;
	
	researchLock:Spawn();
	
	if (IsValid(researchLock)) then
		return researchLock;
	end;
end;

-- A function to bust down a door.
function PLUGIN:BustDownDoor(player, door, force)
	door.bustedDown = true;
	
	door:SetNotSolid(true);
	door:DrawShadow(false);
	door:SetNoDraw(true);
	door:EmitSound("physics/wood/wood_box_impact_hard3.wav");
	door:Fire("Unlock", "", 0);
	
	if (IsValid(door.researchLock)) then
		door.researchLock:Explode();
		door.researchLock:Remove();
	end;
	
	if (IsValid(door.breach)) then
		door.breach:BreachEntity();
	end;
	
	local fakeDoor = ents.Create("prop_physics");
	
	fakeDoor:SetCollisionGroup(COLLISION_GROUP_WORLD);
	fakeDoor:SetAngles( door:GetAngles() );
	fakeDoor:SetModel( door:GetModel() );
	fakeDoor:SetSkin( door:GetSkin() );
	fakeDoor:SetPos( door:GetPos() );
	fakeDoor:Spawn();
	
	local physicsObject = fakeDoor:GetPhysicsObject();
	
	if (IsValid(physicsObject)) then
		if (!force) then
			if (IsValid(player)) then
				physicsObject:ApplyForceCenter( (door:GetPos() - player:GetPos() ):GetNormal() * 10000 );
			end;
		else
			physicsObject:ApplyForceCenter(force);
		end;
	end;
	
	Clockwork.entity:Decay(fakeDoor, 300);
	
	Clockwork.kernel:CreateTimer("reset_door_"..door:EntIndex(), 300, 1, function()
		if (IsValid(door)) then
			door.bustedDown = nil;
			
			door:SetNotSolid(false);
			door:DrawShadow(true);
			door:SetNoDraw(false);
		end;
	end);
end;