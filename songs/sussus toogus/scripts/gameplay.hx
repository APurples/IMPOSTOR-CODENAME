function onSongStart(){
    FlxTween.tween(camHUD, {alpha: 0}, .75);
}

function stepHit(){
    switch(curStep){
        case 112:
            camGame.zoom += 0.03;
            dad.playAnim("left", true);
        case 116:
            camGame.zoom += 0.03;
            dad.playAnim("right", true);
        case 120:
            camGame.zoom += 0.03;
            dad.playAnim("left", true);
        case 124:
            camGame.zoom += 0.03;
            dad.playAnim("right", true);
        case 128:
            FlxTween.tween(camHUD, {alpha: 1}, .75);
        case 240:
            camGame.zoom += 0.03;
            camHUD.zoom += 0.045;
        case 244:
            camGame.zoom += 0.03;
            camHUD.zoom += 0.045;
        case 248:
            camGame.zoom += 0.03;
            camHUD.zoom += 0.045;
        case 896:
            saxguy.animation.play("POP OFF CYAN");
            saxguy.alpha = 1;
            dad.playAnim("notice", true);
    }
}