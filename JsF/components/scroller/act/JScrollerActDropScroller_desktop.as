/**
 * 
 * 使desktop的scroller也像mobile一樣
 *  
 */
package JsF.components.scroller.act
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.utils.Platform;
	
	import spark.components.Group;
	import spark.components.HGroup;
	import spark.components.VGroup;
	
	import JsC.easing.EaseMathFromTo;
	import JsC.events.JEvent;
	import JsC.mvc.ActionUI;
	
	import JsF.components.scroller.ext.JScroller;
	
	
	[Event(name="REMOVED", type="JsC.events.JEvent")]
	[Event(name="STOP", type="JsC.events.JEvent")]
	public class JScrollerActDropScroller_desktop extends ActionUI
	{
		
		private var _scroller:JScroller
		
		private var nX:Number=0;
		private var nY:Number=0;
		private var xPos:Number
		private var yPos:Number
		
		
		private var _gr:Group
		
		private var ease_H:EaseMathFromTo
		private var ease_V:EaseMathFromTo
		
		private var bMouseEnable:Boolean
		private var bMouseChildren:Boolean
		private var bMove:Boolean
		
		public function JScrollerActDropScroller_desktop(__scroller:JScroller,_group:Group)
		{
			if (Platform.isDesktop)
			{
				_scroller = __scroller
				_gr = _group
				setDropScroll()
				
				ease_H = new EaseMathFromTo
				ease_V = new EaseMathFromTo
					
				ease_H.addEventListener(JEvent.UPDATE,onHUpdate)
				ease_V.addEventListener(JEvent.UPDATE,onVUpdate)
				
				addEventListener(JEvent.STOP,function(event:JEvent):void{
					ease_H.stop()
					ease_V.stop()
				})
			}
		}
		
		
		protected function setDropScroll():void
		{
			_scroller.addEventListener(MouseEvent.MOUSE_DOWN,scroller_mouseDownHandler);
			addEvent()
		}
		
		protected function onStageMouseEvent(event:MouseEvent):void
		{
			_gr.mouseChildren = bMouseChildren
			_gr.mouseEnabled = bMouseEnable
			_gr.stage.removeEventListener(MouseEvent.MOUSE_UP,onStageMouseEvent);
			doEffect()
		}
		
		protected function scroller_mouseDownHandler(event:MouseEvent):void
		{
			_gr.stage.addEventListener(MouseEvent.MOUSE_UP,onStageMouseEvent);
			xPos = 0
			yPos = 0
			nX = _scroller.stage.mouseX
			nY = _scroller.stage.mouseY
			ease_H.stop()
			ease_V.stop()
			bMouseChildren = _gr.mouseChildren	
			bMouseEnable = _gr.mouseEnabled
			bMove = false
		}
		
		protected function scrollerH_mouseMoveHandler(event:MouseEvent):void
		{
			if (event.buttonDown)
			{
				if (!bMove)
				{
					_gr.mouseChildren = false
					_gr.mouseEnabled = false
					bMove = true
				}
				xPos = nX - event.stageX;
				_gr.layout.horizontalScrollPosition += xPos;
				nX = event.stageX;
			}
		}
		
		protected function scrollerV_mouseMoveHandler(event:MouseEvent):void
		{
			if (event.buttonDown)
			{
				if (!bMove)
				{
					_gr.mouseChildren = false
					_gr.mouseEnabled = false
					bMove = true
				}
				yPos = nY - event.stageY;
				_gr.layout.verticalScrollPosition += yPos;
				nY = event.stageY;
			}
		}
		
		
		private function addEvent():void
		{
			if (_gr is HGroup)
			{
				_scroller.addEventListener(MouseEvent.MOUSE_MOVE,scrollerH_mouseMoveHandler);
				
			}else if(_gr is VGroup)
			{
				_scroller.addEventListener(MouseEvent.MOUSE_MOVE,scrollerV_mouseMoveHandler);
			}else{
				_scroller.addEventListener(MouseEvent.MOUSE_MOVE,scrollerH_mouseMoveHandler);
				_scroller.addEventListener(MouseEvent.MOUSE_MOVE,scrollerV_mouseMoveHandler);
			}
			_scroller.addEventListener(Event.REMOVED_FROM_STAGE,function(event:Event):void{
				_scroller.removeEventListener(MouseEvent.MOUSE_DOWN,scroller_mouseDownHandler);
				if (_gr is HGroup)
				{
					_scroller.removeEventListener(MouseEvent.MOUSE_MOVE,scrollerH_mouseMoveHandler);
				}else if(_gr is VGroup)
				{
					_scroller.removeEventListener(MouseEvent.MOUSE_MOVE,scrollerV_mouseMoveHandler);
				}else{
					_scroller.removeEventListener(MouseEvent.MOUSE_MOVE,scrollerH_mouseMoveHandler);
					_scroller.removeEventListener(MouseEvent.MOUSE_MOVE,scrollerV_mouseMoveHandler);
				}
			});
		}
		
		
		
		private function doEffect():void
		{
			var _y:Number = _gr.layout.verticalScrollPosition
			var _x:Number = _gr.layout.horizontalScrollPosition
			
			if (_gr is HGroup)
			{
				ease_H.doDistance(_x, xPos)
			}else if(_gr is VGroup)
			{
				ease_V.doDistance(_y, yPos)
			}else{
				ease_H.doDistance(_x, xPos)
				ease_V.doDistance(_y, yPos)
			}
		}
		
		
		
		protected function onVUpdate(event:JEvent):void
		{
			_gr.layout.verticalScrollPosition = event.z
		}
		
		protected function onHUpdate(event:JEvent):void
		{
			_gr.layout.horizontalScrollPosition = event.z
		}
		
		public function stop():void
		{
			dispatchEvent(new JEvent(JEvent.STOP))
		}
	}
}