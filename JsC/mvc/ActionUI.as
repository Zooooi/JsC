package JsC.mvc
{
	import mx.core.UIComponent;
	
	import JsC.events.JEvent;
	
	public class ActionUI extends ActionUIBase
	{
		protected var me:ActionUI;
		
		public function _getCtrl():ActionUI
		{
			return me;
		}
		
		public function ActionUI(_vi:UIComponent = null)
		{
			me = this
			if(_vi != null) __initView(_vi);
		}
		
		public function _addEvent(_value:JEvent):void
		{
			
		}
		
		public function _addSymbol(_value:UIComponent):void
		{
			
		}
	}
}