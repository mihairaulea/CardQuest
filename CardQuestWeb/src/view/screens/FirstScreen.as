package view.screens 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import util.GlobalVariables;
	import view.util.ContentRequester;
	import util.Assets;
	
	public class FirstScreen extends ContentRequester
	{
		private var playBtn:Sprite = new Sprite();
		private var soundBtn:Sprite = new Sprite();
		private var achiBtn:Sprite = new Sprite();
		private var creditsBtn:Sprite = new Sprite();
		
		private var logoArt:Bitmap;
		private var cardsArt:Bitmap;
		
		public function FirstScreen() 
		{
			
		}
		
		override public function init():void
		{
			const playBtnData:PlayBtn = new PlayBtn();
			const playBtnBm:Bitmap = new Bitmap(playBtnData);
			playBtn.addChild(playBtnBm);
			playBtnBm.x = -playBtnBm.width * .5;
			playBtnBm.y = -playBtnBm.height * .5;			
			
			const soundBtnData:SoundBtn = new SoundBtn();
			const soundBtnBm:Bitmap = new Bitmap(soundBtnData);
			soundBtn.addChild(soundBtnBm);
			soundBtnBm.x = -soundBtnBm.width * .5;
			soundBtnBm.y = -soundBtnBm.height * .5;
			
			const achiBtnData:AchiBtn = new AchiBtn();
			const achiBtnBm:Bitmap = new Bitmap(achiBtnData);
			achiBtn.addChild(achiBtnBm);
			achiBtnBm.x = -achiBtnBm.width * .5;
			achiBtnBm.y = -achiBtnBm.height * .5;			
			
			const creditsBtnData:CreditsBtn = new CreditsBtn();
			const creditsBtnBm:Bitmap = new Bitmap(creditsBtnData);
			creditsBtn.addChild(creditsBtnBm);
			creditsBtnBm.x = -creditsBtnBm.width * .5;
			creditsBtnBm.y = -creditsBtnBm.height * .5;
			
			const logoArtData:LogoArt = new LogoArt();
			logoArt = new Bitmap(logoArtData);
			
			const cardsArtData:CardsArt = new CardsArt();
			cardsArt = new Bitmap(cardsArtData);
			
			draw();

			addChild(logoArt);
			addChild(cardsArt);
			
			addChild(playBtn);
			addChild(soundBtn);
			addChild(achiBtn);
			addChild(creditsBtn);
			
			playBtn.addEventListener(MouseEvent.CLICK, playBtnClickHandler);
			soundBtn.addEventListener(MouseEvent.CLICK, soundBtnClickHandler);
			achiBtn.addEventListener(MouseEvent.CLICK, achiBtnClickHandler);
			creditsBtn.addEventListener(MouseEvent.CLICK, creditsBtnClickHandler);
		}
		
		private function draw():void
		{
			const screenWidth:Number = GlobalVariables.SCREEN_WIDTH;
			const screenHeight:Number = GlobalVariables.SCREEN_HEIGHT;
			const gapX:Number = screenWidth * 0.05;
			const gapY:Number = screenHeight * 0.05;	
			
			playBtn.x = screenWidth * .5;
			playBtn.y = screenHeight * .5 + gapY;
			
			soundBtn.x = screenWidth - gapX - soundBtn.width * .5;
			soundBtn.y = gapY;
			
			creditsBtn.x = screenWidth - gapX - creditsBtn.width * .5;
			creditsBtn.y = screenHeight - gapY - creditsBtn.height * .5;
			
			achiBtn.x = creditsBtn.x - creditsBtn.width * .5 - gapX;
			achiBtn.y = creditsBtn.y;
			
			logoArt.x = (screenWidth - logoArt.width) * .5;
			logoArt.y = gapY;
			
			cardsArt.x = (screenWidth - cardsArt.width) * .5;
			cardsArt.y = playBtn.y - cardsArt.height * .7;
		}
		
		private function playBtnClickHandler(e:MouseEvent):void
		{
			requestContent(1);
		}
		
		private function soundBtnClickHandler(e:MouseEvent):void
		{
			trace("sound");
		}
		
		private function achiBtnClickHandler(e:MouseEvent):void
		{
			trace("achi");
		}
		
		private function creditsBtnClickHandler(e:MouseEvent):void
		{
			requestContent(2);
		}
	}

}