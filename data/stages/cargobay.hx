import flixel.addons.display.FlxBackdrop;

var overlay:FlxSprite;
var flashback:FlxSprite;
var defeat:FlxSprite;
var cargo:FlxSprite;
var bflegs:FlxSprite;

var hall:FlxBackdrop;

var swing:Bool = false;
var bopping:Bool = false;
var angle:Bool = false;
var chaseCamPos:Bool = false;
var buildUpCamPos:Bool = false;

camGame.alpha = 0;
camHUD.alpha = 0;

function create(){
    end1 = new FlxSprite(800, 800).loadGraphic(Paths.image('stages/cargo bay/end/1'));
    end1.alpha = 0;
    add(end1);

    end2 = new FlxSprite(800, 800).loadGraphic(Paths.image('stages/cargo bay/end/2'));
    end2.alpha = 0;
    add(end2);

    end3 = new FlxSprite(800, 800).loadGraphic(Paths.image('stages/cargo bay/end/3'));
    end3.alpha = 0;
    add(end3);

    end4 = new FlxSprite(800, 800).loadGraphic(Paths.image('stages/cargo bay/end/4'));
    end4.alpha = 0;
    add(end4);

    end5 = new FlxSprite(800, 800).loadGraphic(Paths.image('stages/cargo bay/end/5'));
    end5.alpha = 0;
    add(end5);
    
    end6 = new FlxSprite(800, 800).loadGraphic(Paths.image('stages/cargo bay/end/6'));
    end6.alpha = 0;
    add(end6);

    overlay = new FlxSprite(0, 0).loadGraphic(Paths.image('stages/cargo bay/overlay ass dk'));
    overlay.alpha = .75;
    add(overlay);

    flashback = new FlxSprite(1805, 800).loadGraphic(Paths.image('stages/cargo bay/airshipFlashback'));
    flashback.alpha = 0;
    flashback.scale.x = flashback.scale.y = 1.5;
    insert(members.indexOf(dad), flashback);

    hall = new FlxBackdrop(Paths.image('stages/cargo bay/chase'));
    hall.y -= 225;
    hall.velocity.x -= 1500; // moves the hall to the left
    hall.scale.x = hall.scale.y = .75;
    hall.alpha = 0;
    hall.moves = true;
    hall.active = true;
    insert(members.indexOf(dad), hall);

    defeat = new FlxSprite(1200, 50);
    defeat.frames = Paths.getSparrowAtlas('stages/cargo bay/defeat');
    defeat.animation.addByPrefix('bop', 'defeat', 24, false);
    defeat.antialiasing = true;
    defeat.alpha = 0;
    insert(members.indexOf(dad), defeat);

    cargo = new FlxSprite(50, 50).loadGraphic(Paths.image('stages/cargo bay/cargo'));
    cargo.alpha = 0;
    insert(members.indexOf(dad), cargo);
}

function update(elapsed){
    if (swing){
        camHUD.angle = Math.sin((Conductor.songPosition / 500) * (Conductor.bpm / 60) * 1.0);
    }

    if (PlayState.opponentMode){
        comboGroup.x = 2050;
    }

    if (PlayState.coopMode){
        comboGroup.x = 2250;
    }
}

function postCreate(){
    // this sucks
    strumLines.members[0].characters[1].visible = false;
    strumLines.members[0].characters[2].visible = false;
    strumLines.members[1].characters[1].visible = false;
    strumLines.members[1].characters[2].visible = false;
    strumLines.members[0].characters[1].x -= 173;
    strumLines.members[0].characters[1].y += 60;
    strumLines.members[2].characters[0].y += 25;
    strumLines.members[0].characters[2].x = strumLines.members[0].characters[1].x + 15;
    strumLines.members[0].characters[2].y = strumLines.members[0].characters[1].y - 60;
    strumLines.members[1].characters[1].x = strumLines.members[1].characters[2].x - 90;
    strumLines.members[1].characters[1].y = strumLines.members[1].characters[2].y + 75;
}

function postUpdate(){
    // cpuStrums.forEach(function(strums) strums.alpha = 0);
    // cpuStrums.notes.forEach(function(notes) notes.alpha = 0.25);

    if (buildUpCamPos){
        camFollow.x -= 275;
        camFollow.y -= 50;
    }

    if (chaseCamPos){
        camFollow.x += 400;
        camFollow.y -= 25;
    }
}

function onSongStart(){
    FlxTween.tween(camGame, {zoom: 1.1}, 1.25, {ease: FlxEase.circIn});
}

function beatHit(){
    if (swing){
        camGame.zoom += 0.045;
        camHUD.zoom += 0.06;
        camZoomingStrength = 0;
    }
    
    if (bopping){
        camGame.zoom += 0.015;
        camHUD.zoom += 0.03;
        camZoomingStrength = 0;
    }
}

function stepHit(){
    if (curStep % 16 == 0){
        defeat.animation.play("bop");
    }

    if (curSong == "double kill vtwo"){
        switch(curStep){
            case 4:
                FlxTween.tween(camGame, {alpha: 1}, 1.75);
            case 16:
                defaultCamZoom = 1;
                camGame.alpha = 1;
                camHUD.alpha = 1;
                if (!FlxG.save.data.flashingLights){
                    camHUD.flash(0xFFFFFF, 1);
                }
            case 272:
                FlxG.camera.followLerp = 0.08;
                overlay.alpha = 0;
                cargo.alpha = 1;
                scrollSpeed = 3.3;
                if (!FlxG.save.data.flashingLights){
                    camGame.flash(0xFFFFFF, .75);
                }
            case 398:
                FlxTween.tween(camGame, {zoom: 1.2}, .35);
            case 400:
                FlxG.camera.followLerp = 0.05;
                FlxTween.tween(camGame, {alpha: 0}, .275);
            case 404:
                FlxG.camera.followLerp = 0.08;
                camGame.alpha = 1;
                scrollSpeed = 3.1;
                if (!FlxG.save.data.flashingLights){
                    camGame.flash(0xFFFFFF, .5);
                }
            case 520:
                camGame.angle = 1;
                camHUD.angle = 1;
            case 522:
                camGame.angle = -1;
                camHUD.angle = -1;
            case 524:
                camGame.angle = 1;
                camHUD.angle = 1;
                FlxTween.tween(camGame, {alpha: 0}, .275);
                FlxTween.tween(camHUD, {alpha: 0}, .275);
            case 526:
                camGame.angle = -1;
                camHUD.angle = -1;
            case 528:
                camGame.alpha = 1;
                camHUD.alpha = 1;
                camGame.angle = 0;
                camHUD.angle = 0;
                FlxG.camera.followLerp = 0.04;
                if (!FlxG.save.data.flashingLights){
                    camGame.flash(0xFFFFFF, .5);
                }
            case 776:
                camGame.angle = 1;
                camHUD.angle = 1;
            case 778:
                camGame.angle = -1;
                camHUD.angle = -1;
            case 780:
                camGame.angle = 1;
                camHUD.angle = 1;
            case 782:
                camGame.angle = -1;
                camHUD.angle = -1;
            case 784:
                FlxG.camera.followLerp = 0.06;
                camGame.angle = 0;
                camHUD.angle = 0;
            case 1040:
                FlxG.camera.followLerp = 0.08;
                scrollSpeed = 3.3;
                if (!FlxG.save.data.flashingLights){
                    camGame.flash(0xFFFFFF, .5);
                }
            case 1296:
                scrollSpeed = 3.1;
                FlxG.camera.followLerp = 0.06;
                if (!FlxG.save.data.flashingLights){
                    camGame.flash(0xFFFFFF, .5);
                }
            case 1456:
                if (!FlxG.save.data.flashingLights){
                    camGame.flash(0xFFFFFF, .5);
                }
            case 1552:
                FlxG.camera.followLerp = 0.04;
                scrollSpeed = 2.6;
                overlay.alpha = .75;
                cargo.alpha = 0;
                if (!FlxG.save.data.flashingLights){
                    camGame.flash(0xFFFFFF, .5);
                }
            case 1788:
                FlxTween.tween(camGame, {zoom: 1.2}, 1.6, {ease: FlxEase.circIn});
            case 1808:
                scrollSpeed = 2.9;
                overlay.alpha = 0;
                camZoomingStrength = 2;
                dad.alpha = 0;
                gf.alpha = 0;
                if (!FlxG.save.data.flashingLights){
                    camGame.flash(0xFFFFFF, .5);
                }
            case 1936:
                FlxTween.tween(flashback, {alpha: .5}, 8.5);
            case 2062:
                camZoomingStrength = 1;
                boyfriend.alpha = 0;
                flashback.alpha = 0;
                camHUD.alpha = 0;
            case 2082:
                FlxTween.tween(camHUD, {alpha: 1}, 1);
            case 2096:
                FlxG.camera.followLerp = 0.08;
                scrollSpeed = 3.15;
                boyfriend.alpha = 1;
                dad.alpha = 1;
                gf.alpha = 1;
                cargo.alpha = 1;
                if (!FlxG.save.data.flashingLights){
                    camGame.flash(0xFFFFFF, .5);
                }
            case 2624:
                FlxG.camera.followLerp = 0.06;
            case 2640:
                FlxG.camera.followLerp = 2;
            case 2641:
                FlxG.camera.followLerp = 0.06;
            case 2672:
                FlxG.camera.followLerp = 2;
            case 2673:
                FlxG.camera.followLerp = 0.06;
            case 2880:
                FlxG.camera.followLerp = 0.08;
                scrollSpeed = 3.3;
                if (!FlxG.save.data.flashingLights){
                    camGame.flash(0xFFFFFF, .5);
                }
            case 3128:
                FlxTween.tween(camGame, {alpha: 0}, .45);
                FlxTween.tween(camHUD, {alpha: 0}, .45);
                FlxTween.tween(camGame, {zoom: 1.2}, .45);
            case 3136:
                strumLines.members[2].characters[0].visible = false;
                FlxG.camera.followLerp = 0.04;
                scrollSpeed = 2.6;
                camGame.alpha = 1;
                camHUD.alpha = 1;
                defeat.alpha = 1;
                remove(cargo);
                if (!FlxG.save.data.flashingLights){
                    camGame.flash(0xFFFFFF, 2);
                }
            case 3328:
                buildUpCamPos = true;
                FlxTween.tween(camGame, {zoom: 0.725}, 10);
            case 3392:
                buildUpCamPos = false;
                camGame.alpha = 0;
                camHUD.alpha = 0;
            case 3408:
                scrollSpeed = 3.5;
                camGame.alpha = 1;
                camHUD.alpha = 1;
            case 3536:
                if (!FlxG.save.data.flashingLights){
                    camGame.flash(0xFFFFFF, .5);
                }
            case 3664:
                if (!FlxG.save.data.flashingLights){
                    camGame.flash(0xFFFFFF, .5);
                }
            case 3792:
                if (!FlxG.save.data.flashingLights){
                    camGame.flash(0xFFFFFF, .5);
                }
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

function healthFade(){
    FlxTween.tween(healthBar, {alpha:0}, .5);
    FlxTween.tween(healthBarBG, {alpha:0}, .5);
    FlxTween.tween(iconP1, {alpha:0}, .5);
    FlxTween.tween(iconP2, {alpha:0}, .5);
    trace("healthbar faded!");
}

function chaseTime(){
    chaseCamPos = true;
    swing = true;
    defeat.alpha = 0;
    strumLines.members[0].characters[0].visible = false;
    strumLines.members[1].characters[0].visible = false;
    FlxTween.tween(healthBar, {alpha:1}, .5);
    FlxTween.tween(healthBarBG, {alpha:1}, .5);
    FlxTween.tween(iconP1, {alpha:1}, .5);
    FlxTween.tween(iconP2, {alpha:1}, .5);
    if (!FlxG.save.data.flashingLights){
        camGame.flash(0xFFFFFF, .5);
    }
    trace("i can feel black coming inside of me at this part");
}

function chaseDrop(){
    camMoveOffset = 32;
    chaseCamPos = false;
    scrollSpeed = 3.575;
    hall.velocity.x -= 250;
    trace("gyat damn black :fire: :fire:"); // 🔥🔥
}

function noMoreChaseDrop(){
    camMoveOffset = 24;
    scrollSpeed = 3.5;
    chaseCamPos = true;
    hall.velocity.x += 250;
}

function chaseTime2(){
    strumLines.members[0].characters[1].visible = true;
    strumLines.members[0].characters[2].visible = true;
    strumLines.members[1].characters[1].visible = true;
    strumLines.members[1].characters[2].visible = true;
    hall.alpha = 1;
    bflegs.alpha = 1;
    blacklegs.alpha = 1;
}

function stopChaseTime(){
    swing = false;
    camHUD.angle = 0;
}