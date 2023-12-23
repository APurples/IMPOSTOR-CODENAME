import funkin.game.cutscenes.DialogueCutscene;
import funkin.game.cutscenes.dialogue.DialogueBox;
import flixel.addons.text.FlxTypeText;

// Arabic alignment
function postUpdate() if (subState != null && subState.curLine != null && FlxG.save.data.arabic) subState.dialogueBox.text.alignment = "right";