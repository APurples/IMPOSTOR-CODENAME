var sound:FlxSound;

function create(){
    game.camFollow.x = 2200;
    game.camFollow.y += 150;
    game.dad.playAnim("confused", false);

    FlxTween.tween(FlxG.camera, {zoom: 1}, 0.2);
    FlxTween.tween(FlxG.camera, {zoom: 1.1}, 25, {ease: FlxEase.quadInOut});
    FlxTween.tween(game.gf, {x: 1050}, 4.3, {ease: FlxEase.sineInOut});

    new FlxTimer().start(.5, function(tmr:FlxTimer){game.boyfriend.playAnim("idle-loop-post", false);});

    new FlxTimer().start(2, function(tmr:FlxTimer){game.dad.playAnim("confused-stare", false);});

    new FlxTimer().start(5.5, function(tmr:FlxTimer){game.camGame.visible = false;});

    sound = FlxG.sound.load(Paths.sound('cutscenes/dlowing/Walking'));
	sound.play();
    sound.onComplete = function(){close();}
}