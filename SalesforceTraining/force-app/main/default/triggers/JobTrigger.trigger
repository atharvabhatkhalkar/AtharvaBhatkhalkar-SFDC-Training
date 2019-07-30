trigger JobTrigger on Job_AtharvaBhatkhalkar__c (before delete,after delete,after update) {
    
    /*if(CheckRecursive.RunOnce()){*/
        
        JobTriggerHandler objOfJob = new  JobTriggerHandler();
        if(Trigger.isDelete && Trigger.isBefore && Deactivate_Triggers__c.getInstance().Deactivate_ActivateTriggers__c){
            if(CheckRecursive.isExecuted){
                CheckRecursive.isExecuted=false;
                objOfJob.JobActiveCannotBeDeleted(trigger.old);
            }
        }
        
        if(Trigger.isUpdate && Trigger.isAfter && Deactivate_Triggers__c.getInstance().Deactivate_ActivateTriggers__c){        
            if(CheckRecursive.isExecuted){
                CheckRecursive.isExecuted=false;
                objOfJob.JobStatusToActive(trigger.old);
            }
         }
    /*}*/
}