function create(){
    game.defaultCamZoom = 1.2;
    game.dad.playAnim("confused", false);
    FlxG.sound.play(Paths.sound("dlowing/Walking"));
    new FlxTimer().start(2, function(tmr:FlxTimer){
        game.dad.playAnim("confused-stare", false);
    });
    new FlxTimer().start(5.5, function(tmr:FlxTimer){
        game.camGame.visible = false;
    });
    new FlxTimer().start(10, function(tmr:FlxTimer){
        close();
    });
}