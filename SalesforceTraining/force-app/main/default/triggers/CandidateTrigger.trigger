trigger CandidateTrigger on Candidate_AtharvaBhatkhalkar__c (before insert) {

     if(CheckRecursive.RunOnce()){
        
        CandidateTriggerHandler ObjOfHandler = new CandidateTriggerHandler();
        if(Trigger.isBefore && Trigger.isInsert && Deactivate_Triggers__c.getInstance().Deactivate_ActivateTriggers__c){
           ObjOfHandler.expectedSalaryMissing(trigger.new);
           ObjOfHandler.inactiveJobApplied(trigger.new);
            
        }
        if(Trigger.isAfter && Trigger.isInsert && Deactivate_Triggers__c.getInstance().Deactivate_ActivateTriggers__c){
            ObjOfHandler.setStatusToInactive(trigger.new);
            ObjOfHandler.givenDateSwapBycreatedDate(trigger.new);
            
        }
        
        if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate) && Deactivate_Triggers__c.getInstance().Deactivate_ActivateTriggers__c) {
            ObjOfHandler.sendEmail(trigger.new);
                
        }   
    }
    
    
    
}