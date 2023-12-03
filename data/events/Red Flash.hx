function onEvent(e:EventGameEvent){
    if (e.event.name == "Red Flash"){
        camGame.zoom += 0.015;
        camHUD.zoom += 0.03;
        if (FlxG.save.data.flashingLights) camGame.flash(0xADFF0000, e.event.params[0]);
    }
}