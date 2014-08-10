package JsC.mvc
{
	import flash.events.EventDispatcher;

	[Event(name="COMPLETE", type="JsC.events.JEvent")]
	[Event(name="ONECOMPLETE", type="JsC.events.JEvent")]
	[Event(name="ALLCOMPLETE", type="JsC.events.JEvent")]
	
	public class Model extends EventDispatcher
	{
		//private static var _model:Login;
		public function Model()
		{
			//_model = this
		}
		
		/*public static function getInstance():Model
		{
			if (_model == null)
			{
				_model = new Model();
			}
			return _model;
		}*/
	}
}