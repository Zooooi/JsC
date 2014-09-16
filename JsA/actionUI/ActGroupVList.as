package JsA.actionUI
{
	import flash.events.Event;
	
	import mx.core.UIComponent;
	import mx.events.ResizeEvent;
	
	import spark.components.Group;
	import spark.components.HGroup;
	import spark.components.VGroup;
	
	import JsC.mvc.ActionUI;
	
	public class ActGroupVList extends ActionUI
	{
		
		public var hGap:uint = 6
		public var vGap:uint = 6
		public var bAction:Boolean = true
		private var gr:VGroup
		
		private var nLastLine:uint
		private var lastGroup:HGroup
		
		private var vUI:Vector.<UIComponent>
		
		private var nCount:uint
		
		public function ActGroupVList(_vi:UIComponent=null)
		{
			super(_vi);
			gr = VGroup(_vi)
		}
		
		public function init():void
		{
			nCount = 0
			vUI = new Vector.<UIComponent>
			initView()
		}
		
		private function initView():void
		{
			gr.removeAllElements()
			addLine()
		}

		private function addLine():void
		{
			var _gr:HGroup = new HGroup
			_gr.gap = hGap
			gr.gap = vGap
			gr.addElement(_gr)
			
			getLastGroup()
		}
		
		private function getLastGroup():void
		{
			nLastLine = gr.numElements - 1
			lastGroup = HGroup(gr.getElementAt(nLastLine))
		}
		
		public function addChild(_ui:UIComponent):void
		{
			vUI.push(_ui)
				
			if (!lastGroup.hasEventListener(ResizeEvent.RESIZE))
			{
				addChildAction()
			}
				
		}
		
		private function addChildAction():void
		{
			if (vUI.length) 
			{
				var _ui:UIComponent = vUI.shift()
				lastGroup.addElement(_ui)
				lastGroup.addEventListener(ResizeEvent.RESIZE,function(event:ResizeEvent):void{
					lastGroup.removeEventListener(event.type,arguments.callee)
					if (lastGroup.width > gr.width)
					{
						addLine()
						lastGroup.addElement(_ui)
					}
					if (bAction) _ui.addEventListener(Event.REMOVED_FROM_STAGE,onItemEvent) /*不能移*/
					nCount++
					addChildAction()
				})
			}
		}
		
		protected function onItemEvent(event:Event):void
		{
			var _current:UIComponent = UIComponent(event.currentTarget)
			_current.removeEventListener(event.type,arguments.callee)
			switch(event.type)
			{
				case Event.REMOVED_FROM_STAGE:
					var _lineNumber:Number = gr.getElementIndex(Group(_current.parent))
					var _currentGroup:Group
					var _lastW:Number
					var _lastG:Group
					
					for (var i:int = _lineNumber; i < gr.numElements; i++) 
					{
						_currentGroup = Group(gr.getElementAt(i))
						if (i ==_lineNumber)
						{
							_lastW = _currentGroup.contentWidth - _current.width - hGap
						}else{
							if (_currentGroup.numElements != 0) 
							{
								var _firstChild:UIComponent = UIComponent(_currentGroup.getElementAt(0))
								if (_lastW + _firstChild.width < gr.width)
								{
									_firstChild.removeEventListener(Event.REMOVED_FROM_STAGE,onItemEvent)
									_lastG.addElement(_firstChild)
									_firstChild.addEventListener(Event.REMOVED_FROM_STAGE,onItemEvent)
								}else{
									break
								}
							}else{
								gr.removeElement(_currentGroup)
								getLastGroup()
								break
							}
							
							_lastW = _currentGroup.contentWidth - _firstChild.width - hGap
						}
						_lastG = Group(gr.getElementAt(i))
					}
					break;
			}
		}
		
		
		
		
		
		public function removeChild(_ui:UIComponent):void
		{
			
		}
		
		
		public function removeAllChild():void
		{
			gr.removeAllElements()
			addLine()
		}
		
		
	}
}