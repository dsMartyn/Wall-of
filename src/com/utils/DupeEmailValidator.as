package com.utils
{
	import mx.validators.ValidationResult;
	import mx.validators.Validator;

	public class DupeEmailValidator extends  Validator
	{
		
		
		/**
		 * Indicates the error code. 
		 */
		private const ERROR_DUPE_EMAIL:String = "DupeEmail"; 
		
		/**
		 * Array stores the return value of doValidation(). 
		 */
		private var _results:Array;
		
				
		/**
		 * Class constructor.
		 */ 
		public function DupeEmailValidator()
		{
			_errorMessage="The email address you entered is already in use."
			super();
		}
		

		private var _errorMessage:String;
		/**
		 * Provides a custom error message.
		 */ 
		public function get errorMessage():String {
			return _errorMessage;
		}
		
		/** 
		 * @private
		 */
		public function set errorMessage(value:String):void {
			_errorMessage = value;
		}

		
		private var _duplicated:Boolean;
		
		/**
		 * is email duplicated
		**/
		public function get duplicated():Boolean{
			return _duplicated;
		}
		
		/**
		 * @private
		**/
		public function set duplicated(value:Boolean):void{
			_duplicated = value;
		}
		
		/**
		 * Overrides the superclass' doValidation() method and defines 
		 * a custom implementation.
		 *
		 * @param value Object to validate.
		 * @return Array containing a ValidationResult object for each error.
		 */
		override protected function doValidation(value:Object):Array {

			// Clear the results array.
			_results = [];
			// Call base class doValidation().
			_results = super.doValidation(_duplicated);
			// Return if there are errors.
			if (_results.length > 0) 
				return _results;

			//check if value is false
			if (_duplicated == true) {
				_results.push(new ValidationResult(true, null, ERROR_DUPE_EMAIL, _errorMessage));
				return _results;
			}
			return _results;              
		}
		
	}
}