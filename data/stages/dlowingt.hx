var bopping:Bool = false;

camGame.alpha = 0;
camHUD.alpha = 0;

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

    callguy = new FlxSprite(1450, 1300);
    callguy.frames = Paths.getSparrowAtlas('stages/dlowing/boppers/call');
    callguy.animation.addByPrefix('bop', 'call', 24, false);
    callguy.scrollFactor.set(1, 1);

    pissOverlay = new FlxSprite(0, 0);
    pissOverlay.frames = Paths.getSparrowAtlas('stages/dlowing/pee vig');
    pissOverlay.animation.addByPrefix('bop', 'penis vig', 12, false);
    pissOverlay.cameras = [camHUD];
    pissOverlay.alpha = 0.3;
    pissOverlay.antialiasing = true;

    add(main);
    add(stand);
    add(whiteruby);
    add(other);
    add(blade);
    add(addb);
    add(ov);
    add(callguy);
    add(adds);
    add(gf);
    add(dad);
    add(boyfriend);
    add(comboGroup);
    add(addm);
    add(pissOverlay);
}

function beatHit(){
    if (curBeat % 2 == 0){
        callguy.animation.play('bop');
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
                FlxTween.tween(camHUD, {alpha: 1}, 6);
                FlxTween.tween(camGame, {zoom: 0.8}, 13, {ease: FlxEase.sineInOut});
            case 128:
                if (!FlxG.save.data.flashingLights){
                    camGame.flash(0xFFFFFF, 1);
                }
            case 192:
                if (!FlxG.save.data.flashingLights){
                    camGame.flash(0xFFFFFF, 1);
                }
            case 384:
                if (!FlxG.save.data.flashingLights){
                    camGame.flash(0xFFFFFF, .5);
                }
            case 512:
                if (!FlxG.save.data.flashingLights){
                    camGame.flash(0xFFFFFF, .5);
                }
            case 770:
                FlxTween.tween(camGame, {zoom: 0.8}, 3.2, {ease: FlxEase.sineInOut});
            case 800:
                if (!FlxG.save.data.flashingLights){
                    camGame.flash(0xFFFFFF, .5);
                }
            case 928:
                if (!FlxG.save.data.flashingLights){
                    camGame.flash(0xFFFFFF, 1);
                }
            case 942:
                FlxTween.tween(camGame, {alpha: 0}, 3);
                FlxTween.tween(camHUD, {alpha: 0}, 3);
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