public var disableGhosts:Bool = false;

var data:Map<Int, {colors:Array<FlxColor>, lastNote:{time:Float, id:Int}}> = [];

function postCreate()
	for (sl in strumLines.members)
		data[strumLines.members.indexOf(sl)] = {
			colors: [for (character in sl.characters) character.iconColor != null ? character.iconColor : switch(sl.data.position) {
				default: 0xFFFF0000;
				case 'boyfriend': 0xFF00FFFF;
			}],

			lastNote: {
				time: -9999,
				id: -1
			}
		};

function onNoteHit(event:NoteHitEvent) {
	if (event.note.isSustainNote) return;

	var target = data[strumLines.members.indexOf(event.note.strumLine)];
	var doDouble = (event.note.strumTime - target.lastNote.time) <= 2 && event.note.noteData != target.lastNote.id;
	target.lastNote.time = event.note.strumTime;
	target.lastNote.id = event.note.noteData;

	if(doDouble && !disableGhosts && FlxG.save.data.doubleTrails)
		for (character in event.characters)
			if (character.visible) doGhostAnim(character, target.colors[event.characters.indexOf(character)]).playAnim(character.getAnimName(), true);
}

var zoomShit = FlxG.save.data.trailZoom;
function doGhostAnim(char:Character, color:FlxColor) {
	camGame.zoom += .015 * zoomShit;
	camHUD.zoom += .03 * zoomShit;

	var trail:Character = new Character(char.x, char.y, char.curCharacter, char.isPlayer);
	trail.color = color;
	insert(members.indexOf(char), trail);
	FlxTween.tween(trail, {alpha: 0}, .75).onComplete = function() {
		trail.kill();
		remove(trail, true);
	};
	if (curStage == "ejected") FlxTween.tween(trail, {y: char.y - 1500}, .85, {ease: FlxEase.cubeOut});
	return trail;
}