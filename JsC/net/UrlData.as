package JsC.net
{
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	
	import JsC.events.JEvent;
	import JsC.mvc.Controller;
	import JsC.vo.NetUserInfo;
	
	
	[Event(name="YES", type="JsC.events.JEvent")]
	[Event(name="NO", type="JsC.events.JEvent")]
	[Event(name="IOERROR", type="JsC.events.JEvent")]
	[Event(name="COMPLETE", type="JsC.events.JEvent")]
	
	public class UrlData extends Controller
	{
		
		protected static var userInfo:NetUserInfo;
		protected static var webSite:String;
		
		protected var xml:XML
		private var urlLoader:URLLoader;
		
		public function UrlData(_vo:NetUserInfo = null)
		{
			if (_vo)
			{
				userInfo = _vo
			}
			init()
		}
		private function init():void
		{
			urlLoader = new URLLoader
			urlLoader.addEventListener(IOErrorEvent.IO_ERROR,function(event:IOErrorEvent):void
			{
				dispatchEvent(new JEvent(JEvent.IOERROR));
			});
			urlLoader.addEventListener(Event.COMPLETE,function(event:Event):void
			{
				
				var _id:String
				try
				{
					xml = new XML(event.currentTarget.data);
					_id = xml.action.@id;
				} 
				catch(error:Error) 
				{
					_id = "false";
					dispatchEvent(new JEvent(JEvent.IOERROR));
				}
				switch(_id)
				{
					case "false":
					case "none":
						dispatchEvent(new JEvent(JEvent.NO));
						break
					case "success":
						dispatchEvent(new JEvent(JEvent.YES));
						break
					default:
						var _event:JEvent = new JEvent(JEvent.COMPLETE)
						_event.key = _id
						_event._xml = xml
						dispatchEvent(_event);
				}
			});
		}
		
		public function login(data:Object=null,_php:String=""):void
		{
			if (data==null) data = new Object
			data.username = userInfo.name;
			data.password = userInfo.pass;
			onLoad(_php,data)
			
			addEventListener(JEvent.COMPLETE,function(event:JEvent):void{
				event.currentTarget.removeEventListener(event.type,arguments.callee)
				switch(event.key)
				{
					case "login":
						userInfo.id = xml.action.@uid;
						dispatchEvent(new JEvent(JEvent.YES));
						break
				}
			})
		}
		
		protected function onLoad(_page:String,data:Object):void
		{
			urlLoader.load(postWebData(_page,data));
		}
		
		protected function postWebData(_url:String,data:Object):URLRequest
		{
			var _link:String = webSite + _url;
			var _urlLink:URLRequest = new URLRequest(_link);	
			var variables:URLVariables = new URLVariables();
			for (var s:String in data) variables[s] = data[s];
			_urlLink.data = variables;
			_urlLink.method = URLRequestMethod.POST
			return _urlLink;
		}
	}
}