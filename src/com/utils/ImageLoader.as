package com.utils
{
	import flash.events.EventDispatcher;
	import flash.events.Event;
	import org.papervision3d.events.FileLoadEvent;
	import org.papervision3d.materials.BitmapFileMaterial;
	
	
	//this class will load an array of images
	public class ImageLoader extends EventDispatcher
	{
		/*
		Public Variables  = g
		Private Variables = p
		Local Variables   = l
		
		Class Objects  *= o
		PaperVision3D  *= p
		Variable types *= i,l,s,b,a 
		integer, long, string, boolean, array
		*/
		
		private var pa_Images:Array; //contains all images
		private var pb_Dbg:Boolean = false; //enable debug
		
		public var gs_ImageLoaded:String = "IMAGE_LOADED";
		
		public function ImageLoader(Debug:Boolean=false)
		{
			pb_Dbg = Debug;
			pa_Images = new Array();
		}
		
		public function ClearImages():void
		{
			_trace('clearing images');
			var li_ctr:Number = 0;
			for (li_ctr=0; li_ctr<pa_Images.length; li_ctr++)
			{
				var lp_tmp:BitmapFileMaterial = pa_Images[li_ctr];
				lp_tmp.destroy();
			}
			
			pa_Images = new Array();
		}
		
		public function GetImage(fileName:String):BitmapFileMaterial
		{
			var li_ctr:Number = 0;
			for (li_ctr=0; li_ctr<pa_Images.length; li_ctr++)
			{
				var lp_tmp:BitmapFileMaterial = pa_Images[li_ctr];
				if (lp_tmp.name == fileName)
				{
					_trace("Returning Image: " + fileName);
					return lp_tmp;
				}
			}
			return null;
		}
		
		public function AddImage(fileName:String, precise:Boolean=false, raiseEvent:Boolean=true):void
		{
			//check image is loaded
			if (GetImage(fileName))
			{	
				dispatchEvent(new FileLoadEvent(gs_ImageLoaded,fileName)); // Event(gs_ImageLoaded));
				_trace('image already loaded');
				return;
			}
			
			//load image
			_trace("Loading: " + fileName)
			var lp_BMPFile:BitmapFileMaterial = new BitmapFileMaterial(fileName,precise);
			
			lp_BMPFile.name = fileName;
			
			if (raiseEvent)
			{
				lp_BMPFile.addEventListener(FileLoadEvent.LOAD_PROGRESS,Image_Progress);
				lp_BMPFile.addEventListener(FileLoadEvent.LOAD_ERROR,Image_Error);
				lp_BMPFile.addEventListener(FileLoadEvent.LOAD_COMPLETE,Image_Complete);
			}
			pa_Images.push(lp_BMPFile);
		}
		
		private function RemoveEventListeners(bmp:BitmapFileMaterial):void
		{
			bmp.removeEventListener(FileLoadEvent.LOAD_PROGRESS,Image_Progress);
			bmp.removeEventListener(FileLoadEvent.LOAD_ERROR,Image_Error);
			bmp.removeEventListener(FileLoadEvent.LOAD_COMPLETE,Image_Complete);	
		}
		protected function Image_Progress(event:FileLoadEvent):void
		{
			_trace('progress');
		}
		
		protected function Image_Error(event:FileLoadEvent):void
		{
			dispatchEvent(new FileLoadEvent(gs_ImageLoaded,event.file,-1,-1,"error")); // Event(gs_ImageLoaded));
			RemoveEventListeners(event.target as BitmapFileMaterial);
			_trace('Error');
		}
		
		protected function Image_Complete(event:FileLoadEvent):void
		{
			dispatchEvent(new FileLoadEvent(gs_ImageLoaded,event.file)); // Event(gs_ImageLoaded));
			RemoveEventListeners(event.target as BitmapFileMaterial);
			
			_trace('Complete');
		}
		
		
		protected function _trace(str:String):void
		{
			if (pb_Dbg)
				trace(str);
		}
	}
}