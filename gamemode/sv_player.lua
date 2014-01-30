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

local _R = debug.getregistry()

local string = string

function _R.Player:SC_LoadData()
	self.SC_Data = {}
	
	if self:SC_HasData() then
		local file = file.Read("union/players/" .. string.gsub(self:SteamID(), ":", "_") .. ".txt", "DATA")
		local info = von.deserialize( file )
		
		PrintTable(info)
		for k,v in next, info do
			if istable( v ) then
				for a,b in next, v do
					self.SC_Data[ k ][ a ] = b
				end
			else
				self.SC_Data[ k ] = v
			end
		end
	end
end

function _R.Player:SC_HasData()
	return file.Exists("union/players/" .. string.gsub(self:SteamID(), ":", "_") .. ".txt", "DATA")
end

function _R.Player:SC_SaveData()
	self.SC_Data = self.SC_Data or {}
	local info = von.serialize( self.SC_Data )
	
	file.Write("union/players/" .. string.gsub(self:SteamID(), ":", "_") .. ".txt", info)
end

_R.Player.OGive = _R.Player.OGive or _R.Player.Give
function _R.Player:Give( classname )
	if type(classname) != "string" then return end

	self.SC_Data = self.SC_Data or {}
	self.SC_Data[ "loadout" ] = self.SC_Data[ "loadout" ] or {}
	self.SC_Data[ "loadout" ][ classname ] = true
	
	self:OGive( classname )
end