function postCreate(){
    if (Options.colorHealthBar){
        if (curStage == "polus"){
            healthBar.createFilledBar(0xFFBB2D30,0xFF31B0D1);
        }
        if (curStage == "toogus"){
            healthBar.createFilledBar(0xFF1F6B2B,0xFF31B0D1);
        }
    }
}