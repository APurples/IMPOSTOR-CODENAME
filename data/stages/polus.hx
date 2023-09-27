var speaker:FlxSprite;
var snow:FlxSprite;
var crowd:FlxSprite;

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
    add(snow);
    if (Options.lowMemoryMode){
        remove(snow);
    }

    crowd = new FlxSprite(-925, 250);
	crowd.frames = Paths.getSparrowAtlas('stages/polus/boppers_meltdown');
	crowd.animation.addByPrefix('bop', 'BoppersMeltdown', 24, false);
	crowd.scrollFactor.set(1.5, 1.5);
	crowd.antialiasing = true;
    
    bfdead.alpha = 0;
}

function update(){
    if (curSong == "sussus moogus"){
        remove(speaker);
    }
    if (curSong == "sabotage"){
        gf.alpha = 0;
        add(speaker);
    }
    if (curSong == "meltdown"){
        add(speaker);
        add(crowd);
        if (Options.lowMemoryMode){
            remove(crowd);
        }
        bfdead.alpha = 1;
    }
}

function onSongStart(){
    if (curSong == "meltdown"){
        camGame.zoom += 0.015;
        camHUD.zoom += 0.03;
        if (!FlxG.save.data.flashingLights){
            camGame.flash(0xADFF0000, .35);
        }
    }
}

function stepHit(){
    if (curSong == 'sussus moogus'){
        if (curStep > 383 && curStep < 641){
            if (curStep % 8 == 0){
                camGame.zoom += 0.015;
                camHUD.zoom += 0.03;
                if (!FlxG.save.data.flashingLights){
                    camGame.flash(0xADFF0000, .35);
                }
            }
        }
        if (curStep > 1151 && curStep < 1273){
            if (curStep % 64 == 0){
                camGame.zoom += 0.015;
                camHUD.zoom += 0.03;
                if (!FlxG.save.data.flashingLights){
                    camGame.flash(0xADFF0000, .35);
                }
            }
        }
        if (curStep > 1279 && curStep < 1533){
            if (curStep % 8 == 0){
                camGame.zoom += 0.015;
                camHUD.zoom += 0.03;
                if (!FlxG.save.data.flashingLights){
                    camGame.flash(0xADFF0000, .35);
                }
            }
        }
    
        switch(curStep){
            case 376:
                camGame.zoom += 0.015;
                camHUD.zoom += 0.03;
                if (!FlxG.save.data.flashingLights){
                    camGame.flash(0xADFF0000, .35);
                }
            case 380:
                camGame.zoom += 0.015;
                camHUD.zoom += 0.03;
                if (!FlxG.save.data.flashingLights){
                    camGame.flash(0xADFF0000, .35);
                }
            case 1272:
                camGame.zoom += 0.015;
                camHUD.zoom += 0.03;
                if (!FlxG.save.data.flashingLights){
                    camGame.flash(0xADFF0000, .35);
                }
            case 1276:
                camGame.zoom += 0.015;
                camHUD.zoom += 0.03;
                if (!FlxG.save.data.flashingLights){
                    camGame.flash(0xADFF0000, .35);
                }
        }
    }
    else if (curSong == "sabotage"){
        switch(curStep){
            case 816:
                gf.alpha = 1;
                gf.playAnim("fadein", true);
            case 820:
                dad.playAnim("look", true);
        }
    
        if (curStep > 63 && curStep < 511){
            if (curStep % 32 == 0){
                camGame.zoom += 0.015;
                camHUD.zoom += 0.03;
                if (!FlxG.save.data.flashingLights){
                    camGame.flash(0xADFF0000, .35);
                }
            }
        }
        if (curStep > 511 && curStep < 577){
            if (curStep % 64 == 0){
                if (!FlxG.save.data.flashingLights){
                    camGame.flash(0xADFF0000, .35);
                }
            }
        }
        if (curStep > 639 && curStep < 705){
            if (curStep % 32 == 0){
                camGame.zoom += 0.015;
                camHUD.zoom += 0.03;
                if (!FlxG.save.data.flashingLights){
                    camGame.flash(0xADFF0000, .35);
                }
            }
        }
        if (curStep > 831 && curStep < 1473){
            if (curStep % 32 == 0){
                camGame.zoom += 0.015;
                camHUD.zoom += 0.03;
                if (!FlxG.save.data.flashingLights){
                    camGame.flash(0xADFF0000, .35);
                }
            }
        }
    }
    else if (curSong == "meltdown"){
        switch (curStep){
            case 1152:
                FlxTween.tween(camGame, {alpha: 0}, 1.65);
                FlxTween.tween(camHUD, {alpha: 0}, 1.65);
        }
    }
}

function beatHit(){
    speaker.animation.play('bop');
    crowd.animation.play('bop');

    if (curSong == "meltdown"){
        if (curBeat > 0 && curBeat < 32){
            if (curBeat % 8 == 0){
                camGame.zoom += 0.015;
                camHUD.zoom += 0.03;
                if (!FlxG.save.data.flashingLights){
                    camGame.flash(0xADFF0000, .35);
                }
            }
        }
        if (curBeat > 31 && curBeat < 125){
            if (curBeat % 4 == 0){
                camGame.zoom += 0.015;
                camHUD.zoom += 0.03;
                if (!FlxG.save.data.flashingLights){
                    camGame.flash(0xADFF0000, .35);
                }
            }
        }
        if (curBeat > 127 && curBeat < 185){
            if (curBeat % 8 == 0){
                camGame.zoom += 0.015;
                camHUD.zoom += 0.03;
                if (!FlxG.save.data.flashingLights){
                    camGame.flash(0xADFF0000, .35);
                }
            }
        }
        if (curBeat > 191 && curBeat < 253){
            if (curBeat % 4 == 0){
                camGame.zoom += 0.015;
                camHUD.zoom += 0.03;
                if (!FlxG.save.data.flashingLights){
                    camGame.flash(0xADFF0000, .35);
                }
            }
        }
        if (curBeat > 255 && curBeat < 281){
            if (curBeat % 8 == 0){
                camGame.zoom += 0.015;
                camHUD.zoom += 0.03;
                if (!FlxG.save.data.flashingLights){
                    camGame.flash(0xADFF0000, .35);
                }
            }
        }
    }
}