// basically the stuff for the custom options

public var bfColor;
public var dadColor;

public var underlay:FlxSprite;
public var opponentUnderlay:FlxSprite;

function postCreate(){
    if (Options.colorHealthBar){
        bfColor = (boyfriend != null && boyfriend.xml != null && boyfriend.xml.exists("color")) ? CoolUtil.getColorFromDynamic(boyfriend.xml.get("color")) : 0xFF66FF33;
        dadColor = (dad != null && dad.xml != null && dad.xml.exists("color")) ? CoolUtil.getColorFromDynamic(dad.xml.get("color")) : 0xFFFF0000;
    
        healthBar.createFilledBar(dadColor, bfColor);

        if (FlxG.save.data.coloredScore){
            if (!PlayState.opponentMode){
                missesTxt.color = dadColor;
                accuracyTxt.color = dadColor;
                scoreTxt.color = dadColor;
            }else{
                missesTxt.color = bfColor;
                accuracyTxt.color = bfColor;
                scoreTxt.color = bfColor;
            }
        }
    }

    underlay = new FlxSprite().makeGraphic(FlxG.width / 2.75, FlxG.height);
    if (!FlxG.save.data.middlescroll) underlay.x = 725;
    else underlay.screenCenter();
    underlay.cameras = [camHUD];
    underlay.alpha = FlxG.save.data.playerUnderlay;
    if (FlxG.save.data.playerUnderlay != 0) insert(1, underlay);

    if (PlayState.opponentMode) underlay.x = 85;

    opponentUnderlay = new FlxSprite().makeGraphic(FlxG.width / 2.75, FlxG.height);
    if (!FlxG.save.data.middlescroll) opponentUnderlay.x = 85;
    else opponentUnderlay.x = 69420;
    opponentUnderlay.cameras = [camHUD];
    opponentUnderlay.alpha = FlxG.save.data.opponentUnderlay;
    if (FlxG.save.data.opponentUnderlay != 0) insert(1, opponentUnderlay);

    if (PlayState.coopMode){
        underlay.color = bfColor;
        opponentUnderlay.color = dadColor;
    }else{
        underlay.color = opponentUnderlay.color = 0xFF000000;
    }

    if (FlxG.save.data.noMoreSplashes) splashHandler.visible = false;

    if (FlxG.save.data.cutsceneFreeplay) playCutscenes = true;
}

function onPlayerHit(a){
    if (FlxG.save.data.hitsound){
        if (!a.note.isSustainNote) FlxG.sound.play(Paths.sound('hitsound'), 0.2);
    }
}

function onCountdown(event:CountdownEvent) {
    if (FlxG.save.data.middlescroll){
        if (!PlayState.coopMode){
            if (event.swagCounter == 0){
                if (!PlayState.opponentMode){
                    for (i in playerStrums.members) i.x -= 320;
                    for (i in cpuStrums.members) i.x -= 5000;
                }else{
                    for (i in playerStrums.members) i.x -= 5000;
                    for (i in cpuStrums.members) i.x += 320;
                }
            }
        }
    }

    if (!PlayState.coopMode){
        if (FlxG.save.data.opponentNotes){
            if (!PlayState.opponentMode){
                for (i in cpuStrums.members) i.x -= 5000;
            }else{
                for (i in playerStrums.members) i.x -= 5000;
            }
        }
    }
}