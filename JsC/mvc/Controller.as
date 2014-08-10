package JsC.mvc
{
	import flash.events.EventDispatcher;
	

	public class Controller extends EventDispatcher
	{
	
		protected var _model:Model
		
		public function Controller()
		{
			
		}
	
		public function getModel():Model
		{
			return _model;
		}
	}
}