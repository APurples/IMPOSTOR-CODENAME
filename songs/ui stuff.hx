// original script by yasher, edited by me (apurples)

import openfl.geom.Rectangle;
import openfl.text.TextFormat;
import flixel.text.FlxTextBorderStyle;
import flixel.ui.FlxBar;
import flixel.FlxG;

public var timeBarBG:FlxSprite;
public var timeBar:FlxBar;
public var timeTxt:FlxText;
public var hudTxt:FlxText;

var hudTxtTween:FlxTween;
var missesTxtTween:FlxTween;
var accuracyTxtTween:FlxTween;
var scoreTxtTween:FlxTween;

var ratingFC:String = "FC";
var ratingStuff:Array<Dynamic> = [
    ['You Suck!', 0.2], //From 0% to 19%
    ['Shit', 0.4], //From 20% to 39%
    ['Bad', 0.5], //From 40% to 49%
    ['Bruh', 0.6], //From 50% to 59%
    ['Meh', 0.69], //From 60% to 68%
    ['Nice', 0.7], //69%
    ['Good', 0.8], //From 70% to 79%
    ['Great', 0.9], //From 80% to 89%
    ['Sick!', 1], //From 90% to 99%
    ['Perfect!!', 1] //The value on this one isn't used actually, since Perfect is always "1"
];

function getRating(accuracy:Float):String {
    if (accuracy < 0) return "?";
    for (rating in ratingStuff) if (accuracy < rating[1]) return rating[0];
    return ratingStuff[ratingStuff.length - 1][0];
}

function getRatingFC(accuracy:Float, misses:Int):String {
    // this sucks but idk how to make it better lol
    if (misses == 0) {
        if (accuracy == 1.0) ratingFC = "SFC";
        else if (accuracy >= 0.99) ratingFC = "GFC";
        else ratingFC = "FC";
    }
    if (misses > 0) {
        if (misses < 10) ratingFC = "SDCB";
        else if (misses >= 10) ratingFC = "Clear";
    }
}

function create() {
    timeTxt = new FlxText(42 + (FlxG.width / 2) - 585, 20, 400, PlayState.SONG.meta.name, 32);
    timeTxt.setFormat(Paths.font("vcr.ttf"), 14, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    timeTxt.scrollFactor.set();
    timeTxt.alpha = 0;
    timeTxt.borderSize = 1;

    timeBarBG = new FlxSprite();
    timeBarBG.x = timeTxt.x - 4;
	timeBarBG.y = timeTxt.y + (timeTxt.height / 4) - 4;
    timeBarBG.alpha = 0;
    timeBarBG.scrollFactor.set();
    timeBarBG.loadGraphic(Paths.image("timeBar"));

    timeBar = new FlxBar(timeBarBG.x + 4, timeBarBG.y + 4, FlxBar.FILL_LEFT_TO_RIGHT, Std.int(timeBarBG.width - 8), Std.int(timeBarBG.height - 8), Conductor, 'songPosition', 0, 1);
    timeBar.scrollFactor.set();
    timeBar.createFilledBar(0xFF2e412e,0xFF44d844);
    timeBar.numDivisions = 800;
    timeBar.alpha = 0;
    timeBar.value = Conductor.songPosition / Conductor.songDuration;
    if (FlxG.save.data.timebar){
        add(timeBarBG);
        add(timeBar);
        add(timeTxt);
    }

    hudTxt = new FlxText(0, 685, FlxG.width, "Score: 0 | Misses: 0 | Rating: ?");
    hudTxt.setFormat(Paths.font("vcr.ttf"), 20, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    hudTxt.borderSize = 1.25;
    hudTxt.screenCenter(FlxAxes.X);

    hudTxt.cameras = [camHUD];
    timeBar.cameras = [camHUD];
    timeBarBG.cameras = [camHUD];
    timeTxt.cameras = [camHUD];
}

function onSongStart() if (timeBar != null) for (e in [timeBar, timeBarBG, timeTxt]) FlxTween.tween(e, {alpha: 1}, 0.5, {ease: FlxEase.circOut});

function update(elapsed:Float){
    // custom icon lerping
    if (FlxG.save.data.iconLerp){
        for (i in [iconP1, iconP2]){
            i.setGraphicSize(Std.int(FlxMath.lerp(150, iconP1.width, FlxMath.bound(1 - (elapsed * 30), 0, 1))));
            i.updateHitbox();
        }
    }

    if (inst != null && timeBar != null && timeBar.max != inst.length) timeBar.setRange(0, Math.max(1, inst.length));

    if (FlxG.save.data.psychUi){
        var acc = FlxMath.roundDecimal(Math.max(accuracy, 0) * 100, 2);
        var rating:String = getRating(accuracy);
        getRatingFC(accuracy, misses);
        if (songScore > 0 || acc > 0 || misses > 0) hudTxt.text = "Score: " + songScore + " | Misses: " + misses +  " | Rating: " + rating + " (" + acc + "%)" + " - " + ratingFC;
    }

    if (FlxG.save.data.verticalHealthbar){
        iconP1.y = healthBar.y + (healthBar.height * (FlxMath.remapToRange(healthBar.percent, 0, 100, 1, 0)) - iconOffset);
		iconP2.y = healthBar.y + (healthBar.height * (FlxMath.remapToRange(healthBar.percent, 0, 100, 1, 0))) - (iconP2.height - iconOffset);
    }
}

function beatHit(){
    for (i in [iconP1, iconP2]){
        i.scale.set(1, 1);
        i.setGraphicSize(Std.int(i.width + 30));
    }
}

function onPlayerHit(event){
    if (FlxG.save.data.scoreZoom){
        if (FlxG.save.data.psychUi){
            if (event.note.isSustainNote) return;
                if(hudTxtTween != null) hudTxtTween.cancel();
                hudTxt.scale.x = 1.1;
                hudTxt.scale.y = 1.1;
                hudTxtTween = FlxTween.tween(hudTxt.scale, {x: 1, y: 1}, 0.2, {
                    onComplete: function(twn:FlxTween) {
                        hudTxtTween = null;
                    }
                });
        }
    }
}

function postCreate(){
    if (FlxG.save.data.coloredScore)
        if (!PlayState.opponentMode) hudTxt.color = dadColor;
        else hudTxt.color = bfColor;

    if (FlxG.save.data.psychUi) for (i in [missesTxt, accuracyTxt, scoreTxt]) i.visible = false;

    if (Options.downscroll && FlxG.save.data.psychUi) hudTxt.y = 605;
    
    if (FlxG.save.data.psychUi) add(hudTxt);

    if (FlxG.save.data.verticalHealthbar){
        for (i in [healthBar, healthBarBG]){
            i.angle = 90;
            i.y -= 300;
            if (FlxG.save.data.middlescroll){
                if (FlxG.save.data.verticalHealthbarAlignment == 1) i.x -= 250;
                else if (FlxG.save.data.verticalHealthbarAlignment == 2) i.x += 250;
            }
            else{
                if (FlxG.save.data.verticalHealthbarAlignment == 1) i.x -= 575;
                else if (FlxG.save.data.verticalHealthbarAlignment == 2) i.x += 575;
            }
        }

        for (i in [iconP1, iconP2]) insert(1, i);
    }

    if (FlxG.save.data.hideIcons) for (i in [iconP1, iconP2]) i.visible = false;
}

function postUpdate(){
    if (FlxG.save.data.verticalHealthbar){
        if (FlxG.save.data.verticalHealthbarAlignment == 1){
            iconP1.x = iconP2.x = -15;
        }else if (FlxG.save.data.verticalHealthbarAlignment == 2){
            iconP1.x = iconP2.x = 1135;
        }
    }
}