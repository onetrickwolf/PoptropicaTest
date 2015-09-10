package net.richardlord.input
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	public class MousePoll
	{
		private var dispObj:DisplayObject;
		private var rotation : Number;
		
		private var mouseDown : Boolean;
		
		public function MousePoll( displayObj:DisplayObject )
		{
			dispObj = displayObj;
			dispObj.addEventListener( MouseEvent.MOUSE_DOWN, mouseDownListener);
			dispObj.addEventListener( MouseEvent.MOUSE_UP, mouseUpListener );
		}
		
		private function mouseDownListener(ev:Event):void
		{
			mouseDown = true;	
		}
		
		private function mouseUpListener(ev:Event):void
		{
			mouseDown = false;
		}
		
		public function isMouseDown() : Boolean
		{
			return mouseDown;
		}
		
		public function angleToMouse(position:Point): Number
		{
			return (Math.atan2(dispObj.mouseY - position.y, dispObj.mouseX - position.x));
		}
		
		public function mouseToCenter(): Number
		{
			return (Math.atan2(dispObj.mouseY - 225, dispObj.mouseX - 300));
		}
		
		public function mouseDistanceFromCenter(): Number
		{
			var dx:Number = dispObj.mouseX - 300;
			var dy:Number = dispObj.mouseY - 225;
			return Math.sqrt(dx * dx + dy * dy);
		}
	}
}