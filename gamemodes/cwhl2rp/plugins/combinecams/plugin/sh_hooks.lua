local cwCombCams = cwCombCams;

-- Called when the Clockwork shared variables are added.
function Clockwork.kernel:ClockworkAddSharedVars(globalVars, playerVars)
	playerVars:Bool("watchingCam", true);
end;