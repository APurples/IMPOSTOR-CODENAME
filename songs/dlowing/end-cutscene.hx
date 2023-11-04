function create(){
    game.camFollow.x = 2250;
    game.camFollow.y += 150;

    game.dad.playAnim("confused", false);

    FlxTween.tween(FlxG.camera, {zoom: 1}, .1);
    FlxTween.tween(FlxG.camera, {zoom: 1.1}, 25, {ease: FlxEase.quadInOut});
    FlxTween.tween(game.gf, {x: 1150}, 4.3, {ease: FlxEase.sineInOut});
    
    FlxG.sound.play(Paths.sound('dlowing/Walking'));

    new FlxTimer().start(.5, function(tmr:FlxTimer){
        game.boyfriend.playAnim("idle-loop-post", false);
    });

    new FlxTimer().start(2, function(tmr:FlxTimer){
        game.dad.playAnim("confused-stare", false);
    });

    new FlxTimer().start(5.5, function(tmr:FlxTimer){
        game.camGame.visible = false;
    });

    new FlxTimer().start(9.25, function(tmr:FlxTimer){
        close();
    });
}