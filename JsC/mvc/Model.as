package JsC.mvc
{
	import flash.events.EventDispatcher;

	[Event(name="COMPLETE", type="JsC.events.JEvent")]
	[Event(name="ONECOMPLETE", type="JsC.events.JEvent")]
	[Event(name="ALLCOMPLETE", type="JsC.events.JEvent")]
	
	public class Model extends EventDispatcher
	{
		private static var _obj:Object
		
		public function Model()
		{
			
		}
	}
}