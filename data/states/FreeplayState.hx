/*
todo:
    - add in the tween thingy for this
    - add in the custom font
    - add in the boxes for the song names
*/

import flixel.FlxCamera;
import flixel.text.FlxTextBorderStyle;
import flixel.addons.display.FlxBackdrop;

import funkin.backend.system.framerate.Framerate;

function create(){   
    FlxTween.tween(Framerate.offset, {y: 77.5}, .75, {ease: FlxEase.elasticOut});

    FlxG.mouse.visible = true;
    disableAutoPlay = true;

    starBG = new FlxBackdrop(Paths.image('menus/starBG'));
	starBG.antialiasing = true;
	starBG.updateHitbox();
	starBG.scrollFactor.set();
    insert(0, starBG);

    starFG = new FlxBackdrop(Paths.image('menus/starFG'));
	starFG.updateHitbox();
	starFG.antialiasing = true;
	starFG.scrollFactor.set();
    insert(0, starFG);

    porGlow = new FlxSprite(-11.1, -12.65).loadGraphic(Paths.image('menus/freeplay/backGlow'));
    porGlow.antialiasing = true;
	porGlow.updateHitbox();
	porGlow.scrollFactor.set();
    insert(0, porGlow);

    portrait = new FlxSprite();
    portrait.frames = Paths.getSparrowAtlas('menus/freeplay/portraits');

    // gonn make this into an array later
    portrait.animation.addByIndices('red', 'Character', [1], null, 24, true);
    portrait.animation.addByIndices('yellow', 'Character', [2], null, 24, true);
    portrait.animation.addByIndices('green', 'Character', [3], null, 24, true);
    portrait.animation.addByIndices('para', 'Character', [8], null, 24, true);
    portrait.animation.addByIndices('black', 'Character', [6], null, 24, true);
    portrait.animation.addByIndices('chef', 'Character', [12], null, 24, true);
    portrait.animation.addByIndices('pop', 'Character', [33], null, 24, true);
    portrait.antialiasing = true;
    portrait.alpha = 0;
    portrait.setPosition(304.65, -100);
    insert(3, portrait);

    upperBar = new FlxSprite(-2, -1.4).loadGraphic(Paths.image('menus/freeplay/topBar'));
    upperBar.antialiasing = true;
    upperBar.updateHitbox();
    upperBar.scrollFactor.set();
    add(4, upperBar);

    crossImage = new FlxSprite(12.50, 8.05).loadGraphic(Paths.image('menus/freeplay/menuBack'));
    crossImage.antialiasing = true;
    crossImage.scrollFactor.set();
    crossImage.updateHitbox();
    add(crossImage);

    scoreText.y = 85;
    coopText.y = scoreText.y + 36;
    diffText.y = scoreText.y + 36;

    scoreBG.visible = false;

    changePortrait();
}

function postCreate() diffText.alpha = 0;

function update(){
    porGlow.color = interpColor.color;

    // moves the stars to the left
    starFG.x -= 0.06;
	starBG.x -= 0.03;
}

function postUpdate(){
    // stuff that changes the portraits !!!! honestly bad code rn but i'll clean up later

    switch(songs[curSelected].name){
        case "sussus moogus" | "sabotage" | "meltdown":
            portrait.animation.play('red');
            portrait.alpha = 1;
            FlxG.sound.music.volume = 1;
        case "sussus toogus" | "lights down" | "reactor": portrait.animation.play('green');
        case "ejected": portrait.animation.play('para');
        case "sauces moogus": portrait.animation.play('chef');
        case "monochrome":
            FlxTween.tween(portrait, {alpha: 0}, 0.25);
            FlxTween.tween(FlxG.sound.music, {volume: 0.15}, 0.35);
            if (FlxG.save.data.windowShake) window.move(window.x + FlxG.random.int(-1, 1), window.y + FlxG.random.int(-1, 1));
            if (FlxG.save.data.screenShake) FlxG.camera.shake(0.0015, .1);
        case "drippypop": portrait.animation.play('pop');
        case "yarlow" | "dlowing": portrait.animation.play('yellow');
        case "double kill vtwo":
            portrait.alpha = 1;
            portrait.animation.play('black');
            FlxG.sound.music.volume = 1;
    }
}

function changePortrait(){
    portrait.x = 504.65;
    portrait.alpha = 0;
    FlxTween.tween(portrait, {x: 304.65}, 0.3, {ease: FlxEase.expoOut});
    FlxTween.tween(portrait, {alpha: 1}, 0.3, {ease: FlxEase.expoOut});
}