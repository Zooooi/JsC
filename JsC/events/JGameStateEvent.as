package JsC.events
{
	import mx.core.UIComponent;

	public class JGameStateEvent extends BaseEvent
	{
		public static const ADDED_TO_TARGET:String = "ADDED_TO_TARGET"
		public static const ADDED_TO_SOURCE:String = "ADDED_TO_SOURCE"
		
		public static const REMOVE_FROM_TARGET:String = "REMOVE_FROM_TARGET"
		public static const REMOVE_FROM_SOURCE:String = "REMOVE_FROM_SOURCE"
			
		public static const RETURN_TO_TARGET:String = "RETURN_TO_TARGET"
		public static const RETURN_TO_SOURCE:String = "RETURN_TO_SOURCE"
			
		public static const CHANGE_TO_TARGET:String = "CHANGE_TO_TARGET"
		public static const CHANGE_TO_SOURCE:String = "CHANGE_TO_SOURCE"
			
		public static const DRAG_START:String = "ONDRAG_START"
		public static const DRAG_UPDATE:String = "ONDRAG_UPDATE"
		public static const DRAG_END:String = "ONDRAG_UPDATE"
				
		public var _target:UIComponent
		public var _current:UIComponent
		public var _source:UIComponent
		public var _parent:UIComponent
		public var _hitTest:Boolean
		public var _id:int
		
		public function JGameStateEvent(type:String)
		{
			super(type);
		}
	}
}