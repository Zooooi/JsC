package JsF.ext
{
	import spark.components.Group;
	
	import JsC.mvc.ActionUI;
	import JsC.mvc.ViewAction;
	
	public class JGroup extends Group
	{
		
		[Bindable]protected var _view:ViewAction
		protected var _ctrl:ActionUI
		
		public function JGroup()
		{
			super();
			_view = new ViewAction(this)
		}
		
		public function _setCtrl(_value:ActionUI):void
		{
			_ctrl = _value
		}
		
		public function _setViews(_value:ViewAction):void
		{
			_view = _value
		}
		
	}
}