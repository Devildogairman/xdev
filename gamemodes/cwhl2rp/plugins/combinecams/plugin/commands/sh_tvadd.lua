local cwCombCams = cwCombCams;

local COMMAND = Clockwork.command:New("CameraTerminalAdd");
COMMAND.tip = "Adds a Terminal for watching cameras.";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "a";

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
	
	data.entity = ents.Create("cw_camtv");
	data.entity:SetAngles(data.angles);
	data.entity:SetPos(data.position);
	data.entity:Spawn();
	
	data.entity:GetPhysicsObject():EnableMotion(false);
	
	Clockwork.player:Notify(player, "You have added a Camera Watcher.");
end;

COMMAND:Register();