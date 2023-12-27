import flixel.text.FlxTextBorderStyle;
import openfl.utils.Assets;

static var bg:FlxSprite;
static var songTxt:FlxText;
static var musicianTxt:FlxText;

var fontSize:Float = 24;

function onSongStart() {
	var camInfo:FlxCamera = new FlxCamera();
	camInfo.bgColor = 0x00000000;
	FlxG.cameras.add(camInfo, false);
	var info = Assets.getText(Paths.file('songs/' + PlayState.SONG.meta.name + '/info.txt')).split("\n");

	bg = new FlxSprite(-475, FlxG.height / 3).makeGraphic(475, 100, FlxColor.WHITE);
    bg.alpha = .47;

	songTxt = new FlxText(-465, bg.y + 10, 0, info[0], 25);
	musicianTxt = new FlxText(-465, bg.y + bg.height - 45, 0, info[1], 25);

	for (i in [songTxt, musicianTxt]) i.setFormat(Paths.font("arial.ttf"), fontSize, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);

	for (i in [bg, songTxt, musicianTxt]) {
		i.cameras = [camInfo];
		add(i);
	}

    for (i in [bg, songTxt, musicianTxt]){
        FlxTween.tween(i, {x: i.x + 475}, 1, {ease: FlxEase.quintInOut, onComplete: function(twn:FlxTween){
            FlxTween.tween(i, {x: i.x - 475}, 1, {ease: FlxEase.quintInOut, startDelay: 2, onComplete: function(twn:FlxTween){ 
                i.destroy(); 
            }});
        }});
    }
}