package com.utils
{
	public class ButtonType
	{
		/*
		* The actual enumeration values. Note that the sorting order doesn't matter.
		*/
		public static const PLAY:ButtonType	= new ButtonType(PLAY);
		public static const FULLSCREEN:ButtonType	= new ButtonType(FULLSCREEN);
		public static const VOLUME:ButtonType	= new ButtonType(VOLUME);
		public static const QUALITY:ButtonType	= new ButtonType(QUALITY);

		/* Constructor */
		public function ButtonType(d:ButtonType)
		{
			/*
			* Empty fake constructor
			* The part that matter is that it accepts a 'copy' of itself
			* For the recursive assignment to work
			*/
		}
		
		public function toString():String
		{
			switch(this) {
				case ButtonType.PLAY:
					return "Play";
				case ButtonType.FULLSCREEN:
					return "Full Screen";
				case ButtonType.VOLUME:
					return "Volume";
				case ButtonType.QUALITY:
					return "Quality";					
				default:
					/* Direction.NONE is considered 'undefined' (no direction) */
					return "undefined";
			}
		}
	}
}