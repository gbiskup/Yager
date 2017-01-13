package yagerTest.factories.gameObjects 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author gbiskup
	 */
	public class ActorsFactory 
	{
		public static function createAvatar(color:uint, radius:Number):Sprite
		{
			var sprite:Sprite = new Sprite();
			sprite.graphics.beginFill(color);
			sprite.graphics.drawCircle( 0, 0, radius);
			sprite.graphics.endFill();
			return sprite;
		}
		
	}

}