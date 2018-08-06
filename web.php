<?php
	$discordurl = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
	$svname = $_POST["svname"];
	$joinurl = $_POST["joinurl"];
	$reason = $_POST["reason"];
	$name = $_POST["pname"];
	$steamid = $_POST["SID"];
	//$steamid64 = $_POST["s64"];

	$rawjson = array('content' => '<@&290669995653070850>', 
		'embeds' => array( array(
			'title' => 'Staff Requested on '.$svname.'.',
			'description' => 'Click to Join: '.$joinurl.'',
			'color' => 16711680,
			'author' => array('name'=>'Calling Staff!'),
			//'thumbnail' => '',
			'fields' => array(
				array(
					'name' => 'Called By:',
					'value' => $name.' ('.$steamid.')'
				),
				array(
					'name' => 'Reason',
					'value' => $reason
				)
			)
		) ) 
	);

	$formatjson = json_encode($rawjson);

	//echo $formatjson;

	$ch = curl_init($discordurl);
	curl_setopt($ch, CURLOPT_POST, 1);
	curl_setopt($ch, CURLOPT_POSTFIELDS, $formatjson);
	curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json'));

	$result = curl_exec($ch);

	//echo $result;

?>