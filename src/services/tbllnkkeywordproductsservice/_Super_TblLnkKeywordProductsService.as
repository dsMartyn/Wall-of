/**
 * This is a generated class and is not intended for modfication.  To customize behavior
 * of this service wrapper you may modify the generated sub-class of this class - TblLnkKeywordProductsService.as.
 */
package services.tbllnkkeywordproductsservice
{
import mx.rpc.AsyncToken;
import com.adobe.fiber.core.model_internal;
import mx.rpc.AbstractOperation;
import valueObjects.TblLnkKeywordProducts;
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
internal class _Super_TblLnkKeywordProductsService extends RemoteObjectServiceWrapper
{      
    private var _tblLnkKeywordProductsRPCDataManager : RPCDataManager;         
    private var managersArray : Array = new Array();
        
    public const DATA_MANAGER_TBLLNKKEYWORDPRODUCTS : String = "TblLnkKeywordProducts";         
        
    public function getDataManager(dataManagerName:String) : RPCDataManager
    {
        switch (dataManagerName)
        {
             case (DATA_MANAGER_TBLLNKKEYWORDPRODUCTS):
                return _tblLnkKeywordProductsRPCDataManager;      
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
    	return _tblLnkKeywordProductsRPCDataManager.dataStore.commit(itemsOrCollections, cascadeCommit);
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
        return _tblLnkKeywordProductsRPCDataManager.dataStore.revertChanges();
    }    
       
    // Constructor
    public function _Super_TblLnkKeywordProductsService()
    {
        // initialize service control
        _serviceControl = new RemoteObject(); 
        
        var operations:Object = new Object();
        var operation:Operation;         
         
        operation = new Operation(null, "getAllTblLnkKeywordProducts");
		 operation.resultElementType = valueObjects.TblLnkKeywordProducts;
        operations["getAllTblLnkKeywordProducts"] = operation;
         
     valueObjects.TblLnkKeywordProducts._initRemoteClassAlias();
        operation = new Operation(null, "getTblLnkKeywordProductsByID");
		 operation.resultType = valueObjects.TblLnkKeywordProducts; 		 
        operations["getTblLnkKeywordProductsByID"] = operation;
         
     valueObjects.TblLnkKeywordProducts._initRemoteClassAlias();
        operation = new Operation(null, "createTblLnkKeywordProducts");
		 operation.resultType = int; 		 
        operations["createTblLnkKeywordProducts"] = operation;
         
        operation = new Operation(null, "updateTblLnkKeywordProducts");
        operations["updateTblLnkKeywordProducts"] = operation;
         
        operation = new Operation(null, "count");
		 operation.resultType = int; 		 
        operations["count"] = operation;
         
        operation = new Operation(null, "getTblLnkKeywordProducts_paged");
		 operation.resultElementType = valueObjects.TblLnkKeywordProducts;
        operations["getTblLnkKeywordProducts_paged"] = operation;
         
     valueObjects.TblLnkKeywordProducts._initRemoteClassAlias();
        operation = new Operation(null, "deleteTblProduct");
        operations["deleteTblProduct"] = operation;
         
        operation = new Operation(null, "deleteTblKeyword");
        operations["deleteTblKeyword"] = operation;
         
        operation = new Operation(null, "getTblLnkKeywordProductsList");
		 operation.resultElementType = valueObjects.TblLnkKeywordProducts;
        operations["getTblLnkKeywordProductsList"] = operation;
         
     valueObjects.TblLnkKeywordProducts._initRemoteClassAlias();
    
        _serviceControl.operations = operations;   
		_serviceControl.convertResultHandler = TypeUtility.convertResultHandler;
        _serviceControl.source = "TblLnkKeywordProductsService";
        _serviceControl.endpoint = "gateway.php";
		_serviceControl.destination = "TblLnkKeywordProductsService";
        
        var managedAssociation : ManagedAssociation;
    	var managedAssocsArray : Array;
        // initialize TblLnkKeywordProducts data manager     
        _tblLnkKeywordProductsRPCDataManager = new RPCDataManager();        
        managersArray.push(_tblLnkKeywordProductsRPCDataManager);
        
        managedAssocsArray = new Array();
        
        _tblLnkKeywordProductsRPCDataManager.destination = "tblLnkKeywordProductsRPCDataManager";
        _tblLnkKeywordProductsRPCDataManager.service = _serviceControl;        
        _tblLnkKeywordProductsRPCDataManager.identities =  "RowID";      
        _tblLnkKeywordProductsRPCDataManager.itemClass = valueObjects.TblLnkKeywordProducts; 
        
                   
    
        var dmOperation : ManagedOperation;
        var dmQuery : ManagedQuery;
         
        dmQuery = new ManagedQuery("getAllTblLnkKeywordProducts");
        dmQuery.propertySpecifier = "ProductID,KeywordID,RowID";
        dmQuery.parameters = "";
        _tblLnkKeywordProductsRPCDataManager.addManagedOperation(dmQuery);                 

        dmQuery = new ManagedQuery("getTblLnkKeywordProducts_paged");
        dmQuery.propertySpecifier = "ProductID,KeywordID,RowID";
        dmQuery.countOperation = "count";
        dmQuery.pagingEnabled = true;
        dmQuery.positionalPagingParameters = true;
        dmQuery.parameters = "startIndex,numItems";
        _tblLnkKeywordProductsRPCDataManager.addManagedOperation(dmQuery);                 

        dmQuery = new ManagedQuery("getTblLnkKeywordProductsList");
        dmQuery.propertySpecifier = "ProductID,KeywordID,RowID";
        dmQuery.parameters = "searchStr";
        _tblLnkKeywordProductsRPCDataManager.addManagedOperation(dmQuery);                 

        dmOperation = new ManagedOperation("updateTblLnkKeywordProducts", "update");
        dmOperation.parameters = "item";
        _tblLnkKeywordProductsRPCDataManager.addManagedOperation(dmOperation);     
            
        dmOperation = new ManagedOperation("createTblLnkKeywordProducts", "create");
        dmOperation.parameters = "item";
        _tblLnkKeywordProductsRPCDataManager.addManagedOperation(dmOperation);     
            
        dmQuery = new ManagedQuery("getTblLnkKeywordProductsByID");
        dmQuery.propertySpecifier = "ProductID,KeywordID,RowID";
        dmQuery.parameters = "keywordId,productId";
		dmQuery.type="findItem";                
        _tblLnkKeywordProductsRPCDataManager.addManagedOperation(dmQuery);                 

        _serviceControl.managers = managersArray;
                      
         model_internal::initialize();
    }

	/**
	  * This method is a generated wrapper used to call the 'getAllTblLnkKeywordProducts' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function getAllTblLnkKeywordProducts() : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("getAllTblLnkKeywordProducts");
		var _internal_token:AsyncToken = _internal_operation.send() ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'getTblLnkKeywordProductsByID' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function getTblLnkKeywordProductsByID(keywordId:int, productId:int) : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("getTblLnkKeywordProductsByID");
		var _internal_token:AsyncToken = _internal_operation.send(keywordId,productId) ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'createTblLnkKeywordProducts' operation. It returns an ItemReference whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.data.ItemReference
      * @see mx.rpc.CallResponder 
      *
      * @return an ItemReference whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function createTblLnkKeywordProducts(item:valueObjects.TblLnkKeywordProducts) : ItemReference
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("createTblLnkKeywordProducts");
		var _internal_token:ItemReference = _internal_operation.send(item) as ItemReference;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'updateTblLnkKeywordProducts' operation. It returns an ItemReference whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.data.ItemReference
      * @see mx.rpc.CallResponder 
      *
      * @return an ItemReference whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function updateTblLnkKeywordProducts(item:valueObjects.TblLnkKeywordProducts) : ItemReference
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("updateTblLnkKeywordProducts");
		var _internal_token:ItemReference = _internal_operation.send(item) as ItemReference;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'count' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function count() : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("count");
		var _internal_token:AsyncToken = _internal_operation.send() ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'getTblLnkKeywordProducts_paged' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function getTblLnkKeywordProducts_paged() : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("getTblLnkKeywordProducts_paged");
		var _internal_token:AsyncToken = _internal_operation.send() ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'deleteTblProduct' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function deleteTblProduct(productID:int) : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("deleteTblProduct");
		var _internal_token:AsyncToken = _internal_operation.send(productID) ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'deleteTblKeyword' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function deleteTblKeyword(keywordID:int) : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("deleteTblKeyword");
		var _internal_token:AsyncToken = _internal_operation.send(keywordID) ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'getTblLnkKeywordProductsList' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function getTblLnkKeywordProductsList(searchStr:String) : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("getTblLnkKeywordProductsList");
		var _internal_token:AsyncToken = _internal_operation.send(searchStr) ;

		return _internal_token;
	}   
	 
}

}
