function create(){
    saxguy = new FlxSprite(-300, 200);
	saxguy.frames = Paths.getSparrowAtlas('stages/toogus/cyan_toogus');
	saxguy.animation.addByPrefix('POP OFF CYAN', 'Cyan Dancy', 24, true);
	saxguy.antialiasing = true;
	saxguy.scrollFactor.set(1, 1);
    saxguy.alpha = 0;
    add(saxguy);
}