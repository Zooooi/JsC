package JsC.shell
{
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	import JsC.events.FilesEvent;
	import JsC.mdel.SystemOS;

	public class ShellAction
	{
		public function ShellAction()
		{
		}
		
		public static function GoWeb(_current:Object,_url:String):void
		{
			if (SystemOS.isMobile)
			{
				var _event:FilesEvent = new FilesEvent(FilesEvent.OPEN_HTML)
				_event.url = _url
				_current.dispatchEvent(_event)
			}else{
				navigateToURL(new URLRequest(_url))
			}
		}
	}
}