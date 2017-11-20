local PLUGIN = PLUGIN;

-- Called when Clockwork has loaded all of the entities.
function PLUGIN:ClockworkInitPostEntity()
	self:LoadResearchLocks();
end;

-- Called just after data should be saved.
function PLUGIN:PostSaveData()
	self:SaveResearchLocks();
end;

-- Called when a player attempts to lock an entity.
function PLUGIN:PlayerCanLockEntity(player, entity)
	if (Clockwork.entity:IsDoor(entity) and IsValid(entity.researchLock)) then
		if (Clockwork.config:Get("research_lock_overrides"):Get() or entity.researchLock:IsLocked()) then
			return false;
		end;
	end;
end;

-- Called when a player attempts to unlock an entity.
function PLUGIN:PlayerCanUnlockEntity(player, entity)
	if (Clockwork.entity:IsDoor(entity) and IsValid(entity.researchLock)) then
		if (Clockwork.config:Get("research_lock_overrides"):Get() or entity.researchLock:IsLocked()) then
			return false;
		end;
	end;
end;

-- Called when a player attempts to use an entity.
function PLUGIN:PlayerUse(player, entity)
	local overlayText = entity:GetNetworkedString("GModOverlayText");
	local curTime = CurTime();
	local faction = player:GetFaction();
	
	if (player:KeyDown(IN_SPEED) and Clockwork.entity:IsDoor(entity)) then
		if ((Schema:PlayerIsCombine(player) or player:GetFaction() == FACTION_ADMIN or player:HasItemByID("research_card")) and IsValid(entity.researchLock)) then
			if (!player.nextResearchLock or curTime >= player.nextResearchLock) then
				entity.researchLock:ToggleWithChecks(player);
				
				player.nextResearchLock = curTime + 3;
			end;
			
			return false;
		end;
	end;
end;

-- Called when an entity has been breached.
function PLUGIN:EntityBreached(entity, activator)
	if (Clockwork.entity:IsDoor(entity)) then
		if (!IsValid(entity.researchLock)) then
			if (!IsValid(activator) or string.lower( entity:GetClass() ) != "prop_door_rotating") then
				Clockwork.entity:OpenDoor(entity, 0, true, true);
			else
				self:BustDownDoor(activator, entity);
			end;
		elseif (IsValid(activator) and activator:IsPlayer() and Schema:PlayerIsCombine(activator)) then
			if (string.lower( entity:GetClass() ) == "prop_door_rotating") then
				entity.researchLock:ActivateSmokeCharge( (entity:GetPos() - activator:GetPos() ):GetNormal() * 10000 );
			else
				entity.researchLock:SetFlashDuration(2);
			end;
		else
			entity.researchLock:SetFlashDuration(2);
		end;
	end;
end;