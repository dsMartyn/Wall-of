
/**
 * This is a generated class and is not intended for modfication.  
 */
package valueObjects
{
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.styles.IStyle;
import com.adobe.fiber.styles.Style;
import com.adobe.fiber.styles.LocalizeableMessage;
import com.adobe.fiber.valueobjects.IModelType;
import com.adobe.fiber.valueobjects.IPropertyIterator;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;
import com.adobe.fiber.valueobjects.AbstractEntityMetadata;
import mx.events.PropertyChangeEvent;

use namespace model_internal;

[ExcludeClass]
internal class _ProductFieldsEntityMetadata extends AbstractEntityMetadata
{
	private static var emptyArray:Array = new Array();

    model_internal static var allProperties:Array = new Array("Panel2_Company_Description", "Clicks", "Panel2_CompanyName", "Panel3_Extended_Description", "Panel2_CompanyURL", "Keywords", "Friendly_Name", "Panel4_Description", "MemberID", "Panel1_LogoPic", "Panel2_Contact_Details", "RowID", "Panel4_Video_URL");
    model_internal static var allAssociationProperties:Array = new Array();
    model_internal static var allRequiredProperties:Array = new Array("Panel2_Company_Description", "Clicks", "Panel2_CompanyName", "Panel3_Extended_Description", "Panel2_CompanyURL", "Keywords", "Friendly_Name", "Panel4_Description", "MemberID", "Panel1_LogoPic", "Panel2_Contact_Details", "RowID", "Panel4_Video_URL");
    model_internal static var allAlwaysAvailableProperties:Array = new Array("Panel2_Company_Description", "Clicks", "Panel2_CompanyName", "Panel3_Extended_Description", "Panel2_CompanyURL", "Keywords", "Friendly_Name", "Panel4_Description", "MemberID", "Panel1_LogoPic", "Panel2_Contact_Details", "RowID", "Panel4_Video_URL");
    model_internal static var guardedProperties:Array = new Array();
    model_internal static var dataProperties:Array = new Array("Panel2_Company_Description", "Clicks", "Panel2_CompanyName", "Panel3_Extended_Description", "Panel2_CompanyURL", "Keywords", "Friendly_Name", "Panel4_Description", "MemberID", "Panel1_LogoPic", "Panel2_Contact_Details", "RowID", "Panel4_Video_URL");
    model_internal static var derivedProperties:Array = new Array();
    model_internal static var collectionProperties:Array = new Array();
    model_internal static var collectionBaseMap:Object;    
    model_internal static var entityName:String = "ProductFields";
    model_internal static var dependentsOnMap:Object;    
    model_internal static var dependedOnServices:Array =  new Array();
    
    
    model_internal var _instance:_Super_ProductFields;
    model_internal static var _nullStyle:Style = new Style();
    
    public function _ProductFieldsEntityMetadata(productFields : _Super_ProductFields)
    {
        // initialize property maps
        if (model_internal::dependentsOnMap == null)
        {
            // depenents map
            model_internal::dependentsOnMap = new Object();
            model_internal::dependentsOnMap["Panel2_Company_Description"] = new Array();
            model_internal::dependentsOnMap["Clicks"] = new Array();
            model_internal::dependentsOnMap["Panel2_CompanyName"] = new Array();
            model_internal::dependentsOnMap["Panel3_Extended_Description"] = new Array();
            model_internal::dependentsOnMap["Panel2_CompanyURL"] = new Array();
            model_internal::dependentsOnMap["Keywords"] = new Array();
            model_internal::dependentsOnMap["Friendly_Name"] = new Array();
            model_internal::dependentsOnMap["Panel4_Description"] = new Array();
            model_internal::dependentsOnMap["MemberID"] = new Array();
            model_internal::dependentsOnMap["Panel1_LogoPic"] = new Array();
            model_internal::dependentsOnMap["Panel2_Contact_Details"] = new Array();
            model_internal::dependentsOnMap["RowID"] = new Array();
            model_internal::dependentsOnMap["Panel4_Video_URL"] = new Array();
                        
            // collection base map
            model_internal::collectionBaseMap = new Object()
        }                        
        
        model_internal::_instance = productFields;     
    }
    
    override public function getEntityName():String
    {
        return model_internal::entityName;
    }    
    
    override public function getProperties():Array
    {
        return model_internal::allProperties;
    }
    
    override public function getAssociationProperties():Array
    {
        return model_internal::allAssociationProperties;
    }    
    
    override public function getRequiredProperties():Array
    {
         return model_internal::allRequiredProperties;   
    }
    
    override public function getDataProperties():Array
    {
        return model_internal::dataProperties;
    }    
    
    override public function getGuardedProperties():Array
    {
        return model_internal::guardedProperties;
    }     
    
    override public function getUnguardedProperties():Array
    {
        return model_internal::allAlwaysAvailableProperties;
    }        
    
    override public function getDependants(propertyName:String):Array
    {
       if (model_internal::dataProperties.indexOf(propertyName) == -1)
            throw new Error(propertyName + " is not a data property of entity ProductFields");  
            
       return model_internal::dependentsOnMap[propertyName] as Array;  
    }
    
    override public function getDependedOnServices():Array
    {
        return model_internal::dependedOnServices;
    }
    
    override public function getCollectionProperties():Array
    {
        return model_internal::collectionProperties;
    }
    
    override public function getCollectionBase(propertyName:String):String
    {
       if (model_internal::collectionProperties.indexOf(propertyName) == -1)
            throw new Error(propertyName + " is not a collection property of entity ProductFields");  
            
       return model_internal::collectionBaseMap[propertyName];
    }                
    
     override public function getAvailableProperties():IPropertyIterator
     {
     	return new AvailablePropertyIterator(this); 
     }  
     
     override public function getValue(propertyName:String):*    
     {
         if (model_internal::allProperties.indexOf(propertyName) == -1)
         {
         	throw new Error(propertyName + " does not exist for entity ProductFields");
         }     
           
         return model_internal::_instance[propertyName];
     }       
     
     override public function setValue(propertyName:String, value:*):void   
     {
         if (model_internal::dataProperties.indexOf(propertyName) == -1)
         {
              throw new Error(propertyName + " is not a data property of entity ProductFields");
         }  
                                                     
         model_internal::_instance[propertyName] = value;
     }     
     
     override public function getMappedByProperty(associationProperty:String):String
     {
        switch(associationProperty)
        {
            default:
            {
                return null;
            }
        }   
     }
     
     override public function getPropertyLength(propertyName:String):int
     {
        switch(propertyName)
        {
            default:
            {
                return 0;
            }
        }  
     }
     
     override public function isAvailable(propertyName:String):Boolean
     {         
         if (model_internal::allProperties.indexOf(propertyName) == -1)
         {
         	throw new Error(propertyName + " does not exist for entity ProductFields");
         }   
                
         if (model_internal::allAlwaysAvailableProperties.indexOf(propertyName) != -1)
         {
         	return true;
         }
         
         switch(propertyName)
         {
            default:
            {
                return true;
            }
         }                                  
     }  
     
     override public function getIdentityMap():Object
     {
         var returnMap:Object = new Object();
       
         return returnMap;
     }       
     
	 [Bindable(event="propertyChange")]
	 override public function get invalidConstraints():Array
     {
        if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
        {
            return model_internal::_instance.model_internal::_invalidConstraints;
        }
        else
        {
            // recalculate isValid
            model_internal::_instance.model_internal::_isValid = model_internal::_instance.model_internal::calculateIsValid();
            model_internal::_instance.model_internal::_cacheInitialized_isValid = true;
            return model_internal::_instance.model_internal::_invalidConstraints;        
        }        
     }       
     
	 [Bindable(event="propertyChange")]
	 override public function get validationFailureMessages():Array
     {
        if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
        {
            return model_internal::_instance.model_internal::_validationFailureMessages;
        }
        else
        {
            // recalculate isValid
            model_internal::_instance.model_internal::_isValid = model_internal::_instance.model_internal::calculateIsValid();
            model_internal::_instance.model_internal::_cacheInitialized_isValid = true;
            return model_internal::_instance.model_internal::_validationFailureMessages;        
        }        
     }       
     
     override public function getDependantInvalidConstraints(propertyName:String):Array
     {
        var dependants:Array = getDependants(propertyName);
        if (dependants.length == 0)
        {
            return emptyArray;
        }
        
        var currentlyInvalid:Array = invalidConstraints;
        if (currentlyInvalid.length == 0)
        {
            return emptyArray;
        }
            
        var filterFunc:Function = function(element:*, index:int, arr:Array):Boolean
        {
            return dependants.indexOf(element) > -1;     
        }                              
        
        return currentlyInvalid.filter(filterFunc);
     }      
     
    /**
     * isValid
     */
    [Bindable(event="propertyChange")] 
    public function get isValid() : Boolean
    {
        if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
        {
            return model_internal::_instance.model_internal::_isValid;
        }
        else
        {
            // recalculate isValid
            model_internal::_instance.model_internal::_isValid = model_internal::_instance.model_internal::calculateIsValid();
            return model_internal::_instance.model_internal::_isValid;        
        }
    }       
     
     [Bindable(event="propertyChange")] 
     public function get isPanel2_Company_DescriptionAvailable():Boolean
     {
        return true;
     }                       
                  
     [Bindable(event="propertyChange")] 
     public function get isClicksAvailable():Boolean
     {
        return true;
     }                       
                  
     [Bindable(event="propertyChange")] 
     public function get isPanel2_CompanyNameAvailable():Boolean
     {
        return true;
     }                       
                  
     [Bindable(event="propertyChange")] 
     public function get isPanel3_Extended_DescriptionAvailable():Boolean
     {
        return true;
     }                       
                  
     [Bindable(event="propertyChange")] 
     public function get isPanel2_CompanyURLAvailable():Boolean
     {
        return true;
     }                       
                  
     [Bindable(event="propertyChange")] 
     public function get isKeywordsAvailable():Boolean
     {
        return true;
     }                       
                  
     [Bindable(event="propertyChange")] 
     public function get isFriendly_NameAvailable():Boolean
     {
        return true;
     }                       
                  
     [Bindable(event="propertyChange")] 
     public function get isPanel4_DescriptionAvailable():Boolean
     {
        return true;
     }                       
                  
     [Bindable(event="propertyChange")] 
     public function get isMemberIDAvailable():Boolean
     {
        return true;
     }                       
                  
     [Bindable(event="propertyChange")] 
     public function get isPanel1_LogoPicAvailable():Boolean
     {
        return true;
     }                       
                  
     [Bindable(event="propertyChange")] 
     public function get isPanel2_Contact_DetailsAvailable():Boolean
     {
        return true;
     }                       
                  
     [Bindable(event="propertyChange")] 
     public function get isRowIDAvailable():Boolean
     {
        return true;
     }                       
                  
     [Bindable(event="propertyChange")] 
     public function get isPanel4_Video_URLAvailable():Boolean
     {
        return true;
     }                       
                  

    /**
     * derived property recalculation
     */

     model_internal function fireChangeEvent(propertyName:String, oldValue:Object, newValue:Object):void
     {
     	this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, propertyName, oldValue, newValue));
     }

    [Bindable(event="propertyChange")]   
    public function get Panel2_Company_DescriptionStyle():Style
    {
		return model_internal::_nullStyle;		
    }      
    
    [Bindable(event="propertyChange")]   
    public function get ClicksStyle():Style
    {
		return model_internal::_nullStyle;		
    }      
    
    [Bindable(event="propertyChange")]   
    public function get Panel2_CompanyNameStyle():Style
    {
		return model_internal::_nullStyle;		
    }      
    
    [Bindable(event="propertyChange")]   
    public function get Panel3_Extended_DescriptionStyle():Style
    {
		return model_internal::_nullStyle;		
    }      
    
    [Bindable(event="propertyChange")]   
    public function get Panel2_CompanyURLStyle():Style
    {
		return model_internal::_nullStyle;		
    }      
    
    [Bindable(event="propertyChange")]   
    public function get KeywordsStyle():Style
    {
		return model_internal::_nullStyle;		
    }      
    
    [Bindable(event="propertyChange")]   
    public function get Friendly_NameStyle():Style
    {
		return model_internal::_nullStyle;		
    }      
    
    [Bindable(event="propertyChange")]   
    public function get Panel4_DescriptionStyle():Style
    {
		return model_internal::_nullStyle;		
    }      
    
    [Bindable(event="propertyChange")]   
    public function get MemberIDStyle():Style
    {
		return model_internal::_nullStyle;		
    }      
    
    [Bindable(event="propertyChange")]   
    public function get Panel1_LogoPicStyle():Style
    {
		return model_internal::_nullStyle;		
    }      
    
    [Bindable(event="propertyChange")]   
    public function get Panel2_Contact_DetailsStyle():Style
    {
		return model_internal::_nullStyle;		
    }      
    
    [Bindable(event="propertyChange")]   
    public function get RowIDStyle():Style
    {
		return model_internal::_nullStyle;		
    }      
    
    [Bindable(event="propertyChange")]   
    public function get Panel4_Video_URLStyle():Style
    {
		return model_internal::_nullStyle;		
    }      
    

     /**
     * 
     * @inheritDoc 
     */ 
     override public function getStyle(propertyName:String):IStyle
     {
         switch(propertyName)
         {
            default:
            {
                return null;
            }
         }
     }
     
     /**
     * 
     * @inheritDoc 
     *  
     */  
     override public function getPropertyValidationFailureMessages(propertyName:String):Array
     {
         switch(propertyName)
         {
            default:
            {
                return emptyArray;
            }
         }
     }
    
}

}
