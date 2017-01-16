package yagerTest.screens.gameplay 
{
	import robotlegs.bender.bundles.mvcs.Mediator;
	import robotlegs.bender.framework.api.IInjector;
	import yagerTest.commands.gameplay.ExitGameMacro;
	import yagerTest.model.GameObjectTypes;
	import yagerTest.model.GridModel;
	import yagerTest.screens.mainMenu.UserActions;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class GameplayScreenMediator extends Mediator 
	{
		[Inject]
		public var view:IGameplayScreen;
		
		[Inject]
		public var gridModel:GridModel;
		
		[Inject]
		public var injector:IInjector;
		
		override public function initialize():void
		{
			view.userActionSignal.add(onUserAction);
			showGrid();
			view.start(20.0);
		}
		
		override public function destroy():void
		{
			view.userActionSignal.remove(onUserAction);
			super.destroy();
		}
		
		private function onUserAction(actionType:String):void 
		{
			switch(actionType)
			{
				case UserActions.EXIT_GAME:
					var exitMacro:ExitGameMacro = injector.instantiateUnmapped(ExitGameMacro);
					exitMacro.execute();
					break;
					
				case UserActions.RESTART_GAME:
					break;
			}
		}
		
		private function showGrid():void
		{
			view.initGrid(gridModel.width, gridModel.height);
		}
	}

}