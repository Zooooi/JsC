package JsC.filters
{
	import spark.filters.BevelFilter;
	
	public class FilterBevel extends BevelFilter
	{
		public function FilterBevel(distance:Number=4.0, angle:Number=45, highlightColor:uint=16777215, highlightAlpha:Number=1.0, shadowColor:uint=0, shadowAlpha:Number=1.0, blurX:Number=4.0, blurY:Number=4.0, strength:Number=1, quality:int=1, type:String="inner", knockout:Boolean=false)
		{
			super(distance, angle, highlightColor, highlightAlpha, shadowColor, shadowAlpha, blurX, blurY, strength, quality, type, knockout);
		}
	}
}