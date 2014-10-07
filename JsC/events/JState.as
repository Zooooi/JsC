package JsC.events
{
	public class JState extends BaseEvent
	{
		public static const normal:String = "normal"
		public static const selected:String = "selected"
		
		public static const up:String = "up"
		public static const over:String = "over"
		public static const down:String = "down"
		public static const disabled:String = "disabled"
		public static const upAndSelected:String = "upAndSelected"
		public static const overAndSelected:String = "overAndSelected"
		public static const downAndSelected:String = "downAndSelected"
		public static const disabledAndSelected:String = "disabledAndSelected"
		
		public static const onMouseUP:String = "onMouseUP"
		public static const onMouseDW:String = "onMouseDW"
		public static const onMouseMV:String = "onMouseMV"
		public static const onMouseOV:String = "onMouseOV"
		public static const onHitTest:String = "onHitTest"
		public static const onDropIn:String = "onDropIn"
		public static const onDropOut:String = "onDropOut"
		public static const onZoomIn:String = "onZoomIn"
		public static const onZoomOut:String = "onZoomOut"
			
		public static const open:String = "open"
		public static const opening:String = "opening"
			
		public static const close:String = "close"
		public static const closeing:String = "closeing"
			
		public static const state1:String = "state1"
		public static const state2:String = "state2"
		public static const state3:String = "state3"
		public static const state4:String = "state4"
		public static const state5:String = "state5"
			
		public static const style1:String = "style1"
		public static const style2:String = "style2"
		public static const style3:String = "style3"
		public static const style4:String = "style4"
		public static const style5:String = "style5"
			
			
		public static const HOME:String = "HOME"
		public static const EXIT:String = "EXIT"
		public static const NEXT:String = "NEXT" 
		public static const PREV:String = "PREV" 
		public static const END:String = "END" 
		
		public static const POPUP:String = "POPUP"
		
			
			
		public function JState(type:String) 
		{
			super(type);
		}
		
	}
}