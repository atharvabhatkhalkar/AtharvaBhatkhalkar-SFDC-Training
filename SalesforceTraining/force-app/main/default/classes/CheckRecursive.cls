/********************************************************************** 
Name: CheckRecursive 
Copyright © 2019 Enzigma Company Inc. 
====================================================== 
====================================================== 
Purpose: This class checks that is there any recusrion 
		while updating the object.
------- 
====================================================== 
====================================================== 
History 
------- 
VERSION AUTHOR DATE DETAIL FEATURES/CSR/TTP 
1.0 - Atharva Bhatkhalkar 03/04/2009 INITIAL DEVELOPMENT CSR: 
***********************************************************************/ 


public class CheckRecursive {
    
    public static boolean isExecuted = True;
    
/*******************************************************************
Purpose: To check whether the trigger is not get stuck in recursion 
		if we are updating the same object. we took one static varible 
		and set it to true.
Returns: It returns True if the value of isExecuted is true, and returns
		false if the value of isExecuted is false.
********************************************************************/

    public static boolean RunOnce(){
        if(isExecuted){ 
            isExecuted=False;
            return true;
            }
        else{
            return isExecuted;
        }
     }   
}