package com.events
{
	import flash.events.Event;
	import com.utils.ButtonType;
	
	public class ToolBarEvent extends Event
	{	
		// Define static constant.
		public static const BUTTON_OVER:String = "buttonOver";
		public static const BUTTON_CLICK:String = "buttonClick";
		public static const BUTTON_OUT:String = "buttonOut";
		public static const SEEK_TO:String = "seekTo";
		public static const VOLUME_TO:String = "volumeTo";
		
		/**
		 * buttonType which was called from
		* */
		public var buttonType:ButtonType;
		/**
		 * duration time in miliseconds to jump to
		 * */
		public var numericVal:Number;
		
		public function ToolBarEvent(type:String, buttonType:ButtonType, numericVal:Number=0 )
		{
			super(type);
			
			this.numericVal = numericVal;
			this.buttonType = buttonType;
		}
	}
}