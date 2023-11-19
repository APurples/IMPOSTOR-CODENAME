var blackScreen:FlxSprite = null;

function create(){
    game.camGame.visible = false;
    game.camHUD.visible = false;

    blackScreen = new FlxSprite(0, 0).makeSolid(FlxG.width * 3, FlxG.height * 3, FlxColor.BLACK);
    blackScreen.screenCenter();
    add(blackScreen);

    startVideo(Paths.video("sabotage"), function(){
        FlxTween.tween(blackScreen, {alpha: 0}, 1);
        game.camGame.visible = true;
        game.camHUD.visible = true;

        new FlxTimer().start(1.35, function(tmr:FlxTimer){
            if (!Options.naughtyness == true){
                game.startCutscene("naughtyness-", function(){
                    close();
                });
            }else{
                game.startCutscene(null, function(){
                    close();
                });
            }
        });
    });
}