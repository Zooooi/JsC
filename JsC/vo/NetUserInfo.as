package JsC.vo
{
	import JsC.mvc.VO;
	
	public class NetUserInfo extends VO
	{
		
		[Bindable] public var site:String = "";
		[Bindable] public var name:String = "";
		[Bindable] public var pass:String = "";
		[Bindable] public var id:String="";
		
		public function NetUserInfo(obj:Object=null)
		{
			
		}
	}
}