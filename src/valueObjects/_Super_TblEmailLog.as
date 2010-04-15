/**
 * This is a generated class and is not intended for modfication.  To customize behavior
 * of this value object you may modify the generated sub-class of this class - TblEmailLog.as.
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
public class _Super_TblEmailLog extends flash.events.EventDispatcher implements com.adobe.fiber.valueobjects.IValueObject
{
    model_internal static function initRemoteClassAliasSingle(cz:Class) : void 
    {
    }   
     
    model_internal static function initRemoteClassAliasAllRelated() : void 
    {
    }

	model_internal var _dminternal_model : _TblEmailLogEntityMetadata;

	/**
	 * properties
	 */
	private var _internal_RowID : int;
	private var _internal_To : String;
	private var _internal_From : String;
	private var _internal_Subject : String;
	private var _internal_Body : String;
	private var _internal_Headers : String;
	private var _internal_MemberID : int;

    private static var emptyArray:Array = new Array();

    /**
     * derived property cache initialization
     */  
    model_internal var _cacheInitialized_isValid:Boolean = false;   
    
	model_internal var _changeWatcherArray:Array = new Array();   

	public function _Super_TblEmailLog() 
	{	
		_model = new _TblEmailLogEntityMetadata(this);
	
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
    public function get To() : String    
    {
            return _internal_To;
    }    
	[Bindable(event="propertyChange")] 
    public function get From() : String    
    {
            return _internal_From;
    }    
	[Bindable(event="propertyChange")] 
    public function get Subject() : String    
    {
            return _internal_Subject;
    }    
	[Bindable(event="propertyChange")] 
    public function get Body() : String    
    {
            return _internal_Body;
    }    
	[Bindable(event="propertyChange")] 
    public function get Headers() : String    
    {
            return _internal_Headers;
    }    
	[Bindable(event="propertyChange")] 
    public function get MemberID() : int    
    {
            return _internal_MemberID;
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
    public function set To(value:String) : void 
    {    	
        var recalcValid:Boolean = false;
    	if (value == null || _internal_To == null)
    	{
    		recalcValid = true;
    	}	
    	
    	
    	var oldValue:String = _internal_To;               
        if (oldValue !== value)
        {
            _internal_To = value;
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
    public function set From(value:String) : void 
    {    	
        var recalcValid:Boolean = false;
    	if (value == null || _internal_From == null)
    	{
    		recalcValid = true;
    	}	
    	
    	
    	var oldValue:String = _internal_From;               
        if (oldValue !== value)
        {
            _internal_From = value;
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
    public function set Subject(value:String) : void 
    {    	
        var recalcValid:Boolean = false;
    	if (value == null || _internal_Subject == null)
    	{
    		recalcValid = true;
    	}	
    	
    	
    	var oldValue:String = _internal_Subject;               
        if (oldValue !== value)
        {
            _internal_Subject = value;
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
    public function set Body(value:String) : void 
    {    	
        var recalcValid:Boolean = false;
    	if (value == null || _internal_Body == null)
    	{
    		recalcValid = true;
    	}	
    	
    	
    	var oldValue:String = _internal_Body;               
        if (oldValue !== value)
        {
            _internal_Body = value;
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
    public function set Headers(value:String) : void 
    {    	
        var recalcValid:Boolean = false;
    	if (value == null || _internal_Headers == null)
    	{
    		recalcValid = true;
    	}	
    	
    	
    	var oldValue:String = _internal_Headers;               
        if (oldValue !== value)
        {
            _internal_Headers = value;
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

		if (_model.isToAvailable && _internal_To == null)
		{
			violatedConsts.push("ToIsRequired");
			validationFailureMessages.push("To is required");
		}
		if (_model.isFromAvailable && _internal_From == null)
		{
			violatedConsts.push("FromIsRequired");
			validationFailureMessages.push("From is required");
		}
		if (_model.isSubjectAvailable && _internal_Subject == null)
		{
			violatedConsts.push("SubjectIsRequired");
			validationFailureMessages.push("Subject is required");
		}
		if (_model.isBodyAvailable && _internal_Body == null)
		{
			violatedConsts.push("BodyIsRequired");
			validationFailureMessages.push("Body is required");
		}
		if (_model.isHeadersAvailable && _internal_Headers == null)
		{
			violatedConsts.push("HeadersIsRequired");
			validationFailureMessages.push("Headers is required");
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
    public function get _model() : _TblEmailLogEntityMetadata
    {
		return model_internal::_dminternal_model;              
    }	
    
    public function set _model(value : _TblEmailLogEntityMetadata) : void       
    {
    	var oldValue : _TblEmailLogEntityMetadata = model_internal::_dminternal_model;               
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
