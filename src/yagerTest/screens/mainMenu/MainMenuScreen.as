package yagerTest.screens.mainMenu 
{
	import com.sibirjak.asdpc.button.Button;
	import com.sibirjak.asdpc.core.constants.Position;
	import flash.geom.Point;
	import yagerTest.screens.BasicScreen;
	import yagerTest.factories.uiComponents.ButtonFactory;
	import yagerTest.signals.StringSignal;
	import yagerTest.view.AlignDisplayObject;
	import yagerTest.view.uiComponents.MyVerticalMenu;
	import yagerTest.factories.uiComponents.MenuFactory;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class MainMenuScreen extends BasicScreen implements IMainMenuScreen
	{
		private var menu:MyVerticalMenu;
		
		private var _userActionSignal:StringSignal = new StringSignal();
		
		public function MainMenuScreen() 
		{
			super();
		}
		
		override protected function init():void
		{
			super.init();
			initMenu();
		}
		
		private function initMenu():void
		{
			menu = MenuFactory.craeteVerticalMenu();
			menu.addButton(ButtonFactory.createTextButton("Play", onPlayButton));
			menu.addButton(ButtonFactory.createTextButton("Credits", onCreditsButton));
			addChild(menu);
			AlignDisplayObject.rightBottom(
				menu, 
				getBounds(this), 
				new Point(-MenuFactory.defaultPadding.x, -MenuFactory.defaultPadding.y)
			);
		}
		
		private function onPlayButton():void
		{
			userActionSignal.dispatch(MainMenuUserActions.START_GAME);
		}
		
		private function onCreditsButton():void
		{
			userActionSignal.dispatch(MainMenuUserActions.SHOW_CREDITS);
		}
		
		public function get userActionSignal():StringSignal 
		{
			return _userActionSignal;
		}
		
	}

}