boyfriend.alpha = 0.0001;
dad.alpha = 0.0001;
camHUD.alpha = 0.0001;

function onSongStart()
    dad.alpha = 1;

function stepHit(){
    switch(curStep){           
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