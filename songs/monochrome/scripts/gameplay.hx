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
        case 120:
            if (PlayState.opponentMode || PlayState.coopMode){
                FlxTween.tween(camHUD, {alpha: 1}, .75);
            }
        case 128:
            if (!PlayState.opponentMode || !PlayState.coopMode){
                FlxTween.tween(camHUD, {alpha: 1}, .5);
            }
    }
}