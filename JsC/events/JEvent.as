package JsC.events 
{
	public class JEvent extends BaseEvent
	{
		
		public function JEvent(type:String) 
		{
			super(type);
		}
		
		
		//BASE---------------------------------------------------------------------
		public static const INIT:String = "INIT"
		public static const ONSTATE:String = "ONSTATE"
		public static const REFRESH:String = "REFRESH"
		public static const SEND:String  = "SEND"
		public static const SUCCESS:String = "SUCCESS";
		public static const ERROR:String = "ERROR";
		public static const IOERROR:String = "IOERROR";
		public static const DESTORY:String = "DESTORY";
		
		
		public static const RUN:String = "RUN"	
		public static const COMPLETE:String = "COMPLETE"	
		public static const ALLCOMPLETE:String = "ALLCOMPLETE"	
		public static const INIT_COMPLETE:String = "INIT_COMPLETE"	
		public static const ONE_COMPLETE:String = "ONE_COMPLETE"	
		
		//uicomponent -------------------------------------------------------------------------------------
		public static const ITEM_ADDED:String = "ITEM_ADDED"
		public static const ITEM_CREATE:String = "ITEM_CREATE"
		public static const ITEM_REMOVE:String = "ITEM_REMOVE"
		public static const ITEM_DELETE:String = "ITEM_DELETE"
		public static const ITEM_COMPLETE:String = "ITEM_COMPLETE"
			
		//Navigate--------------------------------------------------------------------------------------
		public static const HOME:String = "HOME"
		public static const EXIT:String = "EXIT"
		public static const NEXT:String = "NEXT" 
		public static const PREV:String = "PREV" 
		public static const END:String = "END" 
		
		//game------------------------------------------------------------------------------------------
		public static const NEWGAME:String = "NEWGAME" 
		public static const READY:String = "READY" 
		public static const START:String = "START" 
		public static const PLAY:String = "PLAY" 
		public static const PLAYING:String = "PLAYING" 
		public static const RUNING:String = "RUNING" 
		public static const RESTART:String = "RESTART" 
		public static const HELP:String = "HELP" 
		public static const RESULT:String = "RESULT" 
		public static const RESET:String = "RESET" 
		public static const TIMEOUT:String = "TIMEOUT" 
		public static const FINISH:String = "FINISH"
		public static const OVER:String = "OVER"
		public static const DELAY:String = "DELAY"
		public static const MENU:String = "MENU"
		public static const QUIT:String = "QUIT"
		public static const CLOSE:String = "CLOSE"
		public static const HITTEST:String = "HITTEST"
		public static const STOP:String = "STOP"
		
		//draw--------------------------------------------------------------------------
		public static const DRAWING:String = "DRAWING"
		public static const DRAW_ON_START:String = "DRAW_ON_START"
		public static const DRAW_ON_END:String = "DRAW_ON_END"
		public static const DRAW_ON_STOP:String = "DRAW_ON_STOP"
		public static const DRAW_ON_PROGRESS:String = "DRAW_ON_PROGRESS"
		
		//EDIT---------------------------------------------------------------------------	
		public static const CREATE:String = "CREATE"
		public static const UPDATE:String = "UPDATE"	
		public static const CHANGE:String = "CHANGE"
		public static const CHANGED:String = "CHANGED"
		public static const ADD:String = "ADD"
		public static const ADDED:String = "ADDED"
		public static const DEL:String = "DEL"
		public static const REMOVE:String = "REMOVE"	
		public static const REMOVED:String = "REMOVED"	
		public static const SELECT:String = "SELECT"
		public static const DOWNLOAD:String = "DOWNLOAD"
		public static const SAVE:String = "SAVE"
		
		//Info---------------------------------------------------------------------------
		public static const YES:String = "YES"
		public static const NO:String = "NO"
		public static const CANCEL:String = "CANCEL"
		public static const ALERT:String = "ALERT"	
		
		//File---------------------------------------------------------------------------
		public static const LOADED:String = "LOADED"
		public static const SAVEDATA:String = "SAVEDATA"
		public static const NEWDATA:String = "NEWDATA"
		public static const DELDATA:String = "DELDATA"
		public static const LOADDATA:String = "LOADDATA"
		public static const PROGRESS:String = "PROGRESS"
		public static const RELOAD:String = "RELOAD"
		
		//Loader---------------------------------------------------------------------------
		public static const LOADER_START:String = "LOADER_START"
		public static const LOADER_OPEN:String = "LOADER_OPEN"
		public static const LOADER_PROGRESS:String = "LOADER_PROGRESS"
		public static const LOADER_COMPLETE:String = "LOADER_COMPLETE"
		
		//Sound---------------------------------------------------------------------------
		public static const SOUND_COMPLETE:String = "SOUND_COMPLETE"
		public static const SOUND_UPDATE:String = "SOUND_UPDATE"
		public static const SOUND_STOP:String = "SOUND_STOP"
		public static const SOUND_PLAY:String = "SOUND_PLAY"
		
		//MouseEvent---------------------------------------------------------------------------
		public static const CLICK:String = "JSCLICK"
		public static const RESIZE:String = "JSRESIZE"
		public static const MOVE:String = "JSMOVE"
			
		public static const ONMOUSEDW:String = "ONMOUSEDW"
		public static const ONMOUSEUP:String = "ONMOUSEUP"
		public static const ONMOUSEMV:String = "ONMOUSEMV"
		public static const ONMOUSEOV:String = "ONMOUSEOV"
		
		//MouseEvent---------------------------------------------------------------------------
		public static const ONLEFT:String = "ONLEFT"
		public static const ONRIGHT:String = "ONRIGHT"
		public static const ONTOP:String = "ONTOP"
		public static const ONBOTTOM:String = "ONBOTTOM"	
			
		public static const ONSTART:String = "ONSTART"	
		public static const ONEND:String = "ONEND"	
	}
	
}


