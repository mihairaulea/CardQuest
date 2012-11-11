package view.util 
{
	import flash.display.*;
	import flash.events.*;
	
	public class ContentRequester extends Sprite
	{
		public static const REQUEST_NEW_CONTENT:String = "requestNewContent";
		
		public var contentId:int = -1;
		public var contentToRequestId:int = -1;
		public var requestObject:Object = null;
		
		public function ContentRequester() 
		{
			
		}
		
		public function init():void
		{
			
		}
		
		public function destroy():void
		{
			
		}
		
		protected function requestContent(contentToRequestIdParam:int, contentData:Object=null):void
		{
			if (contentId == -1) throw new Error("Did not specify requesting content id");
			if (contentToRequestIdParam == -1) throw new Error("Did not specify content id to request");
			
			this.contentId = contentToRequestIdParam;
			this.contentToRequestId = contentToRequestIdParam;
			this.requestObject = contentData;
			dispatchEvent(new Event(ContentRequester.REQUEST_NEW_CONTENT));
		}
		
	}

}