var defeat:FlxSprite;
var cargoWall:FlxSprite;
var cargo:FlxSprite;

camGame.alpha = 0;
camHUD.alpha = 0;

function create(){
    flashback = new FlxSprite(1850, 800).loadGraphic(Paths.image('stages/cargo bay/airshipFlashback'));
    flashback.scale.x = flashback.scale.y = 1.5;
    flashback.alpha = 0;
    insert(members.indexOf(dad), flashback);
    add(flashback);

    defeat = new FlxSprite(650, 50);
    defeat.frames = Paths.getSparrowAtlas('stages/cargo bay/defeat');
    defeat.animation.addByPrefix('bop', 'defeat', 24, false);
    defeat.antialiasing = true;
    defeat.alpha = 0;
    insert(members.indexOf(dad), defeat);
    add(defeat);

    cargo = new FlxSprite(50, 50).loadGraphic(Paths.image('stages/cargo bay/cargo'));
    insert(members.indexOf(dad), cargo);
    add(cargo);
}

// god bless you maz
function postCreate(){
    strumLines.members[2].characters[1].visible = false;
}

function postUpdate(){
    cpuStrums.forEach(function(strums) strums.alpha = 0);
    cpuStrums.notes.forEach(function(notes) notes.alpha = 0.5);
}

// the most hardcoded shit i've ever made

function stepHit(){
    if (curStep % 32 == 0){
        defeat.animation.play("bop");
    }

    if (curSong == "double kill vtwo"){
        switch(curStep){
            case 4:
                FlxTween.tween(camGame, {alpha: 1}, 1.75);
                FlxTween.tween(camHUD, {alpha:1}, 1.25);
                FlxTween.tween(camGame, {zoom:1}, 1, {ease: FlxEase.sineIn});
            case 16:
                camGame.alpha = 1;
                camHUD.alpha = 1;
                defaultCamZoom = 1;
                if (!FlxG.save.data.flashingLights){
                    camHUD.flash(0xFFFFFF, 1);
                }
            case 240:
                defaultCamZoom = 1.1;
            case 256:
                defaultCamZoom = 1.2;
            case 272:
                FlxTween.tween(camGame, {zoom:1}, .5);
                if (!FlxG.save.data.flashingLights){
                    camGame.flash(0xFFFFFF, .75);
                }
            case 274:
                defaultCamZoom = 1;
            case 398:
                FlxTween.tween(camGame, {zoom:1.2}, .35);
            case 400:
                defaultCamZoom = 1.1;
                FlxTween.tween(camGame, {alpha:0}, .275);
            case 404:
                defaultCamZoom = 1;
                camGame.alpha = 1;
                if (!FlxG.save.data.flashingLights){
                    camGame.flash(0xFFFFFF, .5);
                }
            case 520:
                camZoomingStrength = 1;
            case 524:
                defaultCamZoom = 1.2;
                FlxTween.tween(camGame, {alpha:0}, .275);
                FlxTween.tween(camGame, {angle:-2}, .275);
            case 528:
                defaultCamZoom = 1;
                camGame.alpha = 1;
                camGame.angle = 0;
                if (!FlxG.save.data.flashingLights){
                    camGame.flash(0xFFFFFF, .5);
                }
            case 776:
                defaultCamZoom = 1.1;
            case 780:
                defaultCamZoom = 1.2;
            case 784:
                defaultCamZoom = 1;
            case 800: // CAMERA ZOOMS ATTACK
                camGame.zoom += .03;
                camHUD.zoom += .045;
            case 806:
                camGame.zoom += .03;
                camHUD.zoom += .045;
            case 812:
                camGame.zoom += .03;
                camHUD.zoom += .045;
            case 832:
                camGame.zoom += .03;
                camHUD.zoom += .045;
            case 838:
                camGame.zoom += .03;
                camHUD.zoom += .045;
            case 844:
                camGame.zoom += .03;
                camHUD.zoom += .045;
            case 864:
                camGame.zoom += .03;
                camHUD.zoom += .045;
            case 870:
                camGame.zoom += .03;
                camHUD.zoom += .045;
            case 876:
                camGame.zoom += .03;
                camHUD.zoom += .045;
            case 896:
                camGame.zoom += .03;
                camHUD.zoom += .045;
            case 902:
                camGame.zoom += .03;
                camHUD.zoom += .045;
            case 908:
                camGame.zoom += .03;
                camHUD.zoom += .045;
            case 1024:
                camGame.zoom += .06;
                camHUD.zoom += .075;
            case 1030:
                camGame.zoom += .06;
                camHUD.zoom += .075;
            case 1036:
                camGame.zoom += .06;
                camHUD.zoom += .075;
            case 1040:
                camZoomingStrength = 1;
                if (!FlxG.save.data.flashingLights){
                    camGame.flash(0xFFFFFF, .5);
                }
            case 1282:
                camZoomingStrength = 1;
            case 1296:
                if (!FlxG.save.data.flashingLights){
                    camGame.flash(0xFFFFFF, .5);
                }
            case 1788:
                FlxTween.tween(camGame, {zoom: 1.2}, 1.6, {ease: FlxEase.sineIn});
            case 1808:
                camZoomingStrength = 2;
                cargo.alpha = 0;
                dad.alpha = 0;
                gf.alpha = 0;
                if (!FlxG.save.data.flashingLights){
                    camGame.flash(0xFFFFFF, .5);
                }
                for (i in playerStrums.members)
                    FlxTween.tween(i, {x: i.x - 320}, 1, {ease: FlxEase.sineInOut});
            case 1936:
                FlxTween.tween(flashback, {alpha: .5}, 8);
            case 2062:
                boyfriend.alpha = 0;
                flashback.alpha = 0;
                camHUD.alpha = 0;
                camZoomingStrength = 1;
                for (i in playerStrums.members)
                    FlxTween.tween(i, {x: i.x + 320}, .001);
            case 2082:
                FlxTween.tween(camHUD, {alpha: 1}, 1);
            case 2096:
                boyfriend.alpha = 1;
                dad.alpha = 1;
                gf.alpha = 1;
                cargo.alpha = 1;
                if (!FlxG.save.data.flashingLights){
                    camGame.flash(0xFFFFFF, .5);
                }
            case 2608:
                camZoomingStrength = 1;
            case 2640:
                camGame.zoom += .075;
                camHUD.zoom += .09;
            case 2646:
                camGame.zoom += .075;
                camHUD.zoom += .09;
            case 2652:
                camGame.zoom += .075;
                camHUD.zoom += .09;
            case 2672:
                camGame.zoom += .075;
                camHUD.zoom += .09;
            case 2678:
                camGame.zoom += .075;
                camHUD.zoom += .09;
            case 2684:
                camGame.zoom += .075;
                camHUD.zoom += .09;
            case 2704:
                camGame.zoom += .03;
                camHUD.zoom += .045;
            case 2710:
                camGame.zoom += .03;
                camHUD.zoom += .045;
            case 2716:
                camGame.zoom += .03;
                camHUD.zoom += .045;
            case 2736:
                camGame.zoom += .03;
                camHUD.zoom += .045;
            case 2742:
                camGame.zoom += .03;
                camHUD.zoom += .045;
            case 2748:
                camGame.zoom += .03;
                camHUD.zoom += .045;
            case 2864:
                camGame.zoom += .06;
                camHUD.zoom += .075;
            case 2870:
                camGame.zoom += .06;
                camHUD.zoom += .075;
            case 2876:
                camGame.zoom += .06;
                camHUD.zoom += .075;
            case 3120:
                camZoomingStrength = 1;
            case 3128:
                FlxTween.tween(camGame, {alpha: 0}, .45);
                FlxTween.tween(camHUD, {alpha: 0}, .45);
                FlxTween.tween(camGame, {zoom: 1.2}, .45);
            case 3136:
                strumLines.members[2].characters[1].visible = true;
                camGame.alpha = 1;
                camHUD.alpha = 1;
                defeat.alpha = 1;
                remove(cargo);
                remove(gf);
                remove(strumLines.members[0].characters[0]);
                remove(strumLines.members[2].characters[0]);
                if (!FlxG.save.data.flashingLights){
                    camGame.flash(0xFFFFFF, 2);
                }
        }
    }
}