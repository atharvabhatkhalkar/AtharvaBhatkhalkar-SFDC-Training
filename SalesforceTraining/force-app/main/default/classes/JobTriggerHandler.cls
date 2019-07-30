/********************************************************************** 
Name: JobTriggerHandler 
Copyright © 2009 ABC Company Inc. 
====================================================== 
====================================================== 
Purpose: This class checks the trigger events on Job 
Object.
------- 
====================================================== 
====================================================== 
History 
------- 
VERSION AUTHOR DATE DETAIL FEATURES/CSR/TTP 
1.0 - Atharva Bhatkhalkar 03/04/2009 INITIAL DEVELOPMENT CSR:  
***********************************************************************/ 
public class JobTriggerHandler {
    
    
    /*******************************************************************
Purpose: This method checks that if the job status is active then it 
cannot be deleted.
Parameters: list of trigger.new
********************************************************************/
    
    public void JobActiveCannotBeDeleted(List<Job_AtharvaBhatkhalkar__c> lstOfJobTrigger){
        for (Job_AtharvaBhatkhalkar__c objJob :lstOfJobTrigger){
            if(objJob.Active__c) {
                objJob.addError('This Job is active and can not be deleted');
            }
        }
    }
    
    
    /*******************************************************************
Purpose: This method checks that if the number of positions becomes 
greater than hired applicants then it changes the status of active 
to true.
Parameters: trigger.new
********************************************************************/
    
    public void JobStatusToActive(List<Job_AtharvaBhatkhalkar__c> lstOfJobTriggerActive){
        List<Job_AtharvaBhatkhalkar__c> lstOfJobForStatusActive = [SELECT id,Number_of_Positions__c,Hired_Applicants__c,Active__c 
                                                                   FROM Job_AtharvaBhatkhalkar__c WHERE id in : lstOfJobTriggerActive];
        List<Job_AtharvaBhatkhalkar__c> lstForUpdate = new List<Job_AtharvaBhatkhalkar__c>();
        for(Job_AtharvaBhatkhalkar__c objOfJob:lstOfJobForStatusActive){
            if(objOfJob.Number_of_Positions__c > objOfJob.Hired_Applicants__c){
              objOfJob.Active__c=true;
              lstForUpdate.add(objOfJob);
            }
        }
        update lstForUpdate;
    }
}