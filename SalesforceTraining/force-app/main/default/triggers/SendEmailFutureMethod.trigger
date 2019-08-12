trigger SendEmailFutureMethod on Candidate_AtharvaBhatkhalkar__c (after insert,after update) {
    
    if(Trigger.new[0].Status__c=='Hired'){        
        if(CheckRecursive.isExecuted){
            CheckRecursive.isExecuted=false;
            SendEmail.SendToCandidate(Trigger.NEW[0].Email__c,Trigger.NEW[0].id);
        }      
    }
    
}