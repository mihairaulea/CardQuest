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

	public class LevelVisual extends Sprite
	{
		private var levelId:int = -1;
		private var backgroundArt:Sprite;
		private var lockedBonusArt:Sprite;
		
		private var isBonus:Boolean = false;
		private var isLocked:Boolean = false;
		
		public function LevelVisual(id:int) 
		{
			this.levelId = id;
			
			backgroundArt = ArtFactory.createSpriteFromBd(new LevelSelectBackground());
			addChild(backgroundArt);
			backgroundArt.x = backgroundArt.width * .5;
			backgroundArt.y = backgroundArt.height * .5;
			
			lockedBonusArt = ArtFactory.createSpriteFromBd(new LevelSelecLockedBg());
			addChild(lockedBonusArt);
			lockedBonusArt.x = lockedBonusArt.width * .5;
			lockedBonusArt.y = lockedBonusArt.height * .5;
			
			if (isLocked == true)
				lockedBonusArt.visible = true;
			else 
				lockedBonusArt.visible = false;
				
			var levelNumberArt:Sprite = ArtFactory.createNumberCircle(20, 0x6EAFE6);
			addChild(levelNumberArt);
			levelNumberArt.x = backgroundArt.width;
			levelNumberArt.y = 0;
			
			addNumber(27,levelNumberArt);
		}
		
		public function init():void
		{
			
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