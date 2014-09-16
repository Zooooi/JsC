package JsC.mvc
{
	import mx.core.UIComponent;
	
	import JsC.events.JEvent;
	
	public class ActionUI extends ActionUIBase
	{
	
		
		public function ActionUI(_vi:UIComponent = null)
		{
			if(_vi != null) __initView(_vi);
		}
		
		public function _addEvent(_value:JEvent):void
		{
			
		}
		
		public function _addSymbol(_value:UIComponent):void
		{
			
		}
		
		public function _addCtrl(_value:Controller):void
		{
			
		}
	}
}