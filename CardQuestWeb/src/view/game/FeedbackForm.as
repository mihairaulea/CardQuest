package view.game 
{
	import flash.display.Sprite;
	import util.GlobalVariables;
	import view.util.ArtFactory;

	public class FeedbackForm extends Sprite
	{
		private var feedbackArt:Sprite;
		private var background:Sprite;
		
		public function FeedbackForm() 
		{
			draw();
			
			addChild(background);
			
			feedbackArt = ArtFactory.createSpriteFromBd(new FeedbackFormArt());
			addChild(feedbackArt);
		}
		
		private function draw():void
		{
			const screenWidth:Number = GlobalVariables.SCREEN_WIDTH; 
			const screenHeight:Number = GlobalVariables.SCREEN_HEIGHT; 
			
			background = ArtFactory.createGradientBox(screenWidth * .7, screenHeight * .7, [0x000000, 0x111111]);
			background.alpha = .4;
			background.x = -background.width * .5;
			background.y = -background.height * .5;			
		}
		
	}

}