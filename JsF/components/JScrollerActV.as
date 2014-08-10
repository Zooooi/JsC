package JsF.components
{
	import mx.core.UIComponent;
	
	import spark.components.supportClasses.ScrollBarBase;
	
	import JsC.events.JEvent;
	
	
	public class JScrollerActV extends JScrollerActBase
	{
		public function JScrollerActV(_vi:UIComponent)
		{
			super(_vi);
			nRange = scroller.height
			addEventListener(JEvent.ONSTART,onWaitingEvent)
			addEventListener(JEvent.ONEND,onWaitingEvent)
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
			}
		}
		
		override protected function getScrollerBar():ScrollBarBase
		{
			scrollerbar = scroller.verticalScrollBar
			return scrollerbar
		}
		
	}
}