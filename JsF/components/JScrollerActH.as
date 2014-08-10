package JsF.components
{
	import mx.core.UIComponent;
	
	import spark.components.supportClasses.ScrollBarBase;
	
	import JsC.events.JEvent;
	
	public class JScrollerActH extends JScrollerActBase
	{
		public function JScrollerActH(_vi:UIComponent)
		{
			super(_vi);
			nRange = scroller.width
			addEventListener(JEvent.ONSTART,onWaitingEvent)
			addEventListener(JEvent.ONEND,onWaitingEvent)
		}
		
		protected function onWaitingEvent(event:JEvent):void
		{
			switch(event.type)
			{
				case JEvent.ONSTART:
					dragWaiting.visible = true;
					dragWaiting.right = nWaiting
					dragWaiting.left = null
					break;
				
				case JEvent.ONEND:
					dragWaiting.visible = true;
					dragWaiting.left = null
					dragWaiting.right = nWaiting 
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