<?php

require_once("DatabaseConnector.php");

class TblKeywordsService {

	var $tablename = "tblKeywords";

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
	public function getAllTblKeywords() {

		$stmt = mysqli_prepare($this->mysql->connection, "SELECT * FROM $this->tablename");		
		$this->throwExceptionOnError();
		
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		$rows = array();
		
		mysqli_stmt_bind_result($stmt, $row->RowID, $row->Keyword, $row->CRC1, $row->CRC2);
		
	    while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
	      $row = new stdClass();
	      mysqli_stmt_bind_result($stmt, $row->RowID, $row->Keyword, $row->CRC1, $row->CRC2);
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
	public function getTblKeywordsByID($itemID) {
		
		$stmt = mysqli_prepare($this->mysql->connection, "SELECT * FROM $this->tablename where RowID=?");
		$this->throwExceptionOnError();
		
		mysqli_bind_param($stmt, 'i', $itemID);		
		$this->throwExceptionOnError();
		
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		mysqli_stmt_bind_result($stmt, $row->RowID, $row->Keyword, $row->CRC1, $row->CRC2);
		
		if(mysqli_stmt_fetch($stmt)) {
			return $row;
		} else {
			return null;
		}
	}
	
	
	public function getTblKeywordsByCRC($crc) {
		
		$stmt = mysqli_prepare($this->mysql->connection, "SELECT * FROM $this->tablename where CRC1=?");
		$this->throwExceptionOnError();
		
		mysqli_bind_param($stmt, 'i', $crc);		
		$this->throwExceptionOnError();
		
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		mysqli_stmt_bind_result($stmt, $row->RowID, $row->Keyword, $row->CRC1, $row->CRC2);
		
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
	public function createTblKeywords($item) {
	
		$stmt = mysqli_prepare($this->mysql->connection, "INSERT INTO $this->tablename (RowID, Keyword, CRC1, CRC2) VALUES (?, ?, ?, ?)");		
		$this->throwExceptionOnError();
		
		$item->Keyword = trim(strtolower($item->Keyword));
		$item->CRC1 = $this->mysql->ComputeCRC($item->Keyword); //generate crc from keyword
		$item->CRC2 = crc32($item->Keyword) ;

		$item->CRC1 ^= $item->CRC2;
		
		
		mysqli_stmt_bind_param($stmt, 'isii', $item->RowID, $item->Keyword, $item->CRC1, $item->CRC2);		
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
	public function updateTblKeywords($item) {
	
		$stmt = mysqli_prepare($this->mysql->connection, "UPDATE $this->tablename SET RowID=?, CRC1=?, CRC2=?, Keyword=?	WHERE RowID=?");		
		$this->throwExceptionOnError();
		
		$item->Keyword = trim(strtolower($item->Keyword));
		$item->CRC1 = $this->mysql->ComputeCRC($item->Keyword); //generate crc from keyword
		$item->CRC2 = crc32($item->Keyword);
		
		$item->CRC1 ^= $item->CRC2;
				
		mysqli_bind_param($stmt, 'iiisi', $item->RowID,  $row->Keyword, $item->CRC1, $item->CRC2, $item->RowID);		
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
	public function deleteTblKeywords($itemID) {
				
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
	public function getTblKeywords_paged($startIndex, $numItems) {
		
		$stmt = mysqli_prepare($this->mysql->connection, "SELECT * FROM $this->tablename LIMIT ?, ?");
		$this->throwExceptionOnError();
		
		mysqli_bind_param($stmt, 'ii', $startIndex, $numItems);
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		$rows = array();
		
		mysqli_stmt_bind_result($stmt, $row->RowID,  $row->Keyword, $row->CRC1, $row->CRC2);
		
	    while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
	      $row = new stdClass();
	      mysqli_stmt_bind_result($stmt, $row->RowID,  $row->Keyword, $row->CRC1, $row->CRC2);
	    }
		
		mysqli_stmt_free_result($stmt);		
		$this->mysql->_mysqli_close();
		
		return $rows;
	}
	
	/**
	 * Returns list of keywords by list of ID's
	 * 
	 * @return stdClass
	  SELECT * FROM TblLnkKeywordProducts WHERE KeywordID IN (213582, 579004, 213583, 96711)
	  SELECT RowID FROM tblKeywords WHERE CRC1 IN (115314769853, 113275458213, 113188262816, 113219423308, 0)
	 */
	public function getKeywordsByIDList($searchStr) {
	
	    $query =  "select * from $this->tablename WHERE CRC1 IN ($searchStr)";
    
		$stmt = mysqli_prepare($this->mysql->connection, $query);		
		$this->throwExceptionOnError();
		
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		

		$rows = array();
		mysqli_stmt_bind_result($stmt,  $row->RowID, $row->Keyword, $row->CRC1, $row->CRC2);
		
		
	    while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
	      $row = new stdClass();
	      //mysqli_stmt_bind_result($stmt,  $row->RowID,$row->Keyword,$row->CRC1,$row->CRC2,$row->RowID,$row->KeywordID,$row->ProductID,$row->RowID,$row->MemberID,$row->CompanyName,$row->CompanyDesc,$row->YoutubeVideoUrl,$row->GooglePostCode,$row->AddressName,$row->AddressStreet,$row->AddressTown,$row->AddressCounty,$row->AddressPostCode,$row->AddressEmail,$row->AddressTel,$row->AddressMob,$row->AddressFax,$row->status,$row->picUrl);
	   	  mysqli_stmt_bind_result($stmt,  $row->RowID, $row->Keyword, $row->CRC1, $row->CRC2);
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
