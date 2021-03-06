package yagerTest.screens.gameplay 
{
	import robotlegs.bender.bundles.mvcs.Mediator;
	import robotlegs.bender.extensions.directCommandMap.api.IDirectCommandMap;
	import robotlegs.bender.framework.api.IInjector;
	import yagerTest.commands.gameplay.ExitGameMacro;
	import yagerTest.commands.gameplay.StartGameMacro;
	import yagerTest.model.GameplayModel;
	import yagerTest.screens.mainMenu.UserActions;
	import yagerTest.view.basicViewComponent.IViewComponent;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class GameplayScreenMediator extends Mediator 
	{
		[Inject]
		public var view:IGameplayScreen;
		
		[Inject]
		public var gameplayModel:GameplayModel;
		
		[Inject]
		public var injector:IInjector;
		
		[Inject]
		public var commandMap:IDirectCommandMap;
		
		override public function initialize():void
		{
			super.initialize();
			view.userActionSignal.add(onUserAction);
			view.initializedSignal.add(onViewInitialized);
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
					commandMap.map(ExitGameMacro).execute();
					break;
					
				case UserActions.RESTART_GAME:
					commandMap.map(StartGameMacro).execute();
					break;
			}
		}
		
		private function onViewInitialized(viewComponent:IViewComponent):void
		{
			viewComponent.initializedSignal.remove(onViewInitialized);
			view.initGameplay(gameplayModel);
		}
	
	}

}