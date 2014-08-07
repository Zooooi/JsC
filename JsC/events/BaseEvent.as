package JsC.events 
{
	import flash.events.Event;

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
		
		public var i:uint
		public var j:uint
		public var k:uint
		
		public var id:uint
		public var index:uint
		
		public var name:String
		public var key:String
		public var url:String
		public var path:String
		public var file:String
		
		public var _xml:XML
		public var _obj:Object;
		public var _data:Object;
		public var _array:Array;
		public var _function:Function;
		
		
		public function BaseEvent(type:String) 
		{
			super(type);
		}
		
	
		
		
		
	}

}