import funkin.backend.utils.NativeAPI;
import lime.graphics.Image;

static var initialized:Bool = false;

function new() {
    // makes all of these options automatically set to their default values
    // gameplay options
    if (FlxG.save.data.camMove == null) FlxG.save.data.camMove = true;
    if (FlxG.save.data.doubleTrails == null) FlxG.save.data.doubleTrails = true;
    if (FlxG.save.data.trailZoom == null) FlxG.save.data.trailZoom = 1;

    // visual options
    if (FlxG.save.data.flashingLights == null) FlxG.save.data.flashingLights = true;
    if (FlxG.save.data.screenShake == null) FlxG.save.data.screenShake = true;
    if (FlxG.save.data.windowShake == null) FlxG.save.data.windowShake = true;
    if (FlxG.save.data.jumpscares == null) FlxG.save.data.jumpscares = true;

    // ui/hud options
    if (FlxG.save.data.scoreZoom == null) FlxG.save.data.scoreZoom = 1;
    if (FlxG.save.data.iconLerp == null) FlxG.save.data.iconLerp = true;
    if (FlxG.save.data.timebar == null) FlxG.save.data.timebar = true;
    if (FlxG.save.data.coloredScore == null) FlxG.save.data.coloredScore = true;

    // Language options
    /*if (FlxG.save.data.indonesian == null) FlxG.save.data.indonesian == false;
    if (FlxG.save.data.swedish == null) FlxG.save.data.swedish == false;*/
    if (FlxG.save.data.arabic == null) FlxG.save.data.arabic = false;

    // other options
    if (FlxG.save.data.warningState == null) FlxG.save.data.warningState = true;

    if (!FlxG.save.data.flixelCursor) FlxG.mouse.useSystemCursor = true;
    else{
        FlxG.mouse.useSystemCursor = false;
        FlxG.mouse.load(Paths.image('cursor'));
    }

    window.title = "Vs Impostor: V4 - Codename Engine";
    window.setIcon(Image.fromBytes(Assets.getBytes(Paths.image('icon'))));
}

static var redirectStates:Map<FlxState, String> = [
    MainMenuState => "customStates/AmongMainMenuState",
    TitleState => "customStates/AmongTitleState",
    // FreeplayState => "customStates/AmongFreeplayState",
];

function update(){
    if (FlxG.save.data.devMode)
        if (FlxG.keys.justPressed.F5)
            FlxG.resetState();
        if (FlxG.keys.justPressed.F6)
            NativeAPI.allocConsole();
}

function preStateSwitch() {
    FlxG.camera.bgColor = 0xFF000000;

	if (!initialized) {
		initialized = true;
		FlxG.game._requestedState = new ModState('customStates/WarningState');
	} else
		for (redirectState in redirectStates.keys())
			if (FlxG.game._requestedState is redirectState)
				FlxG.game._requestedState = new ModState(redirectStates.get(redirectState));
}

function onDestroy()
    FlxG.camera.bgColor = 0xFF000000;