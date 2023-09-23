boyfriend.alpha = 0;
dad.alpha = 0;
camHUD.alpha = 0;

function onSongStart(){
    dad.alpha = 1;
    dad.playAnim("hi");
}

function stepHit(){
    switch(curStep){
        case 128:
            FlxTween.tween(camHUD, {alpha: 1}, .5);
    }
}