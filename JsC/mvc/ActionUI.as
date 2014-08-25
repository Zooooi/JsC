package JsC.mvc
{
	import mx.core.UIComponent;
	
	public class ActionUI extends ActionObjectBase
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
		
		
		
		
		public function _addCtrl(_value:Controller):void
		{
			
		}
		
		public function _addAction(_value:ActionUI):void
		{
			
		}
	}
}