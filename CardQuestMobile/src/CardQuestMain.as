package  
{
	import starling.core.Starling;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import util.Assets;
	import util.GlobalVariables;
	import view.View;
	
	public class CardQuestMain extends Sprite
	{
		private var viewComponent:View = new View();
		
		public function CardQuestMain() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
		}
		
		private function addedToStageHandler(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
			init();
		}
		
		private function init():void
		{
			// Set stage size
			stage.stageWidth = GlobalVariables.STAGE_WIDTH;
			stage.stageHeight = GlobalVariables.STAGE_HEIGHT;
			
			Assets.contentScaleFactor = Starling.current.contentScaleFactor; 
			
			addChild(viewComponent);
		}
		
	}

}