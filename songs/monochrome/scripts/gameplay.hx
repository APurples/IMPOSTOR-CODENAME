boyfriend.alpha = 0;
dad.alpha = 0;
camHUD.alpha = 0;

function onSongStart(){
    dad.playAnim("hi");
}

function stepHit(){
    switch(curStep){
        case 1:
            dad.alpha = 1;
        case 128:
            FlxTween.tween(camHUD, {alpha: 1}, .5);
        
        //codename devs please add notetypes already please :sob:
        case 504:
            if (!FlxG.save.data.screenShake){
                FlxG.camera.shake(0.015, .725, null, true);
            }
        case 952:
            if (!FlxG.save.data.screenShake){
                FlxG.camera.shake(0.015, .725, null, true);
            }
        case 964:
            if (!FlxG.save.data.screenShake){
                FlxG.camera.shake(0.015, .275, null, true);
            }
        case 972:
            if (!FlxG.save.data.screenShake){
                FlxG.camera.shake(0.015, .275, null, true);
            }
        case 980:
            if (!FlxG.save.data.screenShake){
                FlxG.camera.shake(0.015, .275, null, true);
            }
        case 1116:
            if (!FlxG.save.data.screenShake){
                FlxG.camera.shake(0.015, .275, null, true);
            }
        case 1208:
            if (!FlxG.save.data.screenShake){
                FlxG.camera.shake(0.015, .725, null, true);
            }
        case 1536:
            if (!FlxG.save.data.screenShake){
                FlxG.camera.shake(0.015, 1.25, null, true);
            }
    }
}