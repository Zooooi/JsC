package JsF.components.act
{
	import mx.core.UIComponent;
	
	import spark.components.BusyIndicator;
	
	import JsC.events.JEvent;
	
	
	public class JScrollerActV extends JScrollerActBase
	{
		
		protected var dragWaiting:BusyIndicator
		public function JScrollerActV(_vi:UIComponent)
		{
			super(_vi);
			dragWaiting = scrollerV._dragWaiting
			addEventListener(JEvent.ONSTART,onWaitingEvent)
			addEventListener(JEvent.ONEND,onWaitingEvent)
			addEventListener(JEvent.READY,onWaitingEvent)
		}
		
		protected function onWaitingEvent(event:JEvent):void
		{
			switch(event.type)
			{
				case JEvent.ONSTART:
					dragWaiting.visible = true;
					dragWaiting.top = nWaiting
					dragWaiting.bottom = null
					break;
				
				case JEvent.ONEND:
					dragWaiting.visible = true;
					dragWaiting.top = null
					dragWaiting.bottom = nWaiting 
					break;
				
				case JEvent.READY:
					dragWaiting.visible = false
					break
			}
		}
		
	}
}