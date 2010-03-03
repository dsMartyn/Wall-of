/**
 * This is a generated class and is not intended for modfication.  To customize behavior
 * of this service wrapper you may modify the generated sub-class of this class - TblKeywordsService.as.
 */
package services.tblkeywordsservice
{
import mx.rpc.AsyncToken;
import com.adobe.fiber.core.model_internal;
import mx.rpc.AbstractOperation;
import valueObjects.TblKeywords;
import mx.collections.ItemResponder;
import mx.rpc.remoting.RemoteObject; 
import mx.rpc.remoting.Operation;
import com.adobe.fiber.services.wrapper.RemoteObjectServiceWrapper;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;
import com.adobe.serializers.utility.TypeUtility;

[ExcludeClass]
internal class _Super_TblKeywordsService extends RemoteObjectServiceWrapper
{      
       
    // Constructor
    public function _Super_TblKeywordsService()
    {
        // initialize service control
        _serviceControl = new RemoteObject(); 
        
        var operations:Object = new Object();
        var operation:Operation;         
         
        operation = new Operation(null, "getAllTblKeywords");
		 operation.resultElementType = valueObjects.TblKeywords;
        operations["getAllTblKeywords"] = operation;
         
     valueObjects.TblKeywords._initRemoteClassAlias();
        operation = new Operation(null, "getTblKeywordsByID");
		 operation.resultType = valueObjects.TblKeywords; 		 
        operations["getTblKeywordsByID"] = operation;
         
     valueObjects.TblKeywords._initRemoteClassAlias();
        operation = new Operation(null, "createTblKeywords");
		 operation.resultType = int; 		 
        operations["createTblKeywords"] = operation;
         
        operation = new Operation(null, "updateTblKeywords");
        operations["updateTblKeywords"] = operation;
         
        operation = new Operation(null, "deleteTblKeywords");
        operations["deleteTblKeywords"] = operation;
         
        operation = new Operation(null, "count");
		 operation.resultType = int; 		 
        operations["count"] = operation;
         
        operation = new Operation(null, "getTblKeywords_paged");
		 operation.resultElementType = valueObjects.TblKeywords;
        operations["getTblKeywords_paged"] = operation;
         
     valueObjects.TblKeywords._initRemoteClassAlias();
        operation = new Operation(null, "getTblKeywordsByCRC");
		 operation.resultElementType = valueObjects.TblKeywords;
        operations["getTblKeywordsByCRC"] = operation;
         
     valueObjects.TblKeywords._initRemoteClassAlias();
        operation = new Operation(null, "getKeywordsByIDList");
		 operation.resultElementType = valueObjects.TblKeywords;
        operations["getKeywordsByIDList"] = operation;
         
     valueObjects.TblKeywords._initRemoteClassAlias();
    
        _serviceControl.operations = operations;   
		_serviceControl.convertResultHandler = TypeUtility.convertResultHandler;
        _serviceControl.source = "TblKeywordsService";
        _serviceControl.endpoint = "gateway.php";
		_serviceControl.destination = "TblKeywordsService";
        
    
                      
         model_internal::initialize();
    }

	/**
	  * This method is a generated wrapper used to call the 'getAllTblKeywords' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function getAllTblKeywords() : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("getAllTblKeywords");
		var _internal_token:AsyncToken = _internal_operation.send() ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'getTblKeywordsByID' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function getTblKeywordsByID(itemID:int) : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("getTblKeywordsByID");
		var _internal_token:AsyncToken = _internal_operation.send(itemID) ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'createTblKeywords' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function createTblKeywords(item:valueObjects.TblKeywords) : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("createTblKeywords");
		var _internal_token:AsyncToken = _internal_operation.send(item) ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'updateTblKeywords' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function updateTblKeywords(item:Object) : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("updateTblKeywords");
		var _internal_token:AsyncToken = _internal_operation.send(item) ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'deleteTblKeywords' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function deleteTblKeywords(itemID:int) : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("deleteTblKeywords");
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
	  * This method is a generated wrapper used to call the 'getTblKeywords_paged' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function getTblKeywords_paged(startIndex:int, numItems:int) : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("getTblKeywords_paged");
		var _internal_token:AsyncToken = _internal_operation.send(startIndex,numItems) ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'getTblKeywordsByCRC' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function getTblKeywordsByCRC(crc:int) : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("getTblKeywordsByCRC");
		var _internal_token:AsyncToken = _internal_operation.send(crc) ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'getKeywordsByIDList' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function getKeywordsByIDList(searchStr:String) : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("getKeywordsByIDList");
		var _internal_token:AsyncToken = _internal_operation.send(searchStr) ;

		return _internal_token;
	}   
	 
}

}
