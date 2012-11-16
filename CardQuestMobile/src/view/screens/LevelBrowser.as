package view.screens 
{
	import feathers.controls.List;
	import feathers.controls.renderers.IListItemRenderer;
	import feathers.controls.Screen;
	import feathers.controls.Scroller;
	import feathers.data.ListCollection;
	import feathers.layout.TiledRowsLayout;
	import starling.display.Button;
	import starling.events.Event;
	import starling.events.ResizeEvent;
	import util.Assets;
	import view.screens.browser.LevelVisual;
	
	public class LevelBrowser extends Screen
	{
		public static const ON_BACK:String = "onBack";
		public static const ON_LEVEL:String = "onLevel";
		
		private static const levelCollection:ListCollection = new ListCollection
		([
			{ levelNumber: 1, levelId: 1, levelType: 0 },
			{ levelNumber: 1, levelId: 1, levelType: 0 },
			{ levelNumber: 1, levelId: 1, levelType: 0 },
			{ levelNumber: 1, levelId: 1, levelType: 1 },
			{ levelNumber: 1, levelId: 1, levelType: 0 },
			{ levelNumber: 1, levelId: 1, levelType: 0 },
			{ levelNumber: 1, levelId: 1, levelType: 0 },
			{ levelNumber: 1, levelId: 1, levelType: 1 }			
		]);
		
		private var _list:List;
		private var _nextBtn:Button;
		private var _prevBtn:Button;
		private var _backBtn:Button;
		
		public function LevelBrowser() 
		{
			super();
		}
		
		override protected function initialize():void
		{
			_nextBtn = new Button(Assets.getAssetsTexture("nextBtn"));
			addChild(_nextBtn);
			_nextBtn.addEventListener(Event.TRIGGERED, nextBtn_triggeredHandler);
			
			_prevBtn = new Button(Assets.getAssetsTexture("prevBtn")); 
			addChild(_prevBtn);
			_prevBtn.addEventListener(Event.TRIGGERED, prevBtn_triggeredHandler);
			
			_backBtn = new Button(Assets.getAssetsTexture("backBtn"));
			addChild(_backBtn);
			_backBtn.addEventListener(Event.TRIGGERED, backBtn_triggeredHandler);
			
			const listLayout:TiledRowsLayout = new TiledRowsLayout(); 
			listLayout.paging = TiledRowsLayout.PAGING_HORIZONTAL;
			listLayout.useSquareTiles = false;
			listLayout.tileHorizontalAlign = TiledRowsLayout.HORIZONTAL_ALIGN_CENTER;
			listLayout.horizontalAlign = TiledRowsLayout.HORIZONTAL_ALIGN_CENTER;
			
			this._list = new List();
			this._list.dataProvider = levelCollection;
			this._list.layout = listLayout;
			this._list.scrollerProperties.snapToPages = true;
			this._list.scrollerProperties.scrollBarDisplayMode = Scroller.SCROLL_BAR_DISPLAY_MODE_NONE; 
			this._list.scrollerProperties.horizontalScrollPolicy = Scroller.SCROLL_POLICY_ON;
			this._list.itemRendererFactory = tileListItemRendererFactory;
			//this._list.onScroll.add(list_onScroll);
			//this._list.onChange.add(list_onChange);
			addChild(this._list);
		}
		
		override protected function draw():void
		{
			const margin:Number = this.originalHeight * 0.06 * this.dpiScale;
			const spacingX:Number = this.originalHeight * 0.06 * this.dpiScale;
			const spacingY:Number = this.originalHeight * 0.06 * this.dpiScale;
			
			_backBtn.x = spacingX;
			_backBtn.y = actualHeight - _backBtn.height - spacingY;
			
			_prevBtn.x = _backBtn.x;
			_prevBtn.y = (actualHeight - _prevBtn.height) * .5;
			
			_nextBtn.x = actualWidth - _nextBtn.width - spacingX;
			_nextBtn.y = _prevBtn.y;
			
			this.layout();
		}
		
		protected function layout():void
		{	
			const shorterSide:Number = Math.min(this.stage.stageWidth, this.stage.stageHeight);
			const layout:TiledRowsLayout = TiledRowsLayout(this._list.layout);
			layout.paddingTop = shorterSide * 0.06;
			layout.paddingBottom = shorterSide * 0.06;
			//layout.paddingRight = shorterSide * 0.02;
			//layout.paddingLeft = shorterSide * 0.02;
			
			layout.gap = shorterSide * 0.04;
			
			this._list.itemRendererProperties.gap = shorterSide * 0.01;

			this._list.x = this._prevBtn.x + this._prevBtn.width;
			this._list.width = this._nextBtn.x - this._prevBtn.x - this._prevBtn.width;
			this._list.height = this.stage.stageHeight;
			this._list.validate();
		}
		
		private function backBtn_triggeredHandler(e:Event):void 
		{
			dispatchEvent(new Event(ON_BACK));
		}
		
		private function prevBtn_triggeredHandler(e:Event):void
		{
			this._list.scrollToPageIndex(this._list.horizontalPageIndex-1,-1,0.4);
		}
		
		private function nextBtn_triggeredHandler(e:Event):void
		{
			if (!(this._list.maxHorizontalScrollPosition == this._list.horizontalScrollPosition))
				this._list.scrollToPageIndex(this._list.horizontalPageIndex + 1, -1, 0.4);
		}

		protected function tileListItemRendererFactory():IListItemRenderer 
		{
			const renderer:LevelVisual= new LevelVisual();
			return renderer;
		}
		
		protected function stage_resizeHandler(event:ResizeEvent):void 
		{
			this.layout();
		}
		
	}

}