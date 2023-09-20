gf.alpha = 0;

function stepHit(){
    switch(curStep){
        case 816:
            gf.alpha = 1;
            gf.playAnim("fadein", true);
        case 820:
            dad.playAnim("look", true);
    }

    if (curStep > 63 && curStep < 511){
        if (curStep % 32 == 0){
            camGame.zoom += 0.015;
            camHUD.zoom += 0.03;
            if (!FlxG.save.data.flashingLights){
                camGame.flash(0xADFF0000, .5);
            }
        }
    }
    if (curStep > 511 && curStep < 577){
        if (curStep % 64 == 0){
            if (!FlxG.save.data.flashingLights){
                camGame.flash(0xADFF0000, .5);
            }
        }
    }
    if (curStep > 639 && curStep < 705){
        if (curStep % 32 == 0){
            camGame.zoom += 0.015;
            camHUD.zoom += 0.03;
            if (!FlxG.save.data.flashingLights){
                camGame.flash(0xADFF0000, .5);
            }
        }
    }
    if (curStep > 831 && curStep < 1473){
        if (curStep % 64 == 0){
            camGame.zoom += 0.015;
            camHUD.zoom += 0.03;
            if (!FlxG.save.data.flashingLights){
                camGame.flash(0xADFF0000, .5);
            }
        }
    }
}