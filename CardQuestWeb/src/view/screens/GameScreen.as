package view.screens 
{
	import com.greensock.TweenLite;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import util.GlobalVariables;
	import view.game.CardManager;
	import view.game.FeedbackForm;
	import view.game.IngameMenu;
	import view.util.ArtFactory;
	import view.util.ContentRequester;

	public class GameScreen extends ContentRequester
	{
		private var cardManager:CardManager;
		private var ingameMenu:IngameMenu;
		private var feedbackForm:FeedbackForm;
		private var displacement:Number;
		private var startPos:Number;
		
		private var soundBtn:Sprite = new Sprite();
		private var settingsBtn:Sprite = new Sprite();
		
		
		private var testBg:Sprite = new Sprite();
		
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
			ingameMenu = new IngameMenu();
			feedbackForm = new FeedbackForm();
			
			const animalsBg:FoodBg = new FoodBg();
			testBg = ArtFactory.createSpriteFromBd(animalsBg);
			
			cardManager.init();
			
			draw();
			
			addChild(testBg);
			
			addChild(cardManager);
			
			addChild(settingsBtn);
			addChild(soundBtn);
			
			addChild(ingameMenu);
			addChild(feedbackForm);
			
			soundBtn.addEventListener(MouseEvent.CLICK, soundBtnClickHandler);
			settingsBtn.addEventListener(MouseEvent.CLICK, settingsBtnClickHandler);
		}
		
		private function draw():void
		{
			const screenWidth:Number = GlobalVariables.SCREEN_WIDTH;
			const screenHeight:Number = GlobalVariables.SCREEN_HEIGHT;
			const gapX:Number = screenWidth * 0.04;
			const gapY:Number = screenHeight * 0.04;	
			const contentPaddingX:Number = (screenWidth - cardManager.width - gapX * 2) * .5;
			const contentPaddingY:Number = screenHeight * 0.05;
			
			// Could simply be centered
			cardManager.x = contentPaddingX;
			cardManager.y = contentPaddingY;
			
			settingsBtn.x = screenWidth - settingsBtn.width * .5 - gapX;
			settingsBtn.y = settingsBtn.height * .5 + gapY;
			
			soundBtn.x = settingsBtn.x - settingsBtn.width * .5 - gapX;
			soundBtn.y = settingsBtn.y;
			
			ingameMenu.x = screenWidth - ingameMenu.width - gapX;
			ingameMenu.y = settingsBtn.y + settingsBtn.height * .5 + gapY;
			displacement = ingameMenu.setPositions(ingameMenu.x, screenWidth);
			startPos = cardManager.x;
			
			testBg.width = screenWidth;
			testBg.scaleY = scaleX;
			testBg.x += testBg.width * .5;
			testBg.y += testBg.height * .5;
			
			feedbackForm.x = screenWidth * .5;
			feedbackForm.y = screenHeight * .5;
		}
		
		private function soundBtnClickHandler(e:MouseEvent):void
		{
			trace("sound");
		}
		
		private function settingsBtnClickHandler(e:MouseEvent):void
		{
			if (ingameMenu.active)
			{
				ingameMenu.hide();
				TweenLite.to(cardManager, 0.5, { x: (startPos) } );
			}
			else
			{
				TweenLite.to(cardManager, 0.5, { x: (startPos - displacement) } );
				ingameMenu.show();
			}
				
 
		}
	}

}