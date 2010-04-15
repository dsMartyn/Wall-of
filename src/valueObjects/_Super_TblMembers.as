/**
 * This is a generated class and is not intended for modfication.  To customize behavior
 * of this value object you may modify the generated sub-class of this class - TblMembers.as.
 */

package valueObjects
{
import com.adobe.fiber.services.IFiberManagingService;
import com.adobe.fiber.valueobjects.IValueObject;
import flash.events.Event;
import flash.events.EventDispatcher;
import mx.events.PropertyChangeEvent;

import flash.net.registerClassAlias;
import flash.net.getClassByAlias;
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.valueobjects.IPropertyIterator;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;

use namespace model_internal;

[Managed]
[ExcludeClass]
public class _Super_TblMembers extends flash.events.EventDispatcher implements com.adobe.fiber.valueobjects.IValueObject
{
    model_internal static function initRemoteClassAliasSingle(cz:Class) : void 
    {
    }   
     
    model_internal static function initRemoteClassAliasAllRelated() : void 
    {
    }

	model_internal var _dminternal_model : _TblMembersEntityMetadata;

	/**
	 * properties
	 */
	private var _internal_RowID : int;
	private var _internal_UserName : String;
	private var _internal_Password : String;
	private var _internal_FirstName : String;
	private var _internal_LastName : String;
	private var _internal_DOB : String;
	private var _internal_ContactNumber : String;
	private var _internal_StartDate : String;

    private static var emptyArray:Array = new Array();

    /**
     * derived property cache initialization
     */  
    model_internal var _cacheInitialized_isValid:Boolean = false;   
    
	model_internal var _changeWatcherArray:Array = new Array();   

	public function _Super_TblMembers() 
	{	
		_model = new _TblMembersEntityMetadata(this);
	
		// Bind to own data properties for cache invalidation triggering  
       
	}

    /**
     * data property getters
     */
	[Bindable(event="propertyChange")] 
    public function get RowID() : int    
    {
            return _internal_RowID;
    }    
	[Bindable(event="propertyChange")] 
    public function get UserName() : String    
    {
            return _internal_UserName;
    }    
	[Bindable(event="propertyChange")] 
    public function get Password() : String    
    {
            return _internal_Password;
    }    
	[Bindable(event="propertyChange")] 
    public function get FirstName() : String    
    {
            return _internal_FirstName;
    }    
	[Bindable(event="propertyChange")] 
    public function get LastName() : String    
    {
            return _internal_LastName;
    }    
	[Bindable(event="propertyChange")] 
    public function get DOB() : String    
    {
            return _internal_DOB;
    }    
	[Bindable(event="propertyChange")] 
    public function get ContactNumber() : String    
    {
            return _internal_ContactNumber;
    }    
	[Bindable(event="propertyChange")] 
    public function get StartDate() : String    
    {
            return _internal_StartDate;
    }    

    /**
     * data property setters
     */      
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
    public function set UserName(value:String) : void 
    {    	
        var recalcValid:Boolean = false;
    	if (value == null || _internal_UserName == null)
    	{
    		recalcValid = true;
    	}	
    	
    	
    	var oldValue:String = _internal_UserName;               
        if (oldValue !== value)
        {
            _internal_UserName = value;
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
    public function set Password(value:String) : void 
    {    	
        var recalcValid:Boolean = false;
    	if (value == null || _internal_Password == null)
    	{
    		recalcValid = true;
    	}	
    	
    	
    	var oldValue:String = _internal_Password;               
        if (oldValue !== value)
        {
            _internal_Password = value;
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
    public function set FirstName(value:String) : void 
    {    	
        var recalcValid:Boolean = false;
    	if (value == null || _internal_FirstName == null)
    	{
    		recalcValid = true;
    	}	
    	
    	
    	var oldValue:String = _internal_FirstName;               
        if (oldValue !== value)
        {
            _internal_FirstName = value;
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
    public function set LastName(value:String) : void 
    {    	
        var recalcValid:Boolean = false;
    	if (value == null || _internal_LastName == null)
    	{
    		recalcValid = true;
    	}	
    	
    	
    	var oldValue:String = _internal_LastName;               
        if (oldValue !== value)
        {
            _internal_LastName = value;
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
    public function set DOB(value:String) : void 
    {    	
        var recalcValid:Boolean = false;
    	if (value == null || _internal_DOB == null)
    	{
    		recalcValid = true;
    	}	
    	
    	
    	var oldValue:String = _internal_DOB;               
        if (oldValue !== value)
        {
            _internal_DOB = value;
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
    public function set ContactNumber(value:String) : void 
    {    	
        var recalcValid:Boolean = false;
    	if (value == null || _internal_ContactNumber == null)
    	{
    		recalcValid = true;
    	}	
    	
    	
    	var oldValue:String = _internal_ContactNumber;               
        if (oldValue !== value)
        {
            _internal_ContactNumber = value;
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
    public function set StartDate(value:String) : void 
    {    	
        var recalcValid:Boolean = false;
    	if (value == null || _internal_StartDate == null)
    	{
    		recalcValid = true;
    	}	
    	
    	
    	var oldValue:String = _internal_StartDate;               
        if (oldValue !== value)
        {
            _internal_StartDate = value;
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    

    /**
     * data property setter listeners
     */   

   model_internal function setterListenerAnyConstraint(value:flash.events.Event):void
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

		if (_model.isUserNameAvailable && _internal_UserName == null)
		{
			violatedConsts.push("UserNameIsRequired");
			validationFailureMessages.push("UserName is required");
		}
		if (_model.isPasswordAvailable && _internal_Password == null)
		{
			violatedConsts.push("PasswordIsRequired");
			validationFailureMessages.push("Password is required");
		}
		if (_model.isFirstNameAvailable && _internal_FirstName == null)
		{
			violatedConsts.push("FirstNameIsRequired");
			validationFailureMessages.push("FirstName is required");
		}
		if (_model.isLastNameAvailable && _internal_LastName == null)
		{
			violatedConsts.push("LastNameIsRequired");
			validationFailureMessages.push("LastName is required");
		}
		if (_model.isDOBAvailable && _internal_DOB == null)
		{
			violatedConsts.push("DOBIsRequired");
			validationFailureMessages.push("DOB is required");
		}
		if (_model.isContactNumberAvailable && _internal_ContactNumber == null)
		{
			violatedConsts.push("ContactNumberIsRequired");
			validationFailureMessages.push("ContactNumber is required");
		}
		if (_model.isStartDateAvailable && _internal_StartDate == null)
		{
			violatedConsts.push("StartDateIsRequired");
			validationFailureMessages.push("StartDate is required");
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
    public function get _model() : _TblMembersEntityMetadata
    {
		return model_internal::_dminternal_model;              
    }	
    
    public function set _model(value : _TblMembersEntityMetadata) : void       
    {
    	var oldValue : _TblMembersEntityMetadata = model_internal::_dminternal_model;               
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
     private var _managingService:com.adobe.fiber.services.IFiberManagingService;
    
     public function set managingService(managingService:com.adobe.fiber.services.IFiberManagingService):void
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
