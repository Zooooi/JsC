package JsF.components.act
{
	import mx.core.UIComponent;
	
	import spark.components.BusyIndicator;
	import spark.components.supportClasses.ScrollBarBase;
	
	import JsC.events.JEvent;
	
	public class JScrollerActH extends JScrollerActBase
	{
		
		protected var dragWaiting:BusyIndicator
		public function JScrollerActH(_vi:UIComponent)
		{
			super(_vi);
			
			dragWaiting = scrollerH._dragWaiting
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
					dragWaiting.left = nWaiting
					dragWaiting.right = null 
					break;
				
				case JEvent.ONEND:
					dragWaiting.visible = true;
					dragWaiting.right = nWaiting
					dragWaiting.left = null
					break;
				
				case JEvent.READY:
					dragWaiting.visible = false
					break
			}
		}
		
		
		
		override protected function getScrollerBar():ScrollBarBase
		{
			scrollerbar = scroller.horizontalScrollBar
			return scrollerbar
		}
	}
}