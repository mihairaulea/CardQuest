package 
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import net.hires.debug.Stats;
	import util.GlobalVariables;
	
	[SWF(width="800",height="480",frameRate="30",backgroundColor="#FFFFFF")]
	public class Main extends Sprite 
	{
		private var cardQuestMain:CardQuestMain;
		private var stats:Stats;
		
		public function Main():void 
		{
			if (stage)
				init();
			else 
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			this.stage.addEventListener(Event.RESIZE, stage_resizeHandler);
			
			this.stage.align = StageAlign.TOP_LEFT;
			this.stage.scaleMode = StageScaleMode.NO_SCALE;
			
			stats = new Stats();
			addChild(stats);
			
			cardQuestMain = new CardQuestMain();
			cardQuestMain.init();
			addChild(cardQuestMain);
		}
		
		private function stage_resizeHandler(e:Event):void 
		{
			GlobalVariables.SCALE_FACTOR = GlobalVariables.SCREEN_HEIGHT / this.stage.fullScreenHeight;
			GlobalVariables.SCREEN_WIDTH = this.stage.fullScreenWidth;
			GlobalVariables.SCREEN_HEIGHT = this.stage.fullScreenHeight;
		}
		
	}
	
}