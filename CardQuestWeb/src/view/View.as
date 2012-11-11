package view 
{
	import flash.display.Sprite;
	import view.util.ContentManipulator;

	public class View extends Sprite
	{
		
		private var contentManipulator:ContentManipulator;
		
		public function View() 
		{
			
		}
		
		public function init():void
		{
			contentManipulator = new ContentManipulator();
			contentManipulator.init();
			addChild(contentManipulator);
		}
	}

}