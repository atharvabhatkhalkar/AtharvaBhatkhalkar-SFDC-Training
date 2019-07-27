/********************************************************************** 
Name: controllerOfJob_AtharvaBhatkhalkar
Copyright © 2019 Enzigma Company Inc. 
====================================================== 
====================================================== 
Purpose: Custom controller of Job object which fetches 
		values from vfpage.
------- 
====================================================== 
====================================================== 
History 
------- 
VERSION AUTHOR DATE DETAIL FEATURES/CSR/TTP 
1.0 - Atharva Bhatkhalkar 03/04/2009 INITIAL DEVELOPMENT CSR:
***********************************************************************/ 

public class controllerOfJob_AtharvaBhatkhalkar {
    
    private Job_AtharvaBhatkhalkar__c objOfJob_Atharva{get;set;}
    
/*******************************************************************
Purpose: This is a constructor which gets all the values from job 
		object where the id is equal.
********************************************************************/
	public void controllerOfJob_AtharvaBhatkhalkar() {
        objOfJob_Atharva = [SELECT id, Name__c,Description__c,Number_of_Positions__c,Active__c,Salary_Offered__c,Manager__c,Job_Type__c,Required_Skills__c,Qualification_Required__c	,Certification_Required__c FROM Job_AtharvaBhatkhalkar__c
               WHERE id = :ApexPages.currentPage().getParameters().get('id')];
    }
    
    
/*******************************************************************
Purpose: To Get the required value from the database.
Returns: The data to the vfPage.
********************************************************************/
    public Job_AtharvaBhatkhalkar__c getobjOfJob_Atharva() {
        return objOfJob_Atharva;
    }
    
    
/*******************************************************************
Purpose: This method is called from vfpage and which saves the value
		to the database.
Returns: Returns to the view state after saving the record.
********************************************************************/
	public PageReference save() {
        upsert objOfJob_Atharva;
        PageReference pref = new ApexPages.StandardController(objOfJob_Atharva).view();
        return pref;
    }
    
}