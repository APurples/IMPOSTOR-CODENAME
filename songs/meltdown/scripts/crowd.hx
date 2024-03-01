function postCreate(){
    crowd = new FlxSprite(-900, 200);
    crowd.frames = Paths.getSparrowAtlas('stages/polus/boppers_meltdown');
    crowd.animation.addByPrefix('bop', 'BoppersMeltdown', 24, false);
    crowd.scrollFactor.set(1.5, 1.5);
    if (!Options.lowMemoryMode) add(crowd);
}

function beatHit()
    crowd.animation.play("bop");