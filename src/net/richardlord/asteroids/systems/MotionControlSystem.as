package net.richardlord.asteroids.systems
{
	import ash.tools.ListIteratingSystem;
	
	import net.richardlord.asteroids.components.Motion;
	import net.richardlord.asteroids.components.MotionControls;
	import net.richardlord.asteroids.components.Position;
	import net.richardlord.asteroids.nodes.MotionControlNode;
	import net.richardlord.input.KeyPoll;
	import net.richardlord.input.MousePoll;


	public class MotionControlSystem extends ListIteratingSystem
	{
		private var keyPoll : KeyPoll;
		private var mousePoll : MousePoll;
		
		public function MotionControlSystem( keyPoll : KeyPoll, mousePoll : MousePoll )
		{
			super( MotionControlNode, updateNode );
			this.keyPoll = keyPoll;
			this.mousePoll = mousePoll;
		}

		private function updateNode( node : MotionControlNode, time : Number ) : void
		{
			var control : MotionControls = node.control;
			var position : Position = node.position;
			var motion : Motion = node.motion;
			
			if (control.rotateToMouse)
			{
				position.rotation = mousePoll.angleToMouse(position.position);
			}
			
			if ( keyPoll.isDown( control.left ) )
			{
				position.rotation -= control.rotationRate * time;
			}

			if ( keyPoll.isDown( control.right ) )
			{
				position.rotation += control.rotationRate * time;
			}

			if ( mousePoll.isMouseDown() )
			{
				var mouseDistanceModifier:Number = mousePoll.mouseDistanceFromCenter() * control.accelerationRate;
				motion.velocity.x += Math.cos( mousePoll.mouseToCenter() ) * mouseDistanceModifier * time;
				motion.velocity.y += Math.sin( mousePoll.mouseToCenter() ) * mouseDistanceModifier * time;
			}
		}
	}
}
