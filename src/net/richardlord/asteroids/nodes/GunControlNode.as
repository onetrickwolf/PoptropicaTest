package net.richardlord.asteroids.nodes
{
	import ash.core.Node;

	import net.richardlord.asteroids.components.Audio;
	import net.richardlord.asteroids.components.Gun;
	import net.richardlord.asteroids.components.GunControls;
	import net.richardlord.asteroids.components.Position;


	public class GunControlNode extends Node
	{
		public var control : GunControls;
		public var gun : Gun;
		public var position : Position;
		public var audio : Audio;
	}
}
