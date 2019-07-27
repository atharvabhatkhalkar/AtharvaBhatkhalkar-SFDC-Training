trigger Candidate_Trigger on Candidate_AtharvaBhatkhalkar__c (before insert,after insert,before update, after update, after delete) {
    
    if(trigger.isInsert)
    {
        if(trigger.isBefore)
        {
            System.debug('Before Insert');
            System.debug('Trigger.new'+trigger.new);
            System.debug('Trigger.old'+trigger.old);
            System.debug('Trigger.oldMap'+trigger.oldMap);
            System.debug('Trigger.newMap'+trigger.newMap);
        }
        if(trigger.isAfter)
        {
            System.debug('After Insert');
            System.debug('Trigger.new'+trigger.new);
            System.debug('Trigger.old'+trigger.old);
            System.debug('Trigger.oldMap'+trigger.oldMap);
            System.debug('Trigger.newMap'+trigger.newMap);
        }
    }
    if(trigger.isUpdate)
    {
        if(trigger.isBefore)
        {
            System.debug('Before Update');
            System.debug('Trigger.new'+trigger.new);
            System.debug('Trigger.old'+trigger.old);
            System.debug('Trigger.oldMap'+trigger.oldMap);
            System.debug('Trigger.newMap'+trigger.newMap);
        }
        if(trigger.isAfter)
        {
            System.debug('After Update');
            System.debug('Trigger.new'+trigger.new);
            System.debug('Trigger.old'+trigger.old);
            System.debug('Trigger.oldMap'+trigger.oldMap);
            System.debug('Trigger.newMap'+trigger.newMap);
        }   
    }
    if(trigger.isDelete)
    {
        if(trigger.isAfter)
        {
            System.debug('After Delete');
            System.debug('Trigger.new'+trigger.new);
            System.debug('Trigger.old'+trigger.old);
            System.debug('Trigger.oldMap'+trigger.oldMap);
            System.debug('Trigger.newMap'+trigger.newMap);
        }    
    }
}