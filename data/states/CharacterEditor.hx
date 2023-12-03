var menumusic = "breakfast";
var volume = 0.5;

function create() FlxG.sound.playMusic(Paths.music(menumusic), volume);

function _file_exit() FlxG.sound.music.stop();