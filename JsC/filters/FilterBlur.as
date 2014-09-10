package JsC.filters
{
	import spark.filters.BlurFilter;
	
	public class FilterBlur extends BlurFilter
	{
		public function FilterBlur(blurX:Number=4.0, blurY:Number=4.0, quality:int=1)
		{
			super(blurX, blurY, quality);
		}
	}
}