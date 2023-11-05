var blackScreen:FlxSprite = null;
var music:FlxSound;

function create(){
    game.camGame.visible = false;
    game.camHUD.visible = false;

    music = FlxG.sound.load(Paths.music('dialogue/main'));
	music.volume = 0;

    blackScreen = new FlxSprite(0, 0).makeSolid(FlxG.width * 3, FlxG.height * 3, FlxColor.BLACK);
    blackScreen.screenCenter();
    add(blackScreen);

    startVideo(Paths.video("meltdown"), function(){
        FlxTween.tween(blackScreen, {alpha: 0}, 1);
        game.camGame.visible = true;
        game.camHUD.visible = true;

        new FlxTimer().start(1.35, function(tmr:FlxTimer){
            game.startCutscene(null, function(){
                close();
            });
        });
    });
}