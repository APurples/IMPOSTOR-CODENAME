// original script by yasher

import openfl.geom.Rectangle;
import openfl.text.TextFormat;
import flixel.text.FlxTextBorderStyle;
import flixel.ui.FlxBar;

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
    hudTxt = new FlxText(0, 685, FlxG.width, "Score: 0 | Misses: 0 | Rating: ?");
    hudTxt.setFormat(Paths.font("vcr.ttf"), 20, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    hudTxt.borderSize = 1.25;
    hudTxt.screenCenter(FlxAxes.X);
    hudTxt.cameras = [camHUD];
    if (FlxG.save.data.psychUi) add(hudTxt);
}

function update(elapsed:Float){
    // custom icon lerping
    if (FlxG.save.data.iconLerp) for (i in [iconP1, iconP2]){
        i.setGraphicSize(Std.int(FlxMath.lerp(150, iconP1.width, FlxMath.bound(1 - (elapsed * 30), 0, 1))));
        i.updateHitbox();
    }

    if (FlxG.save.data.psychUi){
        var acc = FlxMath.roundDecimal(Math.max(accuracy, 0) * 100, 2);
        var rating:String = getRating(accuracy);
        getRatingFC(accuracy, misses);
        if (songScore > 0 || acc > 0 || misses > 0) hudTxt.text = "Score: " + songScore + " | Misses: " + misses +  " | Rating: " + rating + " (" + acc + "%)" + " - " + ratingFC;
    }
}

function beatHit(){
    for (i in [iconP1, iconP2]){
        i.scale.set(1, 1);
        i.setGraphicSize(Std.int(i.width + 30));
    }
}

function onPlayerHit(event){
    if (FlxG.save.data.psychUi)
        if (event.note.isSustainNote) return;
            if(hudTxtTween != null) hudTxtTween.cancel();
            hudTxt.scale.x = hudTxt.scale.y = 1.1 * FlxG.save.data.scoreZoom;
            hudTxtTween = FlxTween.tween(hudTxt.scale, {x: 1, y: 1}, 0.2, {onComplete: function(twn:FlxTween) {hudTxtTween = null;}});
}

function postCreate(){
    if (FlxG.save.data.psychUi)
        for (i in [missesTxt, accuracyTxt, scoreTxt])i.visible = false;
    if (Options.downscroll && FlxG.save.data.psychUi)
        hudTxt.y = 605;
    if (FlxG.save.data.coloredScore)
        var bfColor = (boyfriend != null && boyfriend.xml != null && boyfriend.xml.exists("color")) ? CoolUtil.getColorFromDynamic(boyfriend.xml.get("color")) : 0xFF66FF33;
        var dadColor = (dad != null && dad.xml != null && dad.xml.exists("color")) ? CoolUtil.getColorFromDynamic(dad.xml.get("color")) : 0xFFFF0000;
        for (i in [missesTxt, accuracyTxt, scoreTxt, hudTxt]){
            if (PlayState.opponentMode)
                i.color = bfColor;
            else
                i.color = dadColor;
        }
}