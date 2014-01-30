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

Union = Union or {}
util.AddNetworkString( "union_placenpc" )

DEFINE_BASECLASS( "gamemode_base" )

AddCSLuaFile("sh_init.lua")
include("sh_init.lua")

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("cl_hooks.lua")
AddCSLuaFile("cl_menus.lua")
AddCSLuaFile("cl_scoreboard.lua")

include("sv_hooks.lua")
include("von.lua")
include("sv_player.lua")