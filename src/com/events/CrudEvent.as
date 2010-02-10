package com.events
{
	import flash.events.Event;
	
	import valueObjects.MemberFields;
	
	public class CrudEvent extends Event
	{
		
		public static const VALID_EMAIL:String = "validEmail";
		public static const USER_CREATED:String = "userCreated";
		public static const USER_UPDATED:String = "userUpdated";
		
		public static const USER_LOGIN:String = "userLogin";
		public static const GET_SESSIONID:String = "getSessionID";
		public static const GET_MEMBERINFO:String = "getMemberInfo";
		
		/**
		 * returns true if VALID_EMAIL and email is valid
		 * */
		public var valid:Boolean=false;
		
		/**
		 * returns memberID if user was created
		 * */
		public var memberId:Number=0;

		/**
		 * returns sessionID if user was logged in
		 * */
		public var sessionId:Number=0;
		
		/**
		 * returns error message if crud service fails
		 * */
		public var errorMsg:String="";
		public var errored:Boolean=false;
		
		/**
		 * returns member fields 
		 * */
		public var memberFields:MemberFields;
		
		
		public function CrudEvent(type:String)
		{
			super(type);
			
		}
	}
}