package com.events
{
	import flash.events.Event;
	
	import valueObjects.TblMembers;
	
	public class CrudEvent extends Event
	{
		
		public static const VALID_EMAIL:String = "validEmail";
		
		public static const USER_CREATED:String = "userCreated";
		public static const USER_UPDATED:String = "userUpdated";
		
		public static const PRODUCT_CREATED:String = "productCreated";
		public static const PRODUCT_UPDATED:String = "productUpdated";
		
		public static const USER_LOGIN:String = "userLogin";
		public static const GET_SESSIONID:String = "getSessionID";
		public static const GET_MEMBERINFO:String = "getMemberInfo";
		
		public static const EMAIL_FRIEND:String = "emailFriend";
		
		public static const SEARCH:String = "search"
		
		public static const GET_PRODUCTINFO:String = "getProductInfo";
		public static const GET_PRODUCTVIEW_INFO:String = "getProductViewInfo";
		
		public static const GET_PRODUCT_KEYWORDS:String = "getProductKeywords";
		public static const ADD_KEYWORDS:String = "addKeywords";
		
		/**
		 * returns true if VALID_EMAIL and email is valid
		 * */
		public var valid:Boolean=false;
		
		/**
		 * returns memberID if user was created or updated
		 * */
		public var memberId:Number=0;

		
		/**
		 * returns productID if product was created or updated
		 * */
		public var productId:Number=0;
		
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
		public var memberFields:TblMembers;
	
		//public var page:Number;
		
		public function CrudEvent(type:String)
		{
			super(type);
			
		}
	}
}