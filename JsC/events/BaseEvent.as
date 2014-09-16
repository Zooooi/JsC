package JsC.events 
{
	import flash.events.Event;
	
	import JsC.mvc.VO;

	public class BaseEvent extends Event
	{
		public var w:Number
		public var h:Number
		
		public var x:Number
		public var y:Number
		public var z:Number
		
		public var l:Number
		public var r:Number
		public var t:Number
		public var b:Number
		
		public var m:int
		public var n:int
		
		public var i:int
		public var j:int
		public var k:int
		
		public var id:uint
		public var index:uint
		public var selectIndex:uint
		
		public var name:String
		public var text:String
		public var key:String
		public var url:String
		public var path:String
		public var file:String
		public var kind:String
		
		public var selectItem:Object
		public var _xml:XML
		public var _obj:Object;
		public var _data:Object;
		public var _function:Function;
		public var _event:JEvent
		public var _vo:VO
		public var _array:Array;
		public var _vector:Vector.<Object>
		public var _vecotrVo:Vector.<VO>
		
		public function BaseEvent(type:String) 
		{
			super(type);
		}
		
	
		
		
		
	}

}