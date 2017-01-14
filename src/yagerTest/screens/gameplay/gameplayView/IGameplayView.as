package yagerTest.screens.gameplay.gameplayView 
{
	import flash.geom.Point;
	import org.osflash.signals.Signal;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public interface IGameplayView 
	{
		function get moveRequestSignal():Signal;
		function movePlayer(path:Vector.<Point>):void;
	}
	
}