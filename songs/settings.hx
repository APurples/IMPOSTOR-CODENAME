// has (some) settings code here

public inline var bfColor;
public inline var dadColor;

public var underlay:FlxSprite;
public var opponentUnderlay:FlxSprite;

function postCreate(){
    if (Options.colorHealthBar){
        bfColor = (boyfriend != null && boyfriend.xml != null && boyfriend.xml.exists("color")) ? CoolUtil.getColorFromDynamic(boyfriend.xml.get("color")) : 0xFF66FF33;
        dadColor = (dad != null && dad.xml != null && dad.xml.exists("color")) ? CoolUtil.getColorFromDynamic(dad.xml.get("color")) : 0xFFFF0000;
    
        healthBar.createFilledBar(dadColor, bfColor);

        if (FlxG.save.data.coloredScore){
            for (i in [missesTxt, accuracyTxt, scoreTxt]){
                if (!PlayState.opponentMode) i.color = dadColor;
                else i.color = bfColor;
            }
        }
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
}