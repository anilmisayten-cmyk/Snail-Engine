package funkin.ui;

import flixel.FlxG;
import flixel.FlxSprite;
import funkin.input.Controls;
import flixel.util.FlxColor;

class GlobalExitButton extends FlxSprite
{
	public static var clicked:Bool = false;
	
	var isClicking:Bool = false;
	
	public function new()
	{
		super(10, 10);
		
		frames = Paths.getSparrowAtlas('menus/buttons/buttonExit');
		
		animation.addByPrefix('idle', 'buttonExit0000', 24, false);
		animation.addByPrefix('hover', 'buttonExit0001', 24, false);
		animation.addByIndices('click', 'buttonExit', [1, 2], "", 24, false);
		
		animation.play('idle');
		scrollFactor.set();
		
		// Scale it down to fit nicely in the corner (726x470 is too big natively)
		scale.set(0.2, 0.2);
		updateHitbox();
		
		antialiasing = ClientPrefs.globalAntialiasing;
	}
	
	override function update(elapsed:Float)
	{
		super.update(elapsed);
		
		clicked = false;
		
		if (isClicking)
		{
			if (animation.curAnim != null && animation.curAnim.name == 'click' && animation.curAnim.finished)
			{
				isClicking = false;
				clicked = true;
				animation.play('hover');
			}
			return;
		}
		
		if (FlxG.mouse.overlaps(this))
		{
			if (FlxG.mouse.justPressed)
			{
				isClicking = true;
				animation.play('click', true);
				FlxG.sound.play(Paths.sound('cancelMenu'));
			}
			else
			{
				animation.play('hover');
			}
		}
		else
		{
			animation.play('idle');
		}
	}
}
