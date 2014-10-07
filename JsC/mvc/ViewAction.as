package JsC.mvc
{
	import mx.core.UIComponent;
	
	public class ViewAction extends ActionUI
	{
		public function ViewAction(_vi:UIComponent=null)
		{
			super(_vi);
		}
		
		public function reNum(_b:Boolean,n1:uint,n2:uint):Number
		{
			var _num:Number
			if (_b)
			{
				_num = n1;
			}else{
				_num = n2
			}
			return _num
		}
	}
}