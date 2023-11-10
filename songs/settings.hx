// basically the stuff for the custom options

public var bfColor;
public var dadColor;

function postCreate(){
    if (Options.colorHealthBar){
        bfColor = (boyfriend != null && boyfriend.xml != null && boyfriend.xml.exists("color")) ? CoolUtil.getColorFromDynamic(boyfriend.xml.get("color")) : 0xFF66FF33;
        dadColor = (dad != null && dad.xml != null && dad.xml.exists("color")) ? CoolUtil.getColorFromDynamic(dad.xml.get("color")) : 0xFFFF0000;
    
        healthBar.createFilledBar(dadColor, bfColor);

        if (FlxG.save.data.coloredScore){
            if (!PlayState.opponentMode){
                missesTxt.color = dadColor;
                accuracyTxt.color = dadColor;
                scoreTxt.color = dadColor;
            }else{
                missesTxt.color = bfColor;
                accuracyTxt.color = bfColor;
                scoreTxt.color = bfColor;
            }
        }
    }

    if (FlxG.save.data.cutsceneFreeplay) playCutscenes = true;
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