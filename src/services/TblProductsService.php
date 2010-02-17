<?php

include("DatabaseConnector.php");

class TblProductsService {

	var $tablename = "tblProducts";

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
	public function getAllTblProducts() {

		$stmt = mysqli_prepare($this->mysql->connection, "SELECT * FROM $this->tablename");		
		$this->throwExceptionOnError();
		
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		$rows = array();
		
		mysqli_stmt_bind_result($stmt, $row->RowID, $row->MemberID, $row->CompanyName, $row->CompanyDesc, $row->YoutubeVideoUrl, $row->GooglePostCode, $row->AddressName, $row->AddressStreet, $row->AddressTown, $row->AddressCounty, $row->AddressPostCode, $row->AddressEmail, $row->AddressTel, $row->AddressMob, $row->AddressFax, $row->status);
		
	    while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
	      $row = new stdClass();
	      mysqli_stmt_bind_result($stmt, $row->RowID, $row->MemberID, $row->CompanyName, $row->CompanyDesc, $row->YoutubeVideoUrl, $row->GooglePostCode, $row->AddressName, $row->AddressStreet, $row->AddressTown, $row->AddressCounty, $row->AddressPostCode, $row->AddressEmail, $row->AddressTel, $row->AddressMob, $row->AddressFax, $row->status);
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
	public function getTblProductsByID($itemID) {
		
		$stmt = mysqli_prepare($this->mysql->connection, "SELECT * FROM $this->tablename where RowID=?");
		$this->throwExceptionOnError();
		
		mysqli_bind_param($stmt, 'i', $itemID);		
		$this->throwExceptionOnError();
		
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		mysqli_stmt_bind_result($stmt, $row->RowID, $row->MemberID, $row->CompanyName, $row->CompanyDesc, $row->YoutubeVideoUrl, $row->GooglePostCode, $row->AddressName, $row->AddressStreet, $row->AddressTown, $row->AddressCounty, $row->AddressPostCode, $row->AddressEmail, $row->AddressTel, $row->AddressMob, $row->AddressFax, $row->status);
		
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
	public function createTblProducts($item) {
	
		$stmt = mysqli_prepare($this->mysql->connection, "INSERT INTO $this->tablename (RowID, MemberID, CompanyName, CompanyDesc, YoutubeVideoUrl, GooglePostCode, AddressName, AddressStreet, AddressTown, AddressCounty, AddressPostCode, AddressEmail, AddressTel, AddressMob, AddressFax, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");		
		$this->throwExceptionOnError();
		
		mysqli_bind_param($stmt, 'iisssssssssssssi', $item->RowID, $item->MemberID, $item->CompanyName, $item->CompanyDesc, $item->YoutubeVideoUrl, $item->GooglePostCode, $item->AddressName, $item->AddressStreet, $item->AddressTown, $item->AddressCounty, $item->AddressPostCode, $item->AddressEmail, $item->AddressTel, $item->AddressMob, $item->AddressFax, $item->status);		
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
	public function updateTblProducts($item) {
	
		$stmt = mysqli_prepare($this->mysql->connection, "UPDATE $this->tablename SET RowID=?, MemberID=?, CompanyName=?, CompanyDesc=?, YoutubeVideoUrl=?, GooglePostCode=?, AddressName=?, AddressStreet=?, AddressTown=?, AddressCounty=?, AddressPostCode=?, AddressEmail=?, AddressTel=?, AddressMob=?, AddressFax=?, status=?	WHERE RowID=?");		
		$this->throwExceptionOnError();
		
		mysqli_bind_param($stmt, 'iisssssssssssssii', $item->RowID, $item->MemberID, $item->CompanyName, $item->CompanyDesc, $item->YoutubeVideoUrl, $item->GooglePostCode, $item->AddressName, $item->AddressStreet, $item->AddressTown, $item->AddressCounty, $item->AddressPostCode, $item->AddressEmail, $item->AddressTel, $item->AddressMob, $item->AddressFax, $item->status, $item->RowID);		
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
	public function deleteTblProducts($itemID) {
				
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
	public function getTblProducts_paged($startIndex, $numItems) {
		
		$stmt = mysqli_prepare($this->mysql->connection, "SELECT * FROM $this->tablename LIMIT ?, ?");
		$this->throwExceptionOnError();
		
		mysqli_bind_param($stmt, 'ii', $startIndex, $numItems);
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		$rows = array();
		
		mysqli_stmt_bind_result($stmt, $row->RowID, $row->MemberID, $row->CompanyName, $row->CompanyDesc, $row->YoutubeVideoUrl, $row->GooglePostCode, $row->AddressName, $row->AddressStreet, $row->AddressTown, $row->AddressCounty, $row->AddressPostCode, $row->AddressEmail, $row->AddressTel, $row->AddressMob, $row->AddressFax, $row->status);
		
	    while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
	      $row = new stdClass();
	      mysqli_stmt_bind_result($stmt, $row->RowID, $row->MemberID, $row->CompanyName, $row->CompanyDesc, $row->YoutubeVideoUrl, $row->GooglePostCode, $row->AddressName, $row->AddressStreet, $row->AddressTown, $row->AddressCounty, $row->AddressPostCode, $row->AddressEmail, $row->AddressTel, $row->AddressMob, $row->AddressFax, $row->status);
	    }
		
		mysqli_stmt_free_result($stmt);		
		$this->mysql->_mysqli_close();
		
		return $rows;
	}
	
	

	/****** ParseEmbedded($html - html tag including youtube video url) *****\
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
