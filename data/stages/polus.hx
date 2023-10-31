var flashBeat2:Bool = false;
var flashBeat4:Bool = false;
var flashBeat8:Bool = false;

function create(){
    speaker = new FlxSprite(300, 195);
    speaker.frames = Paths.getSparrowAtlas('stages/polus/speakerlonely');
    speaker.animation.addByPrefix('bop', 'speakers lonely', 24, false);
    speaker.antialiasing = true;
    insert(members.indexOf(gf), speaker);
    
    snow = new FlxSprite(0, -250);
    snow.frames = Paths.getSparrowAtlas('stages/polus/snow');
    snow.animation.addByPrefix('cum', 'cum', 24);
    snow.animation.play('cum');
    snow.scrollFactor.set(1, 1);
    snow.antialiasing = true;
    snow.updateHitbox();
    snow.setGraphicSize(Std.int(snow.width * 2));
    if (!Options.lowMemoryMode){
        add(snow);
    }

    crowd = new FlxSprite(-900, 200);
    crowd.frames = Paths.getSparrowAtlas('stages/polus/boppers_meltdown');
    crowd.animation.addByPrefix('bop', 'BoppersMeltdown', 24, false);
    crowd.animation.play('bop');
    crowd.scrollFactor.set(1.5, 1.5);
    crowd.antialiasing = true;
    crowd.updateHitbox();
    
    bfdead.alpha = 0;
}

function update(){
    if (curSong == "sussus moogus"){
        remove(speaker);
    }

    if (curSong == "sabotage"){
        add(speaker);
    }

    if (curSong == "meltdown"){
        bfdead.alpha = 1;
        add(speaker);
        if (!Options.lowMemoryMode){
            add(crowd);
        }
    }

    if (PlayState.opponentMode){
        comboGroup.x = 400;
    }
    
    if (PlayState.coopMode){
        comboGroup.x = 550;
    }
}

function stepHit(){
    if (curSong == "sabotage"){
        switch(curStep){
            case 816:
                gf.alpha = 1;
                gf.playAnim("fadein", true);
            case 820:
                dad.playAnim("look", true);
        }
    }
    else if (curSong == "meltdown"){
        switch (curStep){
            case 1152:
                playVid('end');
        }
    }
}

function beatHit(){
    speaker.animation.play('bop');
    crowd.animation.play('bop');

    if (flashBeat2 == true){
        if (curBeat % 2 == 0){
            camGame.zoom += 0.015;
            camHUD.zoom += 0.03;
            if (!FlxG.save.data.flashingLights){
                camGame.flash(0xADFF0000, .35);
            }
        }
    }

    if (flashBeat4 == true){
        if (curBeat % 4 == 0){
            camGame.zoom += 0.015;
            camHUD.zoom += 0.03;
            if (!FlxG.save.data.flashingLights){
                camGame.flash(0xADFF0000, .35);
            }
        }
    }

    if (flashBeat8 == true){
        if (curBeat % 8 == 0){
            camGame.zoom += 0.015;
            camHUD.zoom += 0.03;
            if (!FlxG.save.data.flashingLights){
                camGame.flash(0xADFF0000, .35);
            }
        }
    }
}

// hscript call stuff

function flashBeat2(){
    flashBeat2 = true;
}

function flashBeat2Alt(){
    flashBeat2 = true;
}

function flashBeat4(){
    flashBeat4 = true;
}

function flashBeat4Alt(){
    flashBeat4 = true;
}

function flashBeat8(){
    flashBeat8 = true;
}

function flashBeat8Alt(){
    flashBeat8 = true;
}

function flashBeat8Alt2(){
    flashBeat8 = true;
}

function stopFlashing(){
    flashBeat2 = false;
    flashBeat4 = false;
    flashBeat8 = false;
}

function cancelFlashBeat8(){ // specifically for meltdown
    flashBeat8 = false;
}