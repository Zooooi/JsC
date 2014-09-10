package JsC.mvc
{
	import mx.core.UIComponent;
	
	public class ActionUIBase extends ActBase
	{
		protected var vi:UIComponent;
		public function ActionUIBase()
		{
			
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