package JsC.mvc
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import mx.core.UIComponent;
	
	import JsC.events.JEvent;
	
	
	[Event(name="DESTORY", type="JsC.events.JEvent")]
	public class ActBase extends EventDispatcher
	{
		private var me:ActBase;
		public var $name:String
		public function ActBase()
		{
			
		}
	
		
		public function _destory_From_View(_ui:UIComponent):void
		{
			me = this
			_ui.addEventListener(Event.REMOVED_FROM_STAGE,function(event:Event):void
			{
				event.currentTarget.removeEventListener(event.type,arguments.callee);
				destory_event()
			})
		}
		
		public function _destory_From_Action(_act:ActionUI):void
		{
			me = this
			_act.addEventListener(JEvent.DESTORY,function(event:JEvent):void
			{
				event.currentTarget.removeEventListener(event.type,arguments.callee);
				destory_event()
			})
		}
		
		
		private function destory_event():void
		{
			if (me.hasEventListener(JEvent.DESTORY))
			{
				me.dispatchEvent(new JEvent(JEvent.DESTORY));
			}
		}
	}
}