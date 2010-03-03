<?php

include("DatabaseConnector.php");

class TblLoginService {

	var $tablename = "tblLogin";
	
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
	public function getAllTblLogin() {

		$stmt = mysqli_prepare($this->mysql->connection, "SELECT * FROM $this->tablename");		
		$this->throwExceptionOnError();
		
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		$rows = array();
		
		mysqli_stmt_bind_result($stmt, $row->RowID, $row->MemberID, $row->LoginTime, $row->LogoutTime, $row->IPAddress);
		
	    while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
	      $row = new stdClass();
	      mysqli_stmt_bind_result($stmt, $row->RowID, $row->MemberID, $row->LoginTime, $row->LogoutTime, $row->IPAddress);
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
	public function getTblLoginByID($itemID) {
		
		$stmt = mysqli_prepare($this->mysql->connection, "SELECT * FROM $this->tablename where RowID=?");
		$this->throwExceptionOnError();
		
		mysqli_bind_param($stmt, 'i', $itemID);		
		$this->throwExceptionOnError();
		
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		mysqli_stmt_bind_result($stmt, $row->RowID, $row->MemberID, $row->LoginTime, $row->LogoutTime, $row->IPAddress);
		
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
	public function createTblLogin($item) {
	
		$stmt = mysqli_prepare($this->mysql->connection, "INSERT INTO $this->tablename (RowID, MemberID, LoginTime, LogoutTime, IPAddress) VALUES (?, ?, ?, ?, ?)");		
		$this->throwExceptionOnError();
		
		mysqli_bind_param($stmt, 'iisss', $item->RowID, $item->MemberID, $item->LoginTime, $item->LogoutTime, $item->IPAddress);		
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
	public function updateTblLogin($item) {
	
		$stmt = mysqli_prepare($this->mysql->connection, "UPDATE $this->tablename SET RowID=?, MemberID=?, LoginTime=?, LogoutTime=?, IPAddress=?	WHERE RowID=?");		
		$this->throwExceptionOnError();
		
		mysqli_bind_param($stmt, 'iisssi', $item->RowID, $item->MemberID, $item->LoginTime, $item->LogoutTime, $item->IPAddress, $item->RowID);		
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
	public function deleteTblLogin($itemID) {
				
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
	public function getTblLogin_paged($startIndex, $numItems) {
		
		$stmt = mysqli_prepare($this->mysql->connection, "SELECT * FROM $this->tablename LIMIT ?, ?");
		$this->throwExceptionOnError();
		
		mysqli_bind_param($stmt, 'ii', $startIndex, $numItems);
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		$rows = array();
		
		mysqli_stmt_bind_result($stmt, $row->RowID, $row->MemberID, $row->LoginTime, $row->LogoutTime, $row->IPAddress);
		
	    while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
	      $row = new stdClass();
	      mysqli_stmt_bind_result($stmt, $row->RowID, $row->MemberID, $row->LoginTime, $row->LogoutTime, $row->IPAddress);
	    }
		
		mysqli_stmt_free_result($stmt);		
		$this->mysql->_mysqli_close();
		
		return $rows;
	}
	

	
	/****** logout( $SessionID - rowid from sessionTable, $memberID - member ID if known) *******\
		Returns void
		--    
	\********************************************************************************************/
	//sessionID really Login->RowID
	public function logout($SessionID, $memberID=0)
	{
		if ($memberID)
			$stmt = mysqli_prepare($this->mysql->connection, "UPDATE $this->tablename SET LogoutTime=Now() where MemberID=?");
		else
			$stmt = mysqli_prepare($this->mysql->connection, "UPDATE $this->tablename SET LogoutTime=Now() where RowID=?");
		$this->throwExceptionOnError();
		

		$val = ( ($memberID) ? $memberID : $SessionID );
		mysqli_bind_param($stmt, 'i', $val);			
		$this->throwExceptionOnError();

		mysqli_stmt_execute($stmt);		
		$this->throwExceptionOnError();
		
		mysqli_stmt_free_result($stmt);		
		
		//close mysql session if called from flex
		if (!$memberID)
			$this->mysql->_mysqli_close();
	}
	
	
	/****** login($user - email address, $pass - encrypted password) *******\
		Returns SessionID
		--    
	\***********************************************************************/
	//login should only be called if there is no valid session
	public function login($user, $pass)
	{
		$ret = new StdClass();
		$ret->MemberID = 0;
		$ret->SessionID = 0;
		
		$MemberID = 0;
		//get memberID if username and password matches
		$stmt = mysqli_prepare($this->mysql->connection, "SELECT RowID FROM tblMembers where UserName=? AND Password=?");
		$this->throwExceptionOnError();
		
		mysqli_bind_param($stmt, 'ss', $user, $pass);		
		$this->throwExceptionOnError();
		
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		mysqli_stmt_bind_result($stmt, $row->RowID);
		
		if(mysqli_stmt_fetch($stmt)) 
			$MemberID = $row->RowID;
		
		mysqli_stmt_free_result($stmt);	
		
		if (!$MemberID)
		{
			$this->mysql->_mysqli_close();
			return $ret;
		}
		
		//logout previous sessions for this user
		
		$this->logout(0,$MemberID);
		
		
		//log user login
		
		$stmt = mysqli_prepare($this->mysql->connection, "INSERT INTO $this->tablename (MemberID, LoginTime, IPAddress) VALUES (?, Now(), ?)");		
		$this->throwExceptionOnError();
		
		$ip =$this->getIPAddress();
		mysqli_bind_param($stmt, 'is', $MemberID, $ip);		
		$this->throwExceptionOnError();

		mysqli_stmt_execute($stmt);		
		$this->throwExceptionOnError();
		
		$autoid = mysqli_stmt_insert_id($stmt);
		
		mysqli_stmt_free_result($stmt);		
		$this->mysql->_mysqli_close();
		
		
		$ret->MemberID = $MemberID;
		$ret->SessionID = $autoid;
		return $ret;

	}
	
	
	/****** CheckSession($SessionID - SessionID returned from Login) *******\
		Returns SessionID if valid
		--    
	\***********************************************************************/
	public function CheckSession($SessionID)
	{
		$ret = 0;
		$stmt = mysqli_prepare($this->mysql->connection, "SELECT RowID FROM $this->tablename where RowID=? AND LogoutTime IS NULL AND IPAddress=? AND DATEDIFF(now(),LoginTime) < 10");
		$this->throwExceptionOnError();

		mysqli_bind_param($stmt, 'is', $SessionID, $this->getIPAddress());		
		$this->throwExceptionOnError();
		
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		mysqli_stmt_bind_result($stmt, $row->RowID);
		
		if(mysqli_stmt_fetch($stmt)) 
			$ret = $row->RowID;
		
		mysqli_stmt_free_result($stmt);	
		$this->mysql->_mysqli_close();
		
		return $ret;
	}



	/****** GetMemberID( $SessionID - returned from login function) *******\
		Returns MemberID from SessionID 
		--    
	\**********************************************************************/
	public function GetMemberID($SessionID)
	{
		$MemberID =0;
		$stmt = mysqli_prepare($this->mysql->connection, "SELECT MemberID FROM $this->tablename where RowID=?");
		$this->throwExceptionOnError();

		mysqli_bind_param($stmt, 'i', $SessionID);		
		$this->throwExceptionOnError();
		
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		

		mysqli_stmt_bind_result($stmt, $row->MemberID);
		
		if(mysqli_stmt_fetch($stmt)) {
			$MemberID = $row->MemberID;
		}else{
			$MemberID = 0;
		}

		mysqli_stmt_free_result($stmt);
	    $this->mysql->_mysqli_close();
	
	    return $MemberID;
	}
	
	
	/*************** getIPAddress() ******************\
		Returns IPAddress, ip behind proxy
		--    
	\**************************************************/
    public function getIPAddress() 
    {
        $ip; 
        if (getenv("HTTP_CLIENT_IP")) { 
            $ip = getenv("HTTP_CLIENT_IP"); 
        } else if (getenv("HTTP_X_FORWARDED_FOR")) {
            $ip = getenv("HTTP_X_FORWARDED_FOR");
        } else if(getenv("REMOTE_ADDR")) {
            $ip = getenv("REMOTE_ADDR");
        } else {
            $ip = "UNKNOWN";
        } 
        return $ip;
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
