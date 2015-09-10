package net.richardlord.asteroids.graphics
{
	import flash.text.TextFormatAlign;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;

	public class HudView extends Sprite
	{
		private var score : TextField;
		private var lives : TextField;
		private var bombs : TextField;
		
		public function HudView()
		{
			score = createTextField();
			score.x = 480;
			score.y = 5;
			addChild( score );
			
			lives = createTextField();
			lives.x = 0;
			lives.y = 5;
			addChild( lives );
			
			bombs = createTextField();
			bombs.x = 0;
			bombs.y = 400;
			addChild( bombs );
			
			setScore( 0 );
			setLives( 3 ) ;
			setBombs( 3 );
		}
		
		public function setScore( value : int ) : void
		{
			score.text = "SCORE: " + value;
		}
		
		public function setLives( value : int ) : void
		{
			lives.text = "LIVES: " + value;
		}
		
		public function setBombs( value : int ) : void
		{
			bombs.text = "BOMBS: " + value;
		}
		
		private function createTextField() : TextField
		{
			var tf : TextField = new TextField();
			var format : TextFormat = new TextFormat();
			format.align = TextFormatAlign.CENTER;
			format.bold = true;
			format.color = 0xFFFFFF;
			format.font = "Helvetica";
			format.size = 18;
			tf.defaultTextFormat = format;
			tf.selectable = false;
			tf.width = 120;
			return tf;
		}
	}
}
