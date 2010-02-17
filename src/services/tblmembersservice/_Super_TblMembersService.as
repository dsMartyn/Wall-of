/**
 * This is a generated class and is not intended for modfication.  To customize behavior
 * of this service wrapper you may modify the generated sub-class of this class - TblMembersService.as.
 */
package services.tblmembersservice
{
import mx.rpc.AsyncToken;
import com.adobe.fiber.core.model_internal;
import mx.rpc.AbstractOperation;
import valueObjects.TblMembers;
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
internal class _Super_TblMembersService extends RemoteObjectServiceWrapper
{      
    private var _tblMembersRPCDataManager : RPCDataManager;         
    private var managersArray : Array = new Array();
        
    public const DATA_MANAGER_TBLMEMBERS : String = "TblMembers";         
        
    public function getDataManager(dataManagerName:String) : RPCDataManager
    {
        switch (dataManagerName)
        {
             case (DATA_MANAGER_TBLMEMBERS):
                return _tblMembersRPCDataManager;      
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
    	return _tblMembersRPCDataManager.dataStore.commit(itemsOrCollections, cascadeCommit);
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
        return _tblMembersRPCDataManager.dataStore.revertChanges();
    }    
       
    // Constructor
    public function _Super_TblMembersService()
    {
        // initialize service control
        _serviceControl = new RemoteObject(); 
        
        var operations:Object = new Object();
        var operation:Operation;         
         
        operation = new Operation(null, "getAllTblMembers");
		 operation.resultElementType = valueObjects.TblMembers;
        operations["getAllTblMembers"] = operation;
         
     valueObjects.TblMembers._initRemoteClassAlias();
        operation = new Operation(null, "getTblMembersByID");
		 operation.resultType = valueObjects.TblMembers; 		 
        operations["getTblMembersByID"] = operation;
         
     valueObjects.TblMembers._initRemoteClassAlias();
        operation = new Operation(null, "createTblMembers");
		 operation.resultType = int; 		 
        operations["createTblMembers"] = operation;
         
        operation = new Operation(null, "updateTblMembers");
        operations["updateTblMembers"] = operation;
         
        operation = new Operation(null, "deleteTblMembers");
        operations["deleteTblMembers"] = operation;
         
        operation = new Operation(null, "count");
		 operation.resultType = int; 		 
        operations["count"] = operation;
         
        operation = new Operation(null, "getTblMembers_paged");
		 operation.resultElementType = valueObjects.TblMembers;
        operations["getTblMembers_paged"] = operation;
         
     valueObjects.TblMembers._initRemoteClassAlias();
        operation = new Operation(null, "FindEmail");
		 operation.resultType = int; 		 
        operations["FindEmail"] = operation;
         
    
        _serviceControl.operations = operations;   
		_serviceControl.convertResultHandler = TypeUtility.convertResultHandler;
        _serviceControl.source = "TblMembersService";
        _serviceControl.endpoint = "gateway.php";
		_serviceControl.destination = "TblMembersService";
        
        var managedAssociation : ManagedAssociation;
    	var managedAssocsArray : Array;
        // initialize TblMembers data manager     
        _tblMembersRPCDataManager = new RPCDataManager();        
        managersArray.push(_tblMembersRPCDataManager);
        
        managedAssocsArray = new Array();
        
        _tblMembersRPCDataManager.destination = "tblMembersRPCDataManager";
        _tblMembersRPCDataManager.service = _serviceControl;        
        _tblMembersRPCDataManager.identities =  "RowID";      
        _tblMembersRPCDataManager.itemClass = valueObjects.TblMembers; 
        
                   
    
        var dmOperation : ManagedOperation;
        var dmQuery : ManagedQuery;
         
        dmQuery = new ManagedQuery("getAllTblMembers");
        dmQuery.propertySpecifier = "RowID,UserName,Password,FirstName,LastName,DOB,ContactNumber,StartDate";
        dmQuery.parameters = "";
        _tblMembersRPCDataManager.addManagedOperation(dmQuery);                 

        dmQuery = new ManagedQuery("getTblMembers_paged");
        dmQuery.propertySpecifier = "RowID,UserName,Password,FirstName,LastName,DOB,ContactNumber,StartDate";
        dmQuery.countOperation = "count";
        dmQuery.pagingEnabled = true;
        dmQuery.positionalPagingParameters = true;
        dmQuery.parameters = "startIndex,numItems";
        _tblMembersRPCDataManager.addManagedOperation(dmQuery);                 

        dmOperation = new ManagedOperation("createTblMembers", "create");
        dmOperation.parameters = "item";
        _tblMembersRPCDataManager.addManagedOperation(dmOperation);     
            
        dmOperation = new ManagedOperation("getTblMembersByID", "get");
        dmOperation.parameters = "RowID";
        _tblMembersRPCDataManager.addManagedOperation(dmOperation);     
            
        dmOperation = new ManagedOperation("deleteTblMembers", "delete");
        dmOperation.parameters = "id";
        _tblMembersRPCDataManager.addManagedOperation(dmOperation);     
            
        _serviceControl.managers = managersArray;
                      
         model_internal::initialize();
    }

	/**
	  * This method is a generated wrapper used to call the 'getAllTblMembers' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function getAllTblMembers() : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("getAllTblMembers");
		var _internal_token:AsyncToken = _internal_operation.send() ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'getTblMembersByID' operation. It returns an ItemReference whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.data.ItemReference
      * @see mx.rpc.CallResponder 
      *
      * @return an ItemReference whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function getTblMembersByID(itemID:int) : ItemReference
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("getTblMembersByID");
		var _internal_token:ItemReference = _internal_operation.send(itemID) as ItemReference;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'createTblMembers' operation. It returns an ItemReference whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.data.ItemReference
      * @see mx.rpc.CallResponder 
      *
      * @return an ItemReference whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function createTblMembers(item:valueObjects.TblMembers) : ItemReference
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("createTblMembers");
		var _internal_token:ItemReference = _internal_operation.send(item) as ItemReference;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'updateTblMembers' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function updateTblMembers(item:valueObjects.TblMembers) : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("updateTblMembers");
		var _internal_token:AsyncToken = _internal_operation.send(item) ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'deleteTblMembers' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function deleteTblMembers(itemID:int) : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("deleteTblMembers");
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
	  * This method is a generated wrapper used to call the 'getTblMembers_paged' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function getTblMembers_paged() : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("getTblMembers_paged");
		var _internal_token:AsyncToken = _internal_operation.send() ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'FindEmail' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function FindEmail(Email:String) : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("FindEmail");
		var _internal_token:AsyncToken = _internal_operation.send(Email) ;

		return _internal_token;
	}   
	 
}

}
