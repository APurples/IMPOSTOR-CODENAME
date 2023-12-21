import lime.graphics.Image;

static var initialized:Bool = false;

if (FlxG.save.data.uncappedFPS) FlxG.updateFramerate = FlxG.drawFramerate = 999;

function new() {
    // makes all of these options automatically set to their default values
    // gameplay options
    if (FlxG.save.data.camMove == null) FlxG.save.data.camMove = true;

    // visual options
    if (FlxG.save.data.midVidCutscene == null) FlxG.save.data.midVidCutscene = true;
    if (FlxG.save.data.flashingLights == null) FlxG.save.data.flashingLights = true;
    if (FlxG.save.data.screenShake == null) FlxG.save.data.screenShake = true;
    if (FlxG.save.data.windowShake == null) FlxG.save.data.windowShake = true;
    if (FlxG.save.data.jumpscares == null) FlxG.save.data.jumpscares = true;

    // ui/hud options
    if (FlxG.save.data.timebar == null) FlxG.save.data.timebar = true;
    if (FlxG.save.data.coloredScore == null) FlxG.save.data.coloredScore = true;
    if (FlxG.save.data.iconLerp == null) FlxG.save.data.iconLerp = true;
    if (FlxG.save.data.verticalHealthbarAlignment == null) FlxG.save.data.verticalHealthbarAlignment = 1;
    if (FlxG.save.data.playerUnderlay == null) FlxG.save.data.playerUnderlay = 0;
    if (FlxG.save.data.opponentUnderlay == null) FlxG.save.data.opponentUnderlay = 0;

    // Language options
    // if (FlxG.save.data.indonesian == null) indonesian == false;
    // if (FlxG.save.data.swedish == null) swedish == false;
    if (FlxG.save.data.arabic == null) FlxG.save.data.arabic = false;

    // other options
    if (FlxG.save.data.warningState == null) FlxG.save.data.warningState = true;


    if (!FlxG.save.data.flixelCursor) FlxG.mouse.useSystemCursor = true;
    else{
        FlxG.mouse.useSystemCursor = false;
        FlxG.mouse.load(Paths.image('cursor'));
    }
}

static var redirectStates:Map<FlxState, String> = [
    MainMenuState => "customStates/AmongMainMenuState",
    //FreeplayState => "customStates/AmongFreeplayState", - I must uncomment this after demo v1 release
];

function update() if (FlxG.keys.justPressed.F5 && FlxG.save.data.devMode) FlxG.resetState();

function preStateSwitch() {
    window.title = "Vs Impostor: V4 Codename Engine Port";
    window.setIcon(Image.fromBytes(Assets.getBytes(Paths.image('icon'))));
    FlxG.camera.bgColor = 0xFF000000;

	if (!initialized) {
		initialized = true;
		FlxG.game._requestedState = new ModState('customStates/WarningState');
	} else
		for (redirectState in redirectStates.keys())
			if (FlxG.game._requestedState is redirectState)
				FlxG.game._requestedState = new ModState(redirectStates.get(redirectState));
}

function onDestroy() FlxG.camera.bgColor = 0xFF000000;

function onDiscordPresenceUpdate(event) event.cancel(); // disabling for now