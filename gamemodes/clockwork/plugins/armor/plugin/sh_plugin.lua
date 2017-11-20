
local Clockwork = Clockwork;

Clockwork.kernel:IncludePrefixed("cl_hooks.lua");
Clockwork.kernel:IncludePrefixed("sh_hooks.lua");
Clockwork.kernel:IncludePrefixed("sv_hooks.lua");
Clockwork.kernel:IncludePrefixed("sv_plugin.lua");

Clockwork.flag:Add("A", "Heavy Clothes (Armor)", "Access to heavy clothes (armor) on the trader menu.");
Clockwork.flag:Add("S", "Light Clothes", "Access to light clothes on the trader menu.");