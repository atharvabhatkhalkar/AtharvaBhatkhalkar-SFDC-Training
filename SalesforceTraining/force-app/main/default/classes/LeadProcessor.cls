global class LeadProcessor implements Database.Batchable<sObject> {
    global Integer count = 0;
    
    global Database.QueryLocator start (Database.BatchableContext objOfBatch) {
        return Database.getQueryLocator('Select Id, LeadSource from lead');
    }
    
    global void execute (Database.BatchableContext objOfBatch,List<Lead> listOfLead) {
        List<lead> listOfleadNew = new List<lead>();
        for(lead l : listOfLead) {
            l.leadsource = 'Dreamforce';
            listOfleadNew.add(l);
            count+=1;
        }
        update listOfleadNew;
    }
	
    global void finish (Database.BatchableContext objOfBatch) {
        system.debug('count = '+count);
    }
}