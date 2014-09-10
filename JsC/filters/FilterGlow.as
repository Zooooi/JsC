package JsC.filters
{
	import spark.filters.GlowFilter;
	
	public class FilterGlow extends GlowFilter
	{
		public function FilterGlow(color:uint=16711680, alpha:Number=1.0, blurX:Number=4.0, blurY:Number=4.0, strength:Number=1, quality:int=1, inner:Boolean=false, knockout:Boolean=false)
		{
			super(color, alpha, blurX, blurY, strength, quality, inner, knockout);
		}
	}
}