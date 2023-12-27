function postCreate() {
    var bfColor = (boyfriend != null && boyfriend.xml != null && boyfriend.xml.exists("color")) ? CoolUtil.getColorFromDynamic(boyfriend.xml.get("color")) : 0xFF66FF33;
    var dadColor = (dad != null && dad.xml != null && dad.xml.exists("color")) ? CoolUtil.getColorFromDynamic(dad.xml.get("color")) : 0xFFFF0000;

    healthBar.createFilledBar(dadColor, bfColor);

    if (FlxG.save.data.coloredScore) for (i in [missesTxt, accuracyTxt, scoreTxt, hudTxt]){
        if (PlayState.opponentMode) i.color = bfColor;
        else i.color = dadColor;
    }
}