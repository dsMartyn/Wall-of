<?php


	//action="request"&str="search string"&start=1&limit=54
	if (!isset($_REQUEST['action']))
		die("Error missing action");
	if (!isset($_REQUEST['str']))
		die("Error missing action");
	if (!isset($_REQUEST['start']))
		die("Error missing action");
	if (!isset($_REQUEST['limit']))
		die("Error missing action");

	if ($_REQUEST['action'] == "request")
		SearchJSON($_REQUEST['str'],$_REQUEST['start'], $_REQUEST['limit']);

  function SearchJSON($str, $start, $limit)
  {
  	require_once ('TblProductsService.php');
	$clsProducts = new TblProductsService();
	$clsProducts->mysql->php_mode();
	

	$ret = $clsProducts->search ($str, $start, $limit);
	if (!$ret)
	{
		echo 'error getting products';
	}else{
	
		//Header("Content-Type: binary/octet-stream");
		
		$dataLen = 0;

		//image list class contains array of images
		$ilist = new stdClass();
		$ilist->Total = $ret[0]->count;//get total count of products
		$ilist->ImageCount = count($ret);
		
		$ilist->Images = Array();
		for ($i=0;$i<$ilist->ImageCount;$i++)
		{
			$image = new stdClass();
			
			$image->ofSet = $dataLen;
			$image->length = strlen($ret[$i]->Image);
			$dataLen += $image->length;
			
			//$image->crc = $clsProducts->mysql->ComputeCRC($ret[$i]->Image) << 32 >> 32 ; //&  0xFFFFFFFF; 
			$image->productId = $ret[$i]->RowID;
			
			$ilist->Images[] = $image;
		}
		
		$json = json_encode($ilist);
		
		echo strlen($json);
		
		echo json_encode ($ilist);
		
		for ($i=0;$i<$ilist->ImageCount;$i++)
		{
			echo $ret[$i]->Image;
		}	
		
	 }
  }

?>