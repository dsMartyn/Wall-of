package com.utils
{
	import com.adobe.serializers.json.JSONDecoder;
	import com.events.CrudEvent;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import flash.utils.ByteArray;
	
	public class JSONImageLoader extends EventDispatcher
	{
		private var po_urlLoader:URLLoader;
		private var Database:DatabaseCRUD = DatabaseCRUD.getInstance();
	
		
		public function JSONImageLoader()
		{
		}
		
		protected function dispatchError(errorMsg:String):void
		{
			var le_Event:CrudEvent = new CrudEvent(CrudEvent.JSON_SEARCH);
			le_Event.errored = true;
			le_Event.errorMsg = errorMsg
			le_Event.valid = false;
			trace(errorMsg);
			this.dispatchEvent(le_Event);
		}
		protected function Upload_Error(event:IOErrorEvent):void
		{
			dispatchError(event.text);
			trace("error getting data");
		}
		
		protected function Upload_Complete(event:Event):void
		{	
			var le_Event:CrudEvent = new CrudEvent(CrudEvent.JSON_SEARCH);
			var data:ByteArray = po_urlLoader.data;
			if (data && data.length > 10)
			{
				var json_len:Number = 0;
				var json_dec:JSONDecoder = new JSONDecoder();
				var json:Object;
				var i:Number=0;
				
				data.position = 0;
				while (data.readUTFBytes(1) != "{")
				{
					if (data.position >= data.length || data.position > 20)
					{
						le_Event.valid = true;
						this.dispatchEvent(le_Event);
					//	dispatchError("Error data invalid!");
						return; //error!
					}
				}
				json_len = data.position-1;//lenght of integer
				data.position = 0;
				json_len = int(data.readUTFBytes(json_len));//actual length of json array
				if (json_len <= 0 || data.length <= json_len)
				{
					dispatchError("error getting length");
					return;
				}
				json = json_dec.decode(data.readUTFBytes(json_len));//decode array
				
				//get images
				Database.go_SearchFields.removeAll();
				Database.go_SearchCount = json.Total;
				var idx:Number = data.position; //start of data
				for (i = 0 ; i < json.ImageCount; i++)
				{
					var imageDat:ImageData = new ImageData();
					imageDat.productId = json.Images[i].productId;
					if (json.Images[i].length > 0)
					{
						data.position = idx + json.Images[i].ofSet;//get the image binary data
						data.readBytes(imageDat.imageData, 0, json.Images[i].length);
					}
					Database.go_SearchFields.addItem(imageDat);
				}
				trace("Total: " + Database.go_SearchCount + " Showing: " + json.ImageCount );
				le_Event.valid = true;
				this.dispatchEvent(le_Event);
			}else{
				dispatchError("error getting byte array");
			}
		}
		

		public function SearchJSON(search:String=null, page:Number=0):void
		{
			var lo_Vars:URLVariables = new URLVariables();
			var lo_urlRequest:URLRequest = new URLRequest("services/JSONImageService.php");
			
			lo_Vars.action="request";
			lo_Vars.str=search;
			lo_Vars.start = page;
			lo_Vars.limit = Database.MAX_RESULTS_PAGE;
			
			trace("searching for: " + search);
			
			lo_urlRequest.data = lo_Vars;
			lo_urlRequest.method = URLRequestMethod.POST;
			
			po_urlLoader  = new URLLoader();
			po_urlLoader.dataFormat = URLLoaderDataFormat.BINARY;
			
			//po_urlLoader.addEventListener(ProgressEvent.PROGRESS,Upload_Progress);
			po_urlLoader.addEventListener(IOErrorEvent.IO_ERROR, Upload_Error);
			//po_urlLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,Upload_Error); 
			po_urlLoader.addEventListener(Event.COMPLETE, Upload_Complete);
			po_urlLoader.load(lo_urlRequest);
		}
		
	}
}