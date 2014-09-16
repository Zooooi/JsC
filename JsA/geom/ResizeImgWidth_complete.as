package JsA.geom
{
	import flash.display.Stage;
	import flash.events.Event;
	import flash.utils.setTimeout;
	
	import mx.core.UIComponent;
	
	import spark.components.Image;
	
	import JsC.events.JEvent;
	
	[Event(name="JRESIZE", type="JsC.events.JEvent")]
	public class ResizeImgWidth_complete extends ResizeUI_Base
	{
		protected var img:Image
		protected var pw:uint
		protected var target:UIComponent
		protected var _timer:uint = 20;
		protected var stage:Stage
		private var nW:uint
		public function ResizeImgWidth_complete(event:Event)
		{
			img = Image(event.currentTarget);
			pw = img.percentWidth
			img.addEventListener(Event.ADDED_TO_STAGE,onEvent)
			img.addEventListener(Event.REMOVED_FROM_STAGE, onEvent)
			setResizeEvent()
			onResize()
		}
		
		
		
		protected function setResizeEvent():void
		{
			if (img.stage)
			{
				img.parent.addEventListener(Event.RESIZE,onEvent);
			}
		}
		
		protected function onEvent(event:Event):void {
			switch(event.type) {
				case Event.ADDED_TO_STAGE:
					setResizeEvent()
					break
				case Event.RESIZE:
					onResize()
					break
				case Event.REMOVED_FROM_STAGE:
					img.parent.removeEventListener(Event.RESIZE, onEvent);
					img.removeEventListener(Event.ADDED_TO_STAGE, onEvent);
					img.removeEventListener(Event.REMOVED_FROM_STAGE, onEvent);
					break
			}
		}
		
		public function getInstance():Image
		{
			return img;
		}
		
		protected function onRemove(event:Event):void
		{
			
		}
		
		public function onResize():void
		{
			
			setTimeout(function():void{
				img.height = (img.width/img.sourceWidth *img.sourceHeight);
				var _event:JEvent = new JEvent(JEvent.RESIZE)
				_event.w = img.width;
				_event.h = img.height;
				trace(img.width,img.height)
				dispatchEvent(_event);
				img.dispatchEvent(_event);
			},_timer)
		
		}
	}
}