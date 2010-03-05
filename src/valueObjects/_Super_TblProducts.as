/**
 * This is a generated class and is not intended for modfication.  To customize behavior
 * of this value object you may modify the generated sub-class of this class - TblProducts.as.
 */

package valueObjects
{
import flash.events.EventDispatcher;
import flash.net.registerClassAlias;
import flash.net.getClassByAlias;
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.valueobjects.IPropertyIterator;
import com.adobe.fiber.valueobjects.IValueObject;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;
import com.adobe.fiber.services.IFiberManagingService;
import mx.binding.utils.ChangeWatcher;
import mx.rpc.AbstractService;


import flash.events.Event;
import mx.events.CollectionEvent;
import mx.events.PropertyChangeEvent;


use namespace model_internal;

[Managed]
[ExcludeClass]
public class _Super_TblProducts extends EventDispatcher implements IValueObject
{
    model_internal static function initRemoteClassAliasSingle(cz:Class) : void 
    {
     }   
     
    model_internal static function initRemoteClassAliasAllRelated() : void 
    {     
    }

	model_internal var _dminternal_model : _TblProductsEntityMetadata;

	/**
	 * properties
	 */
	private var _internal_picUrl : Object;
	private var _internal_CompanyDesc : String;
	private var _internal_CompanyName : Object;
	private var _internal_Image : String;
	private var _internal_AddressTown : String;
	private var _internal_AddressEmail : String;
	private var _internal_status : int;
	private var _internal_AddressFax : String;
	private var _internal_AddressMob : String;
	private var _internal_AddressTel : String;
	private var _internal_YoutubeVideoUrl : String;
	private var _internal_AddressCounty : String;
	private var _internal_ItemName : String;
	private var _internal_AddressName : String;
	private var _internal_MemberID : int;
	private var _internal_RowID : int;
	private var _internal_Category : String;
	private var _internal_ImageID : int;
	private var _internal_AddressStreet : String;
	private var _internal_ItemDesc : String;
	private var _internal_GooglePostCode : String;
	private var _internal_AddressPostCode : String;

    private static var emptyArray:Array = new Array();

    /**
     * derived property cache initialization
     */  
    model_internal var _cacheInitialized_isValid:Boolean = false;   
    
	model_internal var _changeWatcherArray:Array = new Array();   

	public function _Super_TblProducts() 
	{	
		_model = new _TblProductsEntityMetadata(this);
	
		// Bind to own data properties for cache invalidation triggering  
       
	}

    /**
     * data property getters
     */
	[Bindable(event="propertyChange")] 
    public function get picUrl() : Object    
    {
            return _internal_picUrl;
    }    
	[Bindable(event="propertyChange")] 
    public function get CompanyDesc() : String    
    {
            return _internal_CompanyDesc;
    }    
	[Bindable(event="propertyChange")] 
    public function get CompanyName() : Object    
    {
            return _internal_CompanyName;
    }    
	[Bindable(event="propertyChange")] 
    public function get Image() : String    
    {
            return _internal_Image;
    }    
	[Bindable(event="propertyChange")] 
    public function get AddressTown() : String    
    {
            return _internal_AddressTown;
    }    
	[Bindable(event="propertyChange")] 
    public function get AddressEmail() : String    
    {
            return _internal_AddressEmail;
    }    
	[Bindable(event="propertyChange")] 
    public function get status() : int    
    {
            return _internal_status;
    }    
	[Bindable(event="propertyChange")] 
    public function get AddressFax() : String    
    {
            return _internal_AddressFax;
    }    
	[Bindable(event="propertyChange")] 
    public function get AddressMob() : String    
    {
            return _internal_AddressMob;
    }    
	[Bindable(event="propertyChange")] 
    public function get AddressTel() : String    
    {
            return _internal_AddressTel;
    }    
	[Bindable(event="propertyChange")] 
    public function get YoutubeVideoUrl() : String    
    {
            return _internal_YoutubeVideoUrl;
    }    
	[Bindable(event="propertyChange")] 
    public function get AddressCounty() : String    
    {
            return _internal_AddressCounty;
    }    
	[Bindable(event="propertyChange")] 
    public function get ItemName() : String    
    {
            return _internal_ItemName;
    }    
	[Bindable(event="propertyChange")] 
    public function get AddressName() : String    
    {
            return _internal_AddressName;
    }    
	[Bindable(event="propertyChange")] 
    public function get MemberID() : int    
    {
            return _internal_MemberID;
    }    
	[Bindable(event="propertyChange")] 
    public function get RowID() : int    
    {
            return _internal_RowID;
    }    
	[Bindable(event="propertyChange")] 
    public function get Category() : String    
    {
            return _internal_Category;
    }    
	[Bindable(event="propertyChange")] 
    public function get ImageID() : int    
    {
            return _internal_ImageID;
    }    
	[Bindable(event="propertyChange")] 
    public function get AddressStreet() : String    
    {
            return _internal_AddressStreet;
    }    
	[Bindable(event="propertyChange")] 
    public function get ItemDesc() : String    
    {
            return _internal_ItemDesc;
    }    
	[Bindable(event="propertyChange")] 
    public function get GooglePostCode() : String    
    {
            return _internal_GooglePostCode;
    }    
	[Bindable(event="propertyChange")] 
    public function get AddressPostCode() : String    
    {
            return _internal_AddressPostCode;
    }    

    /**
     * data property setters
     */      
    public function set picUrl(value:Object) : void 
    {    	
        var recalcValid:Boolean = false;
    	if (value == null || _internal_picUrl == null)
    	{
    		recalcValid = true;
    	}	
    	
    	
    	var oldValue:Object = _internal_picUrl;               
        if (oldValue !== value)
        {
        	_internal_picUrl = value;
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
    public function set CompanyDesc(value:String) : void 
    {    	
        var recalcValid:Boolean = false;
    	if (value == null || _internal_CompanyDesc == null)
    	{
    		recalcValid = true;
    	}	
    	
    	
    	var oldValue:String = _internal_CompanyDesc;               
        if (oldValue !== value)
        {
        	_internal_CompanyDesc = value;
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
    public function set CompanyName(value:Object) : void 
    {    	
        var recalcValid:Boolean = false;
    	if (value == null || _internal_CompanyName == null)
    	{
    		recalcValid = true;
    	}	
    	
    	
    	var oldValue:Object = _internal_CompanyName;               
        if (oldValue !== value)
        {
        	_internal_CompanyName = value;
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
    public function set Image(value:String) : void 
    {    	
        var recalcValid:Boolean = false;
    	if (value == null || _internal_Image == null)
    	{
    		recalcValid = true;
    	}	
    	
    	
    	var oldValue:String = _internal_Image;               
        if (oldValue !== value)
        {
        	_internal_Image = value;
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
    public function set AddressTown(value:String) : void 
    {    	
        var recalcValid:Boolean = false;
    	if (value == null || _internal_AddressTown == null)
    	{
    		recalcValid = true;
    	}	
    	
    	
    	var oldValue:String = _internal_AddressTown;               
        if (oldValue !== value)
        {
        	_internal_AddressTown = value;
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
    public function set AddressEmail(value:String) : void 
    {    	
        var recalcValid:Boolean = false;
    	if (value == null || _internal_AddressEmail == null)
    	{
    		recalcValid = true;
    	}	
    	
    	
    	var oldValue:String = _internal_AddressEmail;               
        if (oldValue !== value)
        {
        	_internal_AddressEmail = value;
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
    public function set status(value:int) : void 
    {    	
        var recalcValid:Boolean = false;
    	
    	
    	var oldValue:int = _internal_status;               
        if (oldValue !== value)
        {
        	_internal_status = value;
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
    public function set AddressFax(value:String) : void 
    {    	
        var recalcValid:Boolean = false;
    	if (value == null || _internal_AddressFax == null)
    	{
    		recalcValid = true;
    	}	
    	
    	
    	var oldValue:String = _internal_AddressFax;               
        if (oldValue !== value)
        {
        	_internal_AddressFax = value;
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
    public function set AddressMob(value:String) : void 
    {    	
        var recalcValid:Boolean = false;
    	if (value == null || _internal_AddressMob == null)
    	{
    		recalcValid = true;
    	}	
    	
    	
    	var oldValue:String = _internal_AddressMob;               
        if (oldValue !== value)
        {
        	_internal_AddressMob = value;
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
    public function set AddressTel(value:String) : void 
    {    	
        var recalcValid:Boolean = false;
    	if (value == null || _internal_AddressTel == null)
    	{
    		recalcValid = true;
    	}	
    	
    	
    	var oldValue:String = _internal_AddressTel;               
        if (oldValue !== value)
        {
        	_internal_AddressTel = value;
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
    public function set YoutubeVideoUrl(value:String) : void 
    {    	
        var recalcValid:Boolean = false;
    	if (value == null || _internal_YoutubeVideoUrl == null)
    	{
    		recalcValid = true;
    	}	
    	
    	
    	var oldValue:String = _internal_YoutubeVideoUrl;               
        if (oldValue !== value)
        {
        	_internal_YoutubeVideoUrl = value;
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
    public function set AddressCounty(value:String) : void 
    {    	
        var recalcValid:Boolean = false;
    	if (value == null || _internal_AddressCounty == null)
    	{
    		recalcValid = true;
    	}	
    	
    	
    	var oldValue:String = _internal_AddressCounty;               
        if (oldValue !== value)
        {
        	_internal_AddressCounty = value;
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
    public function set ItemName(value:String) : void 
    {    	
        var recalcValid:Boolean = false;
    	if (value == null || _internal_ItemName == null)
    	{
    		recalcValid = true;
    	}	
    	
    	
    	var oldValue:String = _internal_ItemName;               
        if (oldValue !== value)
        {
        	_internal_ItemName = value;
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
    public function set AddressName(value:String) : void 
    {    	
        var recalcValid:Boolean = false;
    	if (value == null || _internal_AddressName == null)
    	{
    		recalcValid = true;
    	}	
    	
    	
    	var oldValue:String = _internal_AddressName;               
        if (oldValue !== value)
        {
        	_internal_AddressName = value;
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
    public function set MemberID(value:int) : void 
    {    	
        var recalcValid:Boolean = false;
    	
    	
    	var oldValue:int = _internal_MemberID;               
        if (oldValue !== value)
        {
        	_internal_MemberID = value;
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
    public function set RowID(value:int) : void 
    {    	
        var recalcValid:Boolean = false;
    	
    	
    	var oldValue:int = _internal_RowID;               
        if (oldValue !== value)
        {
        	_internal_RowID = value;
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
    public function set Category(value:String) : void 
    {    	
        var recalcValid:Boolean = false;
    	if (value == null || _internal_Category == null)
    	{
    		recalcValid = true;
    	}	
    	
    	
    	var oldValue:String = _internal_Category;               
        if (oldValue !== value)
        {
        	_internal_Category = value;
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
    public function set ImageID(value:int) : void 
    {    	
        var recalcValid:Boolean = false;
    	
    	
    	var oldValue:int = _internal_ImageID;               
        if (oldValue !== value)
        {
        	_internal_ImageID = value;
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
    public function set AddressStreet(value:String) : void 
    {    	
        var recalcValid:Boolean = false;
    	if (value == null || _internal_AddressStreet == null)
    	{
    		recalcValid = true;
    	}	
    	
    	
    	var oldValue:String = _internal_AddressStreet;               
        if (oldValue !== value)
        {
        	_internal_AddressStreet = value;
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
    public function set ItemDesc(value:String) : void 
    {    	
        var recalcValid:Boolean = false;
    	if (value == null || _internal_ItemDesc == null)
    	{
    		recalcValid = true;
    	}	
    	
    	
    	var oldValue:String = _internal_ItemDesc;               
        if (oldValue !== value)
        {
        	_internal_ItemDesc = value;
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
    public function set GooglePostCode(value:String) : void 
    {    	
        var recalcValid:Boolean = false;
    	if (value == null || _internal_GooglePostCode == null)
    	{
    		recalcValid = true;
    	}	
    	
    	
    	var oldValue:String = _internal_GooglePostCode;               
        if (oldValue !== value)
        {
        	_internal_GooglePostCode = value;
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
    public function set AddressPostCode(value:String) : void 
    {    	
        var recalcValid:Boolean = false;
    	if (value == null || _internal_AddressPostCode == null)
    	{
    		recalcValid = true;
    	}	
    	
    	
    	var oldValue:String = _internal_AddressPostCode;               
        if (oldValue !== value)
        {
        	_internal_AddressPostCode = value;
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    

    /**
     * data property setter listeners
     */   

   model_internal function setterListenerAnyConstraint(value:Event):void
   {
        if (model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }        
   }   

    /**
     * valid related derived properties
     */
    model_internal var _isValid : Boolean;
    model_internal var _invalidConstraints:Array = new Array();
    model_internal var _validationFailureMessages:Array = new Array();

    /**
     * derived property calculators
     */

    /**
     * isValid calculator
     */
    model_internal function calculateIsValid():Boolean
    {
        var violatedConsts:Array = new Array();    
        var validationFailureMessages:Array = new Array();    

		if (_model.isPicUrlAvailable && _internal_picUrl == null)
		{
			violatedConsts.push("picUrlIsRequired");
			validationFailureMessages.push("picUrl is required");
		}
		if (_model.isCompanyDescAvailable && _internal_CompanyDesc == null)
		{
			violatedConsts.push("CompanyDescIsRequired");
			validationFailureMessages.push("CompanyDesc is required");
		}
		if (_model.isCompanyNameAvailable && _internal_CompanyName == null)
		{
			violatedConsts.push("CompanyNameIsRequired");
			validationFailureMessages.push("CompanyName is required");
		}
		if (_model.isImageAvailable && _internal_Image == null)
		{
			violatedConsts.push("ImageIsRequired");
			validationFailureMessages.push("Image is required");
		}
		if (_model.isAddressTownAvailable && _internal_AddressTown == null)
		{
			violatedConsts.push("AddressTownIsRequired");
			validationFailureMessages.push("AddressTown is required");
		}
		if (_model.isAddressEmailAvailable && _internal_AddressEmail == null)
		{
			violatedConsts.push("AddressEmailIsRequired");
			validationFailureMessages.push("AddressEmail is required");
		}
		if (_model.isAddressFaxAvailable && _internal_AddressFax == null)
		{
			violatedConsts.push("AddressFaxIsRequired");
			validationFailureMessages.push("AddressFax is required");
		}
		if (_model.isAddressMobAvailable && _internal_AddressMob == null)
		{
			violatedConsts.push("AddressMobIsRequired");
			validationFailureMessages.push("AddressMob is required");
		}
		if (_model.isAddressTelAvailable && _internal_AddressTel == null)
		{
			violatedConsts.push("AddressTelIsRequired");
			validationFailureMessages.push("AddressTel is required");
		}
		if (_model.isYoutubeVideoUrlAvailable && _internal_YoutubeVideoUrl == null)
		{
			violatedConsts.push("YoutubeVideoUrlIsRequired");
			validationFailureMessages.push("YoutubeVideoUrl is required");
		}
		if (_model.isAddressCountyAvailable && _internal_AddressCounty == null)
		{
			violatedConsts.push("AddressCountyIsRequired");
			validationFailureMessages.push("AddressCounty is required");
		}
		if (_model.isItemNameAvailable && _internal_ItemName == null)
		{
			violatedConsts.push("ItemNameIsRequired");
			validationFailureMessages.push("ItemName is required");
		}
		if (_model.isAddressNameAvailable && _internal_AddressName == null)
		{
			violatedConsts.push("AddressNameIsRequired");
			validationFailureMessages.push("AddressName is required");
		}
		if (_model.isCategoryAvailable && _internal_Category == null)
		{
			violatedConsts.push("CategoryIsRequired");
			validationFailureMessages.push("Category is required");
		}
		if (_model.isAddressStreetAvailable && _internal_AddressStreet == null)
		{
			violatedConsts.push("AddressStreetIsRequired");
			validationFailureMessages.push("AddressStreet is required");
		}
		if (_model.isItemDescAvailable && _internal_ItemDesc == null)
		{
			violatedConsts.push("ItemDescIsRequired");
			validationFailureMessages.push("ItemDesc is required");
		}
		if (_model.isGooglePostCodeAvailable && _internal_GooglePostCode == null)
		{
			violatedConsts.push("GooglePostCodeIsRequired");
			validationFailureMessages.push("GooglePostCode is required");
		}
		if (_model.isAddressPostCodeAvailable && _internal_AddressPostCode == null)
		{
			violatedConsts.push("AddressPostCodeIsRequired");
			validationFailureMessages.push("AddressPostCode is required");
		}

		var styleValidity:Boolean = true;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
    
        model_internal::_cacheInitialized_isValid = true;
        model_internal::invalidConstraints_der = violatedConsts;
        model_internal::validationFailureMessages_der = validationFailureMessages;
        return violatedConsts.length == 0 && styleValidity;
    }  

    /**
     * derived property setters
     */

    model_internal function set isValid_der(value:Boolean) : void
    {
       	var oldValue:Boolean = model_internal::_isValid;               
        if (oldValue !== value)
        {
        	model_internal::_isValid = value;
        	_model.model_internal::fireChangeEvent("isValid", oldValue, model_internal::_isValid);
        }        
    }

    /**
     * derived property getters
     */

    [Transient] 
	[Bindable(event="propertyChange")] 
    public function get _model() : _TblProductsEntityMetadata
    {
		return model_internal::_dminternal_model;              
    }	
    
    public function set _model(value : _TblProductsEntityMetadata) : void       
    {
    	var oldValue : _TblProductsEntityMetadata = model_internal::_dminternal_model;               
        if (oldValue !== value)
        {
        	model_internal::_dminternal_model = value;
        	this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "_model", oldValue, model_internal::_dminternal_model));
        }     
    }      

    /**
     * methods
     */  


    /**
     *  services
     */                  
     private var _managingService:IFiberManagingService;
    
     public function set managingService(managingService:IFiberManagingService):void
     {
         _managingService = managingService;
     }                      
     
    model_internal function set invalidConstraints_der(value:Array) : void
    {  
     	var oldValue:Array = model_internal::_invalidConstraints;
     	// avoid firing the event when old and new value are different empty arrays
        if (oldValue !== value && (oldValue.length > 0 || value.length > 0))
        {
            model_internal::_invalidConstraints = value;   
			_model.model_internal::fireChangeEvent("invalidConstraints", oldValue, model_internal::_invalidConstraints);   
        }     	             
    }             
    
     model_internal function set validationFailureMessages_der(value:Array) : void
    {  
     	var oldValue:Array = model_internal::_validationFailureMessages;
     	// avoid firing the event when old and new value are different empty arrays
        if (oldValue !== value && (oldValue.length > 0 || value.length > 0))
        {
            model_internal::_validationFailureMessages = value;   
			_model.model_internal::fireChangeEvent("validationFailureMessages", oldValue, model_internal::_validationFailureMessages);   
        }     	             
    }        
     
     // Individual isAvailable functions     
	// fields, getters, and setters for primitive representations of complex id properties

}

}
