var speaker:FlxSprite;
var crowd:FlxSprite;
var bfdead:FlxSprite;

function create(){
    speaker = new FlxSprite(300, 195);
    speaker.frames = Paths.getSparrowAtlas('stages/polus/speakerlonely');
    speaker.animation.addByPrefix('bop', 'speakers lonely', 24, false);
    speaker.antialiasing = true;
    insert(members.indexOf(gf), speaker);

    crowd = new FlxSprite(-925, 250);
	crowd.frames = Paths.getSparrowAtlas('stages/polus/boppers_meltdown');
	crowd.animation.addByPrefix('bop', 'BoppersMeltdown', 24, false);
	crowd.scrollFactor.set(1.5, 1.5);
	crowd.antialiasing = true;

    var bfdead:FlxSprite = new FlxSprite(600, 525).loadGraphic(Paths.image('stages/polus/bfdead',));
    bfdead.setGraphicSize(Std.int(bfdead.width * .8));
    bfdead.antialiasing = true;
    bfdead.active = false;
}

function update(){
    if (curSong == "sussus moogus"){
        remove(speaker);
    }
    if (curSong == "sabotage"){
        add(speaker);
    }
    if (curSong == "meltdown"){
        add(speaker);
        add(crowd);
        add(bfdead)
    }
}

function beatHit(){
    speaker.animation.play('bop');
    crowd.animation.play('bop');
}