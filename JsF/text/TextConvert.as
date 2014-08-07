package JsF.text
{
	import flashx.textLayout.conversion.ConversionType;
	import flashx.textLayout.conversion.TextConverter;
	import flashx.textLayout.elements.TextFlow;

	public class TextConvert
	{
		public function TextConvert()
		{
			
		}
		
		public static function rebuilderTextFlow(_textFlow:TextFlow):TextFlow
		{
			return TextToFlow(FlowToText(_textFlow))
		}
		
		public static function TextToFlow(_text:String):TextFlow
		{
			return TextConverter.importToFlow(_text,TextConverter.TEXT_FIELD_HTML_FORMAT)
		}
		
		public static function FlowToText(_textFlow:TextFlow):String
		{
			return TextConverter.export(_textFlow,TextConverter.TEXT_FIELD_HTML_FORMAT,ConversionType.STRING_TYPE).toString()
		}
	}
}