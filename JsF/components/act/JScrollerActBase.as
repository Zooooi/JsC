package JsF.components.act
{
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import flash.utils.Timer;
	
	import mx.core.UIComponent;
	import mx.events.FlexEvent;
	import mx.events.PropertyChangeEvent;
	
	import spark.components.Group;
	import spark.components.HGroup;
	import spark.components.Scroller;
	import spark.components.VGroup;
	import spark.components.supportClasses.ScrollBarBase;
	
	import JsC.events.JEvent;
	import JsC.mvc.ActionUI;
	import JsC.sys.SystemOS;
	
	import JsF.components.JScrollerH;
	import JsF.components.JScrollerV;
	
	
	[Event(name="ONSTART", type="JsC.events.JEvent")]
	[Event(name="ONEND", type="JsC.events.JEvent")]
	[Event(name="READY", type="JsC.events.JEvent")]
	
	public class JScrollerActBase extends ActionUI
	{
		public var $slider:Number = 30;
		/**
		 * 模式分類true未做好 
		 */		
		public var $mode:Boolean = false
		
		
		protected var scroller:Scroller;
		
		protected var stage:Stage
		
		protected var nWaiting:uint = 10;
		
		protected var bOnce:Boolean
		
		protected var scrollerbar:ScrollBarBase
		protected var nRange:uint
		
		protected var gr:Group
		
		protected var scrollerV:JScrollerV;
		protected var scrollerH:JScrollerH;
		
		protected var nTimer:Timer
		protected var nInterval:uint
		
		public function JScrollerActBase(_vi:UIComponent)
		{
			super(_vi);
			if (_vi is JScrollerV)
			{
				scrollerV = JScrollerV(_vi)
				scroller = scrollerV._scroller
				gr = scrollerV._gr
			}else if (_vi is JScrollerH){
				scrollerH = JScrollerH(_vi)
				scroller = scrollerH._scroller
				gr = scrollerH._gr
			}else{
				return
			}
			scroller.viewport.addEventListener(FlexEvent.UPDATE_COMPLETE,onCheckScrolling)
			scroller.addEventListener(MouseEvent.MOUSE_DOWN,onScrollMouseEvent)
			
		}
		
		protected function onScrollMouseEvent(event:MouseEvent):void
		{
			bOnce = false
		}
		
		public function _removeAllElement():void
		{
			gr.removeAllElements();
		}
		
		public function _stop():void
		{
			stage.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_UP));
		}
		
		public function _addElement(_ui:UIComponent):void
		{
			gr.addElement(_ui)
		}
		
		public function _getContentV():VGroup
		{
			return VGroup(gr);
		}
		
		public function _getContentH():HGroup
		{
			return HGroup(gr);
		}
		
		public function _getScroller():Scroller
		{
			return scroller;
		}
		
		
		
		protected function getScrollerBar():ScrollBarBase
		{
			return scrollerbar
		}
		
		protected function onCheckScrolling(event:FlexEvent):void
		{
			if (getScrollerBar())
			{
				if (checkEnd())
				{
					if (!bOnce)
					{
						dispatchEvent(new JEvent(JEvent.ONEND));
						bOnce = true
					}
				}else if(checkStart())
				{
					if (!bOnce)
					{
						dispatchEvent(new JEvent(JEvent.ONSTART));
						bOnce = true
					}
				}
			}
		}
		
		
		protected function checkStart():Boolean
		{
			var _b:Boolean
			if (SystemOS.isPc)
			{
				_b = scrollerbar.value <= scrollerbar.minimum - $slider
			}else{
				_b = scrollerbar.value <= scrollerbar.minimum + nRange - $slider
			}
			return _b
		}
		
		
		
		protected function checkEnd():Boolean
		{
			var _b:Boolean
			if (SystemOS.isPc)
			{
				_b = scrollerbar.value >= scrollerbar.maximum + $slider
			}else{
				_b = scrollerbar.value >= scrollerbar.maximum - nRange + $slider
			}
			return _b
		}
	
	}
}

