package JsC.sys
{
	import flash.system.Capabilities;
	
	import mx.utils.Platform;
	
	import JsA.sys.SpecialCaseMapping;
	
	public class SystemOS
	{
		
		public function SystemOs():void
		{
			
		}
		
		private static function getOS():String
		{
			return Capabilities.os
		}
		
		public static function isAndroid():Boolean
		{
			return  Platform.isAndroid
		}
		public static function isIOS():Boolean
		{
			return  Platform.isIOS
		}
		
		public static function get isMobile():Boolean
		{
			return  Platform.isMobile
		}
		
		public static function get isPc():Boolean
		{
			return Platform.isDesktop
		}
		
		public static function get os():String
		{
			var _paltform:String 
			if (Platform.isWindows){
				_paltform = "window";
			}else if (Platform.isMac){
				_paltform = "mac"
			}else if (Platform.isAndroid){
				_paltform = "android"
			}else if (Platform.isIOS){
				_paltform = "ios"
			}
			return _paltform
		}
		
		public static function init():void
		{
			var _map:SpecialCaseMapping = new SpecialCaseMapping
			trace("runtimeDPI",_map.runtimeDPI)
		}
	}
}