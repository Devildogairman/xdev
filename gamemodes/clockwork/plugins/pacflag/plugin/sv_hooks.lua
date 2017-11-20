local PLUGIN = PLUGIN

function PLUGIN:PrePACConfigApply(player)
	if !Clockwork.player:HasFlags(player, "w") then
		return false
	end
end