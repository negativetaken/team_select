-- @negative

func.spawnCharacters = function( table )

    if not table then

        return

    end

    local team = getTeamFromName( v.name )

    if team then

        source:setTeam( team )
        
        source:setPosition( v.posX , v.posY , v.posZ )
        source:outputChat( "[KGT]#ffffff Başarılı bir şekilde '"..v.name.."' adlı takımı seçtin!" , 0 , 153 , 255 , true )

    end

end
addEvent( 'spawn:character' , true )
addEventHandler( 'spawn:character' , root , func.spawnCharacters )