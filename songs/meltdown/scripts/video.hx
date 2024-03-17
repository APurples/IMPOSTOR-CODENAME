importScript("data/scripts/videosprite");

function postCreate(){
    newVideo.scale.set(0.7, 0.7);
    newVideo.x -= 300;
    newVideo.y -= 200;
}

function stepHit()
    if (curStep == 1152)
        playVideo(false);