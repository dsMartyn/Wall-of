<?php

require_once("DatabaseConnector.php");

class TblProductsService {

	var $tablename = "tblProducts";

	/*
	 mysql class contains all variables and conncetion method
	*/
	var $mysql;

	public function __construct() {
		$this->mysql = new MySqlConnector();
	}



	public function getTblProductsByID($itemID) {
		
		$stmt = mysqli_prepare($this->mysql->connection, "SELECT * FROM $this->tablename where RowID=?");
		$this->throwExceptionOnError();
		
		mysqli_bind_param($stmt, 'i', $itemID);		
		$this->throwExceptionOnError();
		
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		mysqli_stmt_bind_result($stmt, $row->RowID, $row->MemberID, $row->ItemName, $row->ItemDesc, $row->YoutubeVideoUrl, $row->GooglePostCode, $row->AddressName, $row->AddressStreet, $row->AddressTown, $row->AddressCounty, $row->AddressPostCode, $row->AddressEmail, $row->AddressTel, $row->AddressMob, $row->AddressFax, $row->status, $row->ImageID, $row->Category);
		
		if(mysqli_stmt_fetch($stmt)) {
			return $row;
		} else {
			return null;
		}
	}


	/**
	 * Returns list of products that are linked to the keywords
	 * 
	 * @return stdClass
	  SELECT * FROM TblLnkKeywordProducts WHERE KeywordID IN (213582, 579004, 213583, 96711)
	  SELECT RowID FROM tblKeywords WHERE CRC1 IN (115314769853, 113275458213, 113188262816, 113219423308, 0)
	 */
	public function countAllProducts() {
		$rec_count=0;
		$query = "select count(*) from tblProducts";

		$stmt = mysqli_prepare($this->mysql->connection, $query);		
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
	 * Returns list of products that are linked to the keywords
	 * 
	 * @return stdClass
	  SELECT * FROM TblLnkKeywordProducts WHERE KeywordID IN (213582, 579004, 213583, 96711)
	  SELECT RowID FROM tblKeywords WHERE CRC1 IN (115314769853, 113275458213, 113188262816, 113219423308, 0)
	 */
	public function countProductsByIDList($searchStr) {
		$rec_count=0;
		$query = "select count(DISTINCT productID) from tblLnkKeywordProducts a left join TblKeywords b ON a.KeywordID = b.rowID WHERE CRC1 IN ($searchStr)";
 
		$stmt = mysqli_prepare($this->mysql->connection, $query);		
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
	 * Returns list of products that are linked to the keywords
	 * 
	 * @return stdClass
	  SELECT * FROM TblLnkKeywordProducts WHERE KeywordID IN (213582, 579004, 213583, 96711)
	  SELECT RowID FROM tblKeywords WHERE CRC1 IN (115314769853, 113275458213, 113188262816, 113219423308, 0)
	 */
	public function getProductsByIDList($searchStr, $startIndex, $numItems) {
	
		$query = "select distinct a.*, d.image, 1 from tblProducts A LEFT JOIN TblLnkKeywordProducts B ON A.RowID = B.ProductID LEFT JOIN tblKeywords C ON C.RowID = B.KeywordID LEFT JOIN TblImages D ON d.RowID = a.ImageID  WHERE CRC1 IN ($searchStr) LIMIT $startIndex, $numItems";

		$stmt = mysqli_prepare($this->mysql->connection, $query);		
		$this->throwExceptionOnError();
		
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		$rows = array();
		//mysqli_stmt_bind_result($stmt,  $row->RowID,$row->Keyword,$row->CRC1,$row->CRC2,$row->RowID,$row->KeywordID,$row->ProductID,$row->RowID,$row->MemberID,$row->ItemName,$row->ItemDesc,$row->YoutubeVideoUrl,$row->GooglePostCode,$row->AddressName,$row->AddressStreet,$row->AddressTown,$row->AddressCounty,$row->AddressPostCode,$row->AddressEmail,$row->AddressTel,$row->AddressMob,$row->AddressFax,$row->status);
		mysqli_stmt_bind_result($stmt,  $row->RowID,$row->MemberID,$row->ItemName,$row->ItemDesc,$row->YoutubeVideoUrl,$row->GooglePostCode,$row->AddressName,$row->AddressStreet,$row->AddressTown,$row->AddressCounty,$row->AddressPostCode,$row->AddressEmail,$row->AddressTel,$row->AddressMob,$row->AddressFax,$row->status,$row->ImageID,$row->Category, $row->Image , $row->count);

	    while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
	      $row = new stdClass();
	      //mysqli_stmt_bind_result($stmt,  $row->RowID,$row->Keyword,$row->CRC1,$row->CRC2,$row->RowID,$row->KeywordID,$row->ProductID,$row->RowID,$row->MemberID,$row->ItemName,$row->ItemDesc,$row->YoutubeVideoUrl,$row->GooglePostCode,$row->AddressName,$row->AddressStreet,$row->AddressTown,$row->AddressCounty,$row->AddressPostCode,$row->AddressEmail,$row->AddressTel,$row->AddressMob,$row->AddressFax,$row->status);
	   	  mysqli_stmt_bind_result($stmt,  $row->RowID,$row->MemberID,$row->ItemName,$row->ItemDesc,$row->YoutubeVideoUrl,$row->GooglePostCode,$row->AddressName,$row->AddressStreet,$row->AddressTown,$row->AddressCounty,$row->AddressPostCode,$row->AddressEmail,$row->AddressTel,$row->AddressMob,$row->AddressFax,$row->status,$row->ImageID, $row->Category, $row->Image, $row->count);
	    }
		
		mysqli_stmt_free_result($stmt);
	   
	
		$ctr = $this->countProductsByIDList($searchStr);
		$this->mysql->_mysqli_close();
		
		for ($i=0; $i< count($rows); $i++)
		{
			$rows[$i]->count = $ctr;
			$rows[$i]->Image =  $this->FixEncoding($rows[$i]->Image);
		}
	    
	    return $rows;
	}



	/**
	 * Returns list of products that are linked to the keywords
	 * 
	 * @return stdClass
	  SELECT * FROM TblLnkKeywordProducts WHERE KeywordID IN (213582, 579004, 213583, 96711)
	  SELECT RowID FROM tblKeywords WHERE CRC1 IN (115314769853, 113275458213, 113188262816, 113219423308, 0)
	 */
	public function getAllProductsPaged($startIndex, $numItems) {
		
		$query = "select distinct a.*, d.image, 1 from tblProducts A LEFT JOIN TblImages D ON d.RowID = a.ImageID  LIMIT $startIndex, $numItems";

		$stmt = mysqli_prepare($this->mysql->connection, $query);		
		$this->throwExceptionOnError();
		
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		$rows = array();
		//mysqli_stmt_bind_result($stmt,  $row->RowID,$row->Keyword,$row->CRC1,$row->CRC2,$row->RowID,$row->KeywordID,$row->ProductID,$row->RowID,$row->MemberID,$row->ItemName,$row->ItemDesc,$row->YoutubeVideoUrl,$row->GooglePostCode,$row->AddressName,$row->AddressStreet,$row->AddressTown,$row->AddressCounty,$row->AddressPostCode,$row->AddressEmail,$row->AddressTel,$row->AddressMob,$row->AddressFax,$row->status);
		mysqli_stmt_bind_result($stmt,  $row->RowID,$row->MemberID,$row->ItemName,$row->ItemDesc,$row->YoutubeVideoUrl,$row->GooglePostCode,$row->AddressName,$row->AddressStreet,$row->AddressTown,$row->AddressCounty,$row->AddressPostCode,$row->AddressEmail,$row->AddressTel,$row->AddressMob,$row->AddressFax,$row->status,$row->ImageID, $row->Category, $row->Image, $row->count);
		
	    while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
	      $row = new stdClass();
	      //mysqli_stmt_bind_result($stmt,  $row->RowID,$row->Keyword,$row->CRC1,$row->CRC2,$row->RowID,$row->KeywordID,$row->ProductID,$row->RowID,$row->MemberID,$row->ItemName,$row->ItemDesc,$row->YoutubeVideoUrl,$row->GooglePostCode,$row->AddressName,$row->AddressStreet,$row->AddressTown,$row->AddressCounty,$row->AddressPostCode,$row->AddressEmail,$row->AddressTel,$row->AddressMob,$row->AddressFax,$row->status);
	   	  mysqli_stmt_bind_result($stmt,  $row->RowID,$row->MemberID,$row->ItemName,$row->ItemDesc,$row->YoutubeVideoUrl,$row->GooglePostCode,$row->AddressName,$row->AddressStreet,$row->AddressTown,$row->AddressCounty,$row->AddressPostCode,$row->AddressEmail,$row->AddressTel,$row->AddressMob,$row->AddressFax,$row->status,$row->ImageID, $row->Category, $row->Image, $row->count);
	    }
		
		mysqli_stmt_free_result($stmt);
		
		$ctr = $this->countAllProducts();
		
	    $this->mysql->_mysqli_close();
	
		for ($i=0; $i< count($rows); $i++)
		{
			$rows[$i]->count = $ctr;
			$rows[$i]->Image =  $this->FixEncoding($rows[$i]->Image);
		}
		
	    return $rows;
	}



	public function createTblProducts($item) {
	
		$stmt = mysqli_prepare($this->mysql->connection, "INSERT INTO $this->tablename (RowID, MemberID, ItemName, ItemDesc, YoutubeVideoUrl, GooglePostCode, AddressName, AddressStreet, AddressTown, AddressCounty, AddressPostCode, AddressEmail, AddressTel, AddressMob, AddressFax, status, ImageID, Category) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");		
		$this->throwExceptionOnError();
		
		mysqli_bind_param($stmt, 'iisssssssssssssiis', $item->RowID, $item->MemberID, $item->ItemName, $item->ItemDesc, $item->YoutubeVideoUrl, $item->GooglePostCode, $item->AddressName, $item->AddressStreet, $item->AddressTown, $item->AddressCounty, $item->AddressPostCode, $item->AddressEmail, $item->AddressTel, $item->AddressMob, $item->AddressFax, $item->status, $item->ImageID, $row->Category);		
		$this->throwExceptionOnError();

		mysqli_stmt_execute($stmt);		
		$this->throwExceptionOnError();
		
		$autoid = mysqli_stmt_insert_id($stmt);
		
		mysqli_stmt_free_result($stmt);		
		$this->mysql->_mysqli_close();
		
		return $autoid;
	}



	public function updateTblProducts($item) {
	
		$stmt = mysqli_prepare($this->mysql->connection, "UPDATE $this->tablename SET RowID=?, MemberID=?, ItemName=?, ItemDesc=?, YoutubeVideoUrl=?, GooglePostCode=?, AddressName=?, AddressStreet=?, AddressTown=?, AddressCounty=?, AddressPostCode=?, AddressEmail=?, AddressTel=?, AddressMob=?, AddressFax=?, status=?, ImageID=?, Category=? WHERE RowID=?");		
		$this->throwExceptionOnError();
		
		mysqli_bind_param($stmt, 'iisssssssssssssiisi', $item->RowID, $item->MemberID, $item->ItemName, $item->ItemDesc, $item->YoutubeVideoUrl, $item->GooglePostCode, $item->AddressName, $item->AddressStreet, $item->AddressTown, $item->AddressCounty, $item->AddressPostCode, $item->AddressEmail, $item->AddressTel, $item->AddressMob, $item->AddressFax, $item->status, $item->ImageID, $row->Category, $item->RowID);		
		$this->throwExceptionOnError();

		mysqli_stmt_execute($stmt);		
		$this->throwExceptionOnError();
		
		mysqli_stmt_free_result($stmt);		
		$this->mysql->_mysqli_close();
	}


	public function deleteTblProducts($itemID) {
				
		$stmt = mysqli_prepare($this->mysql->connection, "DELETE FROM $this->tablename WHERE RowID = ?");
		$this->throwExceptionOnError();
		
		mysqli_bind_param($stmt, 'i', $itemID);
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		mysqli_stmt_free_result($stmt);		
		$this->mysql->_mysqli_close();
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
	

  private function FixEncoding($str)
  {
	return base64_encode($str);
  }
  
  function search($str, $start, $limit)
  {
  
  if ($str == "null")
  	$str = "";
  	
  //	$ret = new stdClass();
    $str = str_replace(",", " ", $str);
    
	$this->mysql->php_mode();
	

	$searchStr = "";
	
	//create keyword search string
	foreach (explode(" ", $str) as $k)
	{
		$item = new stdClass();
		$item->Keyword = strtolower($k);
		$item->CRC1 = $this->mysql->ComputeCRC($item->Keyword); //generate crc from keyword
		$item->CRC2 = crc32($item->Keyword) ;

		$item->CRC1 ^= $item->CRC2;
		$searchStr .= $item->CRC1 . ", ";

	}$searchStr .= "0";

	if ($str == "")
	{
		//get all products
		//$ret->rows =
		$rows = $this->getAllProductsPaged($start,$limit);
		
	}else{
		//get products for keywords 
		//$ret->rows =
		$rows = $this->getProductsByIDList($searchStr, $start,$limit);	
		
	}
		
	
  	$this->mysql->_mysqli_close(true);

	return $rows;
  }

 
  function addKeywords($str, $productId)
  {
  
   //echo $str . "\n";
   
  	$str = str_replace(" ", ",", $str);
    
  	 //delete previous keywords
	require_once ('TblLnkKeywordProductsService.php');
	require_once ('TblKeywordsService.php');
	$clsKeywordLnk = new TblLnkKeywordProductsService();
	$clsKeyword = new TblKeywordsService();
	
	$clsKeyword->mysql->php_mode();
	$clsKeywordLnk->mysql->php_mode();
	
	$clsKeywordLnk->deleteTblProduct($productId);
	
	//add new keywords
	foreach (explode(",", $str) as $k)
	{
		$item->Keyword = strtolower($k);
		$item->CRC1 = $clsKeyword->mysql->ComputeCRC($item->Keyword); //generate crc from keyword
		$item->CRC2 = crc32($item->Keyword) ;

		if ($item->CRC2)
		{
			$item->CRC1 ^= $item->CRC2;
	
			//find keyword ID
			$row = $clsKeyword->getTblKeywordsByCRC($item->CRC1);
			if (!$row)
			{
				 //add to keyword table and get ID
				 $item->Keyword = strtolower($item->Keyword);
				 $item->CRC1 = 0;
				 $item->CRC2 = 0;
				 $item->RowID = 0;
			//  echo 'creating keyword ' . $item->Keyword . "<br>";
				 $item->RowID = $clsKeyword->createTblKeywords($item);
			}else{
				$item->RowID = $row->RowID;
			}
			
			//check link doesn't already exist
			$row = $clsKeywordLnk->getTblLnkKeywordProductsByID($item->RowID, $productId);
			
			if (!$row)
			{
				//add to link table
				$item->KeywordID = $item->RowID;
				$item->ProductID = $productId;
				$item->RowID = 0;
				$clsKeywordLnk->createTblLnkKeywordProducts($item);
			}
	
			//echo $item->RowID . " - " . $k . "<br>";
		}
	}
	
	$clsKeywordLnk->mysql->_mysqli_close(true);
	$clsKeyword->mysql->_mysqli_close(true);
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
