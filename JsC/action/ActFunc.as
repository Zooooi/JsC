package JsC.action
{
	import flash.events.EventDispatcher;
	
	public class ActFunc extends EventDispatcher
	{
		
		private var aVector:Array
		private var nCount:uint
		
		public function ActFunc(_vector:Array)
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