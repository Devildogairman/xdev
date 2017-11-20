local PLUGIN = PLUGIN;
PLUGIN:SetGlobalAlias("TacoConfig");

PLUGIN.AdminNotes = {} // Didn't feel it needed any.

PLUGIN.AllowedPropsFlags = {}
PLUGIN.AllowedPropsFlags.Flag = "j" // DEFAULT: j

PLUGIN.Augmentations = {}
PLUGIN.Augmentations.CanAllowFactions = {"FACTION_MPF", "FACTION_ADMIN"} // Let's clarify here, this is the FIRST test to make sure that you're the right faction, so that a citizen called SeC Can't give all his buddies Augs.
PLUGIN.Augmentations.CanAllowNames = {FACTION_MPF = {"SeC", "CmD", "DvL"}, FACTION_ADMIN = {""}} // Basically, If any part of your name (When in that faction) Contains one of those, You can authorize augmentations.
PLUGIN.Augmentations.CanInstallNames = {FACTION_MPF = {"SeC", "CmD", "HELIX"}, FACTION_ADMIN = {}}


PLUGIN.BindableCommandsAgain = {}
PLUGIN.BindableCommandsAgain.Command = "cwSay" // When typed into the console, This thing will actually say shit, and run commands.
											   // -Don't- Try to reassign a previous command e.g. Say, Because problems.
PLUGIN.Bird = {} // Didn't feel Birds needed a config. At all.

PLUGIN.FirstPersonPlus = {} // See above

PLUGIN.LockJocky = {}
// However expensive you may want it.
PLUGIN.LockJocky.BasicLockPrice = 5
PLUGIN.LockJocky.FancyLockPrice = 10
PLUGIN.LockJocky.ShittyLockPrice = 2

PLUGIN.MysteryBoxs = {} //Alright, This'll be a bit damn confusing, but after a bit of thought. Get's more clear.
// Firstly, there is Teir1, Teir2, Teir3, Junk and Blueprint, these are all the contents of the four boxes.
// As you can see, in the table is a list of names and values. The names are the actual item that will be summoned, and the number is what the chances of it being summoned are.
// The actual algorythm basically randomly picks an item from the teir's list, then reads it's number. It does a random check, and if the random number is lower then the item's value
// then it will add that value to a list.
// After 4 items are chosen, the plugin dumps those items into your inventory.
PLUGIN.MysteryBoxs.Boxes = {Teir1 = {melon = 85, milk_jug = 85, milk_carton = 65, chinese_takeout = 85, spray_can = 20, whiskey = 40, beer = 40},
				Teir2 = {steroids = 50, small_bag = 50, backpack = 50, radio = 30, stationary_radio = 20, ration = 60, paracetamol = 50},
				Teir3 = {weapon_357 = 10, weapon_pistol = 20, weapon_shotgun = 10, weapon_smg = 10, weapon_rpg = 0.1, weapon_ar2 = 1, weapon_crossbow = 5, weapon_frag = 10, ammo_357 = 50, ammo_ar2 = 50, ammo_ar2altfire = 40, ammo_buckshot = 50, ammo_pistol = 60, ammo_xbowbolt = 40, resistance_uniform = 20, medic_uniform = 20, ration = 90},
				Junk = {},
				Blueprint = {}}

PLUGIN.NutScanners = {}
PLUGIN.NutScanners.Cooldown = 12 //Amount of time in seconds between scanner flashes.

PLUGIN.RationTimer = {}
PLUGIN.RationTimer.TimeBetween = 1 // The time between anouncements in hours.
// Just so you know, this only tells the CA and Metropolice.

PLUGIN.ResizablePlayers = {}
PLUGIN.ResizablePlayers.Access = "o" // Access needed to use /charsetsize Make this PLUGIN.ResizablePlayers.Access = nil for endless supplies of 7'0 male_01's
PLUGIN.ResizablePlayers.MinHeight = "4'0" // How short can you make 'em
PLUGIN.ResizablePlayers.MaxHeight = "7'0" // How tall an you make 'em

PLUGIN.SetSkin = {}
PLUGIN.SetSkin.Access = "o" //Access required to set a player's skin.

PLUGIN.SetStat = {}
PLUGIN.SetStat.Access = "s" //Access required to set a player's stats.

PLUGIN.VortHowl = {}
PLUGIN.VortHowl.ShoutingFactions = {"FACTION_VORTIGAUNT"} // Factions that can actually yell at other vorts.
PLUGIN.VortHowl.HearingFactions = {"FACTION_VORTIGAUNT", "FACTION_ENSLAVED"} // Factions that speak vortish to hear.