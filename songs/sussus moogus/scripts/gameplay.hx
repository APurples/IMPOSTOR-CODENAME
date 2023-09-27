function stepHit(){
    if (curStep > 383 && curStep < 641){
        if (curStep % 8 == 0){
            camGame.zoom += 0.015;
            camHUD.zoom += 0.03;
            if (!FlxG.save.data.flashingLights){
                camGame.flash(0xADFF0000, .25);
            }
        }
    }
    if (curStep > 1151 && curStep < 1273){
        if (curStep % 64 == 0){
            camGame.zoom += 0.015;
            camHUD.zoom += 0.03;
            if (!FlxG.save.data.flashingLights){
                camGame.flash(0xADFF0000, .25);
            }
        }
    }
    if (curStep > 1279 && curStep < 1533){
        if (curStep % 8 == 0){
            camGame.zoom += 0.015;
            camHUD.zoom += 0.03;
            if (!FlxG.save.data.flashingLights){
                camGame.flash(0xADFF0000, .25);
            }
        }
    }

    switch(curStep){
        case 376:
            camGame.zoom += 0.015;
            camHUD.zoom += 0.03;
            if (!FlxG.save.data.flashingLights){
                camGame.flash(0xADFF0000, .25);
            }
        case 380:
            camGame.zoom += 0.015;
            camHUD.zoom += 0.03;
            if (!FlxG.save.data.flashingLights){
                camGame.flash(0xADFF0000, .25);
            }
        case 1272:
            camGame.zoom += 0.015;
            camHUD.zoom += 0.03;
            if (!FlxG.save.data.flashingLights){
                camGame.flash(0xADFF0000, .25);
            }
        case 1276:
            camGame.zoom += 0.015;
            camHUD.zoom += 0.03;
            if (!FlxG.save.data.flashingLights){
                camGame.flash(0xADFF0000, .25);
            }
    }
}