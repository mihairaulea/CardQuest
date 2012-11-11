package view.screens.browser 
{
	import com.greensock.TweenLite;
	import flash.display.Sprite;
	import util.GlobalVariables;
	
	public class Browser extends Sprite
	{
		private var displayArray:Array;
		
		private var screenWidth:Number;
		private var screenHeight:Number;
		
		public var browserWidth:Number;
		public var browserHeight:Number;
		public var gap:Number = 10;
		
		private var nrOfElementsRow:int;
		private var nrOfElementsCol:int;
		
		public var pageIndex:int = 0;
		public var nrOfPages:int = 0;
		
		private var transition:Boolean = false;
		
		public function Browser() 
		{
			screenWidth = GlobalVariables.SCREEN_WIDTH;
			screenHeight = GlobalVariables.SCREEN_HEIGHT;
			
			browserWidth = screenWidth * .8;
			browserHeight = screenHeight * .8;
		}
		
		public function set DisplayArray(array:Array):void
		{
			this.displayArray = array;
		}
		
		public function setBrowser(array:Array, gap:Number = 10):void
		{
			displayArray = array;
			
			const elemWidth = Sprite(array[0]).width;
			const elemHeight = Sprite(array[0]).height;
			
			this.gap = gap;
			
			var row:int = 0;
			var col:int = 0;
			var page:int = 0;
			
			nrOfElementsCol = Math.floor(browserWidth / (elemWidth + gap));
			nrOfElementsRow = Math.floor(browserHeight / (elemHeight + gap)) - 1;
			
			for (var i:int = 0 ; i < array.length; i++)
			{
				Sprite(array[i]).x = (screenWidth - browserWidth) * .1 + elemWidth * col + elemWidth * .5 + col * gap + screenWidth * page;
				Sprite(array[i]).y = (elemHeight + gap) * row + (screenHeight - browserHeight) * .5;
				
				if(col<nrOfElementsCol-1)
					col++;
				else
				{
					col = 0;
					
					if (row < nrOfElementsRow)
						row++;
					else
					{
						row = 0;
						page ++;
					}
				}
			}
			
			nrOfPages = Math.floor(array.length / nrOfElementsCol) ;
		}
		
		public function prevPage():void
		{
			if (pageIndex > 0 && transition == false)
			{
				transition = true;
				for (var i:int = 0; i < displayArray.length; i++)
				{
					var posX:Number = displayArray[i].x + screenWidth;
					TweenLite.to(displayArray[i], 0.4, { x : posX, onComplete : transitionOnComplete } );
				}
				
				pageIndex--;
			}
		}
		
		public function nextPage():void
		{
			if (pageIndex < nrOfPages && transition == false)
			{
				transition = true;
				for (var i:int = 0; i < displayArray.length; i++)
				{	
					var posX:Number = displayArray[i].x - screenWidth;
					TweenLite.to(displayArray[i], 0.4, { x : posX, onComplete : transitionOnComplete } );
				}
				
				pageIndex++;
			}
		}
		
		private function transitionOnComplete():void
		{
			transition = false;
		}
		
		public function firstPage():void
		{
			TweenLite.to(this, 0.4, { x : 0 } );
		}
	}

}