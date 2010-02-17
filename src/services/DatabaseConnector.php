<?php

class MySqlConnector {

	var $username = "root";
	var $password = "";
	var $server = "127.0.0.1";
	var $port = "3306";
	var $databasename = "wallof";
	var $Version = '1.0.0';
	var $phpMode = false;
	
	var $connection;

	/**
	 Secure this!
	 **/
	public function __construct(){
	  	$this->connection = mysqli_connect(
	  							$this->server,  
	  							$this->username,  
	  							$this->password, 
	  							$this->databasename,
	  							$this->port
	  						);

		$this->throwExceptionOnError($this->connection);
	}
	
	/************ php_mode() *************\
	  if called from PHP then set this
	\*************************************/
	public function php_mode()
	{
		$this->phpMode = true;
	}
	
	
	public function _mysqli_close($override=false)
	{		
				
		if ($this->phpMode==true && $override==false)
		{
			return;
		}
		
		mysqli_close($this->connection);
	}
	
	/**
	 * Utitity function to throw an exception if an error occurs 
	 * while running a mysql command.
	 */
	private function throwExceptionOnError($link = null) {
		if($link == null) {
			$link = $this->connection;
		}
		if(mysqli_error($link)) {
			$msg = mysqli_errno($link) . ": " . mysqli_error($link);
			throw new Exception('MySQL Error - '. $msg);
		}		
	}
	
	
}


?>