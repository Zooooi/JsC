package JsF.components
{
	import flash.display.Stage;
	import flash.events.MouseEvent;
	
	import mx.core.UIComponent;
	
	import spark.components.BusyIndicator;
	import spark.components.Scroller;
	import spark.components.VGroup;
	
	import JsC.events.JEvent;
	import JsC.mvc.ActionUI;
	import JsC.sys.SystemOS;
	
	[Event(name="ONTOP", type="JsC.events.JEvent")]
	[Event(name="ONBOTTOM", type="JsC.events.JEvent")]
	public class JScrollerAct extends ActionUI
	{
		private var scroller:Scroller;
		private var gr:VGroup
		private var stage:Stage
		
		private var funcDragToTop:Function
		private var funcDragToBottom:Function
		
		private var nSlider:uint = 30;
		private var nWaiting:uint = 10;
		private var dragWaiting:BusyIndicator
		protected var bOnce:Boolean
		
		//*copy---------------------------------------------------------
		private static var instance:JScrollerAct;
		protected var view:JScroller;
		/*	public static function getInstance():JScrollerAct
		{
		return instance;
		}*/
		//-copy---------------------------------------------------------
		
		public function JScrollerAct(_vi:UIComponent)
		{
			super(_vi);
			instance = this;
			view = JScroller(_vi)
			
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
			_removeEvent_DragToTop()
			_removeEvent_DragToBottom()
		}
		public function _stop():void
		{
			stage.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_UP));
		}
		
		public function _addElement(_ui:UIComponent):void
		{
			gr.addElement(_ui)
		}
		public function _addEvent_DragToTop(_function:Function):void
		{
			funcDragToTop = _function
			addEventListener(JEvent.ONTOP,funcDragToTop)
		}
		
		public function _addEvent_DragToBottom(_function:Function):void
		{
			funcDragToBottom = _function
			addEventListener(JEvent.ONBOTTOM,funcDragToBottom)	
		}
		
		
		
		
		public function _removeEvent_DragToTop():void
		{
			if(funcDragToTop!=null)
			{
				removeEventListener(JEvent.ONTOP,funcDragToTop)
				funcDragToTop = null
			}
		}
		
		public function _removeEvent_DragToBottom():void{
			if(funcDragToBottom!=null)
			{
				removeEventListener(JEvent.ONBOTTOM,funcDragToBottom)
				funcDragToBottom = null
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
		
		protected function onScrollEnd():Boolean
		{
			var _bSroll:Boolean
			if (scroller.verticalScrollBar)
			{
				if (checkEnd())
				{
					if (!bOnce && hasEventListener(JEvent.ONBOTTOM))
					{
						dragWaiting.visible = true;
						dragWaiting.top = null
						dragWaiting.bottom = nWaiting 
						dispatchEvent(new JEvent(JEvent.ONBOTTOM));
						bOnce = true
					}
				}else if(chechTop())
				{
					if (!bOnce && hasEventListener(JEvent.ONTOP))
					{
						dragWaiting.visible = true;
						dragWaiting.top = nWaiting
						dragWaiting.bottom = null
						dispatchEvent(new JEvent(JEvent.ONTOP));
						bOnce = true
					}
				}else{
					dragWaiting.visible = false;
				}
			}
			return _bSroll
		}
		
		private function chechTop():Boolean
		{
			var _b:Boolean
			if (SystemOS.isPc)
			{
				_b = scroller.verticalScrollBar.value <= -nSlider
			}else{
				_b = scroller.verticalScrollBar.value <= -nSlider
			}
			return _b
		}
		
		private function checkEnd():Boolean
		{
			var _b:Boolean
			if (SystemOS.isPc)
			{
				_b = scroller.verticalScrollBar.value >= scroller.verticalScrollBar.maximum + nSlider
			}else{
				_b = scroller.verticalScrollBar.value >= scroller.verticalScrollBar.maximum - scroller.height + nSlider
			}
			return _b
		}
	}
}

