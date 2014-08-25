package JsC.mvc
{
	import mx.core.UIComponent;
	
	public class ActionObject extends ActionObjectBase
	{
		protected var me:ActionObject;
		
		public function _getCtrl():ActionObject
		{
			return me;
		}
		
		public function ActionObject(_vi:Object=null)
		{
			me = this
			if(_vi != null) __initView(_vi);
		}
		
		
		public function _addCtrl(_value:Controller):void
		{
			
		}
	}
}

