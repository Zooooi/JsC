package JsC.events
{
	public class JGameEvent extends BaseEvent
	{
		public static const GAMING:String = "GAMING"
		public static const NEWGAME:String = "NEWGAME" 
		public static const READY:String = "READY" 
		public static const START:String = "START" 
		public static const PLAY:String = "PLAY" 
		public static const PLAYING:String = "PLAYING" 
		public static const RUNING:String = "RUNING" 
		public static const RESTART:String = "RESTART" 
		public static const HELP:String = "HELP" 
		public static const RESULT:String = "RESULT" 
		public static const RESET:String = "RESET" 
		public static const TIMEOUT:String = "TIMEOUT" 
		public static const FINISH:String = "FINISH"
		public static const OVER:String = "OVER"
		public static const DELAY:String = "DELAY"
		public static const MENU:String = "MENU"
		public static const QUIT:String = "QUIT"
		public static const CLOSE:String = "CLOSE"
		public static const HITTEST:String = "HITTEST"
		public static const STOP:String = "STOP"
		public static const CHECK:String = "CHECK"
		
		public function JGameEvent(type:String)
		{
			super(type);
		}
	}
}