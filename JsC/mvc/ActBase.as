package JsC.mvc
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import mx.core.UIComponent;
	
	import JsC.events.JEvent;
	
	
	[Event(name="DESTORY",type="JsC.events.JEvent")]
	[Event(name="DESTORY_FROM_VIEW",type="JsC.events.JEvent")]
	[Event(name="DESTORY_FROM_ACTION",type="JsC.events.JEvent")]
	
	public class ActBase extends EventDispatcher
	{
		private var me:ActBase;
		public var $name:String
		
		
		public function ActBase()
		{
			
		}
		
		
		public function _destory_From_View(_ui:UIComponent,_function:Function):void
		{
			addEventListener(JEvent.DESTORY_FROM_VIEW,_function)
			me = this
			_ui.addEventListener(Event.REMOVED_FROM_STAGE,function(event:Event):void
			{
				event.currentTarget.removeEventListener(event.type,arguments.callee);
				destory_event()
				dispatchEvent(new JEvent(JEvent.DESTORY_FROM_VIEW))
				removeEventListener(JEvent.DESTORY_FROM_VIEW,_function)
			})
		}
		
		public function _destory_From_Action(_act:ActionUI,_function:Function):void
		{
			addEventListener(JEvent.DESTORY_FROM_ACTION,_function)
			me = this
			_act.addEventListener(JEvent.DESTORY,function(event:JEvent):void
			{
				event.currentTarget.removeEventListener(event.type,arguments.callee);
				destory_event()
				dispatchEvent(new JEvent(JEvent.DESTORY_FROM_ACTION))
				removeEventListener(JEvent.DESTORY_FROM_ACTION,_function)
			})
		}
		
		
		protected function destory_event():void
		{
			if (me.hasEventListener(JEvent.DESTORY))
			{
				me.dispatchEvent(new JEvent(JEvent.DESTORY));
			}
		}
	}
}