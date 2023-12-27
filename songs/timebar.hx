if (!FlxG.save.data.timebar) disableScript();

import openfl.text.TextFormat;
import flixel.text.FlxTextBorderStyle;
import flixel.ui.FlxBar;

public var timeBarBG:FlxSprite;
public var timeBar:FlxBar;
public var timeTxt:FlxText;
public var hudTxt:FlxText;

function create() {
    timeTxt = new FlxText(42 + (FlxG.width / 2) - 585, 20, 400, PlayState.SONG.meta.displayName.toUpperCase(), 32);
    timeTxt.setFormat(Paths.font("vcr.ttf"), 14, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);

    timeBarBG = new FlxSprite().loadGraphic(Paths.image('game/timeBar'));
    timeBarBG.antialiasing = false;
    timeBarBG.x = timeTxt.x;
    timeBarBG.y = timeTxt.y + (timeTxt.height / 4);

    timeBar = new FlxBar(timeBarBG.x + 4, timeBarBG.y + 4, FlxBar.FILL_LEFT_TO_RIGHT, Std.int(timeBarBG.width - 8), Std.int(timeBarBG.height - 8), Conductor, 'songPosition', 0, 1);
    timeBar.createFilledBar(0xFF2e412e,0xFF44d844);
    timeBar.numDivisions = 800;
    timeBar.value = Conductor.songPosition / Conductor.songDuration;

    add(timeBarBG);
    add(timeBar);
    add(timeTxt);

    for (i in [timeTxt, timeBarBG, timeBar]){
        i.alpha = 0;
        i.cameras = [camHUD];
    }
}

function postCreate(){
    timeTxt.x += 10;
    timeTxt.y += 4;
}

function onSongStart() if (timeBar != null) for (e in [timeBar, timeBarBG, timeTxt]) FlxTween.tween(e, {alpha: 1}, 0.5, {ease: FlxEase.circOut});
  
function update(elapsed:Float) if (inst != null && timeBar != null && timeBar.max != inst.length) timeBar.setRange(0, Math.max(1, inst.length));