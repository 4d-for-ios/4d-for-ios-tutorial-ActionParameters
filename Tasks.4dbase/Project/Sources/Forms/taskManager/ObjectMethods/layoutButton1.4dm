OBJECT SET VISIBLE:C603(*;"layoutButton1Rect";True:C214)
OBJECT SET VISIBLE:C603(*;"layoutButton2Rect";False:C215)
OBJECT SET VISIBLE:C603(*;"Subform2";True:C214)

C_LONGINT:C283($l;$t;$r;$b;$l1;$t1;$r1;$b1)
OBJECT GET COORDINATES:C663(*;"Subform1";$l;$t;$r;$b)
OBJECT GET COORDINATES:C663(*;"searchRect";$l1;$t1;$r1;$b1)
OBJECT SET COORDINATES:C1248(*;"Subform1";$l;$b1+6;$r1;$b)
OBJECT SET COORDINATES:C1248(*;"taskListRect";$l-1;$b1+5;$r1+1;$b+1)

taskListDetailMode_b:=True:C214