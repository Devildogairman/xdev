local cwCombCams = cwCombCams;

local COMMAND = Clockwork.command:New("CameraAdd");
COMMAND.tip = "Adds a camera free of NPCs. Useful for static camera systems. (To see the camera enable the admin esp.)";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "a";
COMMAND.text = "<Camera Name>";
COMMAND.arguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local trace = player:GetEyeTraceNoCursor();
	local data = {
		position = trace.HitPos + Vector(0, 0, 0),
	};
	
	data.angles = player:EyeAngles();
	data.angles.pitch = 0;
	data.angles.roll = 0;
	data.angles.yaw = data.angles.yaw + 180;
	
	camera = ents.Create("cw_npc_cam");
	camera:SetAngles(data.angles);
	camera:SetPos(data.position);
	camera:Spawn();
	camera:SetNWString("Cam_Name", arguments[1]);
	
	camera:GetPhysicsObject():EnableMotion(false);
	
	Clockwork.player:Notify(player, "You have added a Camera named "..camera:GetNWString("Cam_Name")..".");
end;

COMMAND:Register();