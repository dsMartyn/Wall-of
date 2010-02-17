/**
 * This is a generated class and is not intended for modfication.  To customize behavior
 * of this service wrapper you may modify the generated sub-class of this class - TblEmailLogService.as.
 */
package services.tblemaillogservice
{
import mx.rpc.AsyncToken;
import com.adobe.fiber.core.model_internal;
import mx.rpc.AbstractOperation;
import valueObjects.TblEmailLog;
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
internal class _Super_TblEmailLogService extends RemoteObjectServiceWrapper
{      
    private var _tblEmailLogRPCDataManager : RPCDataManager;         
    private var managersArray : Array = new Array();
        
    public const DATA_MANAGER_TBLEMAILLOG : String = "TblEmailLog";         
        
    public function getDataManager(dataManagerName:String) : RPCDataManager
    {
        switch (dataManagerName)
        {
             case (DATA_MANAGER_TBLEMAILLOG):
                return _tblEmailLogRPCDataManager;      
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
    	return _tblEmailLogRPCDataManager.dataStore.commit(itemsOrCollections, cascadeCommit);
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
        return _tblEmailLogRPCDataManager.dataStore.revertChanges();
    }    
       
    // Constructor
    public function _Super_TblEmailLogService()
    {
        // initialize service control
        _serviceControl = new RemoteObject(); 
        
        var operations:Object = new Object();
        var operation:Operation;         
         
        operation = new Operation(null, "getAllTblEmailLog");
		 operation.resultElementType = valueObjects.TblEmailLog;
        operations["getAllTblEmailLog"] = operation;
         
     valueObjects.TblEmailLog._initRemoteClassAlias();
        operation = new Operation(null, "getTblEmailLogByID");
		 operation.resultElementType = valueObjects.TblEmailLog;
        operations["getTblEmailLogByID"] = operation;
         
     valueObjects.TblEmailLog._initRemoteClassAlias();
        operation = new Operation(null, "createTblEmailLog");
		 operation.resultType = int; 		 
        operations["createTblEmailLog"] = operation;
         
        operation = new Operation(null, "updateTblEmailLog");
        operations["updateTblEmailLog"] = operation;
         
        operation = new Operation(null, "deleteTblEmailLog");
        operations["deleteTblEmailLog"] = operation;
         
        operation = new Operation(null, "count");
		 operation.resultType = int; 		 
        operations["count"] = operation;
         
        operation = new Operation(null, "getTblEmailLog_paged");
		 operation.resultElementType = valueObjects.TblEmailLog;
        operations["getTblEmailLog_paged"] = operation;
         
     valueObjects.TblEmailLog._initRemoteClassAlias();
        operation = new Operation(null, "email_friend");
        operations["email_friend"] = operation;
         
    
        _serviceControl.operations = operations;   
		_serviceControl.convertResultHandler = TypeUtility.convertResultHandler;
        _serviceControl.source = "TblEmailLogService";
        _serviceControl.endpoint = "gateway.php";
		_serviceControl.destination = "TblEmailLogService";
        
        var managedAssociation : ManagedAssociation;
    	var managedAssocsArray : Array;
        // initialize TblEmailLog data manager     
        _tblEmailLogRPCDataManager = new RPCDataManager();        
        managersArray.push(_tblEmailLogRPCDataManager);
        
        managedAssocsArray = new Array();
        
        _tblEmailLogRPCDataManager.destination = "tblEmailLogRPCDataManager";
        _tblEmailLogRPCDataManager.service = _serviceControl;        
        _tblEmailLogRPCDataManager.identities =  "RowID";      
        _tblEmailLogRPCDataManager.itemClass = valueObjects.TblEmailLog; 
        
                   
    
        var dmOperation : ManagedOperation;
        var dmQuery : ManagedQuery;
         
        dmOperation = new ManagedOperation("updateTblEmailLog", "update");
        dmOperation.parameters = "item";
        _tblEmailLogRPCDataManager.addManagedOperation(dmOperation);     
            
        dmOperation = new ManagedOperation("deleteTblEmailLog", "delete");
        dmOperation.parameters = "id";
        _tblEmailLogRPCDataManager.addManagedOperation(dmOperation);     
            
        dmOperation = new ManagedOperation("createTblEmailLog", "create");
        dmOperation.parameters = "item";
        _tblEmailLogRPCDataManager.addManagedOperation(dmOperation);     
            
        dmOperation = new ManagedOperation("getTblEmailLogByID", "get");
        dmOperation.parameters = "RowID";
        _tblEmailLogRPCDataManager.addManagedOperation(dmOperation);     
            
        dmQuery = new ManagedQuery("getTblEmailLog_paged");
        dmQuery.propertySpecifier = "RowID,To,From,Subject,Body,Headers,MemberID";
        dmQuery.countOperation = "count";
        dmQuery.pagingEnabled = true;
        dmQuery.positionalPagingParameters = true;
        dmQuery.parameters = "startIndex,numItems";
        _tblEmailLogRPCDataManager.addManagedOperation(dmQuery);                 

        dmQuery = new ManagedQuery("getAllTblEmailLog");
        dmQuery.propertySpecifier = "RowID,To,From,Subject,Body,Headers,MemberID";
        dmQuery.parameters = "";
        _tblEmailLogRPCDataManager.addManagedOperation(dmQuery);                 

        _serviceControl.managers = managersArray;
                      
         model_internal::initialize();
    }

	/**
	  * This method is a generated wrapper used to call the 'getAllTblEmailLog' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function getAllTblEmailLog() : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("getAllTblEmailLog");
		var _internal_token:AsyncToken = _internal_operation.send() ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'getTblEmailLogByID' operation. It returns an ItemReference whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.data.ItemReference
      * @see mx.rpc.CallResponder 
      *
      * @return an ItemReference whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function getTblEmailLogByID(itemID:int) : ItemReference
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("getTblEmailLogByID");
		var _internal_token:ItemReference = _internal_operation.send(itemID) as ItemReference;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'createTblEmailLog' operation. It returns an ItemReference whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.data.ItemReference
      * @see mx.rpc.CallResponder 
      *
      * @return an ItemReference whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function createTblEmailLog(item:valueObjects.TblEmailLog) : ItemReference
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("createTblEmailLog");
		var _internal_token:ItemReference = _internal_operation.send(item) as ItemReference;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'updateTblEmailLog' operation. It returns an ItemReference whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.data.ItemReference
      * @see mx.rpc.CallResponder 
      *
      * @return an ItemReference whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function updateTblEmailLog(item:valueObjects.TblEmailLog) : ItemReference
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("updateTblEmailLog");
		var _internal_token:ItemReference = _internal_operation.send(item) as ItemReference;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'deleteTblEmailLog' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function deleteTblEmailLog(itemID:int) : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("deleteTblEmailLog");
		var _internal_token:AsyncToken = _internal_operation.send(itemID) ;

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
	  * This method is a generated wrapper used to call the 'getTblEmailLog_paged' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function getTblEmailLog_paged() : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("getTblEmailLog_paged");
		var _internal_token:AsyncToken = _internal_operation.send() ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'email_friend' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function email_friend(to:String, name:String, comment:String, memberID:int) : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("email_friend");
		var _internal_token:AsyncToken = _internal_operation.send(to,name,comment,memberID) ;

		return _internal_token;
	}   
	 
}

}
