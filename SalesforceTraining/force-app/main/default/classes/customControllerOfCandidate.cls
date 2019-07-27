/********************************************************************** 
Name: customControllerOfCandidate 
Copyright © 2019 Enzigma Company Inc. 
====================================================== 
====================================================== 
Purpose: Custom controller of Cadidate which fetches values
		from vfpage.
------- 
====================================================== 
====================================================== 
History 
------- 
VERSION AUTHOR DATE DETAIL FEATURES/CSR/TTP 
1.0 - Atharva Bhatkhalkar 03/04/2009 INITIAL DEVELOPMENT CSR:
***********************************************************************/ 


public class customControllerOfCandidate{
    private Candidate_AtharvaBhatkhalkar__c objOfCandidateValues{get;set;}

    
/*******************************************************************
Purpose:constructor for the initialization of memory.
********************************************************************/
    public customControllerOfCandidate() {
      objOfCandidateValues = new Candidate_AtharvaBhatkhalkar__c();
    }
    
    
/*******************************************************************
Purpose: To Get the required value from the database.
Returns: The data to the vfPage.
********************************************************************/
 public Candidate_AtharvaBhatkhalkar__c getobjOfCandidateValues() {
        return objOfCandidateValues;
    }
    
    
/*******************************************************************
Purpose: This method is called from vfpage and which saves the value
		to the database.
Parameters: NO
Returns: Returns to the view state after saving the record.
********************************************************************/
    public PageReference save() {
        insert objOfCandidateValues;
    	return new ApexPages.StandardController(objOfCandidateValues).view();
    }
}