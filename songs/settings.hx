// basically the stuff for the custom options

function postCreate(){
    if (Options.colorHealthBar){
        if (curStage == "polus") healthBar.createFilledBar(0xFFBB2D30,0xFF31B0D1);
        if (curStage == "toogus") healthBar.createFilledBar(0xFF1F6B2B,0xFF31B0D1);
        if (curStage == "monochrome") healthBar.createFilledBar(0xFFFFFFFF,0xFF31B0D1);
        if (curStage == "cargobay") healthBar.createFilledBar(0xFF6C5887,0xFF31B0D1);
        if (curStage == "chef") healthBar.createFilledBar(0xFFC75E52,0xFF31B0D1);
        if (curStage == "dlowingt") healthBar.createFilledBar(0xFFFDCC37,0xFF31B0D1);
    }

    if (FlxG.save.data.cutsceneFreeplay){
        playCutscenes = true;
    }
}

function onPlayerHit(a){
    if (FlxG.save.data.hitsound){
        if (!a.note.isSustainNote){
            FlxG.sound.play(Paths.sound('hitsound'), 0.2);
        }
    }
}

function onCountdown(event:CountdownEvent) {
    if (FlxG.save.data.middlescroll){
        if (!PlayState.coopMode){
            if (event.swagCounter == 0){
                if (!PlayState.opponentMode){
                    for (i in playerStrums.members){
                        i.x -= 320;
                    }
                    for (i in cpuStrums.members){
                        i.x -= 5000;
                    }
                }else{
                    for (i in playerStrums.members){
                        i.x -= 5000;
                    }
                    for (i in cpuStrums.members){
                        i.x += 320;
                    }
                }
            }
        }
    }

    if (!PlayState.coopMode){
        if (FlxG.save.data.opponentNotes){
            if (!PlayState.opponentMode){
                for (i in cpuStrums.members){
                    i.x -= 5000;
                }
            }else{
                for (i in playerStrums.members){
                    i.x -= 5000;
                }
            }
        }
    }
}