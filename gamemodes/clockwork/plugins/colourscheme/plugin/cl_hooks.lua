local PLUGIN = PLUGIN;

function PLUGIN:Initialize()
	timer.Simple(1, function()
		Clockwork.option:SetColor( "information", Color(255, 114, 255, 255) );	-- Change these 'Color' values to change
		Clockwork.option:SetColor( "background", Color(255, 114, 255, 255) );		-- the colour of your schema menu
		Clockwork.option:SetColor( "target_id", Color(255, 114, 255, 255) );		-- and some other elements.
	end);
end;
