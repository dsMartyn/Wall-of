<?php

require_once("DatabaseConnector.php");

class TblHistoryService {

	var $tablename = "tblHistory";

	/*
	 mysql class contains all variables and conncetion method
	*/
	var $mysql;

	public function __construct() {
		$this->mysql = new MySqlConnector();
	}

	/**
	 * Returns all the rows from the table.
	 *
	 * Add authroization or any logical checks for secure access to your data 
	 *
	 * @return array
	 */
	public function getAllTblHistory() {
	/*
		$stmt = mysqli_prepare($this->mysql->connection, "SELECT * FROM $this->tablename");		
		$this->throwExceptionOnError();
		
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		$rows = array();
		
		mysqli_stmt_bind_result($stmt, $row->RowID, $row->IPAddress, $row->Page, $row->Referrer, $row->MemberID);
		
	    while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
	      $row = new stdClass();
	      mysqli_stmt_bind_result($stmt, $row->RowID, $row->IPAddress, $row->Page, $row->Referrer, $row->MemberID);
	    }
		
		mysqli_stmt_free_result($stmt);
	    $this->mysql->_mysqli_close();
	
	    return $rows;
	   */
	}

	/**
	 * Returns the item corresponding to the value specified for the primary key.
	 *
	 * Add authroization or any logical checks for secure access to your data 
	 *
	 * 
	 * @return stdClass
	 */
	public function getTblHistoryByID($itemID) {
		/*
		$stmt = mysqli_prepare($this->mysql->connection, "SELECT * FROM $this->tablename where RowID=?");
		$this->throwExceptionOnError();
		
		mysqli_bind_param($stmt, 'i', $itemID);		
		$this->throwExceptionOnError();
		
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		mysqli_stmt_bind_result($stmt, $row->RowID, $row->IPAddress, $row->Page, $row->Referrer, $row->MemberID);
		
		if(mysqli_stmt_fetch($stmt)) {
			return $row;
		} else {
			return null;
		}*/
	}



	/**
	 * Returns the item corresponding to the value specified for the primary key.
	 *
	 * Add authroization or any logical checks for secure access to your data 
	 *
	 * 
	 * @return stdClass
	 */
	public function createTblHistory($item) {
	
		$stmt = mysqli_prepare($this->mysql->connection, "INSERT INTO tblHistory (RowID, IPAddress, Page, Referrer, MemberID, ItemDate, SessionID, Location, agent) VALUES (?, ?, ?, ?, ?, Now(), ?, ?, ?)");		
		$this->throwExceptionOnError();
		
		mysqli_bind_param($stmt, 'isssisss', $item->RowID, $item->IPAddress, $item->Page, $item->Referrer, $item->MemberID, $item->SessionID, $item->Location, $item->agent);		
		$this->throwExceptionOnError();

		mysqli_stmt_execute($stmt);		
		$this->throwExceptionOnError();
		
		$autoid = mysqli_stmt_insert_id($stmt);
		
		mysqli_stmt_free_result($stmt);		
		$this->mysql->_mysqli_close();
		
		return $autoid;
	}


	public function getTblCountry($ipNumber) {
		
		$stmt = mysqli_prepare($this->mysql->connection, "SELECT COUNTRY_NAME FROM tblCountries WHERE IP_FROM <= $ipNumber and IP_TO >= $ipNumber");
		$this->throwExceptionOnError();
		
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		mysqli_stmt_bind_result($stmt, $row->COUNTRY_NAME);
		
		if(mysqli_stmt_fetch($stmt)) {
			return $row->COUNTRY_NAME;
		} else {
			return null;
		}
	}
	
	public function logUserAction($searchStr, $productId, $memberId)
	{
		if (!session_id())
			session_start();
		
		$stmt = mysqli_prepare($this->mysql->connection, "INSERT INTO tblWallHistory (RowID, SearchString, ProductId, MemberId, SessionId,IPAddress, ActionDate) VALUES (0, ?, ?, ?,?,?, Now())");		
		$this->throwExceptionOnError();
		
		$sessionID = "id-" . session_id();
		$ip = $this->getIPAddress();
		
		mysqli_bind_param($stmt, 'siiss', $searchStr, $productId, $memberId, $sessionID, $ip);		
		$this->throwExceptionOnError();

		mysqli_stmt_execute($stmt);		
		$this->throwExceptionOnError();
		
		$autoid = mysqli_stmt_insert_id($stmt);
		
		mysqli_stmt_free_result($stmt);		
		$this->mysql->_mysqli_close();
		
		return $autoid;
	}



	/**
	 * Returns the number of rows in the table.
	 *
	 * Add authroization or any logical checks for secure access to your data 
	 *
	 * 
	 */
	public function count() {
		$stmt = mysqli_prepare($this->mysql->connection, "SELECT COUNT(*) AS COUNT FROM $this->tablename");
		$this->throwExceptionOnError();

		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		mysqli_stmt_bind_result($stmt, $rec_count);
		$this->throwExceptionOnError();
		
		mysqli_stmt_fetch($stmt);
		$this->throwExceptionOnError();
		
		mysqli_stmt_free_result($stmt);
		$this->mysql->_mysqli_close();
		
		return $rec_count;
	}


	/**
	 * Returns $numItems rows starting from the $startIndex row from the 
	 * table.
	 *
	 * Add authroization or any logical checks for secure access to your data 
	 *
	 * 
	 * 
	 * @return array
	 */
	public function getTblHistory_paged($startIndex, $numItems) {
		/*
		$stmt = mysqli_prepare($this->mysql->connection, "SELECT * FROM $this->tablename LIMIT ?, ?");
		$this->throwExceptionOnError();
		
		mysqli_bind_param($stmt, 'ii', $startIndex, $numItems);
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		$rows = array();
		
		mysqli_stmt_bind_result($stmt, $row->RowID, $row->IPAddress, $row->Page, $row->Referrer, $row->MemberID);
		
	    while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
	      $row = new stdClass();
	      mysqli_stmt_bind_result($stmt, $row->RowID, $row->IPAddress, $row->Page, $row->Referrer, $row->MemberID);
	    }
		
		mysqli_stmt_free_result($stmt);		
		$this->mysql->_mysqli_close();
		
		return $rows;
		*/
	}
	
	
	/**
	 * Utitity function to throw an exception if an error occurs 
	 * while running a mysql command.
	 */
	private function throwExceptionOnError($link = null) {
		if($link == null) {
			$link = $this->mysql->connection;
		}
		if(mysqli_error($link)) {
			$msg = mysqli_errno($link) . ": " . mysqli_error($link);
			throw new Exception('MySQL Error - '. $msg);
		}		
	}
	
		
	public function getIPAddress() 
	{
		$ip = "UNKNOWN"; 
		if (getenv("HTTP_CLIENT_IP")) { 
			$ip = getenv("HTTP_CLIENT_IP"); 
		} else if (getenv("HTTP_X_FORWARDED_FOR")) {
			$ip = getenv("HTTP_X_FORWARDED_FOR");
		} else if(getenv("REMOTE_ADDR")) {
			$ip = getenv("REMOTE_ADDR");
		}
		return $ip;
	} 
    
	public function getReferer()
	{
		$ref = "unknown";
		if (getenv("HTTP_REFERER")){
			$ref = getenv("HTTP_REFERER");
		} else if (isset($_SERVER['HTTP_REFERER'])) {
			$ref = $_SERVER['HTTP_REFERER'];
		} else if (isset($_SERVER['SCRIPT_URI'])) {
			$ref = $_SERVER['SCRIPT_URI'];
		} else if (getenv('SCRIPT_URI')) {
			$ref = getenv('SCRIPT_URI');
		}
		return $ref;
	}
	
	
}

?>
