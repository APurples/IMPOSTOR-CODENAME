// makes all of these options automatically set to true on first ever launch

// gameplay options
if (FlxG.save.data.camMove == null) camMove == true;

// visual options
if (FlxG.save.data.midVidCutscene == null) midVidCutscene == true;
if (FlxG.save.data.flashingLights == null) flashingLights == true;
if (FlxG.save.data.screenShake == null) screenShake == true;
if (FlxG.save.data.windowShake == null) windowShake == true;
if (FlxG.save.data.jumpscares == null) jumpscares == true;

// ui/hud options
if (FlxG.save.data.timebar == null) timebar == true;
if (FlxG.save.data.scoreZoom == null) scoreZoom == true;
if (FlxG.save.data.coloredScore == null) coloredScore == true;

function update() if (FlxG.keys.justPressed.F5 && FlxG.save.data.devMode) FlxG.resetState();

static var redirectStates:Map<FlxState, String> = [
    MainMenuState => "customStates/AmongMainMenuState",
];

function preStateSwitch() {
    FlxG.camera.bgColor = 0xFF000000;
    for (redirectState in redirectStates.keys()) 
        if (Std.isOfType(FlxG.game._requestedState, redirectState)) 
            FlxG.game._requestedState = new ModState(redirectStates.get(redirectState));
}

function onDestroy() FlxG.camera.bgColor = 0xFF000000;