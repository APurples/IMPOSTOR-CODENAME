import flixel.util.FlxColor;

var blackScreen:FlxSprite = null;
var bgMusic:FlxSound;

function create(){
    blackScreen = new FlxSprite(0, 0).makeSolid(FlxG.width*3, FlxG.height*3, FlxColor.BLACK);
    blackScreen.screenCenter();
    add(blackScreen);

    FlxTween.tween(blackScreen, {alpha: 0}, 1);

    FlxG.sound.playMusic(Paths.music('dialogue/main'));
    FlxG.sound.music.fadeIn(1, 0, 0.8);
}

function next(){
    startedCountdown = true;
}