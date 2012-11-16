package view.screens.browser 
{
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.renderers.IListItemRenderer;
	import feathers.controls.text.TextFieldTextRenderer;
	import feathers.core.FeathersControl;
	import flash.text.FontStyle;
	import starling.display.Image;
	import starling.events.Event;
	import starling.text.TextField;
	import util.Assets;

	public class WorldVisual extends FeathersControl implements IListItemRenderer
	{
		
		public function WorldVisual() { }
		
		protected var _worldName:TextField;
		protected var _worldScore:TextField;
		protected var _levelsCompleted:TextField;
		
		protected var _lockedImage:Image;
		protected var _completedImage:Image;
		protected var _activeImage:Image;
		
		protected var _index:int = -1;
		
		private const fontName:String = "Marvin";
		
		public function get index():int
		{
			return this._index;
		}
		
		public function set index(value:int):void
		{
			if (this._index == value)
			{
				return;
			}
			this._index = value;
			this.invalidate(INVALIDATION_FLAG_DATA);
		}
		
		protected var _owner:List;
 
		public function get owner():List
		{
			return List(this._owner);
		}
 
		public function set owner(value:List):void 
		{
			if(this._owner == value)
			{
				return;
			}
			this._owner = value;
			this.invalidate(INVALIDATION_FLAG_DATA);
		}
 
		protected var _data:Object;
 
		public function get data():Object
		{
			return this._data;
		}
 
		public function set data(value:Object):void
		{
			if(this._data == value)
			{
				return;
			}
			this._data = value;
			this.invalidate(INVALIDATION_FLAG_DATA);
		}
 
		protected var _isSelected:Boolean;
 
		public function get isSelected():Boolean
		{
			return this._isSelected;
		}
 
		public function set isSelected(value:Boolean):void
		{
			if(this._isSelected == value)
			{
				return;
			}
			this._isSelected = value;
			this.invalidate(INVALIDATION_FLAG_SELECTED);
			this.dispatchEventWith(Event.CHANGE);
		} 
 
		override protected function initialize():void
		{			
			if (!this._lockedImage)
			{
				this._lockedImage = new Image(Assets.getAssetsTexture("worldLockedBg"));
				this.addChild(_lockedImage);
			}
			
			if (!this._worldName)
			{
				this._worldName = new TextField(_lockedImage.width * .8, 60, "", fontName, 16, 0xFFFFFF);
				this.addChild(this._worldName);
			}
			
			if (!this._worldScore)
			{
				this._worldScore = new TextField(_lockedImage.width, 20, "", fontName, 12, 0xFFFFFF);
				this.addChild(this._worldScore);
			}
			
			if (!this._levelsCompleted)
			{
				this._levelsCompleted = new TextField(_lockedImage.width , 20, "", fontName, 12, 0xFFFFFF);
				this.addChild(this._levelsCompleted);
			}
		}
 
		override protected function draw():void
		{
			const dataInvalid:Boolean = this.isInvalid(INVALIDATION_FLAG_DATA);
			const selectionInvalid:Boolean = this.isInvalid(INVALIDATION_FLAG_SELECTED);
			var sizeInvalid:Boolean = this.isInvalid(INVALIDATION_FLAG_SIZE);
 
			if(dataInvalid)
			{
				this.commitData();
			}
 
			sizeInvalid = this.autoSizeIfNeeded() || sizeInvalid;
 
			if(dataInvalid || sizeInvalid)
			{
				this.layout();
			}
		}
 
		protected function autoSizeIfNeeded():Boolean
		{
			const needsWidth:Boolean = isNaN(this.explicitWidth);
			const needsHeight:Boolean = isNaN(this.explicitHeight);
			if(!needsWidth && !needsHeight)
			{
				return false;
			}
			
			// TODO: Resize elements inside of box
			//this._worldName.width = this._lockedImage.width;
			//this._worldName.height = this._lockedImage;
			
			//this._levelsCompleted.width = NaN;
			//this._levelsCompleted.height = NaN;
			
			var newWidth:Number = this.explicitWidth;
			if(needsWidth)
			{
				newWidth = this._lockedImage.width;
			}
			var newHeight:Number = this.explicitHeight;
			if(needsHeight)
			{
				newHeight = this._lockedImage.height;
			}
			return this.setSizeInternal(newWidth, newHeight, false);
		}
 
		protected function commitData():void
		{
			if(this._data)
			{
				this._activeImage = new Image(this._data.texture);
				addChildAt(this._activeImage,1);
				
				if (this._data.name != null)
					this._worldName.text = this._data.name;
				else
					this._worldName.text = "Mystery World";
					
				if (this._data.score != null)
					this._worldScore.text = this._data.score;
				else
					this._worldScore.text = "000000";	
					
				if (this._data.noOfLevels != null)
					this._levelsCompleted.text = "0/" + this._data.noOfLevels;
				else
					this._levelsCompleted.text = "who knows";
			}
			else
			{
				this._worldName.text = "Mystery World";
			}
		}
 
		protected function layout():void
		{	
			
			this._worldName.x = (this.actualWidth - _worldName.width) * .5;
			this._worldName.y = (this.actualHeight - _worldName.height) * .28;
			
			this._worldScore.x = (this.actualWidth - _worldScore.width) * .5;
			this._worldScore.y = this.actualHeight * .62;
			
			this._levelsCompleted.x = (this.actualWidth - _levelsCompleted.width) * .5;
			this._levelsCompleted.y = this.actualHeight * .84;
		}
		
	}

}