function onCountdown(event:CountdownEvent){
    if (event.swagCounter == 0){
        if (PlayState.opponentMode){
            for (i in playerStrums.members){
                i.x -= 5000;
            }
            for (i in cpuStrums.members){
                i.x += 320;
            }
        }else if (!PlayState.opponentMode){
            for (i in playerStrums.members){
                i.x -= 320;
            }
            for (i in cpuStrums.members){
                i.x -= 5000;
            }
        }
    }
}