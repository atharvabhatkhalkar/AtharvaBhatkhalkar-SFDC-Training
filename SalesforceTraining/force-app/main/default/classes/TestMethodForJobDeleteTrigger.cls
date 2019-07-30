/********************************************************************** 
Name: TestMethodForJobDeleteTrigger 
Copyright © 2019 Enzigma Company Inc. 
====================================================== 
====================================================== 
Purpose: This Class is written for the testing of the job
		trigger. 
------- 
====================================================== 
====================================================== 
History 
------- 
VERSION AUTHOR DATE DETAIL FEATURES/CSR/TTP 
1.0 - Atharva Ravindra Bhatkhalkar 03/04/2009 INITIAL DEVELOPMENT CSR: 
***********************************************************************/ 


@isTest
public class TestMethodForJobDeleteTrigger {
    
    @testSetup public static void setup() {
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
        insert objJob;       
        system.assertNotEquals(objJob.id, null);
        List<Candidate_AtharvaBhatkhalkar__c> objOfCandidate = new List<Candidate_AtharvaBhatkhalkar__c>{
            new Candidate_AtharvaBhatkhalkar__c	(Name='Hitesh',
                                                 First_Name__c='Rahul',
                                                 Last_Name__c='Chordia',
                                                 Email__c='rahul@user.com',
                                                 Status__c='Hired',
                                                 JOB__c=objJob.Id),
                new Candidate_AtharvaBhatkhalkar__c	(Name='Kalpesh',
                                                     First_Name__c='Kalpesh',
                                                     Last_Name__c='Chordia',
                                                     Email__c='rahul@user.com',
                                                     Status__c='Hired',
                                                     JOB__c=objJob.Id)
                };
                    insert objOfCandidate;
        for(Integer i=0;i<objOfCandidate.size();i++){
            system.assertNotEquals(objOfCandidate[i].id, null);
        }
        
        Deactivate_Triggers__c objOfDeactivateTriggers = new Deactivate_Triggers__c();
        objOfDeactivateTriggers.Deactivate_ActivateTriggers__c=true;
        insert objOfDeactivateTriggers;
        system.assertEquals(objOfDeactivateTriggers.Deactivate_ActivateTriggers__c, true);
        
        
    }
/*******************************************************************
Purpose: This is a test method which checks wether the job is active 
		or not, if yes then it gives error as This Job is active 
		and can not be deleted.
Throws [Exceptions]: This Job is active and can not be deleted
********************************************************************/
   
    @isTest
    public static void deleteJobWhenActiveFalse(){
        try {
            Job_AtharvaBhatkhalkar__c objOfJobForDelete = [SELECT id,Name,Active__c FROM Job_AtharvaBhatkhalkar__c WHERE Name='Ramesh'];
            system.assertNotEquals(objOfJobForDelete.Id, null);
            delete objOfJobForDelete;
        }
        
        catch(Exception e){
            System.assert(e.getMessage().contains('This Job is active and can not be deleted'));
        }       
    } 
    
/*******************************************************************
Purpose: This test method activates the jobs as soon as the required
		positions of job are greater than hired ones.
********************************************************************/

    
    @isTest
    public static void activateJobAfterHiredCanidateIsLess(){
        Job_AtharvaBhatkhalkar__c objJob = [SELECT Name,Number_of_Positions__c,Active__c FROM Job_AtharvaBhatkhalkar__c WHERE Name ='Ramesh'];
        system.assertNotEquals(objJob.id, null);
        objJob.Number_of_Positions__c += 4;
        update objJob;
        system.assertEquals(objJob.Active__c, true);
    }
}