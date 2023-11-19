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