/**
 * This is a generated class and is not intended for modfication.  To customize behavior
 * of this value object you may modify the generated sub-class of this class - ProductFields.as.
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

[ExcludeClass]
public class _Super_ProductFields extends EventDispatcher implements IValueObject
{
    model_internal static function initRemoteClassAliasSingle(cz:Class) : void 
    {
     }   
     
    model_internal static function initRemoteClassAliasAllRelated() : void 
    {     
    }

	model_internal var _dminternal_model : _ProductFieldsEntityMetadata;

	/**
	 * properties
	 */
	private var _internal_Panel2_Company_Description : String;
	private var _internal_Clicks : int;
	private var _internal_Panel2_CompanyName : String;
	private var _internal_Panel3_Extended_Description : String;
	private var _internal_Panel2_CompanyURL : String;
	private var _internal_Keywords : String;
	private var _internal_Friendly_Name : String;
	private var _internal_Panel4_Description : String;
	private var _internal_MemberID : int;
	private var _internal_Panel1_LogoPic : String;
	private var _internal_Panel2_Contact_Details : String;
	private var _internal_RowID : int;
	private var _internal_Panel4_Video_URL : String;

    private static var emptyArray:Array = new Array();

    /**
     * derived property cache initialization
     */  
    model_internal var _cacheInitialized_isValid:Boolean = false;   
    
	model_internal var _changeWatcherArray:Array = new Array();   

	public function _Super_ProductFields() 
	{	
		_model = new _ProductFieldsEntityMetadata(this);
	
		// Bind to own data properties for cache invalidation triggering  
       
	}

    /**
     * data property getters
     */
	[Bindable(event="propertyChange")] 
    public function get Panel2_Company_Description() : String    
    {
            return _internal_Panel2_Company_Description;
    }    
	[Bindable(event="propertyChange")] 
    public function get Clicks() : int    
    {
            return _internal_Clicks;
    }    
	[Bindable(event="propertyChange")] 
    public function get Panel2_CompanyName() : String    
    {
            return _internal_Panel2_CompanyName;
    }    
	[Bindable(event="propertyChange")] 
    public function get Panel3_Extended_Description() : String    
    {
            return _internal_Panel3_Extended_Description;
    }    
	[Bindable(event="propertyChange")] 
    public function get Panel2_CompanyURL() : String    
    {
            return _internal_Panel2_CompanyURL;
    }    
	[Bindable(event="propertyChange")] 
    public function get Keywords() : String    
    {
            return _internal_Keywords;
    }    
	[Bindable(event="propertyChange")] 
    public function get Friendly_Name() : String    
    {
            return _internal_Friendly_Name;
    }    
	[Bindable(event="propertyChange")] 
    public function get Panel4_Description() : String    
    {
            return _internal_Panel4_Description;
    }    
	[Bindable(event="propertyChange")] 
    public function get MemberID() : int    
    {
            return _internal_MemberID;
    }    
	[Bindable(event="propertyChange")] 
    public function get Panel1_LogoPic() : String    
    {
            return _internal_Panel1_LogoPic;
    }    
	[Bindable(event="propertyChange")] 
    public function get Panel2_Contact_Details() : String    
    {
            return _internal_Panel2_Contact_Details;
    }    
	[Bindable(event="propertyChange")] 
    public function get RowID() : int    
    {
            return _internal_RowID;
    }    
	[Bindable(event="propertyChange")] 
    public function get Panel4_Video_URL() : String    
    {
            return _internal_Panel4_Video_URL;
    }    

    /**
     * data property setters
     */      
    public function set Panel2_Company_Description(value:String) : void 
    {    	
        var recalcValid:Boolean = false;
    	if (value == null || _internal_Panel2_Company_Description == null)
    	{
    		recalcValid = true;
    	}	
    	
    	
    	var oldValue:String = _internal_Panel2_Company_Description;               
        if (oldValue !== value)
        {
        	_internal_Panel2_Company_Description = value;
        	this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "Panel2_Company_Description", oldValue, _internal_Panel2_Company_Description));
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
    public function set Clicks(value:int) : void 
    {    	
        var recalcValid:Boolean = false;
    	
    	
    	var oldValue:int = _internal_Clicks;               
        if (oldValue !== value)
        {
        	_internal_Clicks = value;
        	this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "Clicks", oldValue, _internal_Clicks));
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
    public function set Panel2_CompanyName(value:String) : void 
    {    	
        var recalcValid:Boolean = false;
    	if (value == null || _internal_Panel2_CompanyName == null)
    	{
    		recalcValid = true;
    	}	
    	
    	
    	var oldValue:String = _internal_Panel2_CompanyName;               
        if (oldValue !== value)
        {
        	_internal_Panel2_CompanyName = value;
        	this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "Panel2_CompanyName", oldValue, _internal_Panel2_CompanyName));
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
    public function set Panel3_Extended_Description(value:String) : void 
    {    	
        var recalcValid:Boolean = false;
    	if (value == null || _internal_Panel3_Extended_Description == null)
    	{
    		recalcValid = true;
    	}	
    	
    	
    	var oldValue:String = _internal_Panel3_Extended_Description;               
        if (oldValue !== value)
        {
        	_internal_Panel3_Extended_Description = value;
        	this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "Panel3_Extended_Description", oldValue, _internal_Panel3_Extended_Description));
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
    public function set Panel2_CompanyURL(value:String) : void 
    {    	
        var recalcValid:Boolean = false;
    	if (value == null || _internal_Panel2_CompanyURL == null)
    	{
    		recalcValid = true;
    	}	
    	
    	
    	var oldValue:String = _internal_Panel2_CompanyURL;               
        if (oldValue !== value)
        {
        	_internal_Panel2_CompanyURL = value;
        	this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "Panel2_CompanyURL", oldValue, _internal_Panel2_CompanyURL));
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
    public function set Keywords(value:String) : void 
    {    	
        var recalcValid:Boolean = false;
    	if (value == null || _internal_Keywords == null)
    	{
    		recalcValid = true;
    	}	
    	
    	
    	var oldValue:String = _internal_Keywords;               
        if (oldValue !== value)
        {
        	_internal_Keywords = value;
        	this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "Keywords", oldValue, _internal_Keywords));
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
    public function set Friendly_Name(value:String) : void 
    {    	
        var recalcValid:Boolean = false;
    	if (value == null || _internal_Friendly_Name == null)
    	{
    		recalcValid = true;
    	}	
    	
    	
    	var oldValue:String = _internal_Friendly_Name;               
        if (oldValue !== value)
        {
        	_internal_Friendly_Name = value;
        	this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "Friendly_Name", oldValue, _internal_Friendly_Name));
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
    public function set Panel4_Description(value:String) : void 
    {    	
        var recalcValid:Boolean = false;
    	if (value == null || _internal_Panel4_Description == null)
    	{
    		recalcValid = true;
    	}	
    	
    	
    	var oldValue:String = _internal_Panel4_Description;               
        if (oldValue !== value)
        {
        	_internal_Panel4_Description = value;
        	this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "Panel4_Description", oldValue, _internal_Panel4_Description));
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
        	this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "MemberID", oldValue, _internal_MemberID));
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
    public function set Panel1_LogoPic(value:String) : void 
    {    	
        var recalcValid:Boolean = false;
    	if (value == null || _internal_Panel1_LogoPic == null)
    	{
    		recalcValid = true;
    	}	
    	
    	
    	var oldValue:String = _internal_Panel1_LogoPic;               
        if (oldValue !== value)
        {
        	_internal_Panel1_LogoPic = value;
        	this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "Panel1_LogoPic", oldValue, _internal_Panel1_LogoPic));
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
    public function set Panel2_Contact_Details(value:String) : void 
    {    	
        var recalcValid:Boolean = false;
    	if (value == null || _internal_Panel2_Contact_Details == null)
    	{
    		recalcValid = true;
    	}	
    	
    	
    	var oldValue:String = _internal_Panel2_Contact_Details;               
        if (oldValue !== value)
        {
        	_internal_Panel2_Contact_Details = value;
        	this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "Panel2_Contact_Details", oldValue, _internal_Panel2_Contact_Details));
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
        	this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "RowID", oldValue, _internal_RowID));
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
    public function set Panel4_Video_URL(value:String) : void 
    {    	
        var recalcValid:Boolean = false;
    	if (value == null || _internal_Panel4_Video_URL == null)
    	{
    		recalcValid = true;
    	}	
    	
    	
    	var oldValue:String = _internal_Panel4_Video_URL;               
        if (oldValue !== value)
        {
        	_internal_Panel4_Video_URL = value;
        	this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "Panel4_Video_URL", oldValue, _internal_Panel4_Video_URL));
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

		if (_model.isPanel2_Company_DescriptionAvailable && _internal_Panel2_Company_Description == null)
		{
			violatedConsts.push("Panel2_Company_DescriptionIsRequired");
			validationFailureMessages.push("Panel2_Company_Description is required");
		}
		if (_model.isPanel2_CompanyNameAvailable && _internal_Panel2_CompanyName == null)
		{
			violatedConsts.push("Panel2_CompanyNameIsRequired");
			validationFailureMessages.push("Panel2_CompanyName is required");
		}
		if (_model.isPanel3_Extended_DescriptionAvailable && _internal_Panel3_Extended_Description == null)
		{
			violatedConsts.push("Panel3_Extended_DescriptionIsRequired");
			validationFailureMessages.push("Panel3_Extended_Description is required");
		}
		if (_model.isPanel2_CompanyURLAvailable && _internal_Panel2_CompanyURL == null)
		{
			violatedConsts.push("Panel2_CompanyURLIsRequired");
			validationFailureMessages.push("Panel2_CompanyURL is required");
		}
		if (_model.isKeywordsAvailable && _internal_Keywords == null)
		{
			violatedConsts.push("KeywordsIsRequired");
			validationFailureMessages.push("Keywords is required");
		}
		if (_model.isFriendly_NameAvailable && _internal_Friendly_Name == null)
		{
			violatedConsts.push("Friendly_NameIsRequired");
			validationFailureMessages.push("Friendly_Name is required");
		}
		if (_model.isPanel4_DescriptionAvailable && _internal_Panel4_Description == null)
		{
			violatedConsts.push("Panel4_DescriptionIsRequired");
			validationFailureMessages.push("Panel4_Description is required");
		}
		if (_model.isPanel1_LogoPicAvailable && _internal_Panel1_LogoPic == null)
		{
			violatedConsts.push("Panel1_LogoPicIsRequired");
			validationFailureMessages.push("Panel1_LogoPic is required");
		}
		if (_model.isPanel2_Contact_DetailsAvailable && _internal_Panel2_Contact_Details == null)
		{
			violatedConsts.push("Panel2_Contact_DetailsIsRequired");
			validationFailureMessages.push("Panel2_Contact_Details is required");
		}
		if (_model.isPanel4_Video_URLAvailable && _internal_Panel4_Video_URL == null)
		{
			violatedConsts.push("Panel4_Video_URLIsRequired");
			validationFailureMessages.push("Panel4_Video_URL is required");
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
    public function get _model() : _ProductFieldsEntityMetadata
    {
		return model_internal::_dminternal_model;              
    }	
    
    public function set _model(value : _ProductFieldsEntityMetadata) : void       
    {
    	var oldValue : _ProductFieldsEntityMetadata = model_internal::_dminternal_model;               
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
