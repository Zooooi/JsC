package JsC.mvc
{
	
	
	public class ActionObjectBase extends ActBase
	{
		protected var vi:Object;
		public function ActionObjectBase()
		{
		
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