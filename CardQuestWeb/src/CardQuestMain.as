package  
{
	import flash.display.Sprite;
	import util.IterableClasses;
	import view.View;
	
	public class CardQuestMain extends Sprite
	{
		private var viewInstance:View;
		
		public function CardQuestMain() 
		{
			
		}
		
		public function init():void
		{
			// Reference the IterableClasses class so the compiler knows 
			//to include those classes for reference later
			IterableClasses;
			
			viewInstance = new View();
			viewInstance.init();
			addChild(viewInstance);
		}
		
	}

}