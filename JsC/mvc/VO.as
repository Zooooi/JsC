package JsC.mvc
{
	import JsC.sys.JObject;
	
	[Bindable] dynamic public class VO extends Object
	{
		public var vL:Vector.<Object>
		
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
				try
				{
					this[i] = obj[i]
				} 
				catch(error:Error) 
				{
					
				}
				
			}
		}
		
		public function toArray(obj:Object):void
		{
			vL = new Vector.<Object>
			for (var i:* in obj)
			{
				vL.push({name:i,content:obj[i]});
			}
		}
		
		public function v(_name:String):VO
		{
			var _vo:VO = new VO
			_vo.fill(this[_name])
			return _vo
		}
		
		public function s(_name:String):String
		{
			return String(this[_name]);
		}
		
		
		public function a(_name:String):Array
		{
			return this[_name];
		}
		
		
		public function o(_obj:Object):String
		{
			return String(_obj);
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
		
	}
}