local PLUGIN = PLUGIN;

local ITEM = Clockwork.item:New();
	ITEM.name = "District Six Access License";
	ITEM.cost = 280;
	ITEM.batch = 1;
	ITEM.model = "models/gibs/metal_gib4.mdl";
	ITEM.weight = 0.2;
	ITEM.category = "Licenses";
	ITEM.uniqueID = "slums_card";
	ITEM.business = false;
	ITEM.examineOveride = true;
	ITEM.description = "A Small card with a Picture, Name, Number, and CID Printed on it. \n This card authorized the holder access to the District Six.";

	ITEM:AddData("Holder", "N/A", true);

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

function ITEM:GetExamineText(player, itemEntity)
	return "Issued To: "..self:GetData("Holder");
end;

if (CLIENT) then
	function ITEM:GetClientSideInfo()
		if (!self:IsInstance()) then
			return;
		end;
		
		local clientSideInfo = "";
		local cardholder = self:GetData("Holder");

		if (cardholder) then
			clientSideInfo = Clockwork.kernel:AddMarkupLine(clientSideInfo, "Issued To: "..cardholder);
		else
			clientSideInfo = Clockwork.kernel:AddMarkupLine(clientSideInfo, "**OOC ERROR, Call Arby**");
		end;
		
		return (clientSideInfo != "" and clientSideInfo);
	end;
end;

ITEM:Register();