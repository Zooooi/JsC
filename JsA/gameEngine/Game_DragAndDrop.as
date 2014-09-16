package JsA.gameEngine
{
	import flash.display.DisplayObjectContainer;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.utils.clearInterval;
	import flash.utils.setInterval;
	
	import mx.core.UIComponent;
	
	import spark.components.Group;
	
	import JsC.events.GameEvent;
	import JsC.events.JEvent;
	import JsC.mvc.Controller;
	
	
	
	[Event(name="ADDED_TO_TARGET", type="JsC.events.GameEvent")]
	[Event(name="ADDED_TO_SOURCE", type="JsC.events.GameEvent")]
	[Event(name="DRAG_UPDATE", type="JsC.events.GameEvent")]
	[Event(name="DRAG_START", type="JsC.events.GameEvent")]
	
	
	[Event(name="RETURN_TO_SOURCE", type="JsC.events.GameEvent")]
	[Event(name="CHANGE_TO_TARGET", type="JsC.events.GameEvent")]
	
	
	public class Game_DragAndDrop extends Controller
	{
		public var bHitTestQ:Boolean = true
		
		private var grDrag:Group
		
		private var aTarget:Vector.<Group>
		private var aSource:Vector.<Group>
		private var aRecorder:Vector.<MyItem>
		
		private var currentBtn:Group
		private var currentID:uint
		private var existID:uint
		
		private var nTime:uint
		
		public function Game_DragAndDrop(_drag:Group)
		{
			super();
			aTarget = new Vector.<Group>
			aSource = new Vector.<Group>
			aRecorder = new Vector.<MyItem>
			setDropingOnComponent(_drag)
			
			addEventListener(JEvent.DESTORY,destoryEvent)
		}
		
		
		public function setUpVector(_dropVector:Vector.<Group>,_sourceVector:Vector.<Group>):void
		{
			aTarget = _dropVector
			aSource = _sourceVector
		}
		
		public function addTarget(_value:Group):void
		{
			aTarget.push(_value)
		}
		
		public function addSource(_value:Group):void
		{
			aSource.push(_value)
		}
		
		
		
		public function setDropingOnComponent(_value:Group):void
		{
			grDrag = _value
		}
		
		
		
		public function init():void
		{
			initCtrl()
		}
		
		
		private function initCtrl():void
		{
			for (var i:int = 0; i < aSource.length; i++) 
			{
				setButtonAction(aSource[i])
			}
		}
		
		private function setButtonAction(_btn:Group):void
		{
			_btn.addEventListener(MouseEvent.MOUSE_DOWN,onSourceBtnMouseEvent)
			
			
		}
		
		protected function onSourceBtnMouseEvent(event:MouseEvent):void
		{
			var _btn:Group
			switch(event.type)
			{
				case MouseEvent.MOUSE_DOWN:
					clearInterval(nTime)
					
					_btn = Group(event.currentTarget)
					_btn.stage.addEventListener(MouseEvent.MOUSE_UP,onSourceBtnMouseEvent)
					_btn.addEventListener(MouseEvent.MOUSE_OUT,onSourceBtnMouseEvent)
					
					nTime = setInterval(function():void
					{
						clearInterval(nTime)
						addToDragingGroup(_btn)
						_btn.startDrag()
						
						currentBtn = _btn
						_btn.removeEventListener(MouseEvent.MOUSE_OUT,onSourceBtnMouseEvent)
						
						sendEventCombox(GameEvent.DRAG_START)
						
					},80)
					
					break;
				
				
				case MouseEvent.MOUSE_OUT:
					event.currentTarget.removeEventListener(event.type,arguments.callee)
					if (currentBtn == null)
					{
						clearInterval(nTime)
					}
					break
				
				
				case MouseEvent.MOUSE_UP:
					clearInterval(nTime)
					event.currentTarget.removeEventListener(event.type,arguments.callee)
					if (currentBtn)
					{
						currentBtn.stopDrag()
						checkHitTestTarget()
					}
					currentBtn = null
					break;
				
				
			}
		}
		
		
		protected function onTargetBtnMouseEvent(event:GameEvent):void
		{
			event.currentTarget.removeEventListener(event.type,arguments.callee)
			
			var _btn:Group = Group(event.currentTarget)
			var _b:Boolean
			var _n:int = -1
			var i:int
			
			switch(event.type)
			{
				case GameEvent.ADDED_TO_SOURCE:
					aRecorder.splice(currentID,1)
					break
				
				case GameEvent.ADDED_TO_TARGET:
					_n = currentID
					_b = true
					break
				
				case GameEvent.CHANGE_TO_TARGET:
					_n = existID
					_b = true
					sendEvent(_btn,event.type,_b,_n,true)
					break;
				
				case GameEvent.RETURN_TO_SOURCE:
					_n = existID
					aRecorder.splice(existID,1)
					sendEvent(_btn,event.type,_b,_n,true)
					break
			}
			sendEvent(UIComponent(event.currentTarget),event.type,_b,_n,false)
		}
		
		
		
		protected function checkHitTestTarget():void
		{
			var _hitTest:Boolean
			var _n:uint
			for (var i:int = 0; i < aTarget.length; i++) 
			{
				var _target:Group = aTarget[i]
				if (currentBtn.hitTestObject(_target))
				{
					if (bHitTestQ)
					{
						if (_target.hitTestPoint(_target.stage.mouseX,_target.stage.mouseY,true))
						{
							_n = i
							_hitTest = true
							break
						}
					}else{
						_n = i
						_hitTest = true
						if (_target.hitTestPoint(_target.stage.mouseX,_target.stage.mouseY,true))
						{
							break
						}
					}
				}
			}
			
			if (_hitTest){
				currentID = _n
				
				/** 占有在target，而需要要被動替換其他Button。所以需要對其操作只要使用該事件*/		
				
				var _return:Boolean
				var _change:Boolean
				
				var _numCurrent:uint
				var _numExist:uint
				
				var _existGroup:Group
				var _currentGroup:Group
				
				for (i = 0; i < aRecorder.length; i++) 
				{
					if(aRecorder[i].obj == currentBtn)
					{
						_change = true
						_numCurrent = i
						_currentGroup = aRecorder[i].obj
						break
					}
				}
				
				for (i = 0; i < aRecorder.length; i++) 
				{
					if(aRecorder[i].id == _n)
					{
						_return = true
						_numExist = i
						existID = i
						_existGroup = aRecorder[i].obj
						break
					}
				}
				
				if (_change)
				{
					/** target => target */
					if (_existGroup)
					{
						removeEvent(_existGroup)
						aRecorder[_numExist].id = aRecorder[_numCurrent].id
						existID = aRecorder[_numExist].id 
						_existGroup.addEventListener(GameEvent.CHANGE_TO_TARGET,onTargetBtnMouseEvent)
					}
					aRecorder.splice(_numCurrent,1)
				}else if (_return){
					/** source => target */
					removeEvent(_existGroup)
					_existGroup.addEventListener(GameEvent.RETURN_TO_SOURCE,onTargetBtnMouseEvent)
				}
				
				/** */
				aRecorder.push(new MyItem(currentBtn,_n))	
				
				/** currentBtn => target */
				sendEventCombox(GameEvent.ADDED_TO_TARGET,_hitTest,_n)
			}else{
				/** currentBtn => source */
				sendEventCombox(GameEvent.ADDED_TO_SOURCE)
			}
			
			
			function removeEvent(_group:Group):void
			{
				if (_group.hasEventListener(GameEvent.CHANGE_TO_TARGET))
					_group.removeEventListener(GameEvent.CHANGE_TO_TARGET,onSourceBtnMouseEvent)
				if (_group.hasEventListener(GameEvent.RETURN_TO_SOURCE))
					_group.removeEventListener(GameEvent.RETURN_TO_SOURCE,onSourceBtnMouseEvent)
			}
			
		}
		
		
		
		protected function sendEvent(_target:UIComponent,_type:String,_hitTest:Boolean=false,_num:int= -1,_objThis:Boolean = true):void
		{
			var _event:GameEvent = new GameEvent(_type)
			_event._id = _num
			_event._target = _target
			_event._hitTest = _hitTest
			if (_objThis)
			{
				dispatchEvent(_event)
			}else{
				_target.dispatchEvent(_event)
			}
			
		}
		
		
		
		private function sendEventCombox(_type:String,_hitTest:Boolean = false,_num:int= -1):void
		{
			
			/** button */
			if (!currentBtn.hasEventListener(_type))
			{
				currentBtn.addEventListener(_type,onTargetBtnMouseEvent)
				currentBtn.dispatchEvent(new GameEvent(_type))
			}
			
			/** ctrl */
			sendEvent(currentBtn,_type,_hitTest,_num)
		}
		
		
		public function addToDragingGroup(_btn:Group):void
		{
			var _parent:DisplayObjectContainer = _btn.parent
			var _newpoint:Point
			_newpoint = _parent.localToGlobal(new Point(_btn.x,_btn.y))
			_newpoint = grDrag.globalToLocal(_newpoint)
			_btn.x = _newpoint.x
			_btn.y = _newpoint.y
			grDrag.addElement(_btn)
		}
		
		private function destoryEvent(event:JEvent):void
		{
			aTarget = null
			aSource = null
			aRecorder = null
			currentBtn = null
			clearInterval(nTime)
		}
	}
}


import spark.components.Group;

class MyItem{
	
	public var obj:Group
	public var id:uint
	public function MyItem(_obj:Group=null,_id:uint=0)
	{
		obj = _obj
		id = _id
	}
}