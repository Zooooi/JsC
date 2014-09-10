package JsF.components.act
{
	import flash.events.Event;
	
	import mx.core.UIComponent;
	import mx.events.FlexEvent;
	
	import spark.components.Group;
	import spark.components.HGroup;
	import spark.components.VGroup;
	import spark.layouts.HorizontalLayout;
	import spark.layouts.VerticalLayout;
	
	import JsC.events.JEvent;
	import JsC.mvc.Controller;
	
	import JsF.components.rebuilder.Scroller_ex;
	
	
	[Event(name="REMOVE", type="JsC.events.JEvent")]
	[Event(name="ALLCOMPLETE", type="JsC.events.JEvent")]
	[Event(name="INIT", type="JsC.events.JEvent")]
	[Event(name="ADDED", type="JsC.events.JEvent")]
	
	
	public class JScrollerCtrlDragPage extends Controller implements IScrollerDragePage
	{
		
		protected const actNormal:String = "actNormal"
		protected const actInit:String = "actInit"
		protected const actNext:String = "actNext"
		protected const actPrev:String = "actPrev"
		protected var act:String = actInit	
		
		protected var scroller:Scroller_ex
		protected var scrollerCtrl:JScrollerActBase
		
		private var grContent:Group
		private var item:UIComponent
		
		protected var nCount:uint;
		protected var cTotal:uint
		protected var cLength:uint
		protected var nLength:uint
		
		private var nUpdate_debug:uint;
		private var nInterval:uint
		private var nValue:Number
		protected var aniScroll:JScrollerAni
		
		
		public function JScrollerCtrlDragPage(_ctrl:JScrollerActBase) 
		{
			scrollerCtrl = _ctrl;
			scroller = scrollerCtrl._getScroller()
			grContent = _ctrl._getContent()
			aniScroll = new JScrollerAni
			
			if (grContent is VGroup)
			{
				aniScroll.verticalScroll([grContent.layout])
				addEventListener(JEvent.REMOVE,onVAddEvent)
				addEventListener(JEvent.ALLCOMPLETE,function():void{
					scroller.viewport.verticalScrollPosition = nValue
				})
			}else if (grContent is HGroup) {
				aniScroll.horizontalScroll([grContent.layout])
				addEventListener(JEvent.REMOVE,onHAddEvent)
				addEventListener(JEvent.ALLCOMPLETE,function():void{
					scroller.viewport.horizontalScrollPosition = nValue
				})
			}
			
		}
		
		
		/*
		var lay:HorizontalLayout = gr.layout as HorizontalLayout;	
		var _x:Number = lay.getElementBounds(_elementIndex).x
		var _w:Number = _numberItem.width /2
		
		位移
		nCurrentButtonX = (_x + _w) - lay.horizontalScrollPosition - scroller.viewport.width/2
		aniScrollBy(nCurrentButtonX)
		*/
		protected function aniScrollBy(_offset:Number):void
		{
			aniScroll.setValue(_offset)
			aniScroll.play()
		}
		
		
		
		/*
		var lay:HorizontalLayout = gr.layout as HorizontalLayout;	
		var _x:Number = lay.getElementBounds(_elementIndex).x
		var _w:Number = _numberItem.width /2
		
		位置
		nCurrentButtonX = lay.getElementBounds(_elementIndex).x - scroller.viewport.width/2 + _w
		aniScrollTo(lay.horizontalScrollPosition,nCurrentButtonX)
		*/
		protected function aniScrollFromTo(_from:Number,_to:Number):void
		{
			
			aniScroll.setFromTo(_from,_to)
			aniScroll.play()
		}
		
		
		protected function aniScrollToIndex(_elementIndex:uint,_offset:Number):Number
		{
			var _t:Number
			var _f:Number
			if (grContent is VGroup)
			{
				_f = VerticalLayout(grContent.layout).verticalScrollPosition;
				_t = grContent.layout.getElementBounds(_elementIndex).y - scroller.viewport.height/2 + _offset
			}else if (grContent is HGroup) {
				_f = HorizontalLayout(grContent.layout).horizontalScrollPosition;
				_t = grContent.layout.getElementBounds(_elementIndex).x - scroller.viewport.width/2 + _offset
			}
			aniScrollFromTo(_f,_t)
			return _t
		}
		
		
		protected function aniScrollStop():void
		{
			aniScroll.stop()
		}
			
		
		protected function aniScrollTo(_value:Number):void
		{
			if (grContent is VGroup)
			{
				aniScrollFromTo(grContent.layout.verticalScrollPosition,_value)
			}else if (grContent is HGroup) {
				aniScrollFromTo(grContent.layout.horizontalScrollPosition,_value)
			}
		}
		
		
		protected function onHAddEvent(event:JEvent):void
		{
			var item:UIComponent = UIComponent(event._obj)
			nValue += HGroup(grContent).gap + item.width
			if (nCount == nLength)
			{
				switch(act)
				{
					case actNext:
						nValue = scroller.viewport.horizontalScrollPosition - nValue
						
						break;
					case actPrev:
						nValue = scroller.viewport.horizontalScrollPosition + nValue 
						break
				}
				setUpdateEvent()
			}
			
		}
		
		
		protected function onVAddEvent(event:JEvent):void
		{
			var item:UIComponent = UIComponent(event._obj)
			nValue += VGroup(grContent).gap + item.height
			if (nCount == nLength)
			{
				switch(act)
				{
					case actNext:
						nValue = scroller.verticalScrollBar.value - nValue
						setUpdateEvent()
						break;
					case actPrev:
						setUpdateEvent()
						nValue = scroller.verticalScrollBar.value + nValue 
						break
				}
			}
		}		
		
		
		public function init():void
		{
			nCount = 0;
			act = actInit
		}
		
		public function next():void
		{
			nCount = 0;
			act = actNext
		}
		
		
		public function prev():void
		{
			nCount = 0;
			act = actPrev
		}
		
		public function load():void
		{
			nCount = 0;
			act = actNormal
		}
		
		public function removeAllElement():void
		{
			/*for (var i:int = 0; i < grContent.numElements; i++) 
			{
				var _ui:UIComponent = UIComponent(grContent.getElementAt(i))
				if (_ui.hasEventListener(Event.REMOVED_FROM_STAGE))
				_ui.removeEventListener(Event.REMOVED_FROM_STAGE,onItemEvent)
			}*/
			
			grContent.removeAllElements()
		}
		
		protected function addItem(_start:uint,_end:uint):void
		{
			scroller.stopAnimations()
				
			nLength = _end - _start
			var addFunc:Function 
			switch(act)
			{
				case actPrev:
					addFunc = function(_item:UIComponent,_index:uint):void
					{
						grContent.addElementAt(_item,nLength-(nLength-(i-_start)));
					}
					break
				default:
					addFunc = function(_item:UIComponent,_index:uint):void
					{
						grContent.addElement(_item)
					}
					break;
			}
			
			for (var i:int = _start; i <_end; i++) 
			{
				var _item:UIComponent = createItem(i);
				if (_item != null)
				{
					_item.addEventListener(FlexEvent.CREATION_COMPLETE,onItemEvent)
					if (act != actNormal )
					{
						_item.addEventListener(Event.REMOVED_FROM_STAGE,onItemEvent)
					}
					addFunc(_item,i)
				}else{
					nLength --
				}
				
			}
		
		}
		
		
		protected function addAndDelItem():void
		{
			nCount = 0
			nValue = 0
			nUpdate_debug = 0
			var i:uint;
			
			switch(act)
			{
				case actNext:
					for (i = 0; i <nLength; i++) grContent.removeElementAt(0);
					break;
				
				case actPrev:
					for (i = 0; i <nLength; i++) grContent.removeElementAt(grContent.numElements - 1)
					break
			}
			nValue = 0
		}
		
		private function setUpdateEvent():void
		{
			scroller.stopAnimations();	
			dispatchEvent(new JEvent(JEvent.ALLCOMPLETE));
			scrollerCtrl.dispatchEvent(new JEvent(JEvent.READY))
		}
		
		
		protected function onItemEvent(event:Event):void
		{
			switch(event.type)
			{
				case FlexEvent.CREATION_COMPLETE:
					nCount++;
					if (nCount == nLength)
					{
						
						switch(act)
						{
							
							case actInit:
								dispatchEvent(new JEvent(JEvent.INIT))
								break
							case actNormal:
								/**
								 * bible的普通載入方式
								 * */
								if (scroller.verticalScrollBar)
								{
									scroller.viewport.verticalScrollPosition = 0
								}else if(scroller.horizontalScrollBar)
								{
									scroller.viewport.horizontalScrollPosition = 0
								}
								scrollerCtrl.dispatchEvent(new JEvent(JEvent.READY))
								break;
							default:
								addAndDelItem();
								break;
						}
						dispatchEvent(new JEvent(JEvent.ADDED))
					}
					break;
				
				case Event.REMOVED_FROM_STAGE:
					var item:UIComponent = UIComponent(event.currentTarget)
					item.removeEventListener(event.type,arguments.callee);
					nCount++
					
					var evt:JEvent = new JEvent(JEvent.REMOVE)
					evt._obj = item
					dispatchEvent(evt)
					break
			}
			
		}
		
		protected function createItem(_index:uint):UIComponent
		{
			return new UIComponent
		}
		
	}
}




