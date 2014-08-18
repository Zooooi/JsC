package JsC.mvc
{
	
	[Bindable] dynamic public class VO extends Object
	{
		public var vL:Array
		
		public function VO()
		{
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
		
		public function fillToArray(obj:Object):void
		{
			vL = new Array
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
		
	}
}