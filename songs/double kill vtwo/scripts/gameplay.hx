function postCreate(){
    strumLines.members[2].characters[1].visible = false; // thanks maz
}

function stepHit(){
    switch(curStep){
        case 3128:
            FlxTween.tween(camGame, {alpha: 0}, .5);
            FlxTween.tween(camHUD, {alpha: 0}, .5);
        case 3136:
            camGame.alpha = 1;
            camHUD.alpha = 1;
            strumLines.members[2].characters[1].visible = true;
            remove(strumLines.members[0].characters[0]);
            remove(strumLines.members[2].characters[0]);
            if (!FlxG.save.data.flashingLights){
                camGame.flash(0xFFFFFF, 2);
            }
    }
}