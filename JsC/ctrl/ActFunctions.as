package JsC.ctrl
{
	import flash.events.EventDispatcher;
	
	public class ActFunctions extends EventDispatcher
	{
		
		private var aVector:Array
		private var nCount:uint
		
		public function ActFunctions(_vector:Array)
		{
			aVector = _vector
		}
		
		public function init():void
		{
			nCount = 0
			aVector[nCount]()
		}
		
		public function next():void
		{
			nCount ++
			aVector[nCount]()
		}
	}
}