C_OBJECT:C1216($0;$response)
C_OBJECT:C1216($1;$request)

C_OBJECT:C1216($o;$context;$request;$result;$parameters)

$request:=$1  // Informations provided by mobile application

$context:=$request.context
$parameters:=$request.parameters

Case of 
		
	: ($request.action="addTasks")
		
		  // Insert here the code for the action "Add…"
		
		$o:=New object:C1471(\
			"dataClass";$context.dataClass;\
			"parameters";$parameters)
		
		$result:=addAction ($o)
		
	: ($request.action="editTasks")
		
		  // Insert here the code for the action "Edit…"
		
		$o:=New object:C1471(\
			"dataClass";$context.dataClass;\
			"ID";$context.entity.primaryKey;\
			"parameters";$parameters)
		
		$result:=editAction ($o)
		
		
	: ($request.action="deleteTasks")
		
		  // Insert here the code for the action "Remove"
		
		$o:=New object:C1471(\
			"dataClass";$context.dataClass;\
			"ID";$context.entity.primaryKey)
		
		$result:=deleteAction ($o)
		
	: ($request.action="sendComment")
		
		  // Insert here the code for the action "Send Comment"
		
		$o:=New object:C1471(\
			"dataClass";$context.dataClass;\
			"ID";$context.entity.primaryKey;\
			"parameters";$parameters)
		
		
		$result:=sendMail ($o)
		
	Else 
		
		  // Unknown action
		
End case 

$0:=$result