package JsF.components.act
{
	import spark.effects.Animate;
	import spark.effects.animation.MotionPath;
	import spark.effects.animation.SimpleMotionPath;
	
	import JsC.mvc.Controller;
	
	public class JScrollerAni extends Controller
	{
		private var ani:Animate
		private var objArray:Array
		public var duration:uint = 1000
		private var bVertical:Boolean = true;
		private var motionPath:SimpleMotionPath
		
		public function JScrollerAni()
		{
			ani = new Animate
		}
		
		public function horizontalScroll(_array:Array):void
		{
			bVertical = false
			objArray = _array
			initValue()
		}
		
		public function verticalScroll(_array:Array):void
		{
			bVertical = true
			objArray = _array
			initValue()
		}
		
		private function initValue():void
		{
			ani.duration = duration
			motionPath = new SimpleMotionPath
			if (bVertical){
				motionPath.property = "verticalScrollPosition"
			}else{
				motionPath.property = "horizontalScrollPosition"
			}
			var v:Vector.<MotionPath> = new Vector.<MotionPath>
			v.push(motionPath)
			ani.motionPaths = v
		}
		
		public function setValue(_value:Number):void
		{
			motionPath.valueBy = _value
		}
		
		public function play():void
		{
			ani.play(objArray);
		}
		
		public function stop():void
		{
			if (ani.isPlaying)
				ani.stop()
		}
	}
}