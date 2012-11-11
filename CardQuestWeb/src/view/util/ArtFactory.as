package view.util 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.GradientType;
	import flash.display.SpreadMethod;
	import flash.display.MovieClip;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.display.Shape;
	import flash.filters.DropShadowFilter;
	import flash.geom.Matrix;
	import flash.events.*;
	import flash.text.AntiAliasType;
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	
	public class ArtFactory 
	{
		
		public function ArtFactory() 
		{
			
		}
		
		public static function createGradientBox(width:Number, height:Number, colors:Array):Sprite
		{
			var sprite:Sprite = new Sprite();
			
			// Measurment params
			const elipseWidth:Number = width / 10;
			const shadowSize:int = 2;
			const borderSize:int = shadowSize + 2;
			
			// Gradient params
			const fillType:String = GradientType.LINEAR;
			const alphas:Array = [1, 1];
			const ratios:Array = [0x00, 0xFF];
			const spreadMethod:String = SpreadMethod.PAD;
			var matr:Matrix = new Matrix();
			
			matr.createGradientBox(width, height, Math.PI / 2, 0, 0);
			
			// Shadow
			sprite.graphics.beginFill(0x000000, 0.3);
			sprite.graphics.drawRoundRect(0, 0, width, height, elipseWidth);
			sprite.graphics.endFill();
			
			// Border
			sprite.graphics.beginFill(0xFFFFFF, 1);
			sprite.graphics.drawRoundRect(shadowSize/2, shadowSize/2, width - shadowSize, height - shadowSize, elipseWidth);
			sprite.graphics.endFill();
			
			// Gradient fill
			sprite.graphics.beginGradientFill(fillType, colors, alphas, ratios, matr, spreadMethod);
			sprite.graphics.drawRoundRect(borderSize/2, borderSize/2, width - borderSize, height - borderSize, elipseWidth);
			sprite.graphics.endFill();
			
			return sprite;
		}
		
		public static function createNumberCircle(dimension:Number, color:uint):Sprite
		{
			var sprite:Sprite = new Sprite();
			
			// Measurment params
			const shadowSize:int = 2;
			const borderSize:int = shadowSize + 2;
			
			// Shadow
			sprite.graphics.beginFill(0x000000, 0.3);
			sprite.graphics.drawCircle(0, 0, dimension);
			sprite.graphics.endFill();
			
			// Border
			sprite.graphics.beginFill(0xFFFFFF, 1);
			sprite.graphics.drawCircle(0, 0, dimension - shadowSize);
			sprite.graphics.endFill();
			
			// Gradient fill
			sprite.graphics.beginFill(color, 1);
			sprite.graphics.drawCircle(0, 0, dimension - borderSize);
			sprite.graphics.endFill();
			
			return sprite;
		}
		
		
		// Testerz
		public static function createShadowText(text:String, size:int, color:uint, shadowColor:uint):TextField
		{
			const shadow:DropShadowFilter = new DropShadowFilter(3, 45, color, 1, 2, 2, 10, 1, false, false, false);
			const textSize:int = size;
			const textFont:Font = new HoboStd();
			const textColor:uint = 0xFFFFFF;
			const bold:Boolean = false;
			const alignment:String = "center";
			
			var textField:TextField = new TextField();
			var textFormat:TextFormat = new TextFormat(textFont.fontName, textSize, textColor, bold, false, false,null,null,alignment);
			
			textField.defaultTextFormat = textFormat;
			textField.autoSize = TextFieldAutoSize.CENTER;
			textField.embedFonts = true;
			textField.antiAliasType = AntiAliasType.ADVANCED;
			//textField.multiline = false;
			textField.selectable = false;
			textField.filters = [shadow];
			
			textField.text = text;
			return textField;
		}
		
		public static function createSpriteFromBd(bitmapData:BitmapData):Sprite
		{
			var sprite:Sprite = new Sprite();
			const bitmap:Bitmap = new Bitmap(bitmapData);
			sprite.addChild(bitmap);
			bitmap.x = -bitmap.width * .5;
			bitmap.y = -bitmap.height * .5;
			
			return sprite;
		}
	}

}