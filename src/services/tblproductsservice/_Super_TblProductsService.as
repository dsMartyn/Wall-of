/**
 * This is a generated class and is not intended for modfication.  To customize behavior
 * of this service wrapper you may modify the generated sub-class of this class - TblProductsService.as.
 */
package services.tblproductsservice
{
import mx.rpc.AsyncToken;
import com.adobe.fiber.core.model_internal;
import mx.rpc.AbstractOperation;
import valueObjects.SearchFields;
import valueObjects.TblProducts;
import valueObjects.TblProductsView;
import mx.data.RPCDataManager;
import mx.data.ManagedOperation;
import mx.data.ManagedAssociation;
import mx.data.ManagedQuery;
import mx.data.ItemReference;
import mx.collections.ItemResponder;
import mx.rpc.remoting.RemoteObject; 
import mx.rpc.remoting.Operation;
import com.adobe.fiber.services.wrapper.RemoteObjectServiceWrapper;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;
import com.adobe.serializers.utility.TypeUtility;

[ExcludeClass]
internal class _Super_TblProductsService extends RemoteObjectServiceWrapper
{      
    private var _tblProductsRPCDataManager : RPCDataManager;         
    private var managersArray : Array = new Array();
        
    public const DATA_MANAGER_TBLPRODUCTS : String = "TblProducts";         
        
    public function getDataManager(dataManagerName:String) : RPCDataManager
    {
        switch (dataManagerName)
        {
             case (DATA_MANAGER_TBLPRODUCTS):
                return _tblProductsRPCDataManager;      
            default:
                return null;
        }
    }
    
    /**
     * Commit all of the pending changes for this DataService, as well as all of the pending changes of all DataServices
     * sharing the same DataStore.  By default, a DataService shares the same DataStore with other DataServices if they have 
     * managed association properties and share the same set of channels. 
     *
     * @see mx.data.DataManager
     * @see mx.data.DataStore
     *
     * @param itemsOrCollections:Array This is an optional parameter which defaults to null when
     *  you want to commit all pending changes.  If you want to commit a subset of the pending
     *  changes use this argument to specify a list of managed ListCollectionView instances
     *  and/or managed items.  ListCollectionView objects are most typically ArrayCollections
     *  you have provided to your fill method.  The items appropriate for this method are
     *  any managed version of the item.  These are any items you retrieve from getItem, createItem
     *  or using the getItemAt method from a managed collection.  Only changes for the
     *  items defined by any of the values in this array will be committed.
     *
     * @param cascadeCommit if true, also commit changes made to any associated
     *  items supplied in this list.
     *
     *  @return AsyncToken that is returned in <code>call</code> property of
     *  either the <code>ResultEvent.RESULT</code> or in the
     *  <code>FaultEvent.FAULT</code>.
     *  Custom data can be attached to this object and inspected later
     *  during the event handling phase.  If no changes have been made
     *  to the relevant items, null is returned instead of an AsyncToken.
     */
    public function commit(itemsOrCollections:Array=null, cascadeCommit:Boolean=false):AsyncToken
    {
    	return _tblProductsRPCDataManager.dataStore.commit(itemsOrCollections, cascadeCommit);
    }
    
    /**
     *  Reverts all pending (uncommitted) changes for this DataService, as well as all of the pending changes of all DataServics
     *  sharing the same DataStore.  By default, a DataService shares the same DataStore with other DataServices if they have 
     * managed association properties and share the same set of channels. 
     *
     * @see mx.data.DataManager
     * @see mx.data.DataStore
     *
     *  @return true if any changes were reverted.
     *  
     */
    public function revertChanges():Boolean
    {
        return _tblProductsRPCDataManager.dataStore.revertChanges();
    }    
       
    // Constructor
    public function _Super_TblProductsService()
    {
        // initialize service control
        _serviceControl = new RemoteObject(); 
        
        var operations:Object = new Object();
        var operation:Operation;         
         
        operation = new Operation(null, "getTblProductsByID");
		 operation.resultType = valueObjects.TblProducts; 		 
        operations["getTblProductsByID"] = operation;
         
     valueObjects.TblProducts._initRemoteClassAlias();
        operation = new Operation(null, "createTblProducts");
		 operation.resultType = int; 		 
        operations["createTblProducts"] = operation;
         
        operation = new Operation(null, "updateTblProducts");
        operations["updateTblProducts"] = operation;
         
        operation = new Operation(null, "deleteTblProducts");
        operations["deleteTblProducts"] = operation;
         
        operation = new Operation(null, "ParseEmbedded");
		 operation.resultType = String; 		 
        operations["ParseEmbedded"] = operation;
         
        operation = new Operation(null, "getProductsByIDList");
		 operation.resultElementType = valueObjects.TblProducts;
        operations["getProductsByIDList"] = operation;
         
     valueObjects.TblProducts._initRemoteClassAlias();
        operation = new Operation(null, "addKeywords");
        operations["addKeywords"] = operation;
         
        operation = new Operation(null, "countAllProducts");
		 operation.resultType = int; 		 
        operations["countAllProducts"] = operation;
         
        operation = new Operation(null, "getAllProductsPaged");
		 operation.resultElementType = valueObjects.TblProducts;
        operations["getAllProductsPaged"] = operation;
         
     valueObjects.TblProducts._initRemoteClassAlias();
        operation = new Operation(null, "countProductsByIDList");
		 operation.resultType = int; 		 
        operations["countProductsByIDList"] = operation;
         
        operation = new Operation(null, "search");
		 operation.resultElementType = valueObjects.SearchFields;
        operations["search"] = operation;
         
     valueObjects.SearchFields._initRemoteClassAlias();
        operation = new Operation(null, "GetProductsForUserPaged");
		 operation.resultElementType = valueObjects.TblProductsView;
        operations["GetProductsForUserPaged"] = operation;
         
     valueObjects.TblProductsView._initRemoteClassAlias();
        operation = new Operation(null, "countAllProductsMemberID");
		 operation.resultType = Object; 		 
        operations["countAllProductsMemberID"] = operation;
         
    
        _serviceControl.operations = operations;   
		_serviceControl.convertResultHandler = TypeUtility.convertResultHandler;
        _serviceControl.source = "TblProductsService";
        _serviceControl.endpoint = "gateway.php";
		_serviceControl.destination = "TblProductsService";
        
        var managedAssociation : ManagedAssociation;
    	var managedAssocsArray : Array;
        // initialize TblProducts data manager     
        _tblProductsRPCDataManager = new RPCDataManager();        
        managersArray.push(_tblProductsRPCDataManager);
        
        managedAssocsArray = new Array();
        
        _tblProductsRPCDataManager.destination = "tblProductsRPCDataManager";
        _tblProductsRPCDataManager.service = _serviceControl;        
        _tblProductsRPCDataManager.identities =  "RowID";      
        _tblProductsRPCDataManager.itemClass = valueObjects.TblProducts; 
        
                   
    
        var dmOperation : ManagedOperation;
        var dmQuery : ManagedQuery;
         
        dmOperation = new ManagedOperation("getTblProductsByID", "get");
        dmOperation.parameters = "RowID";
        _tblProductsRPCDataManager.addManagedOperation(dmOperation);     
            
        dmQuery = new ManagedQuery("getProductsByIDList");
        dmQuery.propertySpecifier = "picUrl,CompanyDesc,CompanyName,AddressTown,Image,AddressEmail,status,AddressFax,AddressMob,AddressTel,YoutubeVideoUrl,AddressCounty,ItemName,AddressName,MemberID,RowID,ImageID,AddressStreet,ItemDesc,GooglePostCode,AddressPostCode";
        dmQuery.parameters = "searchStr,startIndex,numItems";
        _tblProductsRPCDataManager.addManagedOperation(dmQuery);                 

        dmOperation = new ManagedOperation("updateTblProducts", "update");
        dmOperation.parameters = "item";
        _tblProductsRPCDataManager.addManagedOperation(dmOperation);     
            
        dmQuery = new ManagedQuery("getAllProductsPaged");
        dmQuery.propertySpecifier = "AddressTown,Image,AddressEmail,status,AddressFax,AddressMob,AddressTel,YoutubeVideoUrl,AddressCounty,ItemName,AddressName,MemberID,RowID,ImageID,AddressStreet,ItemDesc,GooglePostCode,AddressPostCode";
        dmQuery.parameters = "startIndex,numItems";
        _tblProductsRPCDataManager.addManagedOperation(dmQuery);                 

        dmOperation = new ManagedOperation("createTblProducts", "create");
        dmOperation.parameters = "item";
        _tblProductsRPCDataManager.addManagedOperation(dmOperation);     
            
        dmOperation = new ManagedOperation("deleteTblProducts", "delete");
        dmOperation.parameters = "id";
        _tblProductsRPCDataManager.addManagedOperation(dmOperation);     
            
        _serviceControl.managers = managersArray;
                      
         model_internal::initialize();
    }

	/**
	  * This method is a generated wrapper used to call the 'getTblProductsByID' operation. It returns an ItemReference whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.data.ItemReference
      * @see mx.rpc.CallResponder 
      *
      * @return an ItemReference whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function getTblProductsByID(itemID:int) : ItemReference
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("getTblProductsByID");
		var _internal_token:ItemReference = _internal_operation.send(itemID) as ItemReference;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'createTblProducts' operation. It returns an ItemReference whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.data.ItemReference
      * @see mx.rpc.CallResponder 
      *
      * @return an ItemReference whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function createTblProducts(item:valueObjects.TblProducts) : ItemReference
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("createTblProducts");
		var _internal_token:ItemReference = _internal_operation.send(item) as ItemReference;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'updateTblProducts' operation. It returns an ItemReference whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.data.ItemReference
      * @see mx.rpc.CallResponder 
      *
      * @return an ItemReference whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function updateTblProducts(item:valueObjects.TblProducts) : ItemReference
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("updateTblProducts");
		var _internal_token:ItemReference = _internal_operation.send(item) as ItemReference;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'deleteTblProducts' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function deleteTblProducts(itemID:int) : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("deleteTblProducts");
		var _internal_token:AsyncToken = _internal_operation.send(itemID) ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'ParseEmbedded' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function ParseEmbedded(html:String) : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("ParseEmbedded");
		var _internal_token:AsyncToken = _internal_operation.send(html) ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'getProductsByIDList' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function getProductsByIDList(searchStr:Object, startIndex:Object, numItems:Object) : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("getProductsByIDList");
		var _internal_token:AsyncToken = _internal_operation.send(searchStr,startIndex,numItems) ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'addKeywords' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function addKeywords(str:String, productId:int) : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("addKeywords");
		var _internal_token:AsyncToken = _internal_operation.send(str,productId) ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'countAllProducts' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function countAllProducts() : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("countAllProducts");
		var _internal_token:AsyncToken = _internal_operation.send() ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'getAllProductsPaged' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function getAllProductsPaged(startIndex:int, numItems:int) : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("getAllProductsPaged");
		var _internal_token:AsyncToken = _internal_operation.send(startIndex,numItems) ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'countProductsByIDList' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function countProductsByIDList(searchStr:String) : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("countProductsByIDList");
		var _internal_token:AsyncToken = _internal_operation.send(searchStr) ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'search' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function search(str:String, start:int, limit:int) : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("search");
		var _internal_token:AsyncToken = _internal_operation.send(str,start,limit) ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'GetProductsForUserPaged' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function GetProductsForUserPaged(MemberID:Object, startIndex:Object, numItems:Object) : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("GetProductsForUserPaged");
		var _internal_token:AsyncToken = _internal_operation.send(MemberID,startIndex,numItems) ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'countAllProductsMemberID' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function countAllProductsMemberID(MemberID:Object) : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("countAllProductsMemberID");
		var _internal_token:AsyncToken = _internal_operation.send(MemberID) ;

		return _internal_token;
	}   
	 
}

}
