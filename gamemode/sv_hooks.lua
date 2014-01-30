/*----------------------------------------------
Copyright [2014] [Jason "Shinycow" Cockerham]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

	Shinycow Game, an rpg.
	Alpha.
	Start Date: 1/28/2014
*/----------------------------------------------

function GM:Initialize()
	file.CreateDir("union")
	timer.Simple(0.1, function() file.CreateDir("union/players") end)

	game.ConsoleCommand("sv_kickerrornum 0\n")
end

function GM:InitPostEntity()
end

function GM:PlayerInitialSpawn( pl )
	
	if pl:IsAdmin() then
		pl:SetTeam( TEAM_ADMIN )
	else
		pl:SetTeam( TEAM_PLAYER )
	end
	
	timer.Simple(0.4, function()
		pl:SC_LoadData()
	
		timer.Create("Union_SavePlayerData_" .. pl:UserID(), 35, 0, function()
			if not IsValid( pl ) then return end
			
			pl:SC_SaveData()
		end)
	end)
	
end
function GM:PlayerDisconnected( pl )
	
	timer.Destroy("Union_SavePlayerData_" .. pl:UserID())

end

function GM:PlayerSpawn( pl )

	pl:UnSpectate()
	pl:StripWeapons()
	
	GAMEMODE:PlayerSetModel( pl )
	GAMEMODE:PlayerLoadout( pl )

end

function GM:PlayerSetModel( pl )
	pl:SetModel( "models/player/group03/male_03.mdl" )
end

function GM:PlayerLoadout( pl )
	pl:Give("weapon_pistol")
	pl:GiveAmmo( 99, "pistol" )
	
	if pl.SC_Data[ "loadout" ] then
		for k,v in next, pl.SC_Data[ "loadout" ] do
			pl:Give( k )
		end
	end
end


function GM:PlayerCanHearPlayersVoice( listener, talker )
	return true, false
end
	