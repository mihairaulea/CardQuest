package view.screens.browser 
{
	import feathers.controls.List;
	import feathers.controls.renderers.IListItemRenderer;
	import feathers.core.FeathersControl;
	import feathers.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import util.Assets;

	public class LevelVisual extends FeathersControl implements IListItemRenderer
	{
		
		public function LevelVisual() { }
		
		protected var levelNumber:TextField;
		
		protected var _lockedImage:Image;
		protected var _activeImage:Image;
		protected var _numberImage:Image;
		
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
			_activeImage = new Image(Assets.getAssetsTexture("levelSelectBackground"));
			addChild(_activeImage);
			
			_lockedImage = new Image(Assets.getAssetsTexture("levelSelectLockedBg"));
			addChild(_lockedImage);
			_lockedImage.visible = false;
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
			
			// TODO: Resize elements inside of box here
			
			var newWidth:Number = this.explicitWidth;
			if(needsWidth)
			{
				newWidth = this._activeImage.width;
			}
			var newHeight:Number = this.explicitHeight;
			if(needsHeight)
			{
				newHeight = this._activeImage.height;
			}
			return this.setSizeInternal(newWidth, newHeight, false);
		}
		
		protected function commitData():void
		{
			if (this._data)
			{
				
			}
			else
			{
				
			}
		}
		
		protected function layout():void
		{
			
		}
	}

}