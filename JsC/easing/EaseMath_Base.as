package JsC.easing
{
	import flash.utils.Timer;
	
	import JsC.mvc.Controller;
	
	internal class EaseMath_Base extends Controller
	{
		
		protected var nTime:Timer
		protected var nHalt:uint
		
		protected var nF:Number
		protected var nT:Number
		protected var nC:Number
		
		public function EaseMath_Base()
		{
			super();
		}
	}
}