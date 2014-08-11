package JsF.components.act
{
	import flash.events.MouseEvent;
	
	import mx.core.UIComponent;
	
	public class JScrollerActH2 extends JScrollerActH
	{
		public function JScrollerActH2(_vi:UIComponent)
		{
			super(_vi);
		}
		
		override protected function onScrollEnd():Boolean
		{
			var b:Boolean = super.onScrollEnd();
			if (bOnce)
			{
				stage.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_UP));
			}
			return super.onScrollEnd();
		}
	}
}