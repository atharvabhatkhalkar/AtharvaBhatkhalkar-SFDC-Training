trigger CandidateTrigger on Candidate_AtharvaBhatkhalkar__c (before insert,after insert,after update) {

   /* if(CheckRecursive.RunOnce()){*/
   
        CandidateTriggerHandler ObjOfHandler = new CandidateTriggerHandler();
        if(Trigger.isBefore && Trigger.isInsert && Deactivate_Triggers__c.getInstance().Deactivate_ActivateTriggers__c){
                ObjOfHandler.expectedSalaryMissing(trigger.new);
                ObjOfHandler.inactiveJobApplied(trigger.new);
            }
        
        if(Trigger.isAfter && Trigger.isInsert && Deactivate_Triggers__c.getInstance().Deactivate_ActivateTriggers__c){
            if(CheckRecursive.isExecuted){
                CheckRecursive.isExecuted=false;
                ObjOfHandler.setStatusToInactive(trigger.new);
                ObjOfHandler.givenDateSwapBycreatedDate(trigger.new); 
                
           }
        }
        
        if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate) && Deactivate_Triggers__c.getInstance().Deactivate_ActivateTriggers__c) {
            
            if(CheckRecursive.isExecuted){
                
                CheckRecursive.isExecuted=false;
                ObjOfHandler.sendEmail(trigger.new);
            }    
        }   
    /*}*/    
}