/**
 * 檢測 scroller 在移動到頂部或底部後發出相應事件
 * 
 * JScrollerActH 和 JScrollerActV 是針對橫豎scroller的擴展類。
 * 
 */

package JsF.components.scroller.act
{
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import flash.utils.Timer;
	
	import mx.core.UIComponent;
	import mx.events.FlexEvent;
	
	import spark.components.Group;
	import spark.components.HGroup;
	import spark.components.VGroup;
	import spark.components.supportClasses.ScrollBarBase;
	
	import JsC.events.JEvent;
	import JsC.mvc.ActionUI;
	
	import JsF.components.scroller.ext.JScroller;
	import JsF.components.scroller.ext.JcScrollerH;
	import JsF.components.scroller.ext.JcScrollerV;
	
	
	[Event(name="ONSTART", type="JsC.events.JEvent")]
	[Event(name="ONEND", type="JsC.events.JEvent")]
	[Event(name="READY", type="JsC.events.JEvent")]
	
	public class JScrollerActBase extends ActionUI
	{
		public var $slider:Number = 0;
		
		protected var scroller:JScroller;
		
		protected var stage:Stage
		
		protected var nWaiting:uint = 10;
		
		private var bOnce:Boolean = true
		
		protected var scrollerbar:ScrollBarBase
		protected var nRange:uint
		
		protected var gr:Group
		
		protected var scrollerV:JcScrollerV;
		protected var scrollerH:JcScrollerH;
		
		protected var nTimer:Timer
		protected var nInterval:uint
		
		private var checkStart:Function
		private var checkEnd:Function
		
		public function JScrollerActBase(_vi:UIComponent)
		{
			super(_vi);
			
			if (_vi is JcScrollerV)
			{
				scrollerV = JcScrollerV(_vi)
				scroller = scrollerV._scroller
				gr = scrollerV._gr
				reset()
				checkStart = function():Boolean
				{
					var _b:Boolean = scroller.viewport.verticalScrollPosition <= 0  - $slider
					return _b
				}	
				checkEnd = function():Boolean
				{
					var _b:Boolean = scroller.viewport.verticalScrollPosition >= gr.layout.target.contentHeight - nRange + $slider
					_b = (scroller.height > gr.contentHeight) ? false:_b;
					return _b;
				}	
			}
			else if (_vi is JcScrollerH)
			{
				scrollerH = JcScrollerH(_vi)
				scroller = scrollerH._scroller
				gr = scrollerH._gr
				reset()
				checkStart = function():Boolean
				{
					var _b:Boolean = scroller.viewport.horizontalScrollPosition <= 0  - $slider
					return _b
				}	
				checkEnd = function():Boolean
				{
					var _b:Boolean = scroller.viewport.horizontalScrollPosition >= gr.layout.target.contentWidth - nRange + $slider
					_b = (scroller.width > gr.contentWidth) ? false:_b;
					return _b
				}	
			}else
			{
				return
			}
			scroller.viewport.addEventListener(FlexEvent.UPDATE_COMPLETE,onCheckScrolling)
			scroller.addEventListener(MouseEvent.MOUSE_DOWN,onScrollMouseEvent)
		}
		
		
		private  function reset():void
		{
			if (vi is JcScrollerV)
			{
				nRange = scroller.height
			}else if (vi is JcScrollerH){
				nRange = scroller.width
			}
		}
		protected function onScrollMouseEvent(event:MouseEvent):void
		{
			openCheckEvent()
		}
		
		public function _removeAllElement():void
		{
			gr.removeAllElements();
		}
		
		public function _stop():void
		{
			scroller.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_UP));
		}
		
		public function _addElement(_ui:UIComponent):void
		{
			gr.addElement(_ui)
		}
		
		public function _getContent():Group
		{
			return gr;
		}
		
		public function _getContentV():VGroup
		{
			return VGroup(gr);
		}
		
		public function _getContentH():HGroup
		{
			return HGroup(gr);
		}
		
		public function _getScroller():JScroller
		{
			return scroller;
		}
		
		
		protected function onCheckScrolling(event:FlexEvent):void
		{
			
			if (checkEnd())
			{
				if (!bOnce)
				{
					reclick()
					dispatchEvent(new JEvent(JEvent.ONEND));
					bOnce = true
				}
			}else if(checkStart())
			{
				if (!bOnce)
				{
					reclick()
					dispatchEvent(new JEvent(JEvent.ONSTART));
					bOnce = true
				}
			}
		}
		
		public function openCheckEvent():void
		{
			bOnce = false
		}
		
		
		private function reclick():void
		{
			_stop()
		}
		
		
	}
}

