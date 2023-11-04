import flixel.util.FlxTimer;

var bopping:Bool = false;

camGame.alpha = 0;

function create(){
    // this code is so messy i am so sorry to anyone that knows what they are doing

    remove(comboGroup);
    remove(gf);
    remove(dad);
    remove(boyfriend);

    whiteruby = new FlxSprite(2500, 1150);
    if (curSong == "yarlow"){
        whiteruby.setPosition(2350, 1420);
    }
    whiteruby.frames = Paths.getSparrowAtlas('stages/dlowing/boppers/whiteruby');
    whiteruby.animation.addByPrefix('bop', 'white', 24, false);
    whiteruby.scrollFactor.set(1, 1);

    main = new FlxSprite(1262.5, 806).loadGraphic(Paths.image('stages/dlowing/main'));
    main.scrollFactor.set(1, 1);

    stand = new FlxSprite(1262.5, 806).loadGraphic(Paths.image('stages/dlowing/ruby stand'));
    stand.scrollFactor.set(1, 1);

    other = new FlxSprite(1262.5, 806).loadGraphic(Paths.image('stages/dlowing/the thingies'));
    other.scrollFactor.set(1, 1);

    blade = new FlxSprite(1262.5, 806).loadGraphic(Paths.image('stages/dlowing/blade'));
    blade.scrollFactor.set(1.1, 1.1);

    addb = new FlxSprite(1262.5, 806).loadGraphic(Paths.image('stages/dlowing/blade glow'));
    addb.scrollFactor.set(1, 1);

    adds = new FlxSprite(1262.5, 806).loadGraphic(Paths.image('stages/dlowing/stand glow'));
    adds.scrollFactor.set(1, 1);

    addm = new FlxSprite(1262.5, 806).loadGraphic(Paths.image('stages/dlowing/lighting main'));
    addm.scrollFactor.set(1, 1);

    ov = new FlxSprite(1262.5, 806).loadGraphic(Paths.image('stages/dlowing/overlay gold'));
    ov.scrollFactor.set(1, 1);

    lime = new FlxSprite(3200, 1850);
    lime.frames = Paths.getSparrowAtlas('stages/dlowing/boppers/limedlowing');
    lime.animation.addByPrefix('bop', 'lime', 24, false);
    lime.scrollFactor.set(1, 1);

    callguy = new FlxSprite(1450, 1300);
    callguy.frames = Paths.getSparrowAtlas('stages/dlowing/boppers/call');
    callguy.animation.addByPrefix('bop', 'call', 24, false);
    callguy.scrollFactor.set(1, 1);

    nr = new FlxSprite(1320, 1500);
    nr.frames = Paths.getSparrowAtlas('stages/dlowing/boppers/nr');
    nr.animation.addByPrefix('bop', 'nr', 24, false);
    nr.scrollFactor.set(1, 1);

    sheriff = new FlxSprite(3250, 1500);
    sheriff.frames = Paths.getSparrowAtlas('stages/dlowing/boppers/sheriff');
    sheriff.animation.addByPrefix('bop', 'sheriff', 24, false);
    sheriff.scrollFactor.set(1, 1);

    mint = new FlxSprite(2100, 1250);
    mint.frames = Paths.getSparrowAtlas('stages/dlowing/boppers/mint');
    mint.animation.addByPrefix('bop', 'mint', 24, false);
    mint.scrollFactor.set(1, 1);

    amongly = new FlxSprite(-1500, 1575);
    amongly.frames = Paths.getSparrowAtlas('stages/dlowing/passers/amongly');
    amongly.animation.addByPrefix('bop', 'amongly', 24, true);
    amongly.animation.play('bop');
    amongly.scrollFactor.set(1.2, 1);
    amongly.scale.x = amongly.scale.y = .95;
    amongly.velocity.x = 280;

    tnr = new FlxSprite(-10000, 1575);
    tnr.frames = Paths.getSparrowAtlas('stages/dlowing/passers/tanandrichard');
    tnr.animation.addByPrefix('bop', 'tanandrichard', 32, true);
    tnr.animation.play('bop');
    tnr.scrollFactor.set(1.2, 1);
    tnr.scale.x = tnr.scale.y = .95;
    tnr.velocity.x = 240;

    amonglit = new FlxSprite(55000, 1250);
    amonglit.frames = Paths.getSparrowAtlas('stages/dlowing/passers/amonglita');
    amonglit.animation.addByPrefix('bop', 'amonglita', 32, true);
    amonglit.animation.play('bop');
    amonglit.scrollFactor.set(1.2, 1);
    amonglit.scale.x = amonglit.scale.y = .95;
    amonglit.velocity.x = -800;

    redmungus = new FlxSprite(-16000, 1575);
    redmungus.frames = Paths.getSparrowAtlas('stages/dlowing/passers/redmungus');
    redmungus.animation.addByPrefix('bop', 'redmungus', 24, true);
    redmungus.animation.play('bop');
    redmungus.scrollFactor.set(1.2, 1);
    redmungus.scale.x = redmungus.scale.y = .95;
    redmungus.velocity.x = 200;

    pissOverlay = new FlxSprite(0, 0);
    pissOverlay.frames = Paths.getSparrowAtlas('stages/dlowing/pee vig');
    pissOverlay.animation.addByPrefix('bop', 'penis vig', 12, false);
    pissOverlay.cameras = [camHUD];
    pissOverlay.alpha = 0.3;
    pissOverlay.antialiasing = true;

    add(main);
    add(mint);
    add(stand);
    add(whiteruby);
    add(other);
    add(callguy);
    add(nr);
    add(sheriff);
    add(blade);
    add(addb);
    add(lime);
    add(ov);
    add(adds);
    add(dad);
    add(boyfriend);
    add(comboGroup);
    add(amongly);
    add(tnr);
    add(amonglit);
    add(redmungus);
    add(gf);
    add(addm);
    add(pissOverlay);
}

function update(){
    if (PlayState.opponentMode){
        comboGroup.x = 2300;
    }

    if (PlayState.coopMode){
        comboGroup.x = 2450;
    }
}

function postUpdate(){
    if (curSong == "yarlow"){
        remove(lime);
        remove(nr);
        remove(sheriff);
        remove(redmungus);
        remove(mint);
        remove(amongly);
        remove(tnr);
        remove(amonglit);
        remove(redmungus);
    }

    if (Options.lowMemoryMode){
        remove(addm);
        remove(addb);
        remove(adds);
        remove(ov);
    }
}

function beatHit(){
    if (curBeat % 2 == 0){
        mint.animation.play('bop');
        lime.animation.play('bop');
        callguy.animation.play('bop');
        nr.animation.play('bop');
        sheriff.animation.play('bop');
        whiteruby.animation.play('bop');
        pissOverlay.animation.play('bop');
    }

    if (bopping){
        camGame.zoom += 0.03;
    }
}

function stepHit(){
    if (curSong == "yarlow"){
        switch(curStep){
            case 2:
                FlxTween.tween(camGame, {alpha: 1}, 6);
                FlxTween.tween(camGame, {zoom: 0.8}, 13, {ease: FlxEase.sineInOut});
            case 128:
                if (FlxG.save.data.flashingLights){
                    camGame.flash(0xFFFFFF, 1);
                }
            case 192:
                if (FlxG.save.data.flashingLights){
                    camGame.flash(0xFFFFFF, 1);
                }
            case 384:
                if (FlxG.save.data.flashingLights){
                    camGame.flash(0xFFFFFF, .5);
                }
            case 512:
                if (FlxG.save.data.flashingLights){
                    camGame.flash(0xFFFFFF, .5);
                }
            case 770:
                FlxTween.tween(camGame, {zoom: 0.8}, 3.2, {ease: FlxEase.sineInOut});
            case 800:
                if (FlxG.save.data.flashingLights){
                    camGame.flash(0xFFFFFF, .5);
                }
            case 928:
                if (FlxG.save.data.flashingLights){
                    camGame.flash(0xFFFFFF, 1);
                }
            case 942:
                FlxTween.tween(camGame, {alpha: 0}, 3);
                FlxTween.tween(camHUD, {alpha: 0}, 3);
        }
    }

    if (curSong == "dlowing"){
        switch(curStep){
            case 1:
                FlxTween.tween(camGame, {alpha: 1}, 5);
            case 64:
                if (FlxG.save.data.flashingLights){
                    camGame.flash(0xFFFFFF, 1);
                }
            case 704:
                if (FlxG.save.data.flashingLights){
                    camGame.flash(0xFFFFFF, 1);
                }
            case 1024:
                if (FlxG.save.data.flashingLights){
                    camGame.flash(0xFFFFFF, 1);
                }
            case 1280:
                FlxTween.tween(camHUD, {alpha: 0}, 5);
                if (FlxG.save.data.flashingLights){
                    camGame.flash(0xFFFFFF, 2);
                }
            case 1368:
                new FlxTimer().start(10, function(tmr:FlxTimer){
                    endSong();
                });
        }
    }
}

// hscript call stuff

function boppingShit(){
    bopping = true;
    camZoomingStrength = 0;
}

function stopBoppingShit(){
    bopping = false;
    camZoomingStrength = 1;
}