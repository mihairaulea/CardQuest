package view.util 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import view.screens.FeedbackScreen;
	import view.screens.FirstScreen;
	import view.screens.GameScreen;
	import view.screens.LevelBrowser;
	import view.screens.WorldBrowser;

	public class ContentManipulator extends Sprite
	{
		private var currentContent:int = 0;
		private var contentArray:Array = new Array();
		private var contentInitArray:Array = new Array();
		
		private var firstScreen:FirstScreen = new FirstScreen();
		private var worldBrowser:WorldBrowser = new WorldBrowser();
		private var levelBrowser:LevelBrowser = new LevelBrowser();
		private var gameScreen:GameScreen = new GameScreen();
		private var feedbackScreen:FeedbackScreen = new FeedbackScreen();
		
		private var oldContentPointer:ContentRequester;
		private var contentPointer:ContentRequester;
		
		public function ContentManipulator() 
		{
			
		}
		
		public function init():void
		{
			setContent();
			setEventListeners();
		}
		
		private function setContent(defaultScreen:int =0):void
		{
			contentArray[0] = firstScreen;
			contentArray[1] = worldBrowser;
			contentArray[2] = levelBrowser;
			contentArray[3] = gameScreen;
			contentArray[4] = feedbackScreen;
			
			for (var i:int = 0; i < contentArray.length; i++)
			{
				contentArray[i].visible = false;
				addChild(contentArray[i]);
			}
			
			contentPointer = contentArray[defaultScreen];
			contentPointer.visible = true;
			//contentPointer.init(new Object());
			contentPointer.init();
		}
		
		private function setEventListeners():void
		{
			for (var i:int = 0; i < contentArray.length; i++)
			{
				ContentRequester(contentArray[i]).contentId = i;
				ContentRequester(contentArray[i]).addEventListener(ContentRequester.REQUEST_NEW_CONTENT, newContentRequested);
			}
		}
		
		private function newContentRequested(e:Event):void
		{
			oldContentPointer = contentPointer;
			oldContentPointer.visible = false;
			contentPointer = contentArray[ContentRequester(e.target).contentToRequestId];			
			contentPointer.visible = true;
			//contentPointer.init(ContentRequester(e.target).requestObject);
			contentPointer.init();
		}
		
	}

}