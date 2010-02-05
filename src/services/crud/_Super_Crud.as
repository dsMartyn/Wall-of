/**
 * This is a generated class and is not intended for modfication.  To customize behavior
 * of this service wrapper you may modify the generated sub-class of this class - Crud.as.
 */
package services.crud
{
import mx.rpc.AsyncToken;
import com.adobe.fiber.core.model_internal;
import mx.rpc.AbstractOperation;
import valueObjects.MemberFields;
import valueObjects.ProductFields;
import mx.collections.ItemResponder;
import mx.rpc.remoting.RemoteObject; 
import mx.rpc.remoting.Operation;
import com.adobe.fiber.services.wrapper.RemoteObjectServiceWrapper;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;
import com.adobe.serializers.utility.TypeUtility;

[ExcludeClass]
internal class _Super_Crud extends RemoteObjectServiceWrapper
{      
       
    // Constructor
    public function _Super_Crud()
    {
        // initialize service control
        _serviceControl = new RemoteObject(); 
        
        var operations:Object = new Object();
        var operation:Operation;         
         
        operation = new Operation(null, "php_mode");
        operations["php_mode"] = operation;
         
        operation = new Operation(null, "getProducts");
		 operation.resultElementType = valueObjects.ProductFields;
        operations["getProducts"] = operation;
         
     valueObjects.ProductFields._initRemoteClassAlias();
        operation = new Operation(null, "getProduct");
		 operation.resultType = valueObjects.ProductFields; 		 
        operations["getProduct"] = operation;
         
     valueObjects.ProductFields._initRemoteClassAlias();
        operation = new Operation(null, "getProducts_paged");
		 operation.resultElementType = valueObjects.ProductFields;
        operations["getProducts_paged"] = operation;
         
     valueObjects.ProductFields._initRemoteClassAlias();
        operation = new Operation(null, "createProduct");
		 operation.resultType = int; 		 
        operations["createProduct"] = operation;
         
        operation = new Operation(null, "updateProduct");
        operations["updateProduct"] = operation;
         
        operation = new Operation(null, "deleteProduct");
        operations["deleteProduct"] = operation;
         
        operation = new Operation(null, "countProducts");
		 operation.resultType = int; 		 
        operations["countProducts"] = operation;
         
        operation = new Operation(null, "getMembers");
		 operation.resultElementType = valueObjects.MemberFields;
        operations["getMembers"] = operation;
         
     valueObjects.MemberFields._initRemoteClassAlias();
        operation = new Operation(null, "getMember");
		 operation.resultElementType = valueObjects.MemberFields;
        operations["getMember"] = operation;
         
     valueObjects.MemberFields._initRemoteClassAlias();
        operation = new Operation(null, "getMembers_paged");
		 operation.resultElementType = valueObjects.MemberFields;
        operations["getMembers_paged"] = operation;
         
     valueObjects.MemberFields._initRemoteClassAlias();
        operation = new Operation(null, "createMember");
		 operation.resultType = int; 		 
        operations["createMember"] = operation;
         
        operation = new Operation(null, "email_friend");
        operations["email_friend"] = operation;
         
        operation = new Operation(null, "updateMember");
        operations["updateMember"] = operation;
         
        operation = new Operation(null, "deleteMember");
        operations["deleteMember"] = operation;
         
        operation = new Operation(null, "countMembers");
		 operation.resultType = int; 		 
        operations["countMembers"] = operation;
         
        operation = new Operation(null, "GetMemberID");
		 operation.resultType = int; 		 
        operations["GetMemberID"] = operation;
         
        operation = new Operation(null, "logout");
        operations["logout"] = operation;
         
        operation = new Operation(null, "login");
		 operation.resultType = int; 		 
        operations["login"] = operation;
         
        operation = new Operation(null, "CheckSession");
		 operation.resultType = int; 		 
        operations["CheckSession"] = operation;
         
        operation = new Operation(null, "ParseEmbedded");
		 operation.resultType = String; 		 
        operations["ParseEmbedded"] = operation;
         
        operation = new Operation(null, "getIPAddress");
		 operation.resultType = String; 		 
        operations["getIPAddress"] = operation;
         
    
        _serviceControl.operations = operations;   
		_serviceControl.convertResultHandler = TypeUtility.convertResultHandler;
        _serviceControl.source = "Crud";
        _serviceControl.endpoint = "gateway.php";
		_serviceControl.destination = "Crud";
        
    
                      
         model_internal::initialize();
    }

	/**
	  * This method is a generated wrapper used to call the 'php_mode' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function php_mode() : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("php_mode");
		var _internal_token:AsyncToken = _internal_operation.send() ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'getProducts' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function getProducts(SessionID:int) : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("getProducts");
		var _internal_token:AsyncToken = _internal_operation.send(SessionID) ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'getProduct' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function getProduct(productID:int) : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("getProduct");
		var _internal_token:AsyncToken = _internal_operation.send(productID) ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'getProducts_paged' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function getProducts_paged(startIndex:int, numItems:int) : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("getProducts_paged");
		var _internal_token:AsyncToken = _internal_operation.send(startIndex,numItems) ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'createProduct' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function createProduct(item:valueObjects.ProductFields) : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("createProduct");
		var _internal_token:AsyncToken = _internal_operation.send(item) ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'updateProduct' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function updateProduct(item:valueObjects.ProductFields) : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("updateProduct");
		var _internal_token:AsyncToken = _internal_operation.send(item) ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'deleteProduct' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function deleteProduct(itemID:int) : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("deleteProduct");
		var _internal_token:AsyncToken = _internal_operation.send(itemID) ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'countProducts' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function countProducts() : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("countProducts");
		var _internal_token:AsyncToken = _internal_operation.send() ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'getMembers' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function getMembers() : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("getMembers");
		var _internal_token:AsyncToken = _internal_operation.send() ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'getMember' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function getMember(memberID:int) : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("getMember");
		var _internal_token:AsyncToken = _internal_operation.send(memberID) ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'getMembers_paged' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function getMembers_paged(startIndex:int, numItems:int) : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("getMembers_paged");
		var _internal_token:AsyncToken = _internal_operation.send(startIndex,numItems) ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'createMember' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function createMember(item:valueObjects.MemberFields) : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("createMember");
		var _internal_token:AsyncToken = _internal_operation.send(item) ;

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
	public function email_friend(to:String, name:String, comment:String) : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("email_friend");
		var _internal_token:AsyncToken = _internal_operation.send(to,name,comment) ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'updateMember' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function updateMember(item:valueObjects.MemberFields) : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("updateMember");
		var _internal_token:AsyncToken = _internal_operation.send(item) ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'deleteMember' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function deleteMember(itemID:int) : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("deleteMember");
		var _internal_token:AsyncToken = _internal_operation.send(itemID) ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'countMembers' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function countMembers() : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("countMembers");
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
	public function GetMemberID(SessionID:int) : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("GetMemberID");
		var _internal_token:AsyncToken = _internal_operation.send(SessionID) ;

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
	public function CheckSession(SessionID:Number) : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("CheckSession");
		var _internal_token:AsyncToken = _internal_operation.send(SessionID) ;

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
	 
}

}
