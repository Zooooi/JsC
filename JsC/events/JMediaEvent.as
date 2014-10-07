package JsC.events
{
	public class JMediaEvent extends BaseEvent
	{
		
		//Sound---------------------------------------------------------------------------
		public static const SOUND_COMPLETE:String = "SOUND_COMPLETE"
		public static const SOUND_UPDATE:String = "SOUND_UPDATE"
		public static const SOUND_STOP:String = "SOUND_STOP"
		public static const SOUND_PLAY:String = "SOUND_PLAY"
		
		//MOVIE---------------------------------------------------------------------------
		public static const MOVIE_COMPLETE:String = "MOVIE_COMPLETE"
		public static const MOVIE_UPDATE:String = "MOVIE_UPDATE"
		public static const MOVIE_STOP:String = "MOVIE_STOP"
		public static const MOVIE_PLAY:String = "MOVIE_PLAY"

			
		public function JMediaEvent(type:String)
		{
			super(type);
		}
	}
}