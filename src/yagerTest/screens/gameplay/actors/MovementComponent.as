package yagerTest.screens.gameplay.actors 
{
	import com.gskinner.motion.GTween;
	import flash.display.DisplayObject;
	import flash.geom.Point;
	import yagerTest.screens.gameplay.gameplayView.GridPositionHelper;
	/**
	 * ...
	 * @author gbiskup
	 */
	public class MovementComponent 
	{
		private var target:DisplayObject;
		
		private var currentPath:Vector.<Point>;
		private var tileSize:Number;
		private var speed:Number;
		
		private var moveTween:GTween;
		
		public function MovementComponent(target:DisplayObject, tileSize:Number, speed:Number) 
		{
			this.target = target;
			this.tileSize = tileSize;
			this.speed = speed;
			moveTween = new GTween(target);
		}
		
		public function followPath(path:Vector.<Point>):void
		{
			currentPath = path;
			moveToNextPoint();
		}
		
		private function moveToNextPoint():void
		{
			moveToPoint(currentPath.shift());
		}
		
		private function moveToPoint(gridPosition:Point):void
		{
			if (gridPosition)
			{
				var pixelPosition:Point = GridPositionHelper.gridToPixelPosition(gridPosition, tileSize, tileSize);
				moveTween.setValues({x:pixelPosition.x, y:pixelPosition.y});
				moveTween.duration = 1.0;
				moveTween.onComplete = onMoveTweenComplete;
			}
		}
		
		private function onMoveTweenComplete(tween:GTween):void
		{
			moveToNextPoint();
		}
		
	}

}