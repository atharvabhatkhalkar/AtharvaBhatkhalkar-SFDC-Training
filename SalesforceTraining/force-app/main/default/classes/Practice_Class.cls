public class Practice_Class {
	
    public void Practice_Class(){
     List<Candidate_AtharvaBhatkhalkar__c> lstOfCandidate_AtharvaBhatkhalkar = [SELECT id, Name,First_Name__c,
                                                      Last_Name__c,Email__c,Status__c, JOB__c 
                                                      FROM Candidate_AtharvaBhatkhalkar__c LIMIT 100];
    
    List<Candidate_AtharvaBhatkhalkar__c> lstOfCandidate_AtharvaBhatkhalakarForInsert = new List<Candidate_AtharvaBhatkhalkar__c>();

	for(Candidate_AtharvaBhatkhalkar__c objOfCandidate : lstOfCandidate_AtharvaBhatkhalkar)
    {
        objOfCandidate.Name='New candidate';
        objOfCandidate.First_Name__c='Ramesh';
        objOfCandidate.Last_Name__c='sharma';
        objOfCandidate.Email__c='ok@ok.com';
        objOfCandidate.Status__c='Applied';
        objOfCandidate.JOB__c='DevOps';
        lstOfCandidate_AtharvaBhatkhalakarForInsert.add(objOfCandidate);
    }
   }
}