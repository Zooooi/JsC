package JsA.geom
{
	import JsC.events.JEvent;
	
	import flash.display.Stage;
	import flash.events.Event;
	
	import mx.core.UIComponent;

	[Event(name="JRESIZE", type="JsC.events.JEvent")]
	public class ResizeFromStage_AddToStage extends ResizeUI_Base
	{
		private var ui:UIComponent
		private var stage:Stage 
		public function ResizeFromStage_AddToStage(event:Event)
		{
			super();
			ui = UIComponent(event.currentTarget)
			stage = ui.stage
			onResize()
			stage.addEventListener(Event.RESIZE,onResize)
			ui.addEventListener(Event.REMOVED_FROM_STAGE,onEvent)
		}
		
		protected function onEvent(event:Event):void
		{
			switch(event.type)
			{
				case Event.ADDED_TO_STAGE:
					stage.addEventListener(Event.RESIZE,onResize)
					break;
					
				case Event.REMOVED_FROM_STAGE:
					stage.removeEventListener(Event.RESIZE,onResize)
					break;
			}
		}
		
		public function onResize(event:Event = null):void
		{
			var _w:uint = stage.stageWidth
			var _h:uint = stage.stageHeight
			ui.width = _w
			ui.height = _h
			var _event:JEvent = new JEvent(JEvent.RESIZE)
			_event.w = _w
			_event.h = _h
			dispatchEvent(_event)
			
			
			
		}
	}
}