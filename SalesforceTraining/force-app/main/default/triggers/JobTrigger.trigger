trigger JobTrigger on Job_AtharvaBhatkhalkar__c (before delete,after delete,before update) {
    
    if(CheckRecursive.RunOnce()){
        
        JobTriggerHandler objOfJob = new  JobTriggerHandler();
        if(Trigger.isDelete && Trigger.isBefore && Deactivate_Triggers__c.getInstance().Deactivate_ActivateTriggers__c){
            objOfJob.JobActiveCannotBeDeleted(trigger.new);
        }
        
        if(Trigger.isUpdate && Trigger.isBefore &&Deactivate_Triggers__c.getInstance().Deactivate_ActivateTriggers__c){        
            objOfJob.JobStatusToActive(trigger.new);
        }
    }
}