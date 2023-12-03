// i got lazy lol

var wall:FlxSprite;
var floor:FlxSprite;
var backshit:FlxSprite;
var oven:FlxSprite;
var gray:FlxSprite;
var saster:FlxSprite;
var frontable:FlxSprite;

function create(){
    wall = new FlxSprite(0, 0).loadGraphic(Paths.image('stages/kitchen/Back Wall Kitchen'));
    wall.antialiasing = true;
    wall.scrollFactor.set(1, 1);
    wall.setGraphicSize(Std.int(wall.width * 0.8));
    wall.active = false;
    insert(members.indexOf(dad), wall);
    add(wall);

    floor = new FlxSprite(-850, 1000).loadGraphic(Paths.image('stages/kitchen/Chef Floor'));
    floor.antialiasing = true;
    floor.scrollFactor.set(1, 1);
    floor.active = false;
    insert(members.indexOf(dad), floor);
    add(floor);

    backshit = new FlxSprite(-50, 170).loadGraphic(Paths.image('stages/kitchen/Back Table Kitchen'));
    backshit.antialiasing = true;
    backshit.scrollFactor.set(1, 1);
    backshit.setGraphicSize(Std.int(backshit.width * 0.8));
    backshit.active = false;
    insert(members.indexOf(dad), backshit);
    add(backshit);

    oven = new FlxSprite(1600, 400).loadGraphic(Paths.image('stages/kitchen/oven'));
    oven.antialiasing = true;
    oven.scrollFactor.set(1, 1);
    oven.setGraphicSize(Std.int(oven.width * 0.8));
    oven.active = false;
    insert(members.indexOf(dad), oven);
    add(oven);

    gray = new FlxSprite(1000, 525);
    gray.frames = Paths.getSparrowAtlas('stages/kitchen/Boppers');
    gray.animation.addByPrefix('bop', 'grey', 24, false);
    gray.animation.play('bop');
    gray.antialiasing = true;
    gray.scrollFactor.set(1, 1);
    gray.setGraphicSize(Std.int(gray.width * 0.8));
    gray.active = true;
    insert(members.indexOf(dad), gray);
    add(gray);
    if (!Options.lowMemoryMode) add(gray);

    saster = new FlxSprite(1300, 525);
    saster.frames = Paths.getSparrowAtlas('stages/kitchen/Boppers');
    saster.animation.addByPrefix('bop', 'saster', 24, false);
    saster.animation.play('bop');
    saster.antialiasing = true;
    saster.scrollFactor.set(1, 1);
    saster.setGraphicSize(Std.int(saster.width * 1.2));
    saster.active = true;
    insert(members.indexOf(dad), saster);
    if (!Options.lowMemoryMode) add(saster);

    frontable = new FlxSprite(800, 700).loadGraphic(Paths.image('stages/kitchen/Kitchen Counter'));
    frontable.antialiasing = true;
    frontable.scrollFactor.set(1, 1);
    frontable.active = false;
    insert(members.indexOf(dad), frontable);
    add(frontable);

    chefBluelight = new FlxSprite(0, -300).loadGraphic(Paths.image('stages/kitchen/bluelight'));
    chefBluelight.antialiasing = true;
    chefBluelight.scrollFactor.set(1, 1);
    chefBluelight.active = false;
    if (!Options.lowMemoryMode) add(chefBluelight);

    chefBlacklight = new FlxSprite(0, -300).loadGraphic(Paths.image('stages/kitchen/black_overhead_shadow'));
    chefBlacklight.antialiasing = true;
    chefBlacklight.scrollFactor.set(1, 1);
    chefBlacklight.active = false;
    if (!Options.lowMemoryMode) add(chefBlacklight);
}

function update(){
    if (PlayState.opponentMode) comboGroup.x = 1125;
    if (PlayState.coopMode) comboGroup.x = 1250;
}

function beatHit(){
    if (curBeat % 2 == 0){
        gray.animation.play('bop');
        saster.animation.play('bop');
    }
}