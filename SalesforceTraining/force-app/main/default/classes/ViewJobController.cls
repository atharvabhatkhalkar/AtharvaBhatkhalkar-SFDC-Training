/********************************************************************** 
Name: ViewJobController 
Copyright © 2019 Enzigma Company Inc. 
====================================================== 
====================================================== 
Purpose: 
------- 
====================================================== 
====================================================== 
History 
------- 
VERSION AUTHOR DATE DETAIL FEATURES/CSR/TTP 
1.0 - Atharva Bhatkhalkar 03/04/2009 INITIAL DEVELOPMENT CSR: 
***********************************************************************/ 

public class ViewJobController {
/*******************************************************************
Purpose: Constructor which initializaes the memory for 
		object of list of candidate and the job object. 
********************************************************************/
   
     public ViewJobController() {
        objectOfJob=new Job_AtharvaBhatkhalkar__c();
        lstOfCanidateObject=new List<Candidate_AtharvaBhatkhalkar__c>();
    }
   
    public Job_AtharvaBhatkhalkar__c objectOfJob {get;set;}
    private List<Candidate_AtharvaBhatkhalkar__c> lstOfCanidateObject{get;set;}
    public list<Job_AtharvaBhatkhalkar__c> SearchVal {get;set;}
    
/*******************************************************************
Purpose: This method returns the list of candidate to the vfpage.
Returns: List of candidate.
********************************************************************/
    
    public List<Candidate_AtharvaBhatkhalkar__c> getCandObj() {
        return lstOfCanidateObject;
    }
/*******************************************************************
Purpose: To fetch the values from the database we use the get method.
Returns: This method returns the values of job object to the vfpage.
********************************************************************/
    
    public Job_AtharvaBhatkhalkar__c getjob() {
        return objectOfJob;
    }
/*******************************************************************
Purpose: This method searches for the values provided by the user from 
		vfpage which checks for the name of the job object and the 
		candidates who applied for that job.
********************************************************************/
    
    public void searchVal(){
        objectOfJob = [SELECT id, name, Name__c,Description__c,Number_of_Positions__c,Active__c,
               Salary_Offered__c,Manager__c,Job_Type__c,Required_Skills__c,Qualification_Required__c,
               Certification_Required__c
               FROM Job_AtharvaBhatkhalkar__c
               WHERE Name =: objectOfJob.Name];
        
        
        lstOfCanidateObject=[SELECT id, Name, First_Name__c,Last_Name__c,
                 Salutation__c,Date_of_Birth__c,Email__c,Country__c,
                 State__c,Application_Date__c,Status__c,Expected_Salary__c,
                 JOB__c FROM Candidate_AtharvaBhatkhalkar__c WHERE JOB__r.name =: objectOfJob.name ];
        
    }
}