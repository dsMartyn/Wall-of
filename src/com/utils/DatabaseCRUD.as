package com.utils
{
	public class DatabaseCRUD
	{
		
		private static var instance:DatabaseCRUD;
		private var pn_SessionID:Number = 0;
		

		private var ga_Months:Array = ['Month:','Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
		private var ga_Days:Array = ['Day:'];
		private var ga_Years:Array = ['Year:'];
		
		
		public function get Days():Array
		{
			return ga_Days;
		}

		public function get Months():Array
		{
			return ga_Months;
		}
		
	
		public function get Years():Array
		{
			return ga_Years;
		}
		
		
		
		
		public function DatabaseCRUD()
		{
			trace('init bd');
		}
			
		private function Debug():void{
			trace("SessionID - ", pn_SessionID);
		}
		
		public static function getInstance():DatabaseCRUD {
			if (DatabaseCRUD.instance == null) {
				DatabaseCRUD.instance = new DatabaseCRUD();
				
				var li_Ctr:Number = 0;
				for (li_Ctr = 0; li_Ctr < 31; li_Ctr++)
					instance.ga_Days.push(li_Ctr.toString());
				
				for (li_Ctr = 2010; li_Ctr >= (1900); li_Ctr--)
					instance.ga_Years.push(li_Ctr.toString());	
				
			}
			
			instance.Debug();
			
			return DatabaseCRUD.instance;
		}
			
		
	}
}