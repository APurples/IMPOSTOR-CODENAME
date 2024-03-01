function create(){
    deadGfSpeaker = new FlxSprite(300, 195);
    deadGfSpeaker.frames = Paths.getSparrowAtlas('stages/polus/speakerlonely');
    deadGfSpeaker.antialiasing = Options.antialiasing;
    deadGfSpeaker.animation.addByPrefix('bop', 'speakers lonely', 24, false);
}

function update(){
    switch (curSong){
        case "sabotage":
            insert(members.indexOf(gf), deadGfSpeaker);
        case "meltdown":
            insert(members.indexOf(gf), deadGfSpeaker);
            bfdead.alpha = 1;
    }

    if (PlayState.opponentMode) comboGroup.x = 400;
    else if (PlayState.coopMode) comboGroup.x = 550;
}

function beatHit()
    deadGfSpeaker.animation.play("bop");