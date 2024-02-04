import hxvlc.flixel.FlxVideo;

function postCreate(){
    video = new FlxVideo();
    video.onEndReached.add(video.dispose);
    video.load(Paths.video("midsong/meltdown"));
}

function stepHit() if (curStep == 1152) video.play();