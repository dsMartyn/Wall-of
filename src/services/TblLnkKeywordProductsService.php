<?php


require_once("DatabaseConnector.php");

class TblLnkKeywordProductsService {


	var $tablename = "tblLnkKeywordProducts";
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
	public function getAllTblLnkKeywordProducts() {

		$stmt = mysqli_prepare($this->mysql->connection, "SELECT * FROM $this->tablename");		
		$this->throwExceptionOnError();
		
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		$rows = array();
		
		mysqli_stmt_bind_result($stmt, $row->RowID, $row->KeywordID, $row->ProductID);
		
	    while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
	      $row = new stdClass();
	      mysqli_stmt_bind_result($stmt, $row->RowID, $row->KeywordID, $row->ProductID);
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
	public function getTblLnkKeywordProductsByID($keywordId, $productId) {
		
		$stmt = mysqli_prepare($this->mysql->connection, "SELECT * FROM $this->tablename where ProductID=? AND KeywordID=?");
		$this->throwExceptionOnError();
		
		mysqli_bind_param($stmt, 'ii', $productId, $keywordId);		
		$this->throwExceptionOnError();
		
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		mysqli_stmt_bind_result($stmt, $row->RowID, $row->KeywordID, $row->ProductID);
		
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
	public function createTblLnkKeywordProducts($item) {
	
		$stmt = mysqli_prepare($this->mysql->connection, "INSERT INTO $this->tablename (RowID, KeywordID, ProductID) VALUES (?, ?, ?)");		
		$this->throwExceptionOnError();
		
		mysqli_bind_param($stmt, 'iii', $item->RowID, $item->KeywordID, $item->ProductID);		
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
	public function updateTblLnkKeywordProducts($item) {
	
		$stmt = mysqli_prepare($this->mysql->connection, "UPDATE $this->tablename SET RowID=?, KeywordID=?, ProductID=?	WHERE RowID=?");		
		$this->throwExceptionOnError();
		
		mysqli_bind_param($stmt, 'iiii', $item->RowID, $item->KeywordID, $item->ProductID, $item->RowID);		
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
	public function deleteTblProduct($productID) {
				
		$stmt = mysqli_prepare($this->mysql->connection, "DELETE FROM $this->tablename WHERE ProductID = ?");
		$this->throwExceptionOnError();
		
		mysqli_bind_param($stmt, 'i', $itemID);
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		mysqli_stmt_free_result($stmt);		
		$this->mysql->_mysqli_close();
	}


	public function deleteTblKeyword($keywordID) {
				
		$stmt = mysqli_prepare($this->mysql->connection, "DELETE FROM $this->tablename WHERE KeywordID = ?");
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
	public function getTblLnkKeywordProducts_paged($startIndex, $numItems) {
		
		$stmt = mysqli_prepare($this->mysql->connection, "SELECT * FROM $this->tablename LIMIT ?, ?");
		$this->throwExceptionOnError();
		
		mysqli_bind_param($stmt, 'ii', $startIndex, $numItems);
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		$rows = array();
		
		mysqli_stmt_bind_result($stmt, $row->RowID, $row->KeywordID, $row->ProductID);
		
	    while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
	      $row = new stdClass();
	      mysqli_stmt_bind_result($stmt, $row->RowID, $row->KeywordID, $row->ProductID);
	    }
		
		mysqli_stmt_free_result($stmt);		
		$this->mysql->_mysqli_close();
		
		return $rows;
	}
	
	

	/**
	 * Returns list of products that are linked to the keywords
	 * 
	 * @return stdClass
	  SELECT * FROM TblLnkKeywordProducts WHERE KeywordID IN (213582, 579004, 213583, 96711)
	  SELECT RowID FROM tblKeywords WHERE CRC1 IN (115314769853, 113275458213, 113188262816, 113219423308, 0)
	 */
	public function getTblLnkKeywordProductsList($searchStr) {
		
 		$query =  "select * from $this->tablename WHERE KeywordID IN ($searchStr)";
		$stmt = mysqli_prepare($this->mysql->connection, $query);	
		
		$this->throwExceptionOnError();
		
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		

		$rows = array();
		mysqli_stmt_bind_result($stmt,  $row->RowID,$row->KeywordID,$row->ProductID);
		
	    while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
	      $row = new stdClass();
	   	  mysqli_stmt_bind_result($stmt,  $row->RowID,$row->KeywordID,$row->ProductID);
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
