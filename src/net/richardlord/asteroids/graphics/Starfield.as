package net.richardlord.asteroids.graphics
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;

	public class Starfield extends Sprite
	{	
		public var bg1:Bitmap = new Bitmap(new Starfield1 as BitmapData);
		
		public function Starfield()
		{
			addChild(bg1);
			bg1.x = 100;
			addChild(bg1);
		}
	}
}