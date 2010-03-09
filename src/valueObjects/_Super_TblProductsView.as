/**
 * This is a generated class and is not intended for modfication.  To customize behavior
 * of this value object you may modify the generated sub-class of this class - TblProductsView.as.
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
public class _Super_TblProductsView extends EventDispatcher implements IValueObject
{
    model_internal static function initRemoteClassAliasSingle(cz:Class) : void 
    {
     }   
     
    model_internal static function initRemoteClassAliasAllRelated() : void 
    {     
    }

	model_internal var _dminternal_model : _TblProductsViewEntityMetadata;

	/**
	 * properties
	 */
	private var _internal_Map : Boolean;
	private var _internal_Image : Boolean;
	private var _internal_Clicks : int;
	private var _internal_RowID : int;
	private var _internal_Keywords : int;
	private var _internal_YouTube : Boolean;
	private var _internal_Category : String;
	private var _internal_Name : String;
	private var _internal_count : int;

    private static var emptyArray:Array = new Array();

    /**
     * derived property cache initialization
     */  
    model_internal var _cacheInitialized_isValid:Boolean = false;   
    
	model_internal var _changeWatcherArray:Array = new Array();   

	public function _Super_TblProductsView() 
	{	
		_model = new _TblProductsViewEntityMetadata(this);
	
		// Bind to own data properties for cache invalidation triggering  
       
	}

    /**
     * data property getters
     */
	[Bindable(event="propertyChange")] 
    public function get Map() : Boolean    
    {
            return _internal_Map;
    }    
	[Bindable(event="propertyChange")] 
    public function get Image() : Boolean    
    {
            return _internal_Image;
    }    
	[Bindable(event="propertyChange")] 
    public function get Clicks() : int    
    {
            return _internal_Clicks;
    }    
	[Bindable(event="propertyChange")] 
    public function get RowID() : int    
    {
            return _internal_RowID;
    }    
	[Bindable(event="propertyChange")] 
    public function get Keywords() : int    
    {
            return _internal_Keywords;
    }    
	[Bindable(event="propertyChange")] 
    public function get YouTube() : Boolean    
    {
            return _internal_YouTube;
    }    
	[Bindable(event="propertyChange")] 
    public function get Category() : String    
    {
            return _internal_Category;
    }    
	[Bindable(event="propertyChange")] 
    public function get Name() : String    
    {
            return _internal_Name;
    }    
	[Bindable(event="propertyChange")] 
    public function get count() : int    
    {
            return _internal_count;
    }    

    /**
     * data property setters
     */      
    public function set Map(value:Boolean) : void 
    {    	
        var recalcValid:Boolean = false;
    	
    	
    	var oldValue:Boolean = _internal_Map;               
        if (oldValue !== value)
        {
        	_internal_Map = value;
        	this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "Map", oldValue, _internal_Map));
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
    public function set Image(value:Boolean) : void 
    {    	
        var recalcValid:Boolean = false;
    	
    	
    	var oldValue:Boolean = _internal_Image;               
        if (oldValue !== value)
        {
        	_internal_Image = value;
        	this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "Image", oldValue, _internal_Image));
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
    public function set Keywords(value:int) : void 
    {    	
        var recalcValid:Boolean = false;
    	
    	
    	var oldValue:int = _internal_Keywords;               
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
    public function set YouTube(value:Boolean) : void 
    {    	
        var recalcValid:Boolean = false;
    	
    	
    	var oldValue:Boolean = _internal_YouTube;               
        if (oldValue !== value)
        {
        	_internal_YouTube = value;
        	this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "YouTube", oldValue, _internal_YouTube));
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
        	this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "Category", oldValue, _internal_Category));
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
    public function set Name(value:String) : void 
    {    	
        var recalcValid:Boolean = false;
    	if (value == null || _internal_Name == null)
    	{
    		recalcValid = true;
    	}	
    	
    	
    	var oldValue:String = _internal_Name;               
        if (oldValue !== value)
        {
        	_internal_Name = value;
        	this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "Name", oldValue, _internal_Name));
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
    public function set count(value:int) : void 
    {    	
        var recalcValid:Boolean = false;
    	
    	
    	var oldValue:int = _internal_count;               
        if (oldValue !== value)
        {
        	_internal_count = value;
        	this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "count", oldValue, _internal_count));
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

		if (_model.isCategoryAvailable && _internal_Category == null)
		{
			violatedConsts.push("CategoryIsRequired");
			validationFailureMessages.push("Category is required");
		}
		if (_model.isNameAvailable && _internal_Name == null)
		{
			violatedConsts.push("NameIsRequired");
			validationFailureMessages.push("Name is required");
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
    public function get _model() : _TblProductsViewEntityMetadata
    {
		return model_internal::_dminternal_model;              
    }	
    
    public function set _model(value : _TblProductsViewEntityMetadata) : void       
    {
    	var oldValue : _TblProductsViewEntityMetadata = model_internal::_dminternal_model;               
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
