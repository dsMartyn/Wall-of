<?php

/*
  CRUD Service � 2009 Martyn Gilbertson. All Rights Reserved.
  
  Written by: Martyn Gilbertson Unless otherwise stated
  CRUD class template generated by Flash Builder 4
  Created for Wall Of
  
  This module contains all functions  for accessing the `Wall Of` Database 

  User Login and Session Methods
  Creating Members and Products
  Retrieving Members and Products
  Updating  Members and Products
  Deleting Members and Products

 Notes:
   Refer to documentation for mysqli_bind_param 'types' parameter at http://www.php.net/manual/en/mysqli-stmt.bind-param.php

 ---------------------------------
 Version 1.0.0: Initial Release
 ---------------------------------

  [Legend]

	[+] Added Feature
	[*] Improved/changed feature
	[-] Bug fixed

*/

class crud {


/*
	var $username = "wallof_dev";
	var $password = "HlVmedFb>{Di";
	var $databasename = "wallof_wallof";
	var $server = "127.0.0.1";
	var $port = "3306";
*/	
	
	var $username = "root";
	var $password = "";
	var $databasename = "wallof";
	var $server = "127.0.0.1";
	var $port = "3306";
	
	
	var $memberTable = "tblMembers";
	var $loginTable = "tblLogin";
	var $productTable = "tblProducts";

	var $connection;
	var $Version = '1.0.0';
	var $phpMode = false;
	
	

	public function __construct() 
	{
	
		// Connect to Database
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
	
	
	/*********** _mysqli_close **********\
		-- closes mysql connection
		-- ignore if runnin in php mode
	\***********************************/
	private function _mysqli_close()
	{		
		if (!$this->phpMode)
		{
			mysqli_close($this->connection);
		}
	}
	

	/******** getProducts( $SessionID - returned from Login() function ) *********\
		Returns product object Array 
		--    RowID,  MemberID,  Friendly_Name, Panel1_LogoPic,  
		--    Panel2_CompanyName,  Panel2_CompanyURL, 
		--    Panel2_Company_Description, Panel2_Contact_Details,
		--    Panel3_Extended_Description, Panel4_Video_URL,
		--    Panel4_Description, Keywords, Clicks
	\*****************************************************************************/
	public function getProducts($SessionID) 
	{

		$stmt = mysqli_prepare($this->connection, "SELECT a.* FROM $this->productTable a, $this->loginTable b WHERE a.MemberID = b.MemberID AND b.RowId=?");		
		$this->throwExceptionOnError();
		
		mysqli_bind_param($stmt, 'i', $SessionID);		
		$this->throwExceptionOnError();
		
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		$rows = array();

		mysqli_stmt_bind_result($stmt, $row->RowID,  $row->MemberID,  $row->Friendly_Name, $row->Panel1_LogoPic,  
								$row->Panel2_CompanyName,  $row->Panel2_CompanyURL,  $row->Panel2_Company_Description, $row->Panel2_Contact_Details,
								$row->Panel3_Extended_Description, $row->Panel4_Video_URL, $row->Panel4_Description, $row->Keywords, $row->Clicks);
		
	    while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
 	      $row = new stdClass();
 		  mysqli_stmt_bind_result($stmt, $row->RowID,  $row->MemberID, $row->Friendly_Name, $row->Panel1_LogoPic,  
			    				  $row->Panel2_CompanyName,  $row->Panel2_CompanyURL,  $row->Panel2_Company_Description, $row->Panel2_Contact_Details,
					    		  $row->Panel3_Extended_Description, $row->Panel4_Video_URL, $row->Panel4_Description, $row->Keywords, $row->Clicks);
	    }
	    
		mysqli_stmt_free_result($stmt);
	    $this->_mysqli_close($this->connection);
	
	    return $rows;
	}

	/********** getProduct( $ProductID - returned from Search function ) *********\
		Returns Product object
		--    RowID,  MemberID,  Friendly_Name, Panel1_LogoPic,  
		--    Panel2_CompanyName,  Panel2_CompanyURL, 
		--    Panel2_Company_Description, Panel2_Contact_Details,
		--    Panel3_Extended_Description, Panel4_Video_URL,
		--    Panel4_Description, Keywords, Clicks
	\*****************************************************************************/
	public function getProduct($productID) 
	{

		$stmt = mysqli_prepare($this->connection, "SELECT * FROM $this->productTable where RowID=?");
		$this->throwExceptionOnError();
		
		mysqli_bind_param($stmt, 'i', $productID);		
		$this->throwExceptionOnError();
		
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		mysqli_stmt_bind_result($stmt, $row->RowID,  $row->MemberID,  $row->Friendly_Name, $row->Panel1_LogoPic,  
								$row->Panel2_CompanyName,  $row->Panel2_CompanyURL,  $row->Panel2_Company_Description, $row->Panel2_Contact_Details,
								$row->Panel3_Extended_Description, $row->Panel4_Video_URL, $row->Panel4_Description, $row->Keywords, $row->Clicks);
		
		if(mysqli_stmt_fetch($stmt)) {
			$ret = $row; //use $ret so we can return NULL if fetch failed
		} 
		
		mysqli_stmt_free_result($stmt);
	    $this->_mysqli_close($this->connection);
	    
	    return $ret;
	}
	

	/********** getProduct( $startIndex index into table to start reading items, $numItems max items to return per query) *********\
		Returns Product object array
		--    RowID,  MemberID,  Friendly_Name, Panel1_LogoPic,  
		--    Panel2_CompanyName,  Panel2_CompanyURL, 
		--    Panel2_Company_Description, Panel2_Contact_Details,
		--    Panel3_Extended_Description, Panel4_Video_URL,
		--    Panel4_Description, Keywords, Clicks
	\*****************************************************************************/
	public function getProducts_paged($startIndex, $numItems) 
	{

		$stmt = mysqli_prepare($this->connection, "SELECT * FROM $this->productTable LIMIT ?, ?");
		$this->throwExceptionOnError();
		
		mysqli_bind_param($stmt, 'ii', $startIndex, $numItems);
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		$rows = array();

		mysqli_stmt_bind_result($stmt, $row->RowID,  $row->MemberID,  $row->Friendly_Name, $row->Panel1_LogoPic,  
								$row->Panel2_CompanyName,  $row->Panel2_CompanyURL,  $row->Panel2_Company_Description, $row->Panel2_Contact_Details,
								$row->Panel3_Extended_Description, $row->Panel4_Video_URL, $row->Panel4_Description, $row->Keywords, $row->Clicks);
		
	    while (mysqli_stmt_fetch($stmt))
	    {
	      $rows[] = $row;
	      $row = new stdClass();
		  mysqli_stmt_bind_result($stmt, $row->RowID,  $row->MemberID,  $row->Friendly_Name, $row->Panel1_LogoPic,  
								  $row->Panel2_CompanyName,  $row->Panel2_CompanyURL,  $row->Panel2_Company_Description, $row->Panel2_Contact_Details,
								  $row->Panel3_Extended_Description, $row->Panel4_Video_URL, $row->Panel4_Description, $row->Keywords, $row->Clicks);
		}
		
		mysqli_stmt_free_result($stmt);		
		$this->_mysqli_close($this->connection);
		
		return $rows;	
	}	
	
	
	/*************************** createProduct( $item - product Object) **************************\
		Returns Auto ID Index
		-- 	Product Object
		--    MemberID,  Friendly_Name, Panel1_LogoPic,  
		--    Panel2_CompanyName,  Panel2_CompanyURL, 
		--    Panel2_Company_Description, Panel2_Contact_Details,
		--    Panel3_Extended_Description, Panel4_Video_URL,
		--    Panel4_Description, Keywords
	\*****************************************************************************/
	public function createProduct($item) 
	{
		$stmt = mysqli_prepare($this->connection, "INSERT INTO $this->productTable (MemberID, Friendly_Name, Panel1_LogoPic, Panel2_CompanyName, Panel2_CompanyURL, Panel2_Company_Description, Panel2_Contact_Details, Panel3_Extended_Description, Panel4_Video_URL, Panel4_Description, Keywords) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
		$this->throwExceptionOnError();
		
		mysqli_bind_param($stmt, 'issssssssss', $item->MemberID,  $item->Friendly_Name, $item->Panel1_LogoPic,  
								  $item->Panel2_CompanyName,  $item->Panel2_CompanyURL,  $item->Panel2_Company_Description, $item->Panel2_Contact_Details,
								  $item->Panel3_Extended_Description, $item->Panel4_Video_URL, $item->Panel4_Description, $item->Keywords);		
		$this->throwExceptionOnError();

		mysqli_stmt_execute($stmt);		
		$this->throwExceptionOnError();
		
		$autoid = mysqli_stmt_insert_id($stmt);
		
		mysqli_stmt_free_result($stmt);		
		$this->_mysqli_close($this->connection);
		
		return $autoid;
	}


	
	/*************************** updateProduct( $item - product Object ) **************************\
		Returns void
		--  Product Object
		--    MemberID,  Friendly_Name, Panel1_LogoPic,  
		--    Panel2_CompanyName,  Panel2_CompanyURL, 
		--    Panel2_Company_Description, Panel2_Contact_Details,
		--    Panel3_Extended_Description, Panel4_Video_URL,
		--    Panel4_Description, Keywords, RowID
	\*****************************************************************************/
	public function updateProduct($item) 
	{
		
		$stmt = mysqli_prepare($this->connection, "UPDATE $this->productTable SET MemberID=?, Friendly_Name=?, Panel1_LogoPic=?, Panel2_CompanyName=?, Panel2_CompanyURL=?, Panel2_Company_Description=?, Panel2_Contact_Details=?, Panel3_Extended_Description=?, Panel4_Video_URL=?, Panel4_Description=?, Keywords=? WHERE RowID=?");		
		$this->throwExceptionOnError();		
		
		mysqli_bind_param($stmt, 'issssssssssi', $item->MemberID,  $item->Friendly_Name, $item->Panel1_LogoPic,  
								  $item->Panel2_CompanyName,  $item->Panel2_CompanyURL,  $item->Panel2_Company_Description, $item->Panel2_Contact_Details,
								  $item->Panel3_Extended_Description, $item->Panel4_Video_URL, $item->Panel4_Description, $item->Keywords, $item->RowID);		
		$this->throwExceptionOnError();

		mysqli_stmt_execute($stmt);		
		$this->throwExceptionOnError();
		
		mysqli_stmt_free_result($stmt);		
		$this->_mysqli_close($this->connection);
	}


	/****** deleteProduct( $itemID ) *************\
		Returns void
		--    $itemID - Products Identifier  
	\*********************************************/
	public function deleteProduct($itemID) 
	{
		
		$stmt = mysqli_prepare($this->connection, "DELETE FROM $this->productTable WHERE RowID = ?");
		$this->throwExceptionOnError();
		
		mysqli_bind_param($stmt, 'i', $itemID);	
		
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		mysqli_stmt_free_result($stmt);		
		$this->_mysqli_close($this->connection);
	}

	/****** countProducts() ******\
		Returns count of products
		--    
	\*****************************/
	public function countProducts() 
	{

		$stmt = mysqli_prepare($this->connection, "SELECT COUNT(*) AS COUNT FROM $this->productTable");
		$this->throwExceptionOnError();

		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		mysqli_stmt_bind_result($stmt, $rec_count);
		$this->throwExceptionOnError();
		
		mysqli_stmt_fetch($stmt);
		$this->throwExceptionOnError();
		
		mysqli_stmt_free_result($stmt);
		$this->_mysqli_close($this->connection);
		
		return $rec_count;	
	}

	
	/*************** getMembers() ***************\
		Returns Member Object Array
		-- RowID, UserName,  Password,  
		-- FirstName,  LastName,  DOB, 
		-- Company, StartDate
	\********************************************/
	public function getMembers() 
	{

		$stmt = mysqli_prepare($this->connection, "SELECT * FROM $this->memberTable");		
		$this->throwExceptionOnError();
		
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		$rows = array();
		
		mysqli_stmt_bind_result($stmt, $row->RowID, $row->UserName,  $row->Password,  $row->FirstName,  $row->LastName,  $row->DOB,  $row->Company, $row->StartDate);
		
	    while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
	      $row = new stdClass();
	      mysqli_stmt_bind_result($stmt, $row->RowID, $row->UserName,  $row->Password,  $row->FirstName,  $row->LastName,  $row->DOB,  $row->Company, $row->StartDate);
	    }
		
		mysqli_stmt_free_result($stmt);
	    $this->_mysqli_close($this->connection);
	
	    return $rows;
	}

	/*** getMember( $memberID - member identifier ) ****\
		Returns Member Object
		-- RowID, UserName,  Password,  
		-- FirstName,  LastName,  DOB, 
		-- Company, StartDate
	\****************************************************/
	public function getMember($memberID) 
	{

		$stmt = mysqli_prepare($this->connection, "SELECT * FROM $this->memberTable where RowID=?");
		$this->throwExceptionOnError();
		
		mysqli_bind_param($stmt, 'i', $memberID);		
		$this->throwExceptionOnError();
		
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		mysqli_stmt_bind_result($stmt, $row->RowID, $row->UserName,  $row->Password,  $row->FirstName,  $row->LastName,  $row->DOB,  $row->Company, $row->StartDate);
		
		if(mysqli_stmt_fetch($stmt)) {
			$ret = $row; //use $ret so we can return NULL if fetch failed
		} 
		
		mysqli_stmt_free_result($stmt);
	    $this->_mysqli_close($this->connection);
	    
	    return $ret;
	}
	
	/*** getMembers_paged( $startIndex index into table to start reading items, $numItems max items to return per query) ****\
		Returns Member Object
		-- RowID, UserName,  Password,  
		-- FirstName,  LastName,  DOB, 
		-- Company, StartDate
	\****************************************************/
	public function getMembers_paged($startIndex, $numItems) 
	{

		$stmt = mysqli_prepare($this->connection, "SELECT * FROM $this->memberTable LIMIT ?, ?");
		$this->throwExceptionOnError();
		
		mysqli_bind_param($stmt, 'ii', $startIndex, $numItems);
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		$rows = array();

		mysqli_stmt_bind_result($stmt, $row->RowID, $row->UserName,  $row->Password,  $row->FirstName,  $row->LastName,  $row->DOB,  $row->Company, $row->StartDate);
		
	    while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
	      $row = new stdClass();
	      mysqli_stmt_bind_result($stmt, $row->RowID, $row->UserName,  $row->Password,  $row->FirstName,  $row->LastName,  $row->DOB,  $row->Company, $row->StartDates);
	    }
		
		mysqli_stmt_free_result($stmt);		
		$this->_mysqli_close($this->connection);
		
		return $rows;	
	}	
	
	/******** getMember( $item - Member Object ) ********\
		Member Object
		-- RowID, UserName,  Password,  
		-- FirstName,  LastName,  DOB, 
		-- Company, StartDate
	\****************************************************/
	public function createMember($item) 
	{
		$stmt = mysqli_prepare($this->connection, "INSERT INTO $this->memberTable (UserName, Password, FirstName, LastName, DOB, Company, StartDate) VALUES (?, ?, ?, ?, ?, ?, Now())");		
		$this->throwExceptionOnError();
		
		mysqli_bind_param($stmt, 'sssssss',$item->UserName,$item->Password,$item->FirstName,$item->LastName,$item->DOB,$item->Company);		
		$this->throwExceptionOnError();

		mysqli_stmt_execute($stmt);		
		$this->throwExceptionOnError();
		
		$autoid = mysqli_stmt_insert_id($stmt);
		
		mysqli_stmt_free_result($stmt);		
		$this->_mysqli_close($this->connection);
		
		$this->email_reg_info($item->UserName, $item->FirstName . ' ' . $item->LastName);
		
		return $autoid;
	}

	/************** email_reg_info($to - email address, $name - person) ***************\
		-- 
		returns void
	\*****************************/
	private function email_reg_info($to, $name)
	{
		$subject = 'Account registration.';
		
		$message = 'Thank you for registering at Wall-of ' . $name .  "\r\n" . 
				   'The next time you wish to log in to your new account, simply go to the Wall-of.com home page and log in with your email address and password.';
		
		$headers = 'From: no-reply@wall-of.com' . "\r\n" .
					'Content-type: text/html; charset=iso-8859-1' . "\r\n" . 
				   'X-Mailer: PHP/' . phpversion();
				
		mail($to, $subject, $message, $headers);
	}


	public function email_friend($to, $name, $comment)
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
	}



	/******** updateMember( $item - Member Object ) ********\
		Member Object
		-- RowID, UserName,  Password,  
		-- FirstName,  LastName,  DOB, 
		-- Company, StartDate
	\****************************************************/
	public function updateMember($item) 
	{
		
		$stmt = mysqli_prepare($this->connection, "UPDATE $this->memberTable SET UserName=?, Password=?, FirstName=?, LastName=?, DOB=?, Company=?	WHERE RowID=?");		
		$this->throwExceptionOnError();		
		
		mysqli_bind_param($stmt, 'ssssssi',$item->UserName,  $item->Password,  $item->FirstName,  $item->LastName,  $item->DOB,  $item->Company,$item->RowID);			
		$this->throwExceptionOnError();

		mysqli_stmt_execute($stmt);		
		$this->throwExceptionOnError();
		
		mysqli_stmt_free_result($stmt);		
		$this->_mysqli_close($this->connection);
	}


	/****** deleteMember( $itemID ) **************\
		Returns void
		--    $itemID - Members Identifier  
	\*********************************************/
	public function deleteMember($itemID) 
	{
		
		$stmt = mysqli_prepare($this->connection, "DELETE FROM $this->memberTable WHERE RowID = ?");
		$this->throwExceptionOnError();
		
		mysqli_bind_param($stmt, 'i', $itemID);	
		
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		mysqli_stmt_free_result($stmt);		
		$this->_mysqli_close($this->connection);
	}


	/****** countMembers() *******\
		Returns count of members
		--    
	\*****************************/
	public function countMembers() 
	{

		$stmt = mysqli_prepare($this->connection, "SELECT COUNT(*) AS COUNT FROM $this->memberTable");
		$this->throwExceptionOnError();

		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		mysqli_stmt_bind_result($stmt, $rec_count);
		$this->throwExceptionOnError();
		
		mysqli_stmt_fetch($stmt);
		$this->throwExceptionOnError();
		
		mysqli_stmt_free_result($stmt);
		$this->_mysqli_close($this->connection);
		
		return $rec_count;	
	}
	
	

	/****** GetMemberID( $SessionID - returned from login function) *******\
		Returns MemberID from SessionID 
		--    
	\**********************************************************************/
	public function GetMemberID($SessionID)
	{

		$stmt = mysqli_prepare($this->connection, "SELECT MemberID FROM $this->loginTable where RowID=?");
		$this->throwExceptionOnError();

		mysqli_bind_param($stmt, 'i', $SessionID);		
		$this->throwExceptionOnError();
		
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		

		mysqli_stmt_bind_result($stmt, $row->MemberID);
		
		if(mysqli_stmt_fetch($stmt)) {
			$MemberID = $row->MemberID;
		} 

		mysqli_stmt_free_result($stmt);
	    $this->_mysqli_close($this->connection);
	
	    return $MemberID;
	}
	
	/****** logout( $SessionID - rowid from sessionTable, $memberID - member ID if known) *******\
		Returns void
		--    
	\********************************************************************************************/
	//sessionID really Login->RowID
	public function logout($SessionID, $memberID=0)
	{
		if ($memberID)
			$stmt = mysqli_prepare($this->connection, "UPDATE $this->loginTable SET LogoutTime=Now() where MemberID=?");
		else
			$stmt = mysqli_prepare($this->connection, "UPDATE $this->loginTable SET LogoutTime=Now() where RowID=?");
		$this->throwExceptionOnError();
		

		$val = ( ($memberID) ? $memberID : $SessionID );
		mysqli_bind_param($stmt, 'i', $val);			
		$this->throwExceptionOnError();

		mysqli_stmt_execute($stmt);		
		$this->throwExceptionOnError();
		
		mysqli_stmt_free_result($stmt);		
		
		//close mysql session if called from flex
		if (!$memberID)
			$this->_mysqli_close($this->connection);
	}
	
	
	/****** login($user - email address, $pass - encrypted password) *******\
		Returns SessionID
		--    
	\***********************************************************************/
	//login should only be called if there is no valid session
	public function login($user, $pass)
	{
		//get memberID if username and password matches
		$stmt = mysqli_prepare($this->connection, "SELECT RowID FROM $this->memberTable where UserName=? AND Password=?");
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
			$this->_mysqli_close($this->connection);
			return null;
		}
		
		//logout previous sessions for this user
		
		$this->logout(0,$MemberID);
		
		
		//log user login
		
		$stmt = mysqli_prepare($this->connection, "INSERT INTO $this->loginTable (MemberID, LoginTime, IPAddress) VALUES (?, Now(), ?)");		
		$this->throwExceptionOnError();
		
		mysqli_bind_param($stmt, 'ss', $MemberID, $this->getIPAddress());		
		$this->throwExceptionOnError();

		mysqli_stmt_execute($stmt);		
		$this->throwExceptionOnError();
		
		$autoid = mysqli_stmt_insert_id($stmt);
		
		mysqli_stmt_free_result($stmt);		
		$this->_mysqli_close($this->connection);
		
		return $autoid;

	}
	
	
	/****** CheckSession($SessionID - SessionID returned from Login) *******\
		Returns SessionID if valid
		--    
	\***********************************************************************/
	public function CheckSession($SessionID)
	{
		$stmt = mysqli_prepare($this->connection, "SELECT RowID FROM $this->loginTable where RowID=? AND LogoutTime IS NULL AND IPAddress=? AND DATEDIFF(now(),LoginTime) < 10");
		$this->throwExceptionOnError();

		mysqli_bind_param($stmt, 'is', $SessionID, $this->getIPAddress());		
		$this->throwExceptionOnError();
		
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		mysqli_stmt_bind_result($stmt, $row->RowID);
		
		if(mysqli_stmt_fetch($stmt)) 
			$ret = $row->RowID;
		
		mysqli_stmt_free_result($stmt);	
		$this->_mysqli_close($this->connection);
		
		return $ret;
	}

	/****** CheckSession($html - html tag including youtube video url) *****\
		Returns Youtube Video URL without html mark-up
		--    
	\***********************************************************************/
	//parses an embeded youtube link and returns video ID
	public function ParseEmbedded($html)
	{
	
		if (substr($html,0,4) == 'http' || substr($html,0,3) == 'www')
			return $html . "&autoplay=1";
			
		$nodes = $this->extract_tags( $html, 'param' );
		foreach($nodes as $param){
		if ($param['attributes']['name'] == 'movie')
			$movie = $param['attributes']['value'];
		}
		if (substr($movie,0,4) == 'http' || substr($movie,0,3) == 'www')
			return $movie . "&autoplay=1";
		
		return null;
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
    
    

    
	/**************** throwExceptionOnError *********************\
	 * Utitity function to throw an exception if an error occurs 
	 * while running a mysql command.
	\************************************************************/
	private function throwExceptionOnError($link = null) {
		if($link == null) {
			$link = $this->connection;
		}
		if(mysqli_error($link)) {
			$msg = mysqli_errno($link) . ": " . mysqli_error($link);
			throw new Exception('MySQL Error - '. $msg);
		}		
	}
	
	/*************** extract_tags **************\
		returns html tags in an array 
		Thanks to White Shadow
		http://w-shadow.com/blog/2009/10/20/how-to-extract-html-tags-and-their-attributes-with-php/
	\*******************************************/
	private function extract_tags( $html, $tag, $selfclosing = null, $return_the_entire_tag = false, $charset = 'ISO-8859-1' ){
	 
		if ( is_array($tag) ){
			$tag = implode('|', $tag);
		}
	 
		//If the user didn't specify if $tag is a self-closing tag we try to auto-detect it
		//by checking against a list of known self-closing tags.
		$selfclosing_tags = array( 'area', 'base', 'basefont', 'br', 'hr', 'input', 'img', 'link', 'meta', 'col', 'param' );
		if ( is_null($selfclosing) ){
			$selfclosing = in_array( $tag, $selfclosing_tags );
		}
	 
		//The regexp is different for normal and self-closing tags because I can't figure out 
		//how to make a sufficiently robust unified one.
		if ( $selfclosing ){
			$tag_pattern = 
				'@<(?P<tag>'.$tag.')			# <tag
				(?P<attributes>\s[^>]+)?		# attributes, if any
				\s*/?>					# /> or just >, being lenient here 
				@xsi';
		} else {
			$tag_pattern = 
				'@<(?P<tag>'.$tag.')			# <tag
				(?P<attributes>\s[^>]+)?		# attributes, if any
				\s*>					# >
				(?P<contents>.*?)			# tag contents
				</(?P=tag)>				# the closing </tag>
				@xsi';
		}
	 
		$attribute_pattern = 
			'@
			(?P<name>\w+)							# attribute name
			\s*=\s*
			(
				(?P<quote>[\"\'])(?P<value_quoted>.*?)(?P=quote)	# a quoted value
				|							# or
				(?P<value_unquoted>[^\s"\']+?)(?:\s+|$)			# an unquoted value (terminated by whitespace or EOF) 
			)
			@xsi';
	 
		//Find all tags 
		if ( !preg_match_all($tag_pattern, $html, $matches, PREG_SET_ORDER | PREG_OFFSET_CAPTURE ) ){
			//Return an empty array if we didn't find anything
			return array();
		}
	 
		$tags = array();
		foreach ($matches as $match){
	 
			//Parse tag attributes, if any
			$attributes = array();
			if ( !empty($match['attributes'][0]) ){ 
	 
				if ( preg_match_all( $attribute_pattern, $match['attributes'][0], $attribute_data, PREG_SET_ORDER ) ){
					//Turn the attribute data into a name->value array
					foreach($attribute_data as $attr){
						if( !empty($attr['value_quoted']) ){
							$value = $attr['value_quoted'];
						} else if( !empty($attr['value_unquoted']) ){
							$value = $attr['value_unquoted'];
						} else {
							$value = '';
						}
	 
						//Passing the value through html_entity_decode is handy when you want
						//to extract link URLs or something like that. You might want to remove
						//or modify this call if it doesn't fit your situation.
						$value = html_entity_decode( $value, ENT_QUOTES, $charset );
	 
						$attributes[$attr['name']] = $value;
					}
				}
	 
			}
	 
			$tag = array(
				'tag_name' => $match['tag'][0],
				'offset' => $match[0][1], 
				'contents' => !empty($match['contents'])?$match['contents'][0]:'', //empty for self-closing tags
				'attributes' => $attributes, 
			);
			if ( $return_the_entire_tag ){
				$tag['full_tag'] = $match[0][0]; 			
			}
	 
			$tags[] = $tag;
		}
	 
		return $tags;
	}
	


}

?>