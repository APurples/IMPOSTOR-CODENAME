function onSongStart(){
    camGame.zoom += 0.015;
    camHUD.zoom += 0.03;
    if (!FlxG.save.data.flashingLights){
        camGame.flash(0xADFF0000, .5);
    }
}

function stepHit(){
    switch (curStep){
        case 1152:
            FlxTween.tween(camGame, {alpha: 0}, 1.65);
            FlxTween.tween(camHUD, {alpha: 0}, 1.65);
    }
    if (curStep > 0 && curStep < 126){
        if (curStep % 32 == 0){
            camGame.zoom += 0.015;
            camHUD.zoom += 0.03;
            if (!FlxG.save.data.flashingLights){
                camGame.flash(0xADFF0000, .5);
            }
        }
    }
    if (curStep > 127 && curStep < 496){
        if (curStep % 16 == 0){
            camGame.zoom += 0.015;
            camHUD.zoom += 0.03;
            if (!FlxG.save.data.flashingLights){
                camGame.flash(0xADFF0000, .5);
            }
        }
    }
    if (curStep > 511 && curStep < 737){
        if (curStep % 32 == 0){
            camGame.zoom += 0.015;
            camHUD.zoom += 0.03;
            if (!FlxG.save.data.flashingLights){
                camGame.flash(0xADFF0000, .5);
            }
        }
    }
    if (curStep > 767 && curStep < 993){
        if (curStep % 16 == 0){
            camGame.zoom += 0.015;
            camHUD.zoom += 0.03;
            if (!FlxG.save.data.flashingLights){
                camGame.flash(0xADFF0000, .5);
            }
        }
    }
    if (curStep > 1023 && curStep < 1121){
        if (curStep % 32 == 0){
            camGame.zoom += 0.015;
            camHUD.zoom += 0.03;
            if (!FlxG.save.data.flashingLights){
                camGame.flash(0xADFF0000, .5);
            }
        }
    }
}