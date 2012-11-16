package view.game 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import util.GlobalVariables;

	public class CardManager extends Sprite
	{
		private var numberOfCards:int = 24;
		
		private var flippedCardsArray:Array;
		private var cardPool:CardPool;
		
		public function CardManager() 
		{
			flippedCardsArray = new Array();
			cardPool = new CardPool();
		}
		
		public function init():void
		{
			addCards();
			draw();
		}
		
		private function draw():void
		{
			const screenWidth:Number = GlobalVariables.SCREEN_WIDTH;
			const screenHeight:Number = GlobalVariables.SCREEN_HEIGHT;
			const gapX:Number = screenHeight * 0.05;
			const gapY:Number = screenHeight * 0.05;
			
			var row:int = 0;
			var col:int = 0;
			for (var i:int = 0; i < flippedCardsArray.length; i++)
			{	
				Sprite(flippedCardsArray[i]).x = (gapX + flippedCardsArray[i].width) *  col;
				Sprite(flippedCardsArray[i]).y = (gapY + flippedCardsArray[i].height) *  row;
				
				col ++;
				
				if (col / 6 == 1)
				{
					col = 0;
					row++;
				}
			}
		}
		
		private function addCards():void
		{
			
			for (var i:int = 0; i < numberOfCards; i++)
			{
				const cardBackData:CardBack = new CardBack();
				const cardBackBm:Bitmap =  new Bitmap(cardBackData);
			
				var cardBack:Sprite = new Sprite();
				cardBack.addChild(cardBackBm);
				//cardBack.visible = false;
				addChild(cardBack);
				
				flippedCardsArray.push(cardBack);
			}
		}
		
	}

}