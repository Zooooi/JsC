package JsC.events
{
	public class MotionEvent extends BaseEvent
	{
		
		public static const MOVING:String = "MOVING"
		public static const MOVINGIN:String = "MOVINGIN"
		public static const MOVINGOUT:String = "MOVINGOUT"
		
		public static const MOVE_START:String = "MOVE_START"
		public static const MOVE_END:String = "MOVE_END"
		public static const MOVE_UPDATE:String = "MOVE_END"
			
		public static const RESIZE_START:String = "RESIZE_START"
		public static const RESIZE_END:String = "RESIZE_END"
		public static const RESIZE_UPDATE:String = "RESIZE_END"
		public static const RESIZE_OUT:String = "RESIZE_END"
		public static const RESIZE_IN:String = "RESIZE_END"
		
		public static const ZOOM_START:String = "ZOOM_START"
		public static const ZOOM_END:String = "ZOOM_END"
		public static const ZOOM_UPDATE:String = "ZOOM_END"
		public static const ZOOM_OUT:String = "ZOOM_END"
		public static const ZOOM_IN:String = "ZOOM_END"
			
		public function MotionEvent(type:String)
		{
			super(type);
		}
	}
}