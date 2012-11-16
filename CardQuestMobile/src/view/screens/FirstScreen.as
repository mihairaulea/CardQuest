package view.screens 
{
	import feathers.controls.Screen;
	import starling.display.Button;
	import feathers.display.Image;
	import starling.display.Quad;
	import starling.events.Event;
	import util.Assets;

	public class FirstScreen extends Screen
	{
		public static const ON_PLAY:String = "onPlay";
		public static const ON_CREDITS:String = "onCredits";
		public static const ON_STATS:String = "onStats";
		public static const ON_SOUND:String = "onSound";
		
		private var _playBtn:Button;
		private var _creditsBtn:Button;
		private var _statsBtn:Button;
		
		private var _soundBtn:Button;
		
		private var _logoImage:Image;
		private var _cardsArtImage:Image;
		
		private var _backgroundImage:Image;
		
		public function FirstScreen() 
		{
			super();
		}
		
		override protected function initialize():void
		{	
			this._logoImage = new Image(Assets.getAssetsTexture("logo"));
			addChild(this._logoImage);
			
			this._cardsArtImage = new Image(Assets.getAssetsTexture("cardsArt"));
			addChild(this._cardsArtImage);
			
			_playBtn = new Button(Assets.getAssetsTexture("playBtn"));
			addChild(_playBtn);
			_playBtn.addEventListener(Event.TRIGGERED, playBtn_triggeredHandler);
			
			_soundBtn = new Button(Assets.getAssetsTexture("soundBtn"));
			addChild(_soundBtn);
			_soundBtn.addEventListener(Event.TRIGGERED, soundBtn_triggeredHandler);
			
			_creditsBtn = new Button(Assets.getAssetsTexture("creditsBtn"));
			addChild(_creditsBtn);
			_creditsBtn.addEventListener(Event.TRIGGERED, creditsBtn_triggeredHandler);
			
			_statsBtn = new Button(Assets.getAssetsTexture("achiBtn"));
			addChild(_statsBtn);
			_statsBtn.addEventListener(Event.TRIGGERED, statsBtn_triggeredHandler);
		}
		
		override protected function draw():void
		{
			const margin:Number = this.originalHeight * 0.06 * this.dpiScale;
			const spacingX:Number = this.originalHeight * 0.06 * this.dpiScale;
			const spacingY:Number = this.originalHeight * 0.06 * this.dpiScale;
			
			this._playBtn.x = (actualWidth - _playBtn.width ) * .5;
			this._playBtn.y = (actualHeight - _playBtn.height) * .5;
			
			this._logoImage.x = (actualWidth - _logoImage.width) * .5;
			this._logoImage.y = spacingY;
			
			this._cardsArtImage.x = (actualWidth - _cardsArtImage.width) * .5;
			this._cardsArtImage.y = _logoImage.y + _logoImage.height + spacingY;
			
			this._soundBtn.x = actualWidth - _soundBtn.width - spacingX;
			this._soundBtn.y = spacingY;
			
			this._creditsBtn.x = actualWidth - _creditsBtn.width - spacingX;
			this._creditsBtn.y = actualHeight - _creditsBtn.height - spacingY;
			
			this._statsBtn.x = _creditsBtn.x - _creditsBtn.width - spacingX;
			this._statsBtn.y = _creditsBtn.y;
		}
		
		private function playBtn_triggeredHandler(e:Event):void
		{
			dispatchEvent(new Event(ON_PLAY));
		}
		
		private function soundBtn_triggeredHandler(e:Event):void
		{
			dispatchEvent(new Event(ON_SOUND));			
		}
		
		private function creditsBtn_triggeredHandler(e:Event):void
		{
			dispatchEvent(new Event(ON_CREDITS));			
		}
		
		private function statsBtn_triggeredHandler(e:Event):void
		{
			dispatchEvent(new Event(ON_STATS));			
		}
		
	}

}