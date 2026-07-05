package funkin.game;

import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import funkin.states.PlayState;

class SongInfoCard extends FlxSpriteGroup
{
	var bg:FlxSprite;
	var songText:FlxText;
	var composerText:FlxText;
	var bpmText:FlxText;

	public function new()
	{
		super();

		bg = new FlxSprite().makeGraphic(350, 120, FlxColor.BLACK);
		bg.alpha = 0.6;
		add(bg);

		songText = new FlxText(10, 10, 330, "Unknown Song", 24);
		songText.setFormat(Paths.font("vcr.ttf"), 24, FlxColor.WHITE, LEFT, OUTLINE, FlxColor.BLACK);
		add(songText);

		composerText = new FlxText(10, 45, 330, "Composer: Unknown", 18);
		composerText.setFormat(Paths.font("vcr.ttf"), 18, FlxColor.WHITE, LEFT, OUTLINE, FlxColor.BLACK);
		add(composerText);

		bpmText = new FlxText(10, 75, 330, "BPM: ???", 18);
		bpmText.setFormat(Paths.font("vcr.ttf"), 18, FlxColor.WHITE, LEFT, OUTLINE, FlxColor.BLACK);
		add(bpmText);

		loadInfo();

		// Set initial position off-screen left, middle of the screen
		x = -400;
		y = (flixel.FlxG.height - bg.height) / 2;
	}

	public function loadInfo()
	{
		if (PlayState.SONG != null) {
			var songName = Paths.sanitize(PlayState.SONG.song);
			var infoPath = Paths.getPath('songs/$songName/info.txt', null, true);

			if (funkin.FunkinAssets.exists(infoPath)) {
				var lines = funkin.utils.CoolUtil.coolTextFile(infoPath);
				
				if (lines.length > 0 && lines[0] != "") songText.text = lines[0];
				if (lines.length > 1 && lines[1] != "") composerText.text = "Composer: " + lines[1];
				
				if (lines.length > 2 && lines[2] != "") {
					bpmText.text = "BPM: " + lines[2];
				}
			} else {
				songText.text = PlayState.SONG.song;
				bpmText.text = "BPM: " + PlayState.SONG.bpm;
			}
		}
	}

	public function animate()
	{
		FlxTween.tween(this, {x: 0}, 1.0, {
			ease: FlxEase.quartOut,
			onComplete: function(twn:FlxTween) {
				FlxTween.tween(this, {x: -400}, 1.0, {
					ease: FlxEase.quartIn,
					startDelay: 3.0
				});
			}
		});
	}
}
