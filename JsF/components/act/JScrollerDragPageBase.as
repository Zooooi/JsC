package JsF.components.act
{
	import flash.events.Event;
	
	import mx.core.UIComponent;
	import mx.events.FlexEvent;
	
	import spark.components.Group;
	import spark.components.HGroup;
	import spark.components.Scroller;
	import spark.components.VGroup;
	
	import JsC.events.JEvent;
	import JsC.mvc.ActionUI;
	
	import JsF.components.rebuilder.Scroller_ex;
	
	
	[Event(name="REMOVE", type="JsC.events.JEvent")]
	[Event(name="ALLCOMPLETE", type="JsC.events.JEvent")]
	public class JScrollerDragPageBase extends ActionUI implements IScrollerDragePage
	{
		
		protected const actInit:String = "actInit"
		protected const actNext:String = "actNext"
		protected const actPrev:String = "actPrev"
		protected var act:String = actInit	
		
		protected var cUpdate:uint = 25
		protected var cChange:uint = 75
		
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
		
		private var sKind:String
		public function JScrollerDragPageBase(_ctrl:JScrollerActBase) 
		{
			scrollerCtrl = _ctrl;
			scroller = scrollerCtrl._getScroller()
			grContent = _ctrl._getContent()
			
			if (grContent is VGroup)
			{
				addEventListener(JEvent.REMOVE,onVAddEvent)
				addEventListener(JEvent.ALLCOMPLETE,function():void{scroller.verticalScrollBar.viewport.verticalScrollPosition = nValue;})
			}else{
				addEventListener(JEvent.REMOVE,onHAddEvent)
				addEventListener(JEvent.ALLCOMPLETE,function():void{scroller.horizontalScrollBar.viewport.horizontalScrollPosition = nValue;})
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
						nValue = scroller.horizontalScrollBar.value - nValue
						break;
					case actPrev:
						nValue = scroller.horizontalScrollBar.value + nValue 
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
		
		
		protected function addItem(_start:uint,_end:uint):void
		{
			nLength = _end - _start
			var addFunc:Function 
			switch(act)
			{
				case actNext:
				case actInit:
					addFunc = function(_item:UIComponent,_index:uint):void
					{
						grContent.addElement(_item)
					}
					break;
				case actPrev:
					addFunc = function(_item:UIComponent,_index:uint):void
					{
						grContent.addElementAt(_item,nLength-(nLength-(i-_start)));
					}
					break
			}
			
			for (var i:int = _start; i <_end; i++) 
			{
				var _item:UIComponent = createItem(i);
				if (act != actInit)
				{
					_item.addEventListener(FlexEvent.CREATION_COMPLETE,onItemEvent)
				}
				_item.addEventListener(Event.REMOVED_FROM_STAGE,onItemEvent)
				addFunc(_item,i)
			}
		}
		
		
		protected function delItem():void
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
					if (nCount == nLength) delItem();
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