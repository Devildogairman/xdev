local PLUGIN = PLUGIN;

-- A function to load the Card Printers.
function PLUGIN:LoadCardTerms()
	local cards = Clockwork.kernel:RestoreSchemaData( "plugins/cards/"..game.GetMap() );
	
	for k, v in pairs(cards) do
		local entity = ents.Create("cw_cardterm");
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
function PLUGIN:SaveCardTerms()
	local cards = {};
	
	for k, v in pairs(ents.FindByClass("cw_cardterm")) do
		local position = v:GetPos();
		local angles = v:GetAngles();

		cards[#cards + 1] = {
			position = position,
			angles = angles,
		};
	end;
	
	Clockwork.kernel:SaveSchemaData("plugins/cards/"..game.GetMap(), cards);
end;