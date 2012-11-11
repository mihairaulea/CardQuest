package  
{
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
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
			
			var quad:Quad = new Quad(160, 120, 0xBBDDFF);
			addChild(quad);
			quad.x = (this.stage.stageWidth - quad.width) * .5
			quad.y = 0;
		}
		
	}

}