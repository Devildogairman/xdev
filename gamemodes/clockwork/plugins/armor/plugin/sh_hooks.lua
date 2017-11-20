
local Clockwork = Clockwork;
local PLUGIN = PLUGIN;

function PLUGIN:ClockworkAddSharedVars(globalVars, playerVars)
	playerVars:Number("paTraining", true);
	playerVars:Bool("hasGasmask", true);
	playerVars:Number("filterQuality", true);
end;