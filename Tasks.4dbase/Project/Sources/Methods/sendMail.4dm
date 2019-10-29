//%attributes = {}

C_OBJECT:C1216($0;$out)
C_OBJECT:C1216($1;$in)

C_OBJECT:C1216($dataClass;$entity;$selection)

$in:=$1

$selection:=ds:C1482[$in.dataClass].query("ID = :1";String:C10($in.ID))

If ($selection.length=1)
	
	$entity:=$selection[0]
	
	For each ($key;$in.parameters)
		
		$entity[$key]:=$in.parameters[$key]
		
	End for each 
	
	$out:=New object:C1471
	
	
	$server:=New object:C1471
	$server.host:="smtp.gmail.com"
	$server.port:=465
	$server.user:="test@mail.com"
	$server.password:="yourPassword"
	
	$transporter:=SMTP New transporter:C1608($server)
	
	$email:=New object:C1471
	$email.subject:="New comment about one of your task"
	$email.from:="yourEmail"
	$email.to:=$emailToSend
	$email.htmlBody:="<h1>Comment from Tasks for iOS</h1>"+"<p><b>Task:</b> "+$taskTitle+"</p><p><b>Comment:</b> "\
		+$commentToSend+"</p><br><p><i>Send from my 4D for iOS app</i></p>"\
		
	
	$status:=$transporter.send($email)
	If ($status.success)
		$out.success:=True:C214  // notify App that action success
		$out.statusText:="Mail sent"
		
	Else 
		$out.success:=False:C215  // notify App that action success
		$out.statusText:="Mail not sent"
		
	End if 
	
Else 
	
	$out.success:=False:C215  // notify App that action failed
	
End if 

$0:=$out
