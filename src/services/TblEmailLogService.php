<?php

include("DatabaseConnector.php");

class TblEmailLogService {

	var $tablename = "tblEmailLog";
	
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
	public function getAllTblEmailLog() {

		$stmt = mysqli_prepare($this->mysql->connection, "SELECT * FROM $this->tablename");		
		$this->throwExceptionOnError();
		
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		$rows = array();
		
		mysqli_stmt_bind_result($stmt, $row->RowID, $row->Email, $row->Sender, $row->Subject, $row->Body, $row->Headers, $row->MemberID);
		
	    while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
	      $row = new stdClass();
	      mysqli_stmt_bind_result($stmt, $row->RowID, $row->Email, $row->Sender, $row->Subject, $row->Body, $row->Headers, $row->MemberID);
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
	public function getTblEmailLogByID($itemID) {
		
		$stmt = mysqli_prepare($this->mysql->connection, "SELECT * FROM $this->tablename where RowID=?");
		$this->throwExceptionOnError();
		
		mysqli_bind_param($stmt, 'i', $itemID);		
		$this->throwExceptionOnError();
		
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		mysqli_stmt_bind_result($stmt, $row->RowID, $row->Email, $row->Sender, $row->Subject, $row->Body, $row->Headers, $row->MemberID);
		
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
	public function createTblEmailLog($item) {
	
		$stmt = mysqli_prepare($this->mysql->connection, "INSERT INTO $this->tablename (RowID, Email, Sender, Subject, Body, Headers, MemberID) VALUES (?, ?, ?, ?, ?, ?, ?)");		
		$this->throwExceptionOnError();
		
		mysqli_bind_param($stmt, 'isssssi', $item->RowID, $item->Email, $item->Sender, $item->Subject, $item->Body, $item->Headers, $item->MemberID);		
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
	public function updateTblEmailLog($item) {
	
		$stmt = mysqli_prepare($this->mysql->connection, "UPDATE $this->tablename SET RowID=?, Email=?, Sender=?, Subject=?, Body=?, Headers=?, MemberID=?	WHERE RowID=?");		
		$this->throwExceptionOnError();
		
		mysqli_bind_param($stmt, 'isssssii', $item->RowID, $item->Email, $item->Sender, $item->Subject, $item->Body, $item->Headers, $item->MemberID, $item->RowID);		
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
	public function deleteTblEmailLog($itemID) {
				
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
	public function getTblEmailLog_paged($startIndex, $numItems) {
		
		$stmt = mysqli_prepare($this->mysql->connection, "SELECT * FROM $this->tablename LIMIT ?, ?");
		$this->throwExceptionOnError();
		
		mysqli_bind_param($stmt, 'ii', $startIndex, $numItems);
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		$rows = array();
		
		mysqli_stmt_bind_result($stmt, $row->RowID, $row->Email, $row->Sender, $row->Subject, $row->Body, $row->Headers, $row->MemberID);
		
	    while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
	      $row = new stdClass();
	      mysqli_stmt_bind_result($stmt, $row->RowID, $row->Email, $row->Sender, $row->Subject, $row->Body, $row->Headers, $row->MemberID);
	    }
		
		mysqli_stmt_free_result($stmt);		
		$this->mysql->_mysqli_close();
		
		return $rows;
	}
	
	

	/************** email_reg_info($to - email address, $name - person) ***************\
		-- 
		returns void
	\*****************************/
	private function email_reg_info($to, $name, $memberID)
	{
		$subject = 'Account registration.';
		
		$message = 'Thank you for registering at Wall-of ' . $name .  "\r\n" . 
				   'The next time you wish to log in to your new account, simply go to the Wall-of.com home page and log in with your email address and password.';
		
		$headers = 'From: no-reply@wall-of.com' . "\r\n" .
					'Content-type: text/html; charset=iso-8859-1' . "\r\n" . 
				   'X-Mailer: PHP/' . phpversion();
				
		mail($to, $subject, $message, $headers);
		
		//store email in log
		$item->RowID=0;
		$item->Email = $to;
		$item->Sender = "no-reply@wall-of.com";
		$item->Subject  = $subject;
		$item->Body = $message;
		$item->Headers = $headers;
		$item->MemberID = $memberID;

		$this->createTblEmailLog($item);
		
	}


	/************** email_update_info($to - email address, $name - person) ***************\
		-- 
		returns void
	\*****************************/
	private function email_update_info($to, $name, $memberID)
	{
		$subject = 'Account Updated.';
		
		$message = 'Someone hopefully you ' . $name .  " has updated your account at www.wall-of.com\r\n" . 
				   'if this was not you please reply to this email keeping the original content.';
		
		$headers = 'From: admin@wall-of.com' . "\r\n" .
					'Content-type: text/html; charset=iso-8859-1' . "\r\n" . 
				   'X-Mailer: PHP/' . phpversion();
				
		mail($to, $subject, $message, $headers);
		
		
		//store email in log
		$item->RowID=0;
		$item->Email = $to;
		$item->Sender = "no-reply@wall-of.com";
		$item->Subject  = $subject;
		$item->Body = $message;
		$item->Headers = $headers;
		$item->MemberID = $memberID;

		$this->createTblEmailLog($item);
	}


	/************** email_friend($to - email, $name - person, $comment - message to person) ***************\
		-- 
		returns void
	\*****************************/
	public function email_friend($to, $name, $comment, $memberID)
	{
		$subject = 'Invite from wall-of';
		
		$message =  $name . ' has invited you to join wall-of' . "\r\n" . 
				   'I wanted to let you know about wall-of, a new fun interactive internet buying selling, social and advertisement web site.'  . "<br>\r\n" .
				   'wall of contains over a thousand businesses and is growing constantly. with google wall-of will boost your business popularity in minutes!'  . "<br>\r\n" .
				   'fast quick and easy registration just sign up today at wall-of' . "<br>\r\n" . "<br>\r\n" .
				   'http://www.wall-of.com' . "<br>\r\n" .
				   'Thanks for your support.' . "<br>\r\n" .
				   'Wall-of Team.' . "<br>\r\n";
		
		$headers = 'From: no-reply@wall-of.com' . "\r\n" .
					'Content-type: text/html; charset=iso-8859-1' . "\r\n" . 
				   'X-Mailer: PHP/' . phpversion();
				
		mail($to, $subject, $message, $headers);
		
		//store email in log
		$item->RowID=0;
		$item->Email = $to;
		$item->Sender = "no-reply@wall-of.com";
		$item->Subject  = $subject;
		$item->Body = $message;
		$item->Headers = $headers;
		$item->MemberID = $memberID;

		$this->createTblEmailLog($item);
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
