package com.utils
{
	import com.events.CrudEvent;
	
	import flash.events.EventDispatcher;
	import flash.net.SharedObject;
	
	import mx.rpc.CallResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import services.crud.Crud;
	
	import valueObjects.LoginFields;
	import valueObjects.MemberFields;

	public class DatabaseCRUD extends EventDispatcher
	{
		
		private static var instance:DatabaseCRUD;
		
		public var go_LoginFields:LoginFields = new LoginFields();
		public var go_MemberFields:MemberFields;
		
		private var pc_Crud:Crud = new Crud();
		
		public var ga_Months:Array = ['Month:','Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];	
		public var ga_Days:Array = ['Day:'];	
		public var ga_Years:Array = ['Year:'];
		

		public function DatabaseCRUD()
		{
			
		}

		private function Debug():void{
			trace("SessionID - ", go_LoginFields.SessionID);
			trace("MemberID - ", go_LoginFields.MemberID);
		}
		
		public static function getInstance():DatabaseCRUD {
			if (DatabaseCRUD.instance == null) {
				DatabaseCRUD.instance = new DatabaseCRUD();
				
				
				//create day and month list
				var li_Ctr:Number;
				
				for (li_Ctr = 1; li_Ctr < 32; li_Ctr++)
					instance.ga_Days.push(li_Ctr.toString());
				
				for (li_Ctr = 2010; li_Ctr >= (1900); li_Ctr--)
					instance.ga_Years.push(li_Ctr.toString());	
			}
			
			
			return DatabaseCRUD.instance;
		}
		
		protected function GotMemberID(event:CrudEvent):void
		{
			//get the user name
			if (event.errored)
			{
				go_LoginFields.SessionID = 0;
				go_LoginFields.MemberID = 0;
				trace("Error getting memberID " + event.errorMsg);
			}
			
			if (go_LoginFields.SessionID == 0 || go_LoginFields.MemberID == 0)
			{
				go_LoginFields.SessionID = 0;
				go_LoginFields.MemberID = 0;
			}else{
				GetMember(null,go_LoginFields.MemberID);
			}
			
			this.removeEventListener(CrudEvent.GET_SESSIONID, GotMemberID);

		}
		public function CheckLoggedIn():void
		{
			var sharedObj:SharedObject;
			sharedObj = SharedObject.getLocal("SessionID");
			if (sharedObj.size > 0)
			{
				go_LoginFields.SessionID = sharedObj.data.SessionID;
			}
			
			if (go_LoginFields.SessionID == 0)
			{
				var le_Event:CrudEvent = new CrudEvent(CrudEvent.GET_MEMBERINFO);
				le_Event.memberFields = null;
				le_Event.sessionId = 0;
				le_Event.memberId =0;
				dispatchEvent(le_Event);
				return;
			}
			
			//try get member id from session id
			this.addEventListener(CrudEvent.GET_SESSIONID, GotMemberID);
			this.GetMemberID(null,this.go_LoginFields.SessionID);
		}
		
		public function StoreSessionID():void
		{
			//store sessionID
			var sharedObj:SharedObject;
			sharedObj = SharedObject.getLocal("SessionID");
			sharedObj.data.SessionID = go_LoginFields.SessionID;
			sharedObj.flush();					
		}
		
		private var pc_CheckDuplicate:CallResponder = new CallResponder();
		public function CheckDuplicateEmail(event:Object, email:String=null):void
		{
			if (email)
			{
				pc_CheckDuplicate.addEventListener(ResultEvent.RESULT, CheckDuplicateEmail);
				pc_CheckDuplicate.addEventListener(FaultEvent.FAULT , CheckDuplicateEmail);
				pc_CheckDuplicate.token = pc_Crud.FindEmail(email);
				return;
			}
			
			var le_Event:CrudEvent = new CrudEvent(CrudEvent.VALID_EMAIL);
			if (event is ResultEvent)	
			{
				var lb_valid:Boolean = !pc_CheckDuplicate.token.result as Boolean;
				le_Event.valid = lb_valid;
				dispatchEvent(le_Event);
			}
			
			if (event is FaultEvent)
			{
				var fault:FaultEvent = event as FaultEvent;
				le_Event.errorMsg = fault.fault.faultDetail + ' ' + fault.fault.faultString;
				le_Event.errored = true;
				dispatchEvent(le_Event);
			}
			
			pc_CheckDuplicate.removeEventListener(ResultEvent.RESULT, CheckDuplicateEmail);
			pc_CheckDuplicate.removeEventListener(FaultEvent.FAULT , CheckDuplicateEmail);
		}

		
		private var pc_RegisterUser:CallResponder = new CallResponder();
		public function RegisterUser(event:Object, user:MemberFields=null):void
		{
			if (user)
			{
				pc_RegisterUser.addEventListener(ResultEvent.RESULT, RegisterUser);
				pc_RegisterUser.addEventListener(FaultEvent.FAULT, RegisterUser);
				pc_RegisterUser.token = pc_Crud.createMember(user);
				return;
			}
			
			var le_Event:CrudEvent = new CrudEvent(CrudEvent.USER_CREATED);
			
			if (event is ResultEvent)	
			{
				var ln_Value:Number = pc_RegisterUser.token.result as Number;
				le_Event.memberId = ln_Value;
				dispatchEvent(le_Event);
			}
			
			if (event is FaultEvent)
			{
				var fault:FaultEvent = event as FaultEvent;
				le_Event.errorMsg = fault.fault.faultDetail + ' ' + fault.fault.faultString;
				le_Event.errored = true;
				dispatchEvent(le_Event);
			}
			
			pc_RegisterUser.removeEventListener(ResultEvent.RESULT, RegisterUser);
			pc_RegisterUser.removeEventListener(FaultEvent.FAULT, RegisterUser);
		}
	
		private var pc_UpdateUser:CallResponder = new CallResponder();
		public function UpdateUser(event:Object, user:MemberFields=null):void
		{
			if (user)
			{
				pc_UpdateUser.addEventListener(ResultEvent.RESULT, UpdateUser);
				pc_UpdateUser.addEventListener(FaultEvent.FAULT, UpdateUser);
				pc_UpdateUser.token = pc_Crud.updateMember(user);
				return;
			}
			
			var le_Event:CrudEvent = new CrudEvent(CrudEvent.USER_UPDATED);
			if (event is ResultEvent)	
			{
				le_Event.valid = true;
				//var ln_Value:Number = pc_UpdateUser.token.result as Number;
				//le_Event.memberId = ln_Value;
				dispatchEvent(le_Event);
			}
			
			if (event is FaultEvent)
			{
				var fault:FaultEvent = event as FaultEvent;
				le_Event.errorMsg = fault.fault.faultDetail + ' ' + fault.fault.faultString;
				le_Event.errored = true;
				dispatchEvent(le_Event);
			}
			
			pc_UpdateUser.removeEventListener(ResultEvent.RESULT, UpdateUser);
			pc_UpdateUser.removeEventListener(FaultEvent.FAULT, UpdateUser);
		}

		private var pc_LoginUser:CallResponder = new CallResponder();
		public function LoginUser(event:Object, user:MemberFields=null):void
		{
			if (user)
			{
				pc_LoginUser.addEventListener(ResultEvent.RESULT, LoginUser);
				pc_LoginUser.addEventListener(FaultEvent.FAULT , LoginUser);
				pc_LoginUser.token = pc_Crud.login(user.UserName,user.Password);
				return;
			}
			
			var le_Event:CrudEvent = new CrudEvent(CrudEvent.USER_LOGIN);
			
			if (event is ResultEvent)	
			{
				var lo_LoginFields:LoginFields = pc_LoginUser.token.result as LoginFields;
				if (!lo_LoginFields)
				{
					this.go_LoginFields.SessionID = 0;
					this.go_LoginFields.MemberID = 0;
					le_Event.sessionId = 0;
					le_Event.memberId = 0;
					le_Event.memberFields = null;
					dispatchEvent(le_Event);	
				}else{
					le_Event.sessionId = lo_LoginFields.SessionID;
					le_Event.memberId = lo_LoginFields.MemberID;
					
					go_LoginFields.SessionID = lo_LoginFields.SessionID;
					go_LoginFields.MemberID = lo_LoginFields.MemberID;
					dispatchEvent(le_Event);
				}
			}
			
			if (event is FaultEvent)
			{
				var fault:FaultEvent = event as FaultEvent;
				le_Event.errorMsg = fault.fault.faultDetail + ' ' + fault.fault.faultString;
				le_Event.errored = true;
				dispatchEvent(le_Event);
			}
			
			pc_LoginUser.removeEventListener(ResultEvent.RESULT, LoginUser);
			pc_LoginUser.removeEventListener(FaultEvent.FAULT, LoginUser);

		}
		
		private var pc_GetMemberID:CallResponder = new CallResponder();
		protected function GetMemberID(event:Object, SessionID:Number=0):void
		{
			if (SessionID > 0)
			{
				pc_GetMemberID.addEventListener(ResultEvent.RESULT, GetMemberID);
				pc_GetMemberID.addEventListener(FaultEvent.FAULT, GetMemberID);
				pc_GetMemberID.token = pc_Crud.GetMemberID(SessionID);
				return;
			}
			
			var le_Event:CrudEvent = new CrudEvent(CrudEvent.GET_SESSIONID);
			
			if (event is ResultEvent)	
			{
				var ln_MemberID:Number = pc_GetMemberID.token.result as Number;
				le_Event.memberId = ln_MemberID;
				
				go_LoginFields.MemberID = ln_MemberID;
				dispatchEvent(le_Event);
				
			}
			
			if (event is FaultEvent)
			{
				var fault:FaultEvent = event as FaultEvent;
				le_Event.errorMsg = fault.fault.faultDetail + ' ' + fault.fault.faultString;
				le_Event.errored = true;
				dispatchEvent(le_Event);
			}
			
			pc_GetMemberID.removeEventListener(ResultEvent.RESULT, GetMemberID);
			pc_GetMemberID.removeEventListener(FaultEvent.FAULT, GetMemberID);
		}
		
		private var pc_GetMember:CallResponder = new CallResponder();
		public function GetMember(event:Object, memberID:Number=0):void
		{
			//event should be NULL if memberiD > 0
			if (memberID > 0)
			{
				pc_GetMember.addEventListener(ResultEvent.RESULT, GetMember);
				pc_GetMember.addEventListener(FaultEvent.FAULT, GetMember);
				pc_GetMember.token = pc_Crud.getMember(memberID);
				return;
			}
			
			var le_Event:CrudEvent = new CrudEvent(CrudEvent.GET_MEMBERINFO);
			
			if (event is ResultEvent)	
			{
				var ln_Member:MemberFields = pc_GetMember.token.result as MemberFields;
				if (!ln_Member)
				{
					this.go_LoginFields.SessionID = 0;
					this.go_LoginFields.MemberID = 0;
					le_Event.sessionId = 0;
					le_Event.memberId = 0;
					le_Event.memberFields = null;
					dispatchEvent(le_Event);
				}else{
					le_Event.memberFields = ln_Member;
					go_MemberFields = ln_Member;
					dispatchEvent(le_Event);
				}
			}
			
			if (event is FaultEvent)
			{
				var fault:FaultEvent = event as FaultEvent;
				le_Event.errorMsg = fault.fault.faultDetail + ' ' + fault.fault.faultString;
				le_Event.errored = true;
				dispatchEvent(le_Event);
			}
			
			pc_GetMember.removeEventListener(ResultEvent.RESULT, GetMember);
			pc_GetMember.removeEventListener(FaultEvent.FAULT, GetMember);
		}
	
		public function Logout():void
		{
			pc_Crud.logout(go_LoginFields.SessionID);
			go_LoginFields.SessionID = 0;
			go_LoginFields.MemberID = 0;
			this.StoreSessionID();
			
			var le_Event:CrudEvent = new CrudEvent(CrudEvent.GET_MEMBERINFO);
			le_Event.memberFields = null;
			le_Event.sessionId = 0;
			le_Event.memberId =0;
			dispatchEvent(le_Event);
		}
		
	}
}