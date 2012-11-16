package util 
{
	import flash.display.Bitmap;
    import flash.media.Sound;
    import flash.utils.ByteArray;
    import flash.utils.Dictionary;
    
    import starling.text.BitmapFont;
    import starling.text.TextField;
    import starling.textures.Texture;
    import starling.textures.TextureAtlas;
	
	public class Assets 
	{
		private static var sContentScaleFactor:int = 1;
        private static var sTextures:Dictionary = new Dictionary();
        private static var sSounds:Dictionary = new Dictionary();
		private static var sParticles:Dictionary;
        private static var sTextureAtlasAssets:TextureAtlas;
		private static var sTextureAtlasLevels:TextureAtlas;
        private static var sBitmapFontsLoaded:Boolean;

		// Particles XML
		
		// Sounds
		
		// Fonts
		[Embed(source ="/assets/fonts/Marvin.otf", embedAsCFF = "false", 
		 fontName = "Marvin", fontFamily = "Marvin",
		 mimeType = "application/x-font-opentype")]
		private static const Marvin:Class;
		
		
		public static function getTexture(name:String):Texture
        {
            if (sTextures[name] == undefined)
            {
                var data:Object = create(name);
                
                if (data is Bitmap)
                    sTextures[name] = Texture.fromBitmap(data as Bitmap, true, false, sContentScaleFactor);
                else if (data is ByteArray)
                    sTextures[name] = Texture.fromAtfData(data as ByteArray, sContentScaleFactor);
            }
            
            return sTextures[name];
        }
        
        public static function getAssetsTexture(name:String):Texture
        {
            prepareAtlasAssets();
            return sTextureAtlasAssets.getTexture(name);
        }
		
        public static function getAssetsTextures(prefix:String):Vector.<Texture>
        {
            prepareAtlasAssets();
            return sTextureAtlasAssets.getTextures(prefix);
        }
        
		public static function getParticleXML(name:String):XML
		{
			prepareParticlesXML();
			var xml:XML = sParticles[name] as XML;
			if (xml) return xml;
			else throw new ArgumentError("Particle XML not found: " + name);
		}
		
		public static function getSound(name:String):Sound
        {
            var sound:Sound = sSounds[name] as Sound;
            if (sound) return sound;
            else throw new ArgumentError("Sound not found: " + name);
        }
		
        public static function loadBitmapFonts():void
        {
            if (!sBitmapFontsLoaded)
            {
				/*
                var texture:Texture = getTexture("DesyrelTexture");
                var xml:XML = XML(create("DesyrelXml"));
                TextField.registerBitmapFont(new BitmapFont(texture, xml));
                sBitmapFontsLoaded = true;
				*/
            }
        }
        
        public static function prepareSounds():void
        {
			
        }
        
        private static function prepareAtlasAssets():void
        {
            if (sTextureAtlasAssets == null)
            {
                var textureAssets:Texture = getTexture("AtlasTextureAssets");
                var xmlAssets:XML = XML(create("AtlasXmlAssets"));
                sTextureAtlasAssets = new TextureAtlas(textureAssets, xmlAssets);

            }
        }
		
		private static function prepareParticlesXML():void
		{
			if(!sParticles)
			{	
				sParticles = new Dictionary();
			}
		}
		
        private static function create(name:String):Object
        {
            var textureClass:Class = sContentScaleFactor == 1 ? AssetsSD: AssetsLD;
            return new textureClass[name];
        }
        
        public static function get contentScaleFactor():Number { return sContentScaleFactor; }
        public static function set contentScaleFactor(value:Number):void 
        {
            for each (var texture:Texture in sTextures)
                texture.dispose();
            
            sTextures = new Dictionary();
			sContentScaleFactor = value < 1.5 ? 1 : 2; // assets are available for factor 1 and 2 
        }
		
	}

}