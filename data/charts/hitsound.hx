function onPlayerHit(a){
    if (FlxG.save.data.hitsound){
        if (!a.note.isSustainNote){
            FlxG.sound.play(Paths.sound('hitsound'), 0.2);
        }
    }
}