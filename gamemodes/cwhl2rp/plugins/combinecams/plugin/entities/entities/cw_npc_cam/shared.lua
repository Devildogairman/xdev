
ENT.Type = "anim"
ENT.Base = "gmod_cameraprop"

ENT.PrintName			= "NPC Cam"
ENT.Author				= "Arbiter"
ENT.Contact				= "sex"
ENT.Purpose			    = "sex"
ENT.Instructions	    = "sex it"

if SERVER then

function ENT:Think()
end

function ENT:SetTracking()
end

end

if CLIENT then
	function ENT:Draw()	
		if !Clockwork.plugin:Call("PlayerCanSeeAdminESP") then return end;
		
		
		self.Entity:DrawModel()
	end;
end;