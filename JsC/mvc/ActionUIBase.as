package JsC.mvc
{
	import flash.events.EventDispatcher;
	
	import mx.core.UIComponent;
	
	public class ActionUIBase extends EventDispatcher
	{
		protected var me:;
		protected var vi:UIComponent;
		public function ActionUIBase()
		{
			
		}
		public function _getCtrl():ActionUI
		{
			return me;
		}
		public function _getView():UIComponent
		{
			return vi
		}
		protected function __initView(_vi:UIComponent):void
		{
			vi = _vi;
		}
		
		
	}
}