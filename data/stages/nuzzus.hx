// why the fuck does the opponent disappear if the camera is close to it

function postCreate(){
    FlxG.state.forEachOfType(FlxText, text -> text.font = Paths.font("apple_kid.ttf"));

    boyfriend.alpha = 0;
    healthBar.alpha = 0;
    healthBarBG.alpha = 0;
    iconP1.alpha = 0;
    iconP2.alpha = 0;

    scoreTxt.x = 150;
    accuracyTxt.x = 600;

    scoreTxt.scale.x = scoreTxt.scale.y = 2;
    missesTxt.scale.x = missesTxt.scale.y = 2;
    accuracyTxt.scale.x = accuracyTxt.scale.y = 2;
}