import funkin.backend.system.framerate.Framerate;
import flixel.addons.display.FlxBackdrop;

function postCreate(){
    FlxTween.tween(Framerate.offset, {y: pathBG.height}, .75, {ease: FlxEase.elasticOut});

    for (option in main.members) if (option.desc == "Modify mod options here") main.members.remove(option);

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
}

function update(){
    // moves the stars to the left
    starFG.x -= 0.06;
    starBG.x -= 0.03;
}

function exit(){
    if (WarningState.optionsPressed){
        FlxG.switchState(new ModState('customStates/WarningState'));
        WarningState.optionsPressed = false;
    }
}