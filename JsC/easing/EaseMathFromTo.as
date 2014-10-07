package JsC.easing
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import JsC.events.JEvent;

	
	[Event(name="UPDATE", type="JsC.events.JEvent")]
	public class EaseMathFromTo extends EaseMath_Base
	{
		[Bindable] public var value:Number
		
		private const cTime:uint = 6
			
		public var e:Number = 0.1
		public var f:Number = 0.0
		public var s:Number = 30	
		public var l:Number = 2
			
		private var nV:Number
	
			
		public function EaseMathFromTo()
		{
			nTime = new Timer(0);
			nTime.addEventListener(TimerEvent.TIMER,onTiming)
		}
		
		protected function onTiming(event:TimerEvent):void
		{
			var _event:JEvent = new JEvent(JEvent.UPDATE)
			nV = (nT-nC)*e + (nV*f)
			nC += nV
			_event.z = nC
	
			dispatchEvent(_event)
			if (Math.abs(nT-nC)<0.02)
			{
				nTime.stop()
			}
		}
		
		public function doDistance(_from:Number,_pos:Number,_function:Function = null):void
		{
			if (Math.abs(_pos) <l) return
			nT = _from + _pos * s
			nC = _from
			nV = 0
			if (_function!=null)
			{
				if (hasEventListener(JEvent.UPDATE))removeEventListener(JEvent.UPDATE,_function);
				addEventListener(JEvent.UPDATE,_function);
			}
			if (!nTime.running) nTime.start()
		}
		
		public function stop():void
		{
			nTime.stop()
		}
		
		
	}
}