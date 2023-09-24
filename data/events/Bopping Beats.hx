var bop;

function onEvent(e:EventGameEvent){
    if (e.event.name == "Bopping Beats"){
        if (e.event.params[0] == true){
            bop = true;
        }
        if(e.event.params[0] == false){
            bop = false;
        }
    }
}

function beatHit(){
    if (bop){
        camZoomingStrength = 0;
        camGame.zoom += 0.015;
        camHUD.zoom += 0.03;
    }
    else{
        camZoomingStrength = 1;
    }
}