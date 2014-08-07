package JsF.geom
{
	
	import JsC.events.JEvent;
	
	import flash.display.Stage;
	import flash.events.Event;
	
	import mx.core.UIComponent;
	public class ResizeFromParent extends ResizeUI_Base
	{
		
		private var ui:UIComponent
		public function ResizeFromParent(event:Event)
		{
			super();
			ui = UIComponent(event.currentTarget)
			ui.addEventListener(Event.ADDED_TO_STAGE,onEvent)
		}
		
		protected function onEvent(event:Event):void
		{
			switch(event.type)
			{
				case Event.ADDED_TO_STAGE:
					onResize()
					ui.addEventListener(Event.RESIZE,onResize)
					ui.addEventListener(Event.REMOVED_FROM_STAGE,onEvent)
					break;
				
				case Event.REMOVED_FROM_STAGE:
					ui.removeEventListener(Event.ADDED_TO_STAGE,onEvent)
					ui.removeEventListener(Event.RESIZE,onResize)
					ui.removeEventListener(Event.REMOVED_FROM_STAGE,onEvent)
					break;
			}
		}
		
		public function onResize(event:Event = null):void
		{
			var _event:JEvent = new JEvent(JEvent.RESIZE)
			dispatchEvent(_event)
		}
	}
}