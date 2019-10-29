//%attributes = {}

C_OBJECT:C1216($0)
C_OBJECT:C1216($1)

C_OBJECT:C1216($entity;$in;$out)

$in:=$1

$out:=New object:C1471("success";False:C215)

If ($in.dataClass#Null:C1517)
	
	$entity:=ds:C1482.Tasks.new()  //create a reference
	
	For each ($key;$in.parameters)
		
		$entity[$key]:=$in.parameters[$key]
		
	End for each 
	
	$entity.save()  //save the entity
	
	
	$out.success:=True:C214  // notify App that action success
	$out.dataSynchro:=True:C214  // notify App to refresh the selection
	$out.statusText:="Task added"
	
	
Else 
	
	$out.errors:=New collection:C1472("No Selection")
	
End if 

$0:=$out

