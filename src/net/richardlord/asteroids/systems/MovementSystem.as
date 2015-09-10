package net.richardlord.asteroids.systems
{
	
	import ash.tools.ListIteratingSystem;
	
	import net.richardlord.asteroids.EntityCreator;
	import net.richardlord.asteroids.GameConfig;
	import net.richardlord.asteroids.components.Motion;
	import net.richardlord.asteroids.components.Position;
	import net.richardlord.asteroids.nodes.MovementNode;
	import net.richardlord.input.MousePoll;
	
	
	public class MovementSystem extends ListIteratingSystem
	{
		private var config : GameConfig;
		private var mousePoll : MousePoll;
		private var creator:EntityCreator;
		
		public function MovementSystem( config : GameConfig , mousePoll : MousePoll, creator : EntityCreator)
		{
			this.config = config;
			this.mousePoll = mousePoll;
			this.creator = creator;
			
			super( MovementNode, updateNode );
		}
		
		private function updateNode( node : MovementNode, time : Number ) : void
		{
			var position : Position = node.position;
			var motion : Motion = node.motion;
			
			var destroyDistance : Number = 200;
			var createDistance : Number = 50;
			
			position = node.position;
			motion = node.motion;
			position.position.x += motion.velocity.x * time;
			position.position.y += motion.velocity.y * time;
			
			if(node.entity.name != "starfield"){
				if ( position.position.x + destroyDistance < 0 )
				{
					creator.destroyEntity( node.entity );
					creator.createAsteroid( 30, config.width + createDistance, Math.random() * config.height );
				}
				if ( position.position.x - destroyDistance > config.width )
				{
					creator.destroyEntity( node.entity );
					creator.createAsteroid( 30, -1 * createDistance, Math.random() * config.height );
				}
				if ( position.position.y + destroyDistance < 0 )
				{
					creator.destroyEntity( node.entity );
					creator.createAsteroid( 30, Math.random() * config.width, config.height + createDistance );
				}
				if ( position.position.y - destroyDistance > config.height )
				{
					creator.destroyEntity( node.entity );
					creator.createAsteroid( 30, Math.random() * config.width, -1 * createDistance);
				}
			}
			else
			{
				if ( position.position.x + 1000 < 0 )
				{
					position.position.x = config.width;
				}
				if ( position.position.x > config.width )
				{
					position.position.x = -1000;
				}
				if ( position.position.y + 800 < 0 )
				{
					position.position.y = config.height;
				}
				if ( position.position.y > config.height )
				{
					position.position.y = -800;
				}
			}
			
			position.rotation += motion.angularVelocity * time;
			if ( motion.damping > 0 )
			{
				var xDamp : Number = Math.abs( Math.cos( mousePoll.mouseToCenter() ) * motion.damping * time );
				var yDamp : Number = Math.abs( Math.sin( mousePoll.mouseToCenter() ) * motion.damping * time );
				if ( motion.velocity.x > xDamp )
				{
					motion.velocity.x -= xDamp;
				}
				else if ( motion.velocity.x < -xDamp )
				{
					motion.velocity.x += xDamp;
				}
				else
				{
					motion.velocity.x = 0;
				}
				if ( motion.velocity.y > yDamp )
				{
					motion.velocity.y -= yDamp;
				}
				else if ( motion.velocity.y < -yDamp )
				{
					motion.velocity.y += yDamp;
				}
				else
				{
					motion.velocity.y = 0;
				}
			}
		}
	}
}
