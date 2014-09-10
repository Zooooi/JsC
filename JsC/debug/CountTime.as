package JsC.debug
{
	import JsC.mvc.Controller;
	
	public class CountTime extends Controller
	{
		private static var begin:Number
		private static var pass:Number
		public function CountTime()
		{
			super();
		}
		
		public static function start():void
		{
			begin = (new Date).getTime()
			pass = (new Date).getTime()
			//trace("CountTime-start",0)
		}
		
		
		public static function display(_state:String = ""):void
		{
			var _pass:Number = (new Date).getTime() - pass
			pass = (new Date).getTime()
			//trace("CountTime-counting",_state,pass - begin,_pass)
		}
		
	}
}