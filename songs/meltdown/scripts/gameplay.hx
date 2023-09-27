function onSongStart(){
    camGame.zoom += 0.015;
    camHUD.zoom += 0.03;
    if (!FlxG.save.data.flashingLights){
        camGame.flash(0xADFF0000, .35);
    }
}

function stepHit(){
    switch (curStep){
        case 1152:
            FlxTween.tween(camGame, {alpha: 0}, 1.65);
            FlxTween.tween(camHUD, {alpha: 0}, 1.65);
    }

}

function beatHit(){
    if (curBeat > 0 && curBeat < 32){
        if (curBeat % 8 == 0){
            camGame.zoom += 0.015;
            camHUD.zoom += 0.03;
            if (!FlxG.save.data.flashingLights){
                camGame.flash(0xADFF0000, .35);
            }
        }
    }
    if (curBeat > 31 && curBeat < 125){
        if (curBeat % 4 == 0){
            camGame.zoom += 0.015;
            camHUD.zoom += 0.03;
            if (!FlxG.save.data.flashingLights){
                camGame.flash(0xADFF0000, .35);
            }
        }
    }
    if (curBeat > 127 && curBeat < 185){
        if (curBeat % 8 == 0){
            camGame.zoom += 0.015;
            camHUD.zoom += 0.03;
            if (!FlxG.save.data.flashingLights){
                camGame.flash(0xADFF0000, .35);
            }
        }
    }
    if (curBeat > 191 && curBeat < 253){
        if (curBeat % 4 == 0){
            camGame.zoom += 0.015;
            camHUD.zoom += 0.03;
            if (!FlxG.save.data.flashingLights){
                camGame.flash(0xADFF0000, .35);
            }
        }
    }
    if (curBeat > 255 && curBeat < 281){
        if (curBeat % 8 == 0){
            camGame.zoom += 0.015;
            camHUD.zoom += 0.03;
            if (!FlxG.save.data.flashingLights){
                camGame.flash(0xADFF0000, .35);
            }
        }
    }
}