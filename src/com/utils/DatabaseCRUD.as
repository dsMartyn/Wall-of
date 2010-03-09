package com.utils
{
	import com.events.CrudEvent;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.SharedObject;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.CallResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import services.tblemaillogservice.TblEmailLogService;
	import services.tblhistoryservice.TblHistoryService;
	import services.tblkeywordsservice.TblKeywordsService;
	import services.tblloginservice.TblLoginService;
	import services.tblmembersservice.TblMembersService;
	import services.tblproductsservice.TblProductsService;
	
	import valueObjects.LoginFields;
	import valueObjects.TblMembers;
	import valueObjects.TblProducts;

	public class DatabaseCRUD extends EventDispatcher
	{
		
		private static var instance:DatabaseCRUD;
		/*
		public var go_LoginFields:LoginFields = new LoginFields();
		public var go_MemberFields:MemberFields;
		private var pc_Crud:Crud = new Crud();
		*/
		
		public const pc_name:String = "Enter Company Name";
		public const pc_street:String = "Enter Street Name";
		public const pc_town:String = "Enter Town";
		public const pc_county:String = "Enter County";
		public const pc_postcode:String = "Ener Post Code";
		public const pc_email:String = "Enter Email address";
		public const pc_tel:String = "Enter Number";
		public const pc_mob:String = "Enter Mobile";
		public const pc_fax:String = "Enter Fax";
		public const pc_companyName:String = "Enter Company name";
		public const pc_companyDesc:String = "Enter company Descrption\n\nYear it was established\nother company information\nany offers.";
		public const pc_mapsPostCode:String = "Street Name, Post Code";
		public const pc_youTubeURL:String = "http://www.youtube.com/watch?v=VideoID";
		public const pc_Category:String = "Enter Category";
		
		//private variables
		private var pc_CrudEmailLog:TblEmailLogService = new TblEmailLogService();
		private var pc_CrudProducts:TblProductsService = new TblProductsService();
		private var pc_CrudMembers:TblMembersService = new TblMembersService();
		private var pc_CrudKeywords:TblKeywordsService = new TblKeywordsService();
		private var pc_CrudHistory:TblHistoryService = new TblHistoryService();
		private var pc_CrudLogin:TblLoginService = new TblLoginService();

		//global variables
		/** 
		 * Login fields contains memberID + SessionID when logging in  
		**/
		public var go_LoginFields:LoginFields = new LoginFields();
		
		/**
		 * MemberFields contains username and info for that user when logging in
		**/
		public var go_MemberFields:TblMembers = new TblMembers();
		
		/**
		 * SearchFields contains Image which is Base64 Encoded *change this*
		**/
		public var go_SearchFields:ArrayCollection;
		
		/**
		 * ProductFields this contain the product information for the clicked product
		**/
		public var go_ProductFields:TblProducts;
		
		public var go_KeywordFields:ArrayCollection;
	
		[bindable]
		/**
		 * Product view for MemberID 
		 * @see MAX_RESULTS_VIEW
		 */		
		public var go_ProductsView:ArrayCollection;

		public var ga_Months:Array = ['Month:','Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];	
		public var ga_Days:Array = ['Day:'];	
		public var ga_Years:Array = ['Year:'];
		

		public var gi_CurrentIndex:Number=-1;
		
		/**
		 * this is how many results are rendered when searching
		**/
		public const MAX_RESULTS_PAGE:Number = 54;
		
		/**
		 * this is how many results are shown in the product view list 
		 **/
		public const MAX_RESULTS_VIEW:Number = 10;
		

		
		public function DatabaseCRUD()
		{
			
		}

		private function Debug():void{
			trace("SessionID - ", this.go_LoginFields.SessionID);
			trace("MemberID - ", this.go_LoginFields.MemberID);
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
		
		
		
		public function Logout():void
		{
			this.pc_CrudLogin.logout(go_LoginFields.SessionID);
			this.go_LoginFields.SessionID = 0;
			this.go_LoginFields.MemberID = 0;
			this.StoreSessionID();
			
			var le_Event:CrudEvent = new CrudEvent(CrudEvent.GET_MEMBERINFO);
			le_Event.memberFields = null;
			le_Event.sessionId = 0;
			le_Event.memberId =0;
			this.dispatchEvent(le_Event);
			this.dispatchEvent(new Event("notLoggedIn"));
		}
		
		protected function GotMemberID(event:CrudEvent):void
		{
			//get the user name
			if (event.errored)
			{
				this.go_LoginFields.SessionID = 0;
				this.go_LoginFields.MemberID = 0;
				trace("Error getting memberID " + event.errorMsg);
				var le_Event:CrudEvent = new CrudEvent(CrudEvent.GET_MEMBERINFO);
				le_Event.errored = event.errored;
				le_Event.errorMsg = event.errorMsg;
				this.dispatchEvent(le_Event);
			}
			
			if (this.go_LoginFields.SessionID == 0 || this.go_LoginFields.MemberID == 0)
			{
				this.go_LoginFields.SessionID = 0;
				this.go_LoginFields.MemberID = 0;
				this.GetMember(null,this.go_LoginFields.MemberID);
			}else{
				this.GetMember(null,this.go_LoginFields.MemberID);
			}
			
			this.removeEventListener(CrudEvent.GET_SESSIONID, this.GotMemberID);

		}
		public function CheckLoggedIn():void
		{
			var sharedObj:SharedObject;
			sharedObj = SharedObject.getLocal("SessionID");
			if (sharedObj.size > 0)
			{
				this.go_LoginFields.SessionID = sharedObj.data.SessionID;
			}
			
			if (this.go_LoginFields.SessionID == 0)
			{
				var le_Event:CrudEvent = new CrudEvent(CrudEvent.GET_MEMBERINFO);
				le_Event.memberFields = null;
				le_Event.sessionId = 0;
				le_Event.memberId =0;
				this.dispatchEvent(le_Event);
				return;
			}
			
			trace('trying to get memberId from ' + this.go_LoginFields.SessionID);
			//try get member id from session id
			this.addEventListener(CrudEvent.GET_SESSIONID, GotMemberID );
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
				this.pc_CheckDuplicate.addEventListener(ResultEvent.RESULT, this.CheckDuplicateEmail);
				this.pc_CheckDuplicate.addEventListener(FaultEvent.FAULT , this.CheckDuplicateEmail);
				this.pc_CheckDuplicate.token = this.pc_CrudMembers.FindEmail(email);
				trace('check duplicate email');
				return;
			}
			
			var le_Event:CrudEvent = new CrudEvent(CrudEvent.VALID_EMAIL);
			trace('check duplicate email completed');
			
			if (event is ResultEvent)	
			{
				var lb_valid:Boolean = !this.pc_CheckDuplicate.token.result as Boolean;
				le_Event.valid = lb_valid;
				this.dispatchEvent(le_Event);
			}
			
			if (event is FaultEvent)
			{
				var fault:FaultEvent = event as FaultEvent;
				le_Event.errorMsg = fault.fault.faultDetail + ' ' + fault.fault.faultString;
				le_Event.errored = true;
				this.dispatchEvent(le_Event);
			}
			
			this.pc_CheckDuplicate.removeEventListener(ResultEvent.RESULT, this.CheckDuplicateEmail);
			this.pc_CheckDuplicate.removeEventListener(FaultEvent.FAULT , this.CheckDuplicateEmail);
		}

		
		private var pc_RegisterUser:CallResponder = new CallResponder();
		public function RegisterUser(event:Object, user:TblMembers=null):void
		{
			if (user)
			{
				this.pc_RegisterUser.addEventListener(ResultEvent.RESULT, this.RegisterUser);
				this.pc_RegisterUser.addEventListener(FaultEvent.FAULT, this.RegisterUser);
				this.pc_RegisterUser.token = pc_CrudMembers.createTblMembers(user);
				trace('creating member');
				return;
			}
			
			var le_Event:CrudEvent = new CrudEvent(CrudEvent.USER_CREATED);
			trace('creating member completed');
			if (event is ResultEvent)	
			{
				//why does this return member fields instead of rowid?
				var ln_Value:TblMembers = pc_RegisterUser.token.result as TblMembers;
				le_Event.memberId = ln_Value.RowID;
				le_Event.valid = true;
				this.dispatchEvent(le_Event);
			}
			
			if (event is FaultEvent)
			{
				var fault:FaultEvent = event as FaultEvent;
				le_Event.errorMsg = fault.fault.faultDetail + ' ' + fault.fault.faultString;
				le_Event.errored = true;
				this.dispatchEvent(le_Event);
			}
			
			this.pc_RegisterUser.removeEventListener(ResultEvent.RESULT, this.RegisterUser);
			this.pc_RegisterUser.removeEventListener(FaultEvent.FAULT, this.RegisterUser);
		}
	
		private var pc_UpdateUser:CallResponder = new CallResponder();
		public function UpdateUser(event:Object, user:TblMembers=null):void
		{
			if (user)
			{
				this.pc_UpdateUser.addEventListener(ResultEvent.RESULT, UpdateUser);
				this.pc_UpdateUser.addEventListener(FaultEvent.FAULT, UpdateUser);
				this.pc_UpdateUser.token =  this.pc_CrudMembers.updateTblMembers(user);
				trace('update user');
				return;
			}
			
			var le_Event:CrudEvent = new CrudEvent(CrudEvent.USER_UPDATED);
			trace('update user completed');
			if (event is ResultEvent)	
			{
				le_Event.valid = true;
				this.dispatchEvent(le_Event);
			}
			
			if (event is FaultEvent)
			{
				var fault:FaultEvent = event as FaultEvent;
				le_Event.errorMsg = fault.fault.faultDetail + ' ' + fault.fault.faultString;
				le_Event.errored = true;
				this.dispatchEvent(le_Event);
			}
			
			this.pc_UpdateUser.removeEventListener(ResultEvent.RESULT, UpdateUser);
			this.pc_UpdateUser.removeEventListener(FaultEvent.FAULT, UpdateUser);
		}

		private var pc_LoginUser:CallResponder = new CallResponder();
		public function LoginUser(event:Object, user:TblMembers=null):void
		{
			if (user)
			{
				this.pc_LoginUser.addEventListener(ResultEvent.RESULT, this.LoginUser);
				this.pc_LoginUser.addEventListener(FaultEvent.FAULT , this.LoginUser);
				this.pc_LoginUser.token = this.pc_CrudLogin.login(user.UserName,user.Password);
				trace('login user');
				return;
			}
			
			var le_Event:CrudEvent = new CrudEvent(CrudEvent.USER_LOGIN);
			trace('login user completed');
			if (event is ResultEvent)	
			{
				var lo_LoginFields:LoginFields = this.pc_LoginUser.token.result as LoginFields;
				if (!lo_LoginFields)
				{
					this.go_LoginFields.SessionID = 0;
					this.go_LoginFields.MemberID = 0;
					le_Event.sessionId = 0;
					le_Event.memberId = 0;
					le_Event.memberFields = null;
					this.dispatchEvent(le_Event);
					this.dispatchEvent(new Event("notLoggedIn"));
					
				}else{
					le_Event.sessionId = lo_LoginFields.SessionID;
					le_Event.memberId = lo_LoginFields.MemberID;
					le_Event.valid = true;
					this.go_LoginFields.SessionID = lo_LoginFields.SessionID;
					this.go_LoginFields.MemberID = lo_LoginFields.MemberID;
					this.dispatchEvent(le_Event);
					

				}
			}
			
			if (event is FaultEvent)
			{
				trace("login errored");
				var fault:FaultEvent = event as FaultEvent;
				le_Event.errorMsg = "login error: " + fault.fault.faultDetail + ' ' + fault.fault.faultString;
				le_Event.errored = true;
				this.dispatchEvent(le_Event);
			}
			
			this.pc_LoginUser.removeEventListener(ResultEvent.RESULT, this.LoginUser);
			this.pc_LoginUser.removeEventListener(FaultEvent.FAULT, this.LoginUser);

		}
		
		private var pc_GetMemberID:CallResponder = new CallResponder();
		protected function GetMemberID(event:Object, SessionID:Number=0):void
		{
			if (SessionID > 0)
			{
				this.pc_GetMemberID.addEventListener(ResultEvent.RESULT, this.GetMemberID);
				this.pc_GetMemberID.addEventListener(FaultEvent.FAULT, this.GetMemberID);
				this.pc_GetMemberID.token =  this.pc_CrudLogin.GetMemberID(SessionID);
				trace('GetMemberID');
				return;
			}
			
			var le_Event:CrudEvent = new CrudEvent(CrudEvent.GET_SESSIONID);
			trace('GetMemberID Completed');
			if (event is ResultEvent)	
			{
				var ln_MemberID:Number = this.pc_GetMemberID.token.result as Number;
				if (!ln_MemberID)
				{
					le_Event.memberId = 0;
					this.go_LoginFields.MemberID = 0;
					le_Event.valid = false;
					this.dispatchEvent(le_Event);
				}else{
					le_Event.memberId = ln_MemberID;
					le_Event.valid = true;
					trace('memberId received - ' + ln_MemberID);
					this.go_LoginFields.MemberID = ln_MemberID;
					this.dispatchEvent(le_Event);
				}
			}
			
			if (event is FaultEvent)
			{
				var fault:FaultEvent = event as FaultEvent;
				trace('error getting memberId');
				le_Event.errorMsg = fault.fault.faultDetail + ' ' + fault.fault.faultString;
				le_Event.errored = true;
				this.dispatchEvent(le_Event);
			}
			
			this.pc_GetMemberID.removeEventListener(ResultEvent.RESULT, this.GetMemberID);
			this.pc_GetMemberID.removeEventListener(FaultEvent.FAULT, this.GetMemberID);
		}
		
		private var pc_GetMember:CallResponder = new CallResponder();
		public function GetMember(event:Object, memberID:Number=-1):void
		{
			var le_Event:CrudEvent = new CrudEvent(CrudEvent.GET_MEMBERINFO);
			//event should be NULL if memberiD > 0
			if (memberID > 0)
			{
				this.pc_GetMember.addEventListener(ResultEvent.RESULT, GetMember);
				this.pc_GetMember.addEventListener(FaultEvent.FAULT, GetMember);
				this.pc_GetMember.token = pc_CrudMembers.getTblMembersByID(memberID);
				trace('GetMember');
				return;
			}else if(memberID == 0)
			{
				this.dispatchEvent(le_Event);                                                                                                                                               
				this.pc_GetMember.removeEventListener(ResultEvent.RESULT, GetMember);
				this.pc_GetMember.removeEventListener(FaultEvent.FAULT, GetMember);
				return;
			}

			
			trace('GetMember completed');
			if (event is ResultEvent)	
			{
				var ln_Member:TblMembers = pc_GetMember.token.result as TblMembers;
				if (!ln_Member)
				{
					this.go_LoginFields.SessionID = 0;
					this.go_LoginFields.MemberID = 0;
					le_Event.sessionId = 0;
					le_Event.memberId = 0;
					le_Event.memberFields = null;
					this.dispatchEvent(le_Event);
					this.dispatchEvent(new Event("notLoggedIn"));
				}else{
					trace('dispatching GET_MEMBERINFO event');
					le_Event.memberFields = ln_Member;
					le_Event.valid = true;
					this.go_MemberFields = ln_Member;
					this.dispatchEvent(le_Event);
					trace("Executing event loggedIn");
					this.dispatchEvent(new Event("loggedIn"));
				}
			}
			
			if (event is FaultEvent)
			{
				trace('dispatching GET_MEMBERINFO event FAILED');
				var fault:FaultEvent = event as FaultEvent;
				le_Event.errorMsg = fault.fault.faultDetail + ' ' + fault.fault.faultString;
				le_Event.errored = true;
				this.dispatchEvent(le_Event);
			}
			
			this.pc_GetMember.removeEventListener(ResultEvent.RESULT, this.GetMember);
			this.pc_GetMember.removeEventListener(FaultEvent.FAULT, this.GetMember);
		}
	
		
		private var pc_ProductKeywords:CallResponder = new CallResponder();
		public function GetProductKeywords(event:Object, productID:Number=-1):void
		{
			var le_Event:CrudEvent = new CrudEvent(CrudEvent.GET_PRODUCT_KEYWORDS);

			if (productID > 0)
			{
				this.pc_ProductKeywords.addEventListener(ResultEvent.RESULT, GetProductKeywords);
				this.pc_ProductKeywords.addEventListener(FaultEvent.FAULT, GetProductKeywords);
				this.pc_ProductKeywords.token = pc_CrudKeywords.getKeywordsByProductID(productID);
				trace('GetProductKeywords: ' + productID);
				return;
			}
			
			trace('GetProductKeywords completed');
			if (event is ResultEvent)	
			{
				var ln_Value:ArrayCollection = pc_ProductKeywords.token.result as ArrayCollection;
				if (!ln_Value)
				{
					trace("no keyword list");
					le_Event.valid = true;
					this.go_KeywordFields = ln_Value;
					this.dispatchEvent(le_Event);
				}else{
					this.go_KeywordFields = ln_Value;
					trace("got keyword list");
					le_Event.valid = true;
					this.dispatchEvent(le_Event);
				}
			}
			
			if (event is FaultEvent)
			{
				trace("GetProductKeywords errored!");
				var fault:FaultEvent = event as FaultEvent;
				le_Event.errorMsg = fault.fault.faultDetail + ' ' + fault.fault.faultString;
				le_Event.errored = true;
				le_Event.valid = false;
				this.dispatchEvent(le_Event);
			}
			
			this.pc_ProductKeywords.removeEventListener(ResultEvent.RESULT, this.GetProductKeywords);
			this.pc_ProductKeywords.removeEventListener(FaultEvent.FAULT, this.GetProductKeywords);
		}
		
		
		private var pc_EmailFriends:CallResponder = new CallResponder();
		public function EmailFriend(event:Object, email:String="", name:String="", comment:String=""):void
		{
			if (email)
			{
				this.pc_EmailFriends.addEventListener(ResultEvent.RESULT, this.EmailFriend);
				this.pc_EmailFriends.addEventListener(FaultEvent.FAULT, this.EmailFriend);
				this.pc_EmailFriends.token = this.pc_CrudEmailLog.email_friend(email,name,comment, this.go_LoginFields.MemberID);
				trace('EmailFriend');
				return;
			}
			
			var le_Event:CrudEvent = new CrudEvent(CrudEvent.EMAIL_FRIEND);
			trace('EmailFriend Completed');
			if (event is ResultEvent)	
			{
				this.dispatchEvent(le_Event);
			}
			
			if (event is FaultEvent)
			{
				var fault:FaultEvent = event as FaultEvent;
				le_Event.errorMsg = fault.fault.faultDetail + ' ' + fault.fault.faultString;
				le_Event.errored = true;
				this.dispatchEvent(le_Event);
			}
			
			this.pc_EmailFriends.removeEventListener(ResultEvent.RESULT,this.EmailFriend);
			this.pc_EmailFriends.removeEventListener(FaultEvent.FAULT, this.EmailFriend);
		}
		
		
		
		
		private var pc_CreateProduct:CallResponder = new CallResponder();
		public function CreateProduct(event:Object, product:TblProducts=null):void
		{
			if (product)
			{
				this.pc_CreateProduct.addEventListener(ResultEvent.RESULT, this.CreateProduct);
				this.pc_CreateProduct.addEventListener(FaultEvent.FAULT, this.CreateProduct);
				this.pc_CreateProduct.token = pc_CrudProducts.createTblProducts(product);
				trace('creating product');
				return;
			}
			
			var le_Event:CrudEvent = new CrudEvent(CrudEvent.PRODUCT_CREATED);
			trace('creating product completed');
			if (event is ResultEvent)	
			{
				//why does this return member fields instead of rowid?
				var ln_Value:Number = pc_CreateProduct.token.result as Number;
				le_Event.productId = ln_Value;
				
				this.dispatchEvent(le_Event);
			}
			
			if (event is FaultEvent)
			{
				var fault:FaultEvent = event as FaultEvent;
				le_Event.errorMsg = fault.fault.faultDetail + ' ' + fault.fault.faultString;
				le_Event.errored = true;
				this.dispatchEvent(le_Event);
			}
			
			this.pc_CreateProduct.removeEventListener(ResultEvent.RESULT, this.CreateProduct);
			this.pc_CreateProduct.removeEventListener(FaultEvent.FAULT, this.CreateProduct);
		}
		
		

		private var pc_UpdateProduct:CallResponder = new CallResponder();
		public function UpdateProduct(event:Object, product:TblProducts=null):void
		{

			if (product)
			{
				trace("updating " + product.RowID);
				this.pc_UpdateProduct.addEventListener(ResultEvent.RESULT, UpdateProduct);
				this.pc_UpdateProduct.addEventListener(FaultEvent.FAULT, UpdateProduct);
				this.pc_UpdateProduct.token =  pc_CrudProducts.updateTblProducts(product);
				return;
			}
			
			var le_Event:CrudEvent = new CrudEvent(CrudEvent.PRODUCT_UPDATED);
			if (event is ResultEvent)	
			{
				trace("updated product");
				le_Event.errored = false;
				le_Event.valid = true;
				this.dispatchEvent(le_Event);
			}
			
			if (event is FaultEvent)
			{
				trace("Error updating product");
				var fault:FaultEvent = event as FaultEvent;
				le_Event.errorMsg = fault.fault.faultDetail + ' ' + fault.fault.faultString;
				le_Event.errored = true;
				this.dispatchEvent(le_Event);
			}
			
			trace("removing listeners");
			this.pc_UpdateProduct.removeEventListener(ResultEvent.RESULT, this.UpdateProduct);
			this.pc_UpdateProduct.removeEventListener(FaultEvent.FAULT, this.UpdateProduct);
		}
		
		
		
		private var pc_GetProduct:CallResponder = new CallResponder();
		public function GetProduct(event:Object, productId:Number=-1):void
		{
			var fault:FaultEvent;
			
			if (productId >= 0)
			{
				this.pc_GetProduct.addEventListener(ResultEvent.RESULT, this.GetProduct);
				this.pc_GetProduct.addEventListener(FaultEvent.FAULT, this.GetProduct);
				this.pc_GetProduct.token =  pc_CrudProducts.getTblProductsByID(productId);
				trace('Get Product: ' + productId);
				return;
			}
			
			var le_Event:CrudEvent = new CrudEvent(CrudEvent.GET_PRODUCTINFO);
			if (event is ResultEvent && pc_GetProduct && pc_GetProduct.token.result)	
			{
				var ln_Value:TblProducts = pc_GetProduct.token.result as  TblProducts;
				if (!ln_Value)
				{
					trace("GetProduct errored");
					fault = event as FaultEvent;
					le_Event.errorMsg = "Error allocating data";
					le_Event.errored = true;
					this.dispatchEvent(le_Event);
				}else{
					trace("Got Product Fields");
					
					this.go_ProductFields = ln_Value;
					le_Event.valid = true;
					
					this.dispatchEvent(le_Event);
				}
			}
			
			if (event is FaultEvent)
			{
				trace("GetProduct errored");
				fault = event as FaultEvent;
				le_Event.errorMsg = fault.fault.faultDetail + ' ' + fault.fault.faultString;
				le_Event.errored = true;
				this.dispatchEvent(le_Event);
			}
			
			this.pc_GetProduct.removeEventListener(ResultEvent.RESULT, this.GetProduct);
			this.pc_GetProduct.removeEventListener(FaultEvent.FAULT, this.GetProduct);
		}
		
		
		private var pc_Search:CallResponder = new CallResponder();
		public function Search(event:Object, search:String=null, page:Number=0):void
		{
			if (search)
			{
				this.pc_Search.addEventListener(ResultEvent.RESULT, this.Search);
				this.pc_Search.addEventListener(FaultEvent.FAULT, this.Search);
				this.pc_Search.token =  pc_CrudProducts.search(search,page,MAX_RESULTS_PAGE);
				trace('Search');
				return;
			}
			
			var le_Event:CrudEvent = new CrudEvent(CrudEvent.SEARCH);
			if (event is ResultEvent && pc_Search && pc_Search.token.result)	
			{
				var ln_Value:ArrayCollection = pc_Search.token.result as  ArrayCollection;
				if (!ln_Value)
				{
					trace("no search results");
					le_Event.valid = true;
					this.dispatchEvent(le_Event);
				}else{
					this.go_SearchFields = ln_Value;
					le_Event.valid = true;
	
					trace("dispatched");
					this.dispatchEvent(le_Event);
				}
			}
			
			if (event is FaultEvent)
			{
				trace("errored");
				var fault:FaultEvent = event as FaultEvent;
				le_Event.errorMsg = fault.fault.faultDetail + ' ' + fault.fault.faultString;
				le_Event.errored = true;
				le_Event.valid = false;
				this.dispatchEvent(le_Event);
			}
			
			this.pc_Search.removeEventListener(ResultEvent.RESULT, this.Search);
			this.pc_Search.removeEventListener(FaultEvent.FAULT, this.Search);
		}
		
		
		
		private var pc_GetProductView:CallResponder = new CallResponder();
		public function GetProductView(event:Object, memberId:Number=-1, start:Number=0):void
		{
			var fault:FaultEvent;
			
			if (memberId >= 0)
			{
				this.pc_GetProductView.addEventListener(ResultEvent.RESULT, this.GetProductView);
				this.pc_GetProductView.addEventListener(FaultEvent.FAULT, this.GetProductView);
				this.pc_GetProductView.token =   pc_CrudProducts.GetProductsForUserPaged(memberId, start, this.MAX_RESULTS_VIEW);
				trace('Get Product: ' + memberId);
				return;
			}
			
			trace("got event back");
			var le_Event:CrudEvent = new CrudEvent(CrudEvent.GET_PRODUCTVIEW_INFO);
			if (event is ResultEvent && pc_GetProductView && pc_GetProductView.token.result)	
			{
				var ln_Value:ArrayCollection = pc_GetProductView.token.result as ArrayCollection;
				if (!ln_Value)
				{
					trace("errored");
					fault = event as FaultEvent;
					le_Event.errorMsg = "Error allocating data";
					le_Event.errored = true;
					le_Event.valid = false;
					this.dispatchEvent(le_Event);
				}else{
					this.go_ProductsView = ln_Value;
					le_Event.valid = true;
					
					trace("dispatched");
					this.dispatchEvent(le_Event);
				}
			}
			
			if (event is FaultEvent)
			{
				trace("errored");
				fault = event as FaultEvent;
				le_Event.errorMsg = fault.fault.faultDetail + ' ' + fault.fault.faultString;
				le_Event.errored = true;
				le_Event.valid = false;
				this.dispatchEvent(le_Event);
			}
			
			this.pc_GetProductView.removeEventListener(ResultEvent.RESULT, this.GetProductView);
			this.pc_GetProductView.removeEventListener(FaultEvent.FAULT, this.GetProductView);
		}
		
		
		
		
		private var pc_AddKeywords:CallResponder = new CallResponder();
		public function AddKeywords(event:Object, keywords:String="", productId:Number=-1):void
		{
			var fault:FaultEvent;
			
			if (productId > 0)
			{
				this.pc_AddKeywords.addEventListener(ResultEvent.RESULT, this.AddKeywords);
				this.pc_AddKeywords.addEventListener(FaultEvent.FAULT, this.AddKeywords);
				this.pc_AddKeywords.token =  pc_CrudProducts.addKeywords(keywords,productId);
				trace('Add Keywords: ' + productId);
				return;
			}
			
			var le_Event:CrudEvent = new CrudEvent(CrudEvent.ADD_KEYWORDS);
			
			if (event is FaultEvent)
			{
				trace("AddKeywords errored");
				fault = event as FaultEvent;
				le_Event.errorMsg = fault.fault.faultDetail + ' ' + fault.fault.faultString;
				le_Event.errored = true;
				le_Event.valid = false;
				this.dispatchEvent(le_Event);
			}else{
				trace("dispatched event");
				le_Event.valid = true;
				this.dispatchEvent(le_Event);
			}
			
			this.pc_GetProduct.removeEventListener(ResultEvent.RESULT, this.AddKeywords);
			this.pc_GetProduct.removeEventListener(FaultEvent.FAULT, this.AddKeywords);
		}
		
		
	}
}