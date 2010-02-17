<?php

include("DatabaseConnector.php");

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
		}
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
	
		$stmt = mysqli_prepare($this->mysql->connection, "INSERT INTO $this->tablename (RowID, IPAddress, Page, Referrer, MemberID) VALUES (?, ?, ?, ?, ?)");		
		$this->throwExceptionOnError();
		
		mysqli_bind_param($stmt, 'iiiii', $item->RowID, $item->IPAddress, $item->Page, $item->Referrer, $item->MemberID);		
		$this->throwExceptionOnError();

		mysqli_stmt_execute($stmt);		
		$this->throwExceptionOnError();
		
		$autoid = mysqli_stmt_insert_id($stmt);
		
		mysqli_stmt_free_result($stmt);		
		$this->mysql->_mysqli_close();
		
		return $autoid;
	}

	/**
	 * Updates the passed item in the table.
	 *
	 * Add authroization or any logical checks for secure access to your data 
	 *
	 * @param stdClass $item
	 * @return void
	 */
	public function updateTblHistory($item) {
	
		$stmt = mysqli_prepare($this->mysql->connection, "UPDATE $this->tablename SET RowID=?, IPAddress=?, Page=?, Referrer=?, MemberID=?	WHERE RowID=?");		
		$this->throwExceptionOnError();
		
		mysqli_bind_param($stmt, 'iiiiii', $item->RowID, $item->IPAddress, $item->Page, $item->Referrer, $item->MemberID, $item->RowID);		
		$this->throwExceptionOnError();

		mysqli_stmt_execute($stmt);		
		$this->throwExceptionOnError();
		
		mysqli_stmt_free_result($stmt);		
		$this->mysql->_mysqli_close();
	}

	/**
	 * Deletes the item corresponding to the passed primary key value from 
	 * the table.
	 *
	 * Add authroization or any logical checks for secure access to your data 
	 *
	 * 
	 * @return void
	 */
	public function deleteTblHistory($itemID) {
				
		$stmt = mysqli_prepare($this->mysql->connection, "DELETE FROM $this->tablename WHERE RowID = ?");
		$this->throwExceptionOnError();
		
		mysqli_bind_param($stmt, 'i', $itemID);
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		mysqli_stmt_free_result($stmt);		
		$this->mysql->_mysqli_close();
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
}

?>
