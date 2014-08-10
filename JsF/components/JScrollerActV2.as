package JsF.components
{
	import flash.events.MouseEvent;
	import mx.core.UIComponent;
	
	
	public class JScrollerActV2 extends JScrollerActV
	{
		public function JScrollerActV2(_vi:UIComponent)
		{
			super(_vi);
		}
		
		override protected function onScrollEnd():Boolean
		{
			var b:Boolean = super.onScrollEnd();
			if (bOnce)
			{
				view.stage.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_UP));
			}
			return super.onScrollEnd();
		}
		
		
	}
}