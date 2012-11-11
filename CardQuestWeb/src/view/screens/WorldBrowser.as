package view.screens 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import util.GlobalVariables;
	import view.screens.browser.Browser;
	import view.screens.browser.WorldVisual;
	import view.util.ArtFactory;
	import view.util.ContentRequester;

	public class WorldBrowser extends ContentRequester
	{
		private var worldArtBd:Array;
		
		private var worldArray:Array;
		private var lockedArray:Array;
		private var page:int = 0;
		
		private var backBtn:Sprite = new Sprite();
		private var prevBtn:Sprite = new Sprite();
		private var nextBtn:Sprite = new Sprite();
		
		private var browser:Browser = new Browser();
		
		public function WorldBrowser() 
		{
			worldArtBd = [
				{title:"Clothes", levels:0, color:0x508907},
				{title:"Food", levels:0, color:0x508907},
				{title:"Beach", levels:0, color:0x508907},
				{title:"Forrest", levels:0, color:0x508907},
				{title:"Winter", levels:0, color:0x508907},
				{title:"Fruit", levels:0, color:0x508907},
				{title:"Animals", levels:0, color:0x508907}
			];
			
			worldArray = new Array();
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
			
			// Init world list
			for (var i:int = worldArtBd.length-1; i >= 0; i--)
			{	
				var wv:WorldVisual = new WorldVisual(0,0,0,0);
				wv.init(worldArtBd[i].title,worldArtBd[i].color);
				addChild(wv);
				
				var locked:Boolean = false
				lockedArray.push(locked);
				
				worldArray.push(wv);
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
			const gapX:Number = screenWidth * 0.05;
			const gapY:Number = screenHeight * 0.05;	
			
			backBtn.x = backBtn.width * .5 + gapX;
			backBtn.y = screenHeight - backBtn.height * .5 - gapY;
			
			prevBtn.x = prevBtn.width * .5 + gapX;
			prevBtn.y = screenHeight * .5;
			
			nextBtn.x = screenWidth - nextBtn.width * .5 - gapX;
			nextBtn.y = prevBtn.y;
			
			// Worlds
			browser.browserWidth = worldArray[0].width * 2 + gapX * 2;
			browser.setBrowser(worldArray,gapX);			
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