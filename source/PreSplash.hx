package;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.animation.FlxAnimation;
import flixel.sound.FlxSound;

/**
 * Pre-splash state shown before the main Splash screen.
 * Plays the startSplash sprite animation centered on a black background,
 * then immediately switches to the Splash state once the animation finishes.
 */
@:nullSafety(Strict)
class PreSplash extends FlxState
{
	var _cachedAutoPause:Bool = false;
	var _finished:Bool = false;
	var _char:FlxSprite = new FlxSprite();
	var _introSnd:Null<FlxSound> = null;

	override function create()
	{
		_cachedAutoPause = FlxG.autoPause;
		FlxG.autoPause = false;

		// Pure black background
		cameras[0].bgColor = 0xFF000000;

		// Load the pre-splash animated sprite from the sparrow atlas
		_char = new FlxSprite();
		_char.frames = Paths.getSparrowAtlas('branding/preSplash/startSplash', null, true, false);
		_char.animation.addByPrefix('play', 'start', 24, false);
		_char.animation.play('play');

		// Play the unlock sound immediately — same frame as the animation, zero delay.
		// persist = true so it survives the state switch to Splash without cutting off.
		FlxG.sound.volume = 1;
		_introSnd = FlxG.sound.play(Paths.sound('CS_unlock'));
		if (_introSnd != null) _introSnd.persist = true;
		_char.antialiasing = true;

		// Center on screen once hitbox is known
		_char.updateHitbox();
		_char.screenCenter();

		add(_char);

		super.create();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (_char != null)
		{
			// Keep centered in case of resize
			_char.updateHitbox();
			_char.screenCenter();

			// Skip on SPACE or ENTER
			if (!_finished && (FlxG.keys.justPressed.SPACE || FlxG.keys.justPressed.ENTER))
			{
				_finish();
				return;
			}

			// Auto-finish when animation completes
			if (!_finished)
			{
				final anim:Null<FlxAnimation> = _char.animation.curAnim;
				if (anim != null && anim.finished)
				{
					_finish();
				}
			}
		}
	}

	function _finish()
	{
		if (_finished) return;
		_finished = true;

		FlxG.autoPause = _cachedAutoPause;

		// Go to the main Splash (which then goes to TitleState),
		// or skip straight to initialState if skipSplash is on.
		if (Main.startMeta.skipSplash)
			FlxG.switchState(() -> Type.createInstance(Main.startMeta.initialState, []));
		else
			FlxG.switchState(() -> new Splash());
	}
}
