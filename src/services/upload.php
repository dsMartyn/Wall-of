<?php

	function ReturnResult($result)
	{
		echo "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n";
		echo "<variables>\n";
			echo "<variable\n";
			echo	"name=\"Result\" \n";
			echo	"value=\"" . $result . "\" \n";
			echo "/>\n";	
			echo "<variable\n";
			echo	"name=\"Return\" \n";
			echo	"value=\"" . $result . "\" \n";
			echo "/>\n";	
		echo "</variables>\n";
		exit(0);
	}
	
	function ReturnError($errMsg, $location)
	{
		echo "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n";
		echo "<variables>\n";
			echo "<variable\n";
			echo	"name=\"Message\" \n";
			echo	"value=\"" . $errMsg . "\" \n";
			echo "/>\n";
			echo "<variable\n";
			echo	"name=\"Location\" \n";
			echo	"value=\"" . $location . "\" \n";
			echo "/>\n";	
			echo "<variable\n";
			echo	"name=\"Result\" \n";
			echo	"value=\"0\" \n";
			echo "/>\n";		
		echo "</variables>\n";
		exit(0); //die($errMsg);
	}
	
	//check there is an action
	if (!isset($_REQUEST['action']))
		ReturnError("Error missing action","Process actions");

	switch ($_REQUEST['action'])
	{
		case 'upload':
			

			$file_temp = $_FILES['file']['tmp_name'];
			$file_name = $_REQUEST['filename']; //$_FILES['file']['name'];
		//$_SERVER['DOCUMENT_ROOT'].
			$file_path = "../assets/uploaded";

	
			//checks for duplicate files
			if(!file_exists($file_path."/".$file_name)) 
			{
		
				 //complete upload
				 $filestatus = move_uploaded_file($file_temp,$file_path."/".$file_name);
				// unlink($file_path."/upload");
				
				 if(!$filestatus) 
				 {
					 ReturnError("Upload failed. Please try again.", $file_path."/".$file_name);
				 }
		
			}
			else
			{
				ReturnResult($file_name);
				//unlink($file_path."/upload");
				//ReturnError("File already exists on server.", $file_path."/".$file_name);
			}
		break;
		
		default:
			ReturnError("Error missing action","Process actions");
		break;
	}
	
	ReturnResult($file_name);
	
	
?>