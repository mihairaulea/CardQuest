package view.screens 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import util.GlobalVariables;
	import view.screens.browser.Browser;
	import view.screens.browser.LevelVisual;
	import view.util.ContentRequester;

	public class LevelBrowser extends ContentRequester
	{
		private var levelsArray:Array;
		
		private var levelsVisualArray:Array;
		private var lockedArray:Array;
		
		private var backBtn:Sprite = new Sprite();
		private var prevBtn:Sprite = new Sprite();
		private var nextBtn:Sprite = new Sprite();
		
		private var browser:Browser = new Browser();
		
		public function LevelBrowser() 
		{
			levelsArray = new Array();

			levelsArray.push(1, 2, 3, 4, 5, 6, 7, 8);
			
			levelsVisualArray = new Array();
			lockedArray = new Array();
			
			
		}
		
		override public function init():void
		{
			// Buttons
			const backBtnData:BackBtn = new BackBtn();
			const backBtnBm:Bitmap = new Bitmap(backBtnData);
			backBtn.addChild(backBtnBm);
			backBtnBm.x = -backBtnBm.width * .5;
			backBtnBm.y = -backBtnBm.height * .5;
			
			const prevBtnData:PrevBtn = new PrevBtn();
			const prevBtnBm:Bitmap = new Bitmap(prevBtnData); 
			prevBtn.addChild(prevBtnBm);
			prevBtnBm.x = -prevBtnBm.width * .5;
			prevBtnBm.y = -prevBtnBm.height * .5;
			
			const nextBtnData:NextBtn = new NextBtn();
			const nextBtnBm:Bitmap = new Bitmap(nextBtnData);
			nextBtn.addChild(nextBtnBm);
			nextBtnBm.x = -nextBtnBm.width * .5;
			nextBtnBm.y = -nextBtnBm.height * .5;
			
			// Init level list
			for (var i:int = levelsArray.length -1; i >= 0; i--)
			{
				var lv:LevelVisual = new LevelVisual(0);
				addChild(lv);
				
				var locked:Boolean = false;
				lockedArray.push(locked);
				
				levelsVisualArray.push(lv);
			}
			
			draw();
			
			addChild(backBtn);
			addChild(prevBtn);
			addChild(nextBtn);
			
			backBtn.addEventListener(MouseEvent.CLICK, backBtnClickHandler);
			prevBtn.addEventListener(MouseEvent.CLICK, prevBtnClickHandler);
			nextBtn.addEventListener(MouseEvent.CLICK, nextBtnClickHandler);
		}
		
		private function draw():void
		{
			const screenWidth:Number = GlobalVariables.SCREEN_WIDTH;
			const screenHeight:Number = GlobalVariables.SCREEN_HEIGHT;
			const gapX:Number = screenWidth * 0.02;
			const gapY:Number = screenHeight * 0.05;	
			
			backBtn.x = backBtn.width * .5 + gapX;
			backBtn.y = screenHeight - backBtn.height * .5 - gapY;
			
			prevBtn.x = prevBtn.width * .5 + gapX;
			prevBtn.y = screenHeight * .5;
			
			nextBtn.x = screenWidth - nextBtn.width * .5 - gapX;
			nextBtn.y = prevBtn.y;

			// Set levels browser
			browser.browserWidth = levelsVisualArray[0].width * 4 + gapX * 4;
			browser.setBrowser(levelsVisualArray, gapX);
		}
		
		private function backBtnClickHandler(e:MouseEvent):void
		{
			requestContent(0);
		}
		
		private function prevBtnClickHandler(e:MouseEvent):void
		{
			browser.prevPage();
		}
		
		private function nextBtnClickHandler(e:MouseEvent):void 
		{
			browser.nextPage();
		}
	}

}