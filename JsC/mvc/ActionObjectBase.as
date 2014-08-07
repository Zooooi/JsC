package JsC.mvc
{
	import flash.events.EventDispatcher;
	
	public class ActionObjectBase extends EventDispatcher
	{
		protected var me:ActionObjectBase;
		protected var vi:Object;
		public function ActionObjectBase()
		{
		
		}
		public function _getCtrl():ActionObjectBase
		{
			return me;
		}
		public function _getView():Object
		{
			return vi
		}
		
		protected function __initView(_vi:Object):void
		{
			vi = _vi;
		}
		
		
	}
}