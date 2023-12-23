import funkin.backend.system.framerate.Framerate;
import flixel.addons.display.FlxBackdrop;

function postCreate(){
    FlxTween.tween(Framerate.offset, {y: pathBG.height}, .75, {ease: FlxEase.elasticOut});
    
    starBG = new FlxBackdrop(Paths.image('menus/starBG'));
	starBG.scrollFactor.set();
    insert(0, starBG);

    starFG = new FlxBackdrop(Paths.image('menus/starFG'));
	starFG.scrollFactor.set();
    insert(0, starFG);
}

function update(){
    // moves the stars to the left
    starFG.x -= 0.06;
    starBG.x -= 0.03;
}