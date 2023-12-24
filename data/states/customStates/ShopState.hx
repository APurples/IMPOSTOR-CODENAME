import flixel.group.FlxTypedGroup;
import flixel.addons.display.FlxBackdrop;
import flixel.text.FlxTextBorderStyle;
import flixel.input.mouse.FlxMouseEventManager;

var isFocused:Bool = false;

var camUpper:FlxCamera;

/*var nodeData:Array<Dynamic> = [
    ['bottom', 'root', 'redp', 125, false, 'Red', 'Unlocked by completing the first week.', BF, COMPLETED, ['sussus-moogus', 'sabotage', 'meltdown']],
    ['right', 'redp', 'greenp', 250, false, 'Green', 'Unlocked by completing the second week.', BF, COMPLETED, ['sussus-toogus', 'lights-down', 'ejected']],
    ['right', 'greenp', 'blackp', 450, false, 'Black', "Unlocked by completing the black week", BF, COMPLETED, ['defeat', 'finale'], true, "It's a secret!"],
    ['top', 'blackp', 'amongbf', 400, false, 'Crewmate', "Unlocked by completing all of the main story's songs.", BF, COMPLETED, ['sussus-moogus', 'sabotage', 'meltdown', 'sussus-toogus', 'lights-down', 'ejected', 'mando', 'dlow', 'oversight', 'danger', 'double-kill']],
    ['bottom', 'redp', 'bfg', 200, false, 'Ghost BF', "Unlocked by achieving an accuracy higher than 95% on all of the first week's songs.", BF, PERCENT95, ['sussus-moogus', 'sabotage', 'meltdown']],
    ['right', 'bfg', 'ghostgf', 450, false, 'Ghost GF', "Unlocked by achieving an accuracy higher than 95% on all of the first week's songs.", GF, PERCENT95, ['sussus-moogus', 'sabotage', 'meltdown']],
    ['top', 'root', 'bfpolus', 175, false, 'Polus BF', 'Unlocked by completing the fifth week.', BF, COMPLETED, ['magmatic', 'ashes', 'boiling-point']],
    ['right', 'root', 'dripbf', 225, false, 'Drippypop BF', 'Unlocked by achieving an accuracy higher than 95% on Drippypop.', BF, PERCENT95, ['drippypop']],
    ['right', 'bfpolus', 'bfmira', 225, false, 'Mira BF', 'Unlocked by completing the sixth week.', BF, COMPLETED, ['heartbeat', 'pinkwave', 'pretender']],
    ['left', 'bfpolus', 'bfairship', 200, false, 'Airship BF', 'Unlocked by completing the sixth week.', BF, COMPLETED, ['delusion', 'blackout', 'neurotic']],
    ['right', 'bfmira', 'gfmira', 250, false, 'Mira GF', 'Unlocked by completing the seventh week.', GF, COMPLETED, ['heartbeat', 'pinkwave', 'pretender']],
    ['top', 'bfmira', 'bfsauce', 250, false, 'Chef BF', 'Unlocked by achieving an accuracy higher than 95% on Sauces Moogus.', BF, PERCENT95, ['sauces-moogus']],

    ['top', 'bfpolus', 'gfpolus', 450, false, 'Polus GF', "Unlocked by completing the fifth week.", GF, COMPLETED, ['magmatic', 'ashes', 'boiling-point']],
    ['top', 'gfpolus', 'snowball', 300, false, 'Snowball', "i dont even know man", PET],
    ['right', 'bfsauce', 'ham', 300, false, 'Hammy', "its like a ham but with legs", PET],

    ['bottom', 'bfg', 'dog', 300, false, 'Doggy', "man(?)'s best friend!", PET],
    ['bottom', 'ghostgf', 'frankendog', 300, false, 'Frankendog', "spooky ass dog", PET],

    ['left', 'redp', 'minicrewmate', 300, false, 'Crewmate', "your very own child", PET],
    ['left', 'minicrewmate', 'tomong', 300, false, 'Tomongus', "he's not among us, he's a hamster!", PET],

    ['top', 'bfairship', 'crab', 300, false, 'Bedcrab', "the thing from half life", PET],
    ['left', 'crab', 'ufo', 300, false, 'UFO', "aliens ahh", PET],

    
    ['left', 'root', 'stick-bf', 375, false, 'Stickmin BF', "Unlocked by completing Henry's week.", BF, COMPLETED, ['titular', 'reinforcements', 'greatest-plan', 'armed'], true, "Someone told me about some broken old device lying around the airship and i dont think anyones cleaned it up yet.\nMight wanna check that out sometime."],
    ['left', 'stick-bf', 'henrygf', 375, false, 'Stickmin GF', "Unlocked by completing Henry's week.", GF, COMPLETED, ['titular', 'reinforcements', 'greatest-plan', 'armed'], true, "..."],

    ['top', 'henrygf', 'stickmin', 300, false, 'H. Stickmin', "a tiny henry?", PET],
    ['left', 'stickmin', 'elliepet', 300, false, 'E. Rose', "and an ellie too!", PET]
];*/

function create(){
    camUpper = new FlxCamera();
    camUpper.bgColor = 0;
    FlxG.cameras.add(camUpper, false);

    panel = new FlxSprite(FlxG.width * 1.4, 0).makeGraphic(Std.int(FlxG.width * 0.4), FlxG.height, 0xFFA2A2A2);
    panel.alpha = 0.47;
    panel.cameras = [camUpper];
    add(panel);

    starBG = new FlxBackdrop(Paths.image('menus/starBG'));
    starBG.updateHitbox();
    starBG.antialiasing = true;
    starBG.scrollFactor.set();
    add(starBG);

    starFG = new FlxBackdrop(Paths.image('menus/starFG'));
    starFG.updateHitbox();
    starFG.antialiasing = true;
    starFG.scrollFactor.set();
    add(starFG);

    equipbutton = new FlxSprite(0, 0);
    equipbutton.frames = Paths.getSparrowAtlas('menus/shop/button');
	equipbutton.animation.addByPrefix('buy', 'buy', 0, false);
    equipbutton.animation.addByPrefix('equipped', 'equipped', 0, false);
    equipbutton.animation.addByPrefix('grey', 'grey', 0, false);
    equipbutton.animation.addByPrefix('locked', 'locked', 0, false);
	equipbutton.animation.play('buy');
    equipbutton.scale.set(0.8, 0.8);
    equipbutton.scrollFactor.set();
    equipbutton.cameras = [camUpper];
    add(equipbutton);

    equipText = new FlxText(0, 0, equipbutton.width, 'BUY', 35);
	equipText.setFormat(Paths.font("ariblk.ttf"), 35, FlxColor.WHITE, FlxAxes.CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    equipText.updateHitbox();
	equipText.borderSize = 3;
    equipText.scrollFactor.set();
    equipText.antialiasing = true;
    equipText.cameras = [camUpper];
    add(equipText);

    charName = new FlxText(0, 0, panel.width, 'this is a test', 70);
    charName.setFormat(Paths.font("ariblk.ttf"), 70, FlxColor.WHITE, FlxAxes.CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    charName.updateHitbox();
    charName.borderSize = 3;
    charName.scrollFactor.set();
    charName.antialiasing = true;
    charName.cameras = [camUpper];
    add(charName);

    charDesc = new FlxText(0, 0, panel.width, 'this is a test', 20);
    charDesc.setFormat(Paths.font("ariblk.ttf"), 20, FlxColor.WHITE, FlxAxes.CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    charDesc.updateHitbox();
    charDesc.borderSize = 1;
    charDesc.scrollFactor.set();
    charDesc.antialiasing = true;
    charDesc.cameras = [camUpper];
    add(charDesc);

    topBean = new FlxSprite(30, 100).loadGraphic(Paths.image('menus/shop/bean'));
    topBean.antialiasing = true;
    topBean.cameras = [camUpper];
    topBean.updateHitbox();
    add(topBean);

    upperBar = new FlxSprite(-2, -1.4).loadGraphic(Paths.image('menus/freeplay/topBar'));
    upperBar.antialiasing = true;
    upperBar.updateHitbox();
    upperBar.scrollFactor.set();
    upperBar.cameras = [camUpper];
    add(upperBar);

    crossImage = new FlxSprite(12.50, 8.05).loadGraphic(Paths.image('menus/freeplay/menuBack'));
    crossImage.antialiasing = true;
    crossImage.scrollFactor.set();
    crossImage.updateHitbox();
    crossImage.cameras = [camUpper];
    add(crossImage);

    topBean = new FlxSprite(30, 100).loadGraphic(Paths.image('menus/shop/bean'));
    topBean.antialiasing = true;
    topBean.cameras = [camUpper];
    topBean.updateHitbox();
    add(topBean);	

    beanText = new FlxText(110, 105, 200, '---', 35);
    beanText.setFormat(Paths.font(""), 35, FlxColor.WHITE, FlxAxes.LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    beanText.updateHitbox();
    beanText.borderSize = 3;
    beanText.scrollFactor.set();
    beanText.antialiasing = true;
    beanText.cameras = [camUpper];
    add(beanText);
}

function update(elapsed){
    starFG.x -= 0.06;
    starBG.x -= 0.03;

	if (controls.BACK || FlxG.mouse.justPressedRight) goBack();

    if (FlxG.keys.pressed.E && FlxG.camera.zoom < 3) {
        FlxG.camera.zoom += elapsed * FlxG.camera.zoom;
        if(FlxG.camera.zoom > 3) FlxG.camera.zoom = 3;
    }
    if (FlxG.keys.pressed.Q && FlxG.camera.zoom > 0.1) {
        FlxG.camera.zoom -= elapsed * FlxG.camera.zoom;
        if(FlxG.camera.zoom < 0.1) FlxG.camera.zoom = 0.1;
    }
}

function goBack(){
    FlxG.sound.play(Paths.sound('menu/cancel'));
    FlxG.camera.fade(FlxColor.BLACK, 0.5, false);
    new FlxTimer().start(.25, function(tmr:FlxTimer){FlxG.switchState(new ModState('customStates/AmongMainMenuState'));});
}

function showPanel() FlxTween.tween(panel, {x: FlxG.width * 0.6}, 0.4, {ease: FlxEase.circOut});

function hidePanel() FlxTween.tween(panel, {x: FlxG.width * 1.4}, 0.4, {ease: FlxEase.circIn});