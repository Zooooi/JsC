package JsC.mvc
{
	import mx.core.UIComponent;
	
	public class ActionUI extends ActionObjectBase
	{
		public function ActionUI(_vi:UIComponent = null)
		{
			me = this
			if(_vi != null) __initView(_vi);
		}
		
	}
}