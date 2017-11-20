local cwCombCams = cwCombCams;

-- A function to load the Card Printers.
function cwCombCams:LoadCamTerms()
	local cams = Clockwork.kernel:RestoreSchemaData( "plugins/cams/"..game.GetMap() );
	
	for k, v in pairs(cams) do
		local entity = ents.Create("cw_camtv");
		entity:SetPos(v.position);
		entity:SetAngles(v.angles);
		entity:Spawn();
		local physicsObject = entity:GetPhysicsObject();
		
		if ( IsValid(physicsObject) ) then
			physicsObject:EnableMotion(false);
		end;
	end;
end;

-- A function to save the Card Printers.
function cwCombCams:SaveCamTerms()
	local cams = {};
	
	for k, v in pairs(ents.FindByClass("cw_camtv")) do
		local position = v:GetPos();
		local angles = v:GetAngles();
		
		cams[#cams + 1] = {
			position = position,
			angles = angles,
		};
	end;
	
	Clockwork.kernel:SaveSchemaData("plugins/cams/"..game.GetMap(), cams);
end;

-- A function to load the Static Cameras
function cwCombCams:LoadCameras()
	local staticcams = Clockwork.kernel:RestoreSchemaData( "plugins/staticcams/"..game.GetMap() );
	
	for k, v in pairs(staticcams) do
		local entity = ents.Create("cw_npc_cam");
		entity:SetPos(v.position);
		entity:SetAngles(v.angles);
		entity:Spawn();
		entity:SetNWString("Cam_Name", v.name)
		local physicsObject = entity:GetPhysicsObject();
		
		if ( IsValid(physicsObject) ) then
			physicsObject:EnableMotion(false);
		end;
	end;
end;

-- A function to save the Static Cameras
function cwCombCams:SaveCameras()
	local staticcams = {};
	
	for k, v in pairs(ents.FindByClass("cw_npc_cam")) do
		if !v:GetParent():IsValid() then
			local position = v:GetPos();
			local angles = v:GetAngles();
			local name = v:GetNWString("Cam_Name");
			
			staticcams[#staticcams + 1] = {
			position = position,
			angles = angles,
			name = name,
			};
		end;
	end;
	
	Clockwork.kernel:SaveSchemaData("plugins/staticcams/"..game.GetMap(), staticcams);
end;

-- A function to load the NPCs.
function cwCombCams:LoadCams()
	local cameras = Clockwork.kernel:RestoreSchemaData("plugins/cameras/"..game.GetMap());
	for k, v in pairs(cameras) do
		local entity = ents.Create(v.class);
		
		if (IsValid(entity)) then
			entity:SetKeyValue("spawnflags", v.spawnFlags or 0);
			entity:SetKeyValue("additionalequipment", v.equipment or "");
			entity:SetAngles(v.angles);
			entity:SetModel(v.model);
			entity:SetPos(v.position);
			entity:Spawn();
			
			if (IsValid(entity)) then
				entity:Activate();
				
				entity:SetNetworkedString("cw_Name", v.name);
				entity:SetNetworkedString("cw_Title", v.title);
			end;
		end;
	end;
end;

-- A function to save the NPCs.
function cwCombCams:SaveCams()
	local cameras = {};
	
	for k, v in pairs( ents.FindByClass("npc_combine_camera") ) do
		local name = v:GetNetworkedString("cw_Name");
		local title = v:GetNetworkedString("cw_Title");
		
		if (name != "" and title != "") then
			local keyValues = table.LowerKeyNames( v:GetKeyValues() );
			
			cameras[#cameras + 1] = {
				spawnFlags = keyValues["spawnflags"],
				equipment = keyValues["additionequipment"],
				position = v:GetPos(),
				angles = v:GetAngles(),
				model = v:GetModel(),
				title = title,
				class = v:GetClass(),
				name = name
			};
		end;
	end;
	
	Clockwork.kernel:SaveSchemaData("plugins/cameras/"..game.GetMap(), cameras);
end;

function cwCombCams:AddCameraEntity(target)
	local attname = "eyes"
	
	local head = target:LookupAttachment( "eyes" )
	if ( head == 0 ) then
		attname = "Eye"
		head = target:LookupAttachment( "Eye" )
		if ( head == 0 ) then -- No eyes :(
			return
		end
	end
	
	-- Already have a camera ? Remove it
	local cam
	cam = target.COMB_ViewCam
	
	if ( cam && cam:IsValid() ) then
		cam:Remove()
	end
	
	-- Create the camera
	local cam = ents.Create( "cw_npc_cam" )
	cam:SetParent( target )
	
	-- Position and rotate the camera correctly
	local attachment = target:GetAttachment( head )
	
	local ang = attachment.Ang
	local pos = attachment.Pos
	cam:SetPos( Vector(pos.x, pos.y, pos.z) )
	cam:SetLocalPos( Vector( -5, 0, 0 ) )
	cam:SetAngles( ang )
	cam:Spawn( )
	cam:Activate()
	cam:SetNotSolid( true )

	--cam:GetTable():SetTracking( NULL, Vector(0) )
	
	-- Attach it to the head so it moves and rotate with it
	cam:Fire( "setparentattachmentmaintainoffset" , attname , 0 )
	
	target.COMB_ViewCam = cam
end;