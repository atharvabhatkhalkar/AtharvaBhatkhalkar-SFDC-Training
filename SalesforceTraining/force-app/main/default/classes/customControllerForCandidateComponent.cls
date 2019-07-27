/********************************************************************** 
Name: customControllerForCandidateComponent 
Copyright © 2019 Enzigma Company Inc. 
====================================================== 
====================================================== 
Purpose: This class is written for the related list 
		componen which fetches the values from the 
		candidate object.
------- 
====================================================== 
====================================================== 
History 
------- 
VERSION AUTHOR DATE DETAIL FEATURES/CSR/TTP 
1.0 - Atharva Bhatkhalkar 03/04/2009 INITIAL DEVELOPMENT CSR: 
***********************************************************************/ 


public class customControllerForCandidateComponent{
    private Candidate_AtharvaBhatkhalkar__c objOfCandidateValues{get;set;}
    
 /*******************************************************************
Purpose: This method is a constructor which fetches the field values	
		of the candidate object after matching the id from the vfpage.
********************************************************************/
	 public customControllerForCandidateComponent() {
        objOfCandidateValues = [SELECT id, First_Name__c,Last_Name__c,Salutation__c,Date_of_Birth__c,Email__c,
                                Country__c,State__c,Application_Date__c,Status__c,Expected_Salary__c,JOB__c 
                                FROM Candidate_AtharvaBhatkhalkar__c
                                WHERE id = :ApexPages.currentPage().getParameters().get('id')];
    }
/*******************************************************************
Purpose: get method returns the values which he gets from the constructor
		in the objOfCandidateValues object.
Returns: The values of candidate object.
********************************************************************/
    
    public Candidate_AtharvaBhatkhalkar__c getobjOfCandidateValues() {
        return objOfCandidateValues;
    }
}