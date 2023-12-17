import funkin.game.cutscenes.DialogueCutscene;
import funkin.game.cutscenes.dialogue.DialogueBox;
import flixel.addons.text.FlxTypeText;

static public var camMoveOffset:Float = 16;
static var camFollowChars:Bool = true;

function create(){
    camMoveOffset = 16;
    camFollowChars = true;
}

function postUpdate() {
    switch(strumLines.members[curCameraTarget].characters[0].getAnimName()) {
        case "singLEFT": camFollow.x -= camMoveOffset;
        case "singDOWN": camFollow.y += camMoveOffset;
        case "singUP": camFollow.y -= camMoveOffset;
        case "singRIGHT": camFollow.x += camMoveOffset;

        case "singLEFT-alt": camFollow.x -= camMoveOffset;
        case "singDOWN-alt": camFollow.y += camMoveOffset;
        case "singUP-alt": camFollow.y -= camMoveOffset;
        case "singRIGHT-alt": camFollow.x += camMoveOffset;
    }
    
    if (curStage == "toogus" || "chef") camMoveOffset = 14;

    // Arabic alignment
    if (subState != null && subState.curLine != null && FlxG.save.data.arabic) subState.dialogueBox.text.alignment = "right";
}