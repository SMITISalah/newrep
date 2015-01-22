<?php
// [params]
$app_id = "993651730663707"; // id de l'application
$app_secret = "0b8bd2ead9c68ddd4210fd3cf27ab7f0"; // code secret de l'application
$group_id = "1514794125452517"; // id ou nom du groupe à scraper (cf url du groupe) ou d'une page
$callback_url = "http://new-salahsmiti.rhcloud.com/"; // url de retour
// [/params]

// [fonctions]
function getToken(){
	$content = file('token.txt');
	return $content[0];
}

function curl_get_file_contents($url) {
	$ch = curl_init($url);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	curl_setopt($ch, CURLOPT_BINARYTRANSFER, true);
	curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
	curl_setopt($ch, CURLOPT_FOLLOWLOCATION, false);
	curl_setopt($ch, CURLOPT_HTTPHEADER, array('Host: graph.facebook.com'));
	$json = curl_exec($ch);
	curl_close($ch);
	return $json;
}

function getError() {
	$json = json_decode(curl_get_file_contents('https://graph.facebook.com/'.$app_id.'/feed?access_token='.getToken()));
	if ($json->error) {
		if ($json->error->type== "OAuthException") {
			return false;
		}else {
			return true;
		}
	}
}
// [/fonctions]

// [token] permet de récupérer le token valable 60 jours
$tmp_token = getToken();
if((empty($tmp_token) && !preg_match('/code=/', $_SERVER['REQUEST_URI'])) || (!getError($app_id))) {
	$code = 'https://www.facebook.com/dialog/oauth?client_id='.
		$app_id."&redirect_uri=".urlencode($callback_url).
		'&scope=user_groups&state=lijecreative';
	echo("<script> top.location.href='".$code."'</script>");
}

if((empty($tmp_token) && preg_match('/code=/', $_SERVER['REQUEST_URI'])) || (!getError($app_id))) {
	$token_url = 'https://graph.facebook.com/oauth/access_token?client_id='.
		$app_id."&redirect_uri=".urlencode($callback_url).
		'&client_secret='.$app_secret.'&code='.$_REQUEST["code"];
		
	$data = curl_get_file_contents($token_url);
	parse_str($data, $params);
	$token_60j = $params['access_token'];
	$fp = fopen('token.txt','w');
	fwrite($fp, $token_60j);
	fclose($fp);
}
// [/token]

// [scrap]
$json = json_decode(curl_get_file_contents('https://graph.facebook.com/'.$group_id.'/feed?access_token='.getToken().'&limit=5&since='.date('now')));

foreach($json->data as $item) {
	if($item->message != "") {
		$days = abs(floor((strtotime(date('Y-m-dTH:i:s+0000')) - strtotime($item->created_time)) / (60 * 60 * 24)));
		//echo "<a href='http://www.facebook.com/".$item->from->id."' rel='nofollow' target='_blank'>".utf8_decode($item->from->name)."</a> : ";
		echo "@ ".utf8_decode($item->from->name)." : ";
		echo htmlentities(utf8_decode(substr($item->message,0, 100)))."... <small>(<a href='".$item->actions[0]->link."' target='_blank'>il y a ".$days." jour(s)</a>)</small><br />";
	}
}
// [/scrap]
?>