local sx , sy = guiGetScreenSize( )
local boxW , boxH = 300 , 400

local x , y = ( sx - boxW ) / 25 , ( sy - boxH ) / 2
local w , h = boxW , boxH

selectTeam = { 

	[ 1 ] = { image = 'files/aztecas' , x = x ,       y = y , w = w , h = h , posX = 2216.927734375 ,  posY = -1162.123046875 , posZ = 25.7265625 , name = "Aztecas" },
	[ 2 ] = { image = 'files/ballas'  , x = x + 300 , y = y , w = w , h = h , posX = 2245.435546875  , posY = -1453.3955078125 , posZ = 23.82812  , name = "Ballas" },
	[ 3 ] = { image = 'files/grove'   , x = x + 600 , y = y , w = w , h = h , posX = 2492.1357421875 , posY = -1665.326171875 , posZ = 13.34375   , name = "Grove" },
	[ 4 ] = { image = 'files/vagos'   , x = x + 900 , y = y , w = w , h = h , posX = 2453 ,            posY = -1339.470703125 , posZ = 23.8359375 , name = "Vagos" },

}


func.drawPanel = function( )

	dxDrawRectangle( 0 , 0 , sx , sy , tocolor ( 25 , 25 , 25 , 240 ) )

	for key , row in pairs( selectTeam ) do

		if isMouseInPosition( row.x , row.y , row.w , row.h ) then

			dxDrawImage( row.x , row.y , row.w , row.h , row.image.."true.png")

		else

			dxDrawImage( row.x , row.y , row.w , row.h , row.image.."false.png")

		end

	end

end
addEventHandler( 'onClientRender' , root , func.drawPanel )

func.onClick = function( button , state )

	if state == 'down' then

		for k , v in pairs( selectTeam ) do

			if isMouseInPosition( v.x , v.y , v.w , v.h ) then

				triggerServerEvent( 'spawn:character' , localPlayer , v )
				removeEventHandler( 'onClientRender' , root , func.drawPanel )

			end

		end

	end

end
addEventHandler( 'onClientClick' , root , func.onClick )

function isMouseInPosition ( x, y, width, height )
	if ( not isCursorShowing( ) ) then
		return false
	end
	local sx, sy = guiGetScreenSize ( )
	local cx, cy = getCursorPosition ( )
	local cx, cy = ( cx * sx ), ( cy * sy )
	
	return ( ( cx >= x and cx <= x + width ) and ( cy >= y and cy <= y + height ) )
end