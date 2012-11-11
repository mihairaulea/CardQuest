package view.screens.browser 
{
	import flash.display.Sprite;
	import flash.text.AntiAliasType;
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.utils.getDefinitionByName;
	import view.util.ArtFactory;
	
	public class WorldVisual extends Sprite
	{
		private var levelsNumber:int = 1;
		private var levelsCompleted:int = 0;
		private var currentScore:int = 0;
		private var orderNumber:int = 1;
		
		private var lockedLevelBackground:Sprite;
		private var locked:Boolean = false;
		
		public function WorldVisual(levelsNumber:int,levelsCompleted:int,currentScore:int,orderNumber:int) 
		{
			this.levelsNumber = levelsNumber;
			this.levelsCompleted = levelsCompleted;
			this.currentScore = currentScore;
			this.orderNumber = orderNumber;
		}
		
		public function init(worldName:String, worldColor:uint = 0x508907):void
		{
			var className:String = "World" + worldName + "Bg";
			var classData:Class = getDefinitionByName(className) as Class;
			var background:Sprite = ArtFactory.createSpriteFromBd(new classData());
			background.x = background.width * .5;
			background.y = background.height * .5;
			addChild(background);
			
			const componentsWidth:Number = background.width * 0.9;
			const componentsHeight:Number = background.height * 0.18;
			
			var mainColors:Array = [worldColor-0xD7BADF, worldColor];
			var disabledColors:Array = [0x8A8A8A, 0x5D5C5C];
			var scoreColors:Array = [0x62367E, 0x422454];
			var levelsColors:Array = [0x982E62, 0x661F41];
			
			const gapX:Number = background.width * 0.05;
			const gapY:Number = gapX;
			
			var worldGradientBox:Sprite = ArtFactory.createGradientBox(componentsWidth, componentsHeight*2, mainColors);
			var disabledGradientBox:Sprite = ArtFactory.createGradientBox(componentsWidth, componentsHeight * 2, disabledColors);
			var scoreGradientBox:Sprite = ArtFactory.createGradientBox(componentsWidth, componentsHeight, scoreColors);
			var levelsGradientBox:Sprite = ArtFactory.createGradientBox(componentsWidth, componentsHeight, levelsColors);
			
			levelsGradientBox.x = (background.width - levelsGradientBox.width) * .5;
			levelsGradientBox.y = background.height - levelsGradientBox.height - gapY;
			addChild(levelsGradientBox);
			
			scoreGradientBox.x = levelsGradientBox.x;
			scoreGradientBox.y = levelsGradientBox.y - scoreGradientBox.height - gapY;
			addChild(scoreGradientBox);
			
			disabledGradientBox.x = worldGradientBox.x = scoreGradientBox.x;
			disabledGradientBox.y = worldGradientBox.y = scoreGradientBox.y - disabledGradientBox.height - gapY;
			addChild(disabledGradientBox);
			addChild(worldGradientBox);
			
			lockedLevelBackground = ArtFactory.createSpriteFromBd(new WorldLockedBg());
			addChild(lockedLevelBackground);
			lockedLevelBackground.x = lockedLevelBackground.width * .5;
			lockedLevelBackground.y = lockedLevelBackground.height * .5;
			
			if (locked == true)
				lockedLevelBackground.visible = true;
			else 
				lockedLevelBackground.visible = false;
				
			var levelNumberArt:Sprite = ArtFactory.createNumberCircle(20, 0x6EAFE6);
			addChild(levelNumberArt);
			levelNumberArt.x = background.width;
			levelNumberArt.y = 0;
			
			addNumber(27,levelNumberArt);
		}
		
		private function addNumber(number:int, levelNumberArt:Sprite)
		{
			var textSize:int = 20;
			var textFont:Font = new HoboStd(); 
			var textColor:Object = 0xFFFFFF;
			var bold:Boolean = false;
			var underlined:Boolean = false;
			var alignment:String = "center";
			
			var textField:TextField = new TextField(); 
			var textFormat:TextFormat = new TextFormat(textFont.fontName, textSize, textColor, bold, false, underlined, null, null, alignment);
			
			textField.defaultTextFormat = textFormat;
			textField.autoSize = TextFieldAutoSize.CENTER;
			textField.embedFonts = true;
			textField.antiAliasType = AntiAliasType.ADVANCED;
			textField.multiline = false;
			textField.selectable = false;
			
			textField.text = number.toString();
			textField.x = levelNumberArt.x - textField.width * .5;
			textField.y = levelNumberArt.y - textField.height * .5;
			addChild(textField);
		}
	}

}