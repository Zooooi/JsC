package JsC.mvc
{
	import JsC.sys.JObject;
	import JsC.xml.XmlCtrl;
	
	public dynamic class VO extends Object /** 暂时不要改为 Dictionary */
	{
		public function VO(obj:Object = null)
		{
			if (obj !=null)
			{
				fill(obj)
			}
		}
		
		public function fill(obj:Object):void
		{
			for (var i:* in obj)
			{
				this[i] = obj[i]
			}
		}
		
		public function toObject():Object
		{
			var vo:Object = (JObject.cloneObject(this))
			return vo
		}
		
		public function clone():VO
		{
			var vo:VO = new VO
			vo.fill(toObject())
			return vo
		}
		
		public function delKey(_name:String):void
		{
			delete this[_name];
		}
		
		public function copy(_vo:VO):void
		{
			for each(var s:String in _vo)
			{
				this[s] = _vo[s]
			}
		}
		
		public function _addVO(_vo:VO):void
		{
			
		}
		
		public function fromXML(_xml:XML,_key:String):void
		{
			var _xmllist:XMLList = _xml[_key]
			for (var i:int = 0; i < _xmllist.attributes().length(); i++) 
			{
				var _name:String = _xmllist.attributes()[i].localName()
				this[_name] = _xmllist.attributes()[i]
			}
			
		}
	}
}