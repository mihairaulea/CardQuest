package view.game 
{
	import com.greensock.TweenLite;
	import flash.display.Sprite;
	import flash.text.TextField;
	import util.GlobalVariables;
	import view.util.ArtFactory;
	
	public class IngameMenu extends Sprite
	{
		private var background:Sprite;
		
		private var nextBtn:Sprite;
		private var prevBtn:Sprite;
		private var menuBtn:Sprite;
		private var statsBtn:Sprite;
		
		private var hidePos:Number;
		private var showPos:Number;
		
		public var active:Boolean = false;
		
		public function IngameMenu() 
		{
			nextBtn = new Sprite();
			prevBtn = new Sprite();
			menuBtn = new Sprite();
			statsBtn = new Sprite();
			
			var statsBtnTxt:TextField = ArtFactory.createShadowText("Check your stats", 22, 0xFFFFFF, 0x665390);
			statsBtn.addChild(statsBtnTxt);
			statsBtnTxt.x = 0;
			statsBtnTxt.y = 0;
			
			var nextBtnTxt:TextField = ArtFactory.createShadowText("Next Level", 22, 0xFFFFFF, 0x665390);
			nextBtn.addChild(nextBtnTxt);
			nextBtnTxt.x = 0;
			nextBtnTxt.y = 0;
			
			var prevBtnTxt:TextField = ArtFactory.createShadowText("Previous Level", 22, 0xFFFFFF, 0x665390);
			prevBtn.addChild(prevBtnTxt);
			prevBtnTxt.x = 0;
			prevBtnTxt.y = 0;
			
			var menuBtnTxt:TextField = ArtFactory.createShadowText("Main Menu", 22, 0xFFFFFF, 0x665390);
			menuBtn.addChild(menuBtnTxt);
			menuBtnTxt.x = 0;
			menuBtnTxt.y = 0;
			
			draw();
			
			addChild(background);
			addChild(statsBtn);
			addChild(nextBtn);
			addChild(prevBtn);
			addChild(menuBtn);
		}
		
		private function draw():void
		{
			const screenWidth:Number = GlobalVariables.SCREEN_WIDTH; 
			const screenHeight:Number = GlobalVariables.SCREEN_HEIGHT;
			
			background = ArtFactory.createGradientBox(screenWidth * .25, screenHeight * .4, [0x000000, 0x111111]);
			background.alpha = .4;
			
			const gap:Number = background.width * 0.05;
			
			statsBtn.x = (background.width - statsBtn.width) * .5;
			statsBtn.y = gap;
			
			nextBtn.x = (background.width - nextBtn.width) * .5;
			nextBtn.y = statsBtn.y + statsBtn.height + gap;
			
			prevBtn.x = (background.width - prevBtn.width) * .5;
			prevBtn.y = nextBtn.y + nextBtn.height + gap;
			
			menuBtn.x = (background.width - menuBtn.width) * .5;
			menuBtn.y = prevBtn.y + prevBtn.height + gap;
			
			hidePos = screenWidth;
		}
		
		public function setPositions(show:Number, hide:Number):Number
		{
			var difference:Number;
			
			showPos = show;
			hidePos = hide;
			difference = hidePos - showPos;
			
			this.x = hidePos;
			
			return difference;
		}
		
		public function show():void
		{
			TweenLite.to(this, 0.5, { x: showPos, onComplete: showComplete } );
		}
		
		private function showComplete():void
		{
			this.active = true;
		}
		
		public function hide():void
		{
			TweenLite.to(this, 0.5, { x: hidePos, onComplete: hideComplete });
		}
		
		private function hideComplete():void
		{
			this.active = false;
		}
	}

}