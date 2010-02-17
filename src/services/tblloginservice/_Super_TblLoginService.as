/**
 * This is a generated class and is not intended for modfication.  To customize behavior
 * of this service wrapper you may modify the generated sub-class of this class - TblLoginService.as.
 */
package services.tblloginservice
{
import mx.rpc.AsyncToken;
import com.adobe.fiber.core.model_internal;
import mx.rpc.AbstractOperation;
import valueObjects.LoginFields;
import valueObjects.TblLogin;
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
internal class _Super_TblLoginService extends RemoteObjectServiceWrapper
{      
    private var _tblLoginRPCDataManager : RPCDataManager;         
    private var managersArray : Array = new Array();
        
    public const DATA_MANAGER_TBLLOGIN : String = "TblLogin";         
        
    public function getDataManager(dataManagerName:String) : RPCDataManager
    {
        switch (dataManagerName)
        {
             case (DATA_MANAGER_TBLLOGIN):
                return _tblLoginRPCDataManager;      
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
    	return _tblLoginRPCDataManager.dataStore.commit(itemsOrCollections, cascadeCommit);
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
        return _tblLoginRPCDataManager.dataStore.revertChanges();
    }    
       
    // Constructor
    public function _Super_TblLoginService()
    {
        // initialize service control
        _serviceControl = new RemoteObject(); 
        
        var operations:Object = new Object();
        var operation:Operation;         
         
        operation = new Operation(null, "getAllTblLogin");
		 operation.resultElementType = valueObjects.TblLogin;
        operations["getAllTblLogin"] = operation;
         
     valueObjects.TblLogin._initRemoteClassAlias();
        operation = new Operation(null, "getTblLoginByID");
		 operation.resultElementType = valueObjects.TblLogin;
        operations["getTblLoginByID"] = operation;
         
     valueObjects.TblLogin._initRemoteClassAlias();
        operation = new Operation(null, "createTblLogin");
		 operation.resultType = int; 		 
        operations["createTblLogin"] = operation;
         
        operation = new Operation(null, "updateTblLogin");
        operations["updateTblLogin"] = operation;
         
        operation = new Operation(null, "deleteTblLogin");
        operations["deleteTblLogin"] = operation;
         
        operation = new Operation(null, "count");
		 operation.resultType = int; 		 
        operations["count"] = operation;
         
        operation = new Operation(null, "getTblLogin_paged");
		 operation.resultElementType = valueObjects.TblLogin;
        operations["getTblLogin_paged"] = operation;
         
     valueObjects.TblLogin._initRemoteClassAlias();
        operation = new Operation(null, "CheckSession");
		 operation.resultType = int; 		 
        operations["CheckSession"] = operation;
         
        operation = new Operation(null, "login");
		 operation.resultType = valueObjects.LoginFields; 		 
        operations["login"] = operation;
         
     valueObjects.LoginFields._initRemoteClassAlias();
        operation = new Operation(null, "logout");
        operations["logout"] = operation;
         
        operation = new Operation(null, "getIPAddress");
		 operation.resultType = Object; 		 
        operations["getIPAddress"] = operation;
         
        operation = new Operation(null, "GetMemberID");
		 operation.resultType = Object; 		 
        operations["GetMemberID"] = operation;
         
    
        _serviceControl.operations = operations;   
		_serviceControl.convertResultHandler = TypeUtility.convertResultHandler;
        _serviceControl.source = "TblLoginService";
        _serviceControl.endpoint = "gateway.php";
		_serviceControl.destination = "TblLoginService";
        
        var managedAssociation : ManagedAssociation;
    	var managedAssocsArray : Array;
        // initialize TblLogin data manager     
        _tblLoginRPCDataManager = new RPCDataManager();        
        managersArray.push(_tblLoginRPCDataManager);
        
        managedAssocsArray = new Array();
        
        _tblLoginRPCDataManager.destination = "tblLoginRPCDataManager";
        _tblLoginRPCDataManager.service = _serviceControl;        
        _tblLoginRPCDataManager.identities =  "RowID";      
        _tblLoginRPCDataManager.itemClass = valueObjects.TblLogin; 
        
                   
    
        var dmOperation : ManagedOperation;
        var dmQuery : ManagedQuery;
         
        dmOperation = new ManagedOperation("deleteTblLogin", "delete");
        dmOperation.parameters = "id";
        _tblLoginRPCDataManager.addManagedOperation(dmOperation);     
            
        dmOperation = new ManagedOperation("updateTblLogin", "update");
        dmOperation.parameters = "item";
        _tblLoginRPCDataManager.addManagedOperation(dmOperation);     
            
        dmOperation = new ManagedOperation("getTblLoginByID", "get");
        dmOperation.parameters = "RowID";
        _tblLoginRPCDataManager.addManagedOperation(dmOperation);     
            
        dmOperation = new ManagedOperation("createTblLogin", "create");
        dmOperation.parameters = "item";
        _tblLoginRPCDataManager.addManagedOperation(dmOperation);     
            
        dmQuery = new ManagedQuery("getAllTblLogin");
        dmQuery.propertySpecifier = "RowID,MemberID,LoginTime,LogoutTime,IPAddress";
        dmQuery.parameters = "";
        _tblLoginRPCDataManager.addManagedOperation(dmQuery);                 

        dmQuery = new ManagedQuery("getTblLogin_paged");
        dmQuery.propertySpecifier = "RowID,MemberID,LoginTime,LogoutTime,IPAddress";
        dmQuery.countOperation = "count";
        dmQuery.pagingEnabled = true;
        dmQuery.positionalPagingParameters = true;
        dmQuery.parameters = "startIndex,numItems";
        _tblLoginRPCDataManager.addManagedOperation(dmQuery);                 

        _serviceControl.managers = managersArray;
                      
         model_internal::initialize();
    }

	/**
	  * This method is a generated wrapper used to call the 'getAllTblLogin' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function getAllTblLogin() : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("getAllTblLogin");
		var _internal_token:AsyncToken = _internal_operation.send() ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'getTblLoginByID' operation. It returns an ItemReference whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.data.ItemReference
      * @see mx.rpc.CallResponder 
      *
      * @return an ItemReference whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function getTblLoginByID(itemID:int) : ItemReference
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("getTblLoginByID");
		var _internal_token:ItemReference = _internal_operation.send(itemID) as ItemReference;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'createTblLogin' operation. It returns an ItemReference whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.data.ItemReference
      * @see mx.rpc.CallResponder 
      *
      * @return an ItemReference whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function createTblLogin(item:valueObjects.TblLogin) : ItemReference
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("createTblLogin");
		var _internal_token:ItemReference = _internal_operation.send(item) as ItemReference;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'updateTblLogin' operation. It returns an ItemReference whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.data.ItemReference
      * @see mx.rpc.CallResponder 
      *
      * @return an ItemReference whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function updateTblLogin(item:valueObjects.TblLogin) : ItemReference
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("updateTblLogin");
		var _internal_token:ItemReference = _internal_operation.send(item) as ItemReference;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'deleteTblLogin' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function deleteTblLogin(itemID:int) : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("deleteTblLogin");
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
	  * This method is a generated wrapper used to call the 'getTblLogin_paged' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function getTblLogin_paged() : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("getTblLogin_paged");
		var _internal_token:AsyncToken = _internal_operation.send() ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'CheckSession' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function CheckSession(SessionID:int) : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("CheckSession");
		var _internal_token:AsyncToken = _internal_operation.send(SessionID) ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'login' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function login(user:String, pass:String) : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("login");
		var _internal_token:AsyncToken = _internal_operation.send(user,pass) ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'logout' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function logout(SessionID:int) : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("logout");
		var _internal_token:AsyncToken = _internal_operation.send(SessionID) ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'getIPAddress' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function getIPAddress() : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("getIPAddress");
		var _internal_token:AsyncToken = _internal_operation.send() ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'GetMemberID' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function GetMemberID(SessionID:Object) : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("GetMemberID");
		var _internal_token:AsyncToken = _internal_operation.send(SessionID) ;

		return _internal_token;
	}   
	 
}

}
