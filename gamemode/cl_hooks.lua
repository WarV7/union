-- hi this isnt included yet. bye

local DontDraw = {
	"CHudHealth",
	"CHudSuitPower",
	"CHudBattery",
	"CHudCrosshair",
	"CHudAmmo",
	"CHudSecondaryAmmo",
	"CHudChat"

}

function GM:HUDPaint()
	
end

function GM:HUDShouldDraw(dv)
	if (dv == table.HasValue(DontDraw, dv)) then
		return false
	end
end
