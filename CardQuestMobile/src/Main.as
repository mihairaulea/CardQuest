package 
{
	import flash.desktop.NativeApplication;
	import flash.events.Event;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.geom.Rectangle;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	import net.hires.debug.Stats;
	import starling.core.Starling;
	import util.GlobalVariables;
	
	public class Main extends Sprite 
	{
		private var starling:Starling;
		private var stats:Stats;
		
		public function Main():void 
		{
			// Splash screen (Android?)
			this.addEventListener(Event.ADDED_TO_STAGE, initSplash);
			
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			
		}
		
		private function initSplash(e:Event):void
		{
			// Debug until splash screen
			loaderInfo.addEventListener(Event.COMPLETE, loader_infoCompleteHandler);
		}
		
		private function loader_infoCompleteHandler(e:Event):void
		{
			// General properties
			Starling.handleLostContext = true; 
			Starling.multitouchEnabled = true;
			
			// Debug stats
			//this.stats = new Stats();
			//addChild(stats);
			
			// Init starling
			this.starling = new Starling(CardQuestMain, this.stage);
			this.starling.simulateMultitouch = true; // debug multitouch
			this.starling.enableErrorChecking = false;
			this.starling.start();
			
			this.stage.addEventListener(Event.RESIZE, stage_resizeHandler, false, int.MAX_VALUE, true);
			this.stage.addEventListener(Event.DEACTIVATE, stage_deactivateHandler, false, 0, true);			
		}
		
		private function stage_resizeHandler(event:Event):void
		{
			// Creating a suitable viewport
			var screenWidth:int = stage.fullScreenWidth;
			var screenHeight:int = stage.fullScreenHeight;
			var viewPort:Rectangle = new Rectangle();
			
			if (stage.fullScreenHeight / stage.fullScreenWidth < GlobalVariables.ASPECT_RATIO)
            {
                viewPort.height = screenHeight;
                viewPort.width  = int(viewPort.height / GlobalVariables.ASPECT_RATIO);
                viewPort.x = int((screenWidth - viewPort.width) / 2);
            }
            else
            {
                viewPort.width = screenWidth; 
                viewPort.height = int(viewPort.width * GlobalVariables.ASPECT_RATIO);
                viewPort.y = int((screenHeight - viewPort.height) / 2);
            }
			
			try
			{
				this.starling.viewPort = viewPort;
			}
			catch (error:Error) { }
			
		}
		
		private function stage_deactivateHandler(event:Event):void
		{
			this.starling.stop();
			this.stage.addEventListener(Event.ACTIVATE, stage_activateHandler, false, 0, true);
		}
		
		private function stage_activateHandler(event:Event):void
		{
			this.stage.removeEventListener(Event.ACTIVATE, stage_activateHandler);
			this.starling.start();
		}
		
	}
	
}