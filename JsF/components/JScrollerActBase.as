package JsF.components
{
	import flash.display.Stage;
	import flash.events.MouseEvent;
	
	import mx.core.UIComponent;
	
	import spark.components.BusyIndicator;
	import spark.components.Scroller;
	import spark.components.VGroup;
	import spark.components.supportClasses.ScrollBarBase;
	
	import JsC.events.JEvent;
	import JsC.mvc.ActionUI;
	import JsC.sys.SystemOS;
	
	
	[Event(name="ONSTART", type="JsC.events.JEvent")]
	[Event(name="ONEND", type="JsC.events.JEvent")]
	
	public class JScrollerActBase extends ActionUI
	{
		public var $slider:Number = 30;
		
		protected var scroller:Scroller;
		protected var gr:VGroup
		protected var stage:Stage
		
		protected var funcDragToStart:Function
		protected var funcDragToEnd:Function
		
		protected var nWaiting:uint = 10;
		protected var dragWaiting:BusyIndicator
		protected var bOnce:Boolean
		
		protected var scrollerbar:ScrollBarBase
		protected var nRange:uint
		
		//*copy---------------------------------------------------------
		protected var view:JScrollerV;
		/*	public static function getInstance():JScrollerAct
		{
		return instance;
		}*/
		//-copy---------------------------------------------------------
		
		public function JScrollerActBase(_vi:UIComponent)
		{
			super(_vi);
			view = JScrollerV(_vi)
			
			scroller = view._scroller
			gr = view._gr
			dragWaiting = view._dragWaiting
			stage = view.stage;
			scroller.addEventListener(MouseEvent.MOUSE_DOWN,onScrollMouseEvent)
				
		}
		
		public function _removeAllElement():void
		{
			gr.removeAllElements();
		}
		public function _removeAllEvent():void
		{
			_removeEvent_DragToStart()
			_removeEvent_DragToEnd()
		}
		public function _stop():void
		{
			stage.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_UP));
		}
		
		public function _addElement(_ui:UIComponent):void
		{
			gr.addElement(_ui)
		}
		
		public function _getContent():VGroup
		{
			return gr;
		}
		
		public function _getScroller():Scroller
		{
			return scroller;
		}
		
		
		
		
		public function _addEvent_DragToStart(_function:Function):void
		{
			funcDragToStart = _function
			addEventListener(JEvent.ONSTART,funcDragToStart)
		}
		
		public function _addEvent_DragToEnd(_function:Function):void
		{
			funcDragToEnd = _function
			addEventListener(JEvent.ONEND,funcDragToEnd)	
		}
		
		
		
		
		public function _removeEvent_DragToStart():void
		{
			if(funcDragToStart!=null)
			{
				removeEventListener(JEvent.ONSTART,funcDragToStart)
				funcDragToStart = null
			}
		}
		
		public function _removeEvent_DragToEnd():void{
			if(funcDragToEnd!=null)
			{
				removeEventListener(JEvent.ONEND,funcDragToEnd)
				funcDragToEnd = null
			}
		}
		
		
		protected function onScrollMouseEvent(event:MouseEvent):void
		{
			switch(event.type)
			{
				case MouseEvent.MOUSE_DOWN:
					bOnce = false;
					scroller.addEventListener(MouseEvent.MOUSE_MOVE,onScrollMouseEvent)
					if (!onScrollEnd())view.stage.addEventListener(MouseEvent.MOUSE_UP,onStageMouseEvent)
					break;
				case MouseEvent.MOUSE_MOVE:
					onScrollEnd()
					break
			}
		}	
		
		
		protected function onStageMouseEvent(event:MouseEvent):void
		{
			//onScrollEnd()
			scroller.removeEventListener(MouseEvent.MOUSE_MOVE,onScrollMouseEvent)
			view.stage.removeEventListener(MouseEvent.MOUSE_UP,onStageMouseEvent)
			dragWaiting.visible = false;
		}
		
		
		protected function getScrollerBar():ScrollBarBase
		{
			return scrollerbar
		}
		
		protected function onScrollEnd():Boolean
		{
			var _bSroll:Boolean
			if (getScrollerBar())
			{
				if (checkEnd())
				{
					if (!bOnce && hasEventListener(JEvent.ONEND))
					{
						dispatchEvent(new JEvent(JEvent.ONEND));
						bOnce = true
					}
				}else if(checkStart())
				{
					if (!bOnce && hasEventListener(JEvent.ONSTART))
					{
						dispatchEvent(new JEvent(JEvent.ONSTART));
						bOnce = true
					}
				}else{
					dragWaiting.visible = false;
				}
			}
			return _bSroll
		}
		
		
		
		
		protected function checkStart():Boolean
		{
			var _b:Boolean
			if (SystemOS.isPc)
			{
				_b = scrollerbar.value <= -$slider
			}else{
				_b = scrollerbar.value <= -$slider
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

