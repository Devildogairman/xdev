local PLUGIN = PLUGIN;

-- Called when OpenAura has loaded all of the entities.
function PLUGIN:ClockworkInitPostEntity()
	self:LoadCardTerms();
end;

-- Called when data should be saved.
function PLUGIN:SaveData() 
	self:SaveCardTerms();
end;

-- Called when an entity's menu option should be handled.
function PLUGIN:EntityHandleMenuOption(player, entity, option, arguments)
	local class = entity:GetClass();
	if (class == "cw_cardterm") then
		if arguments == "cwCIDmake" then
			Clockwork.dermaRequest:RequestString(player, "<:: Printing CID Card..", "Enter the Name and CID of the Card Holder.", "John Doe, #12345", function(text)
				local holder = text;
				
				local card = player:GiveItem(Clockwork.item:CreateInstance("cid_card"));
				
				card:SetData("Holder", holder);
				end)
		elseif arguments == "cwCWUmake" then
			Clockwork.dermaRequest:RequestString(player, "<:: Printing CWU Card..", "Enter the Name and CID of the Card Holder.", "John Doe, #12345", function(text)
				local holder = text;
				
				local card = player:GiveItem(Clockwork.item:CreateInstance("cwu_card"));
				
				card:SetData("Holder", holder);
				end)
		elseif arguments == "cwSlumsMake" then
			Clockwork.dermaRequest:RequestString(player, "<:: Printing D6 License..", "Enter the Name and CID of the Card Holder.", "John Doe, #12345", function(text)
				local holder = text;
				
				local card = player:GiveItem(Clockwork.item:CreateInstance("slums_card"));
				
				card:SetData("Holder", holder);
				end)
		elseif arguments == "cwBusMake" then -- Licenses
			Clockwork.dermaRequest:RequestString(player, "<:: Printing Business License..", "Enter the Name and CID of the Card Holder.", "John Doe, #12345", function(text)
				local holder = text;
				
				local card = player:GiveItem(Clockwork.item:CreateInstance("bus_card"));
				
				card:SetData("Holder", holder);
				end)
		elseif arguments == "cwCarMake" then
			Clockwork.dermaRequest:RequestString(player, "<:: Printing Vehicle License..", "Enter the Name and CID of the Card Holder.", "John Doe, #12345", function(text)
				local holder = text;
				
				local card = player:GiveItem(Clockwork.item:CreateInstance("car_card"));
				
				card:SetData("Holder", holder);
				end)
		elseif arguments == "cwDocMake" then
			Clockwork.dermaRequest:RequestString(player, "<:: Printing Medical License..", "Enter the Name and CID of the Card Holder.", "John Doe, #12345", function(text)
				local holder = text;
				
				local card = player:GiveItem(Clockwork.item:CreateInstance("med_card"));
				
				card:SetData("Holder", holder);
				end)
		end;
	end;
end;

function PLUGIN:PostPlayerSpawn(player, lightSpawn, changeClass, firstSpawn)
	if !lightSpawn then
		if !Schema:PlayerIsCombine(player) and player:GetFaction() != FACTION_ADMIN then
			if !player:HasItemByID("cid_card") then
				if (!player:GetCharacterData("givenCard") or player:GetCharacterData("givenCard") != "true") then
					local name = player:Name();
					local CID = player:GetCharacterData("citizenid");
					local card = player:GiveItem(Clockwork.item:CreateInstance("cid_card"));
					
					card:SetData("Holder", name..", #"..CID);
					player:SetCharacterData("givenCard", "true");
				end;
			end;
		end;
	end;
end;