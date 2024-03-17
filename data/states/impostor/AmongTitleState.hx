import funkin.backend.scripting.Script;
import flixel.addons.display.FlxBackdrop;
import flixel.group.FlxSpriteGroup;
import openfl.Assets;

var titleGroup:FlxSpriteGroup;

var textGroup:FlxSpriteGroup;

var pressedEnter:Bool = false;
var skippedIntro:Bool = false;
var transitioning:Bool = false;

var flashTime:Bool = false;

var curWacky:Array<String> = [];

function getIntroTextShit() {
	var fullText:String = Assets.getText(Paths.txt('titlescreen/introText'));

	var firstArray:Array<String> = fullText.split('\n');
	var swagGoodArray:Array<Array<String>> = [];

	for (i in firstArray)
		swagGoodArray.push(i.split('--'));

	return swagGoodArray;
}

function create() {
	CoolUtil.playMenuSong();

	curWacky = getIntroTextShit();

	titleGroup = new FlxSpriteGroup();
	textGroup = new FlxSpriteGroup();

    starBG = new FlxBackdrop(Paths.image('menus/starBG'));
    titleGroup.add(starBG);

    starFG = new FlxBackdrop(Paths.image('menus/starFG'));
	titleGroup.add(starFG);

    logoBl = new FlxSprite(-150, -35);
    logoBl.frames = Paths.getSparrowAtlas('menus/logoBumpin');
    logoBl.animation.addByPrefix('bump', 'logo bumpin', 24);
    logoBl.animation.play('bump');
    logoBl.screenCenter(FlxAxes.X);
    titleGroup.add(logoBl);

    titleText = new FlxSprite(300, FlxG.height * 0.855);
    titleText.frames = Paths.getSparrowAtlas('menus/titleScreen/titleEnter');
    titleText.animation.addByPrefix('idle', "EnterIdle", 24, false);
    titleText.animation.addByPrefix('press', "EnterStart", 24, false);		
    titleText.animation.play('idle');
    titleText.y -= 80;
    titleGroup.add(titleText);

	add(titleGroup);
	titleGroup.alpha = Script.staticVariables.get('skipTitleIntro') ? 1 : 0.001;

	add(textGroup);

	if (Script.staticVariables.get('skipTitleIntro')) finishIntro();
	else createCoolText(['Impostorm', 'APurples']);

    flashTime = false;
}

function update(elapsed:Float){
    starFG.x -= 0.06;
    starBG.x -= 0.02;

	if (controls.ACCEPT && !skippedIntro) finishIntro();
	else if (controls.ACCEPT && skippedIntro && !pressedEnter){
        FlxG.camera.flash(FlxColor.WHITE, 1);
		pressedEnter = transitioning = true;
        titleText.animation.play('press');
		CoolUtil.playMenuSFX(1);
		new FlxTimer().start(1, function() {
			FlxG.switchState(new MainMenuState());
		});
	} else if (controls.ACCEPT && transitioning){
		FlxG.camera.stopFX();
		FlxG.switchState(new MainMenuState());
	}
}

function finishIntro(){
    if (FlxG.save.data.flashingLights) FlxG.camera.flash(FlxColor.WHITE, 4);
	titleGroup.alpha = 1;
	skippedIntro = true;
	deleteCoolText();
}

function beatHit() {
	if (!Script.staticVariables.get('skipTitleIntro') && !skippedIntro){
		switch (curBeat){
            case 1: flashTime = false;
            case 3: addMoreText('Presents');
            case 4: deleteCoolText();
            case 5: createCoolText(["This is a CNE Port"]);
            case 7: addMoreText('to this mod lmfao');
            case 8:
                flash();
                deleteCoolText();
            case 9: createCoolText([curWacky[0]]);
            case 11: addMoreText([curWacky[1]]);
            case 12: deleteCoolText();
            case 13: addMoreText('VS');
            case 14:
                flash();
                addMoreText('Impostor');
            case 15:
                flash();
                addMoreText('Codename Engine');
            case 16:
                finishIntro();
                flashTime = true;
        }
	}
}

function createCoolText(textArray:Array<String>) {
	for (text in textArray) {
		if (text == "" || text == null) continue;
		var money:Alphabet = new Alphabet(0, (textArray.indexOf(text) * 60) + 200, text, true, false);
		money.screenCenter(FlxAxes.X);
		textGroup.add(money);
	}
}

function addMoreText(text:String) {
	var coolText:Alphabet = new Alphabet(0, (textGroup.length * 60) + 200, text, true, false);
	coolText.screenCenter(FlxAxes.X);
	textGroup.add(coolText);
}

function deleteCoolText() {
	while (textGroup.members.length > 0) {
		textGroup.members[0].destroy();
		textGroup.remove(textGroup.members[0], true);
	}
}

function flash(){
    if (FlxG.save.data.flashingLights) FlxG.camera.flash(0x86FF0000, .35);
    FlxG.camera.zoom += 0.045;
    FlxTween.tween(FlxG.camera, {zoom: 1}, .35, {ease: FlxEase.expoOut});
}

function measureHit(){
    if (flashTime) if (curMeasure % 4 == 0) flash();
}