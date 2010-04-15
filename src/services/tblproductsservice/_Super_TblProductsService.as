/**
 * This is a generated class and is not intended for modfication.  To customize behavior
 * of this service wrapper you may modify the generated sub-class of this class - TblProductsService.as.
 */
package services.tblproductsservice
{
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.services.wrapper.RemoteObjectServiceWrapper;
import com.adobe.serializers.utility.TypeUtility;
import mx.rpc.AbstractOperation;
import mx.rpc.AsyncToken;
import mx.rpc.remoting.Operation;
import mx.rpc.remoting.RemoteObject;
import valueObjects.SearchFields;
import valueObjects.TblProducts;
import valueObjects.TblProductsView;

import mx.collections.ItemResponder;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;

[ExcludeClass]
internal class _Super_TblProductsService extends com.adobe.fiber.services.wrapper.RemoteObjectServiceWrapper
{      
       
    // Constructor
    public function _Super_TblProductsService()
    {
        // initialize service control
        _serviceControl = new mx.rpc.remoting.RemoteObject();
        
        var operations:Object = new Object();
        var operation:mx.rpc.remoting.Operation;
         
        operation = new mx.rpc.remoting.Operation(null, "getTblProductsByID");
		 operation.resultType = valueObjects.TblProducts; 		 
        operations["getTblProductsByID"] = operation;

        valueObjects.TblProducts._initRemoteClassAlias();
        operation = new mx.rpc.remoting.Operation(null, "createTblProducts");
		 operation.resultType = int; 		 
        operations["createTblProducts"] = operation;

        operation = new mx.rpc.remoting.Operation(null, "updateTblProducts");
		 operation.resultType = Object; 		 
        operations["updateTblProducts"] = operation;

        operation = new mx.rpc.remoting.Operation(null, "deleteTblProducts");
        operations["deleteTblProducts"] = operation;

        operation = new mx.rpc.remoting.Operation(null, "ParseEmbedded");
		 operation.resultType = String; 		 
        operations["ParseEmbedded"] = operation;

        operation = new mx.rpc.remoting.Operation(null, "getProductsByIDList");
		 operation.resultType = Object; 		 
        operations["getProductsByIDList"] = operation;

        operation = new mx.rpc.remoting.Operation(null, "addKeywords");
        operations["addKeywords"] = operation;

        operation = new mx.rpc.remoting.Operation(null, "countAllProducts");
		 operation.resultType = int; 		 
        operations["countAllProducts"] = operation;

        operation = new mx.rpc.remoting.Operation(null, "getAllProductsPaged");
		 operation.resultType = Object; 		 
        operations["getAllProductsPaged"] = operation;

        operation = new mx.rpc.remoting.Operation(null, "countProductsByIDList");
		 operation.resultType = int; 		 
        operations["countProductsByIDList"] = operation;

        operation = new mx.rpc.remoting.Operation(null, "search");
		 operation.resultElementType = valueObjects.SearchFields;
        operations["search"] = operation;

        valueObjects.SearchFields._initRemoteClassAlias();
        operation = new mx.rpc.remoting.Operation(null, "GetProductsForUserPaged");
		 operation.resultElementType = valueObjects.TblProductsView;
        operations["GetProductsForUserPaged"] = operation;

        valueObjects.TblProductsView._initRemoteClassAlias();
        operation = new mx.rpc.remoting.Operation(null, "countAllProductsMemberID");
		 operation.resultType = Object; 		 
        operations["countAllProductsMemberID"] = operation;

    
        _serviceControl.operations = operations;   
		_serviceControl.convertResultHandler = com.adobe.serializers.utility.TypeUtility.convertResultHandler;
        _serviceControl.source = "TblProductsService";
        _serviceControl.endpoint = "gateway.php";
		destination = "TblProductsService";
        
    
                      
         model_internal::initialize();
    }

	/**
	  * This method is a generated wrapper used to call the 'getTblProductsByID' operation. It returns an mx.rpc.AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function getTblProductsByID(itemID:int) : mx.rpc.AsyncToken
	{
		var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("getTblProductsByID");
		var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(itemID) ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'createTblProducts' operation. It returns an mx.rpc.AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function createTblProducts(item:Object) : mx.rpc.AsyncToken
	{
		var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("createTblProducts");
		var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(item) ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'updateTblProducts' operation. It returns an mx.rpc.AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function updateTblProducts(item:Object) : mx.rpc.AsyncToken
	{
		var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("updateTblProducts");
		var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(item) ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'deleteTblProducts' operation. It returns an mx.rpc.AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function deleteTblProducts(itemID:int) : mx.rpc.AsyncToken
	{
		var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("deleteTblProducts");
		var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(itemID) ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'ParseEmbedded' operation. It returns an mx.rpc.AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function ParseEmbedded(html:String) : mx.rpc.AsyncToken
	{
		var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("ParseEmbedded");
		var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(html) ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'getProductsByIDList' operation. It returns an mx.rpc.AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function getProductsByIDList(searchStr:Object, startIndex:Object, numItems:Object) : mx.rpc.AsyncToken
	{
		var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("getProductsByIDList");
		var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(searchStr,startIndex,numItems) ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'addKeywords' operation. It returns an mx.rpc.AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function addKeywords(str:String, productId:int) : mx.rpc.AsyncToken
	{
		var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("addKeywords");
		var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(str,productId) ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'countAllProducts' operation. It returns an mx.rpc.AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function countAllProducts() : mx.rpc.AsyncToken
	{
		var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("countAllProducts");
		var _internal_token:mx.rpc.AsyncToken = _internal_operation.send() ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'getAllProductsPaged' operation. It returns an mx.rpc.AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function getAllProductsPaged(startIndex:int, numItems:int) : mx.rpc.AsyncToken
	{
		var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("getAllProductsPaged");
		var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(startIndex,numItems) ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'countProductsByIDList' operation. It returns an mx.rpc.AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function countProductsByIDList(searchStr:String) : mx.rpc.AsyncToken
	{
		var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("countProductsByIDList");
		var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(searchStr) ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'search' operation. It returns an mx.rpc.AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function search(str:String, start:int, limit:int) : mx.rpc.AsyncToken
	{
		var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("search");
		var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(str,start,limit) ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'GetProductsForUserPaged' operation. It returns an mx.rpc.AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function GetProductsForUserPaged(MemberID:Number, startIndex:Number, numItems:Number) : mx.rpc.AsyncToken
	{
		var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("GetProductsForUserPaged");
		var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(MemberID,startIndex,numItems) ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'countAllProductsMemberID' operation. It returns an mx.rpc.AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function countAllProductsMemberID(MemberID:Object) : mx.rpc.AsyncToken
	{
		var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("countAllProductsMemberID");
		var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(MemberID) ;

		return _internal_token;
	}   
	 
}

}
