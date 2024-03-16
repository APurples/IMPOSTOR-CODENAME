function onCountdown(event:CountdownEvent)
    if (!FlxG.save.data.middlescroll)
        if (event.swagCounter == 0)
            if (!PlayState.opponentMode){
                for (i in playerStrums.members) i.x -= 320;
                for (i in cpuStrums.members) i.x -= 5000;
            }else{
                for (i in playerStrums.members) i.x -= 5000;
                for (i in cpuStrums.members) i.x += 320;
            }

function postCreate()
    disableGhosts = true;