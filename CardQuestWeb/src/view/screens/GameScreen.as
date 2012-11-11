package view.screens 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import util.GlobalVariables;
	import view.game.CardManager;
	import view.util.ContentRequester;

	public class GameScreen extends ContentRequester
	{
		private var cardManager:CardManager;
		
		private var soundBtn:Sprite = new Sprite();
		private var settingsBtn:Sprite = new Sprite();
		
		public function GameScreen() {}
		
		override public function init():void
		{
			const soundBtnData:SoundBtn = new SoundBtn();
			const soundBtnBm:Bitmap = new Bitmap(soundBtnData);
			soundBtn.addChild(soundBtnBm);
			soundBtnBm.x = -soundBtnBm.width * .5;
			soundBtnBm.y = -soundBtnBm.height * .5;
			
			const settingsBtnData:SettingsBtn = new SettingsBtn();
			const settingsBtnBm:Bitmap = new Bitmap(settingsBtnData);
			settingsBtn.addChild(settingsBtnBm);
			settingsBtnBm.x = -settingsBtnBm.width * .5;
			settingsBtnBm.y = -settingsBtnBm.height * .5;
			
			cardManager = new CardManager();
			
			draw();
			
			addChild(cardManager);
			cardManager.init();
			
			addChild(settingsBtn);
			addChild(soundBtn);
			
			soundBtn.addEventListener(MouseEvent.CLICK, soundBtnClickHandler);
			settingsBtn.addEventListener(MouseEvent.CLICK, settingsBtnClickHandler);
		}
		
		private function draw():void
		{
			const screenWidth:Number = GlobalVariables.SCREEN_WIDTH;
			const screenHeight:Number = GlobalVariables.SCREEN_HEIGHT;
			const gapX:Number = screenWidth * 0.05;
			const gapY:Number = screenHeight * 0.05;	
			const contentPaddingX:Number = screenHeight * 0.07;
			const contentPaddingY:Number = contentPaddingX;
			
			// Could simply be centered
			cardManager.x = contentPaddingX;
			cardManager.y = contentPaddingY;
			
			settingsBtn.x = screenWidth - settingsBtn.width * .5 - gapX;
			settingsBtn.y = gapY;
			
			soundBtn.x = settingsBtn.x - settingsBtn.width * .5 - gapX;
			soundBtn.y = settingsBtn.y;
			
		}
		
		private function soundBtnClickHandler(e:MouseEvent):void
		{
			trace("sound");
		}
		
		private function settingsBtnClickHandler(e:MouseEvent):void
		{
			trace("settings");
		}
	}

}