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

net.Receive("union_placenpc", function( len, client )
	if not client:IsSuperAdmin() then print("lol " .. client:Nick()) return end
	
	local npc = net.ReadString()
	local model = net.ReadString()
	
	if not npc then return end
	
	local ent = ents.Create("npc_union_" .. npc)
	ent:SetModel( model or "models/player/group03/male_03.mdl" )
	ent:SetPos( client:GetPos() )
	timer.Simple(3, function()
		ent:Spawn()
	end)
end)