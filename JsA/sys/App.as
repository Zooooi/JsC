package JsA.sys
{
	import flash.desktop.NativeApplication;

	public class App
	{
		public function App()
		{
			
		}
		
		public static function getVersion():String {
			var appXml:XML = NativeApplication.nativeApplication.applicationDescriptor;
			var ns:Namespace = appXml.namespace();
			var appVersion:String = appXml.ns::versionNumber[0];
			return appVersion;
		}
	}
}