package yagerTest.commands.gameplay 
{
	import eu.alebianco.robotlegs.utils.impl.SequenceMacro;
	import eu.alebianco.robotlegs.utils.impl.SubCommandPayload;
	import yagerTest.screens.BasicScreen;
	import yagerTest.screens.gameplay.GameplayScreen;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class StartGameMacro extends SequenceMacro 
	{	
		override public function prepare():void
		{
			add(InitGridCommand);
			add(ShowScreenCommand).withPayloads(
				new SubCommandPayload(new GameplayScreen(), BasicScreen)
			);
		}
	}

}