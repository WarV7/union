AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

ENT.Base 			= "base_nextbot"
ENT.Spawnable		= true

ENT.Level = 0

function ENT:Initialize()
	self:SetModel( "models/Humans/Group02/Male_01.mdl" )
	self:SetHealth( 
end

function ENT:Use( activator, caller )
	if not IsValid(activator) or not activator:IsPlayer() then return end
	
	activator:ChatPrint("hi.")
end