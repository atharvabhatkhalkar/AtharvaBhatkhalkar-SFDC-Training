@isTest
public class TestMethodForJobDeleteTrigger {

    @isTest
    static void deleteJobWhenActiveFalse(){
        Contact objContact = new Contact(LastName='Test-Enzigma-Contact');
        insert objContact;
        system.assertNotEquals(objContact.id, null);
        
        Job_AtharvaBhatkhalkar__c objJob = new Job_AtharvaBhatkhalkar__c(Name = 'Ramesh',
                                                                       Description__c = 'Hello world',
                                                                       Number_of_Positions__c = 2,
                                                                       Active__c = true,
                                                                       Manager__c = objContact.Id,
                                                                       Qualification_Required__c = 'Bcom'
                                                                      );        
        try {
            insert objJob;
            Job_AtharvaBhatkhalkar__c objJobQuery = [SELECT id FROM Job_AtharvaBhatkhalkar__c WHERE id =: objJob.Id];
            system.assertNotEquals(objJobQuery.Id, null);
            delete objJobQuery;
            
        }catch(Exception e){
            System.assert(e.getMessage().contains('This Job is active and can not be deleted'));
        }       
    }   
}