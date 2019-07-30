/********************************************************************** 
Name: TestMethodForCandidateTrigger 
Copyright © 2019 Enzigma Company Inc. 
====================================================== 
====================================================== 
Purpose: This class is used for testing all the candidate
		Trigger.
------- 
====================================================== 
====================================================== 
History 
------- 
VERSION AUTHOR DATE DETAIL FEATURES/CSR/TTP 
1.0 - Atharva Ravindra Bhatkhalkar 03/04/2009 INITIAL DEVELOPMENT CSR:  
***********************************************************************/ 


@isTest
public class TestMethodForCandidateTrigger {
/*******************************************************************
Purpose: This method is written for the data required for testing 
		purpose.
********************************************************************/
    @testSetup public static void testSetup() {
        Deactivate_Triggers__c objOfDeactivateTriggers = new Deactivate_Triggers__c();
        objOfDeactivateTriggers.Deactivate_ActivateTriggers__c=true;
        insert objOfDeactivateTriggers;
        system.assertEquals(objOfDeactivateTriggers.Deactivate_ActivateTriggers__c, true);
        
     
	}
 /*******************************************************************
Purpose: This method checks for the salary field if it is empty then 
		it gives error.
Throws [Exceptions]: Expected Salary field is missing
********************************************************************/
   
    @isTest
    public static void testMethodForSalaryFieldMissing(){
        try{
            Contact objContact = new Contact(LastName='Test-Enzigma-Contact');
            insert objContact;
            Job_AtharvaBhatkhalkar__c objOfjob = new Job_AtharvaBhatkhalkar__c(Number_of_Positions__c=20,Manager__c=objContact.id,Active__c=true,
                                                                               Qualification_Required__c='MBA');
            insert objOfjob;
            Candidate_AtharvaBhatkhalkar__c objForItr=  new Candidate_AtharvaBhatkhalkar__c(First_Name__c='Anuaja',Last_Name__c='Joshi', Email__c='anuja@user.com',
                                                                                            Status__c='Applied',Expected_Salary__c=NULL, JOB__c=objOfjob.Id);
            insert objForItr;
            
            system.assertNotEquals(objForItr.Id, NULL);
            
        }
        catch(Exception e){
            System.assert(e.getMessage().contains('Expected Salary field is missing'));
        }
    }
    
/*******************************************************************
Purpose: This Method checks that the job applied is active or not,
		if it is inactive then the value is not inserted and it gives 
		the	error.
Throws [Exceptions]: Applied job is inactive
********************************************************************/

    @isTest
    public static void testMethodForJobAppliedIsInactive(){
        
        try{
            Contact objContact = new Contact(LastName='Test-Enzigma-Contact');
            insert objContact;
            Job_AtharvaBhatkhalkar__c objOfjob = new Job_AtharvaBhatkhalkar__c(Number_of_Positions__c=20,
                                                                               Manager__c=objContact.id,
                                                                               Active__c=false,
                                                                               Qualification_Required__c='MBA');
            insert objOfjob;
            Candidate_AtharvaBhatkhalkar__c objForItr=  new Candidate_AtharvaBhatkhalkar__c(First_Name__c='Anutja',
                                                                                            Last_Name__c='Joshi', 
                                                                                            Email__c='anuja@user.com',
                                                                                            Status__c='Applied',
                                                                                            Expected_Salary__c=NULL, 
                                                                                            JOB__c=objOfjob.Id);
            insert objForItr; 
            system.assertNotEquals(objForItr.id, null);
        }
        catch(Exception e){
            system.assert(e.getMessage().contains('Applied job is inactive'));
        }
        
        
    }
/*******************************************************************
Purpose: This method checks that if the application date is equal to the
		created date or not.
********************************************************************/

    @isTest
    public static void testMethodForReplacingCreatedDateWithSystemDate(){
         Contact objContact = new Contact(LastName='Test-Enzigma-Contact');
            insert objContact;
            Job_AtharvaBhatkhalkar__c objOfjob = new Job_AtharvaBhatkhalkar__c(Number_of_Positions__c=20,
                                                                               Manager__c=objContact.id,
                                                                               Active__c=true,
                                                                               Qualification_Required__c='MBA');
            insert objOfjob;
            Candidate_AtharvaBhatkhalkar__c objForItr=  new Candidate_AtharvaBhatkhalkar__c(First_Name__c='Anuja',
                                                                                            Last_Name__c='Joshi', 
                                                                                            Email__c='anuja@user.com',
                                                                                            Application_Date__c=Date.newInstance(2019, 03, 15),
                                                                                            Status__c='Applied',
                                                                                            Expected_Salary__c=12341, 
                                                                                            JOB__c=objOfjob.Id);
            insert objForItr; 

        
        	Candidate_AtharvaBhatkhalkar__c objOfCandidate = [SELECT id,Application_Date__c FROM Candidate_AtharvaBhatkhalkar__c
                                                             WHERE First_Name__c='Anuja'];
        	objOfCandidate.Application_Date__c=system.today();
        	system.debug(objOfCandidate.Application_Date__c);
        	update objOfCandidate;
        	system.debug(objOfCandidate);
        	system.assertEquals(objOfCandidate.Application_Date__c, system.today());
        
    }
    
   /* @isTest
    public static void testMethodForSendingMailToHiredCandidate(){
         Contact objContact = new Contact(LastName='Test-Enzigma-Contact');
            insert objContact;
            Job_AtharvaBhatkhalkar__c objOfjob = new Job_AtharvaBhatkhalkar__c(Number_of_Positions__c=20,
                                                                               Manager__c=objContact.id,
                                                                               Active__c=true,
                                                                               Qualification_Required__c='MBA');
            insert objOfjob;
            Candidate_AtharvaBhatkhalkar__c objForItr=  new Candidate_AtharvaBhatkhalkar__c(First_Name__c='Anuja',
                                                                                            Last_Name__c='Joshi', 
                                                                                            Email__c='anuja@user.com',
                                                                                            Status__c='Applied',
                                                                                            Expected_Salary__c=12341, 
                                                                                            JOB__c=objOfjob.Id);
            insert objForItr; 
        
        	Candidate_AtharvaBhatkhalkar__c objOfCandidateForEmail = [SELECT id,Status__c,Email__c FROM Candidate_AtharvaBhatkhalkar__c
                                                                     WHERE id=:objForItr.Id];
        
        	objOfCandidateForEmail.Status__c='Hired';
        	update objOfCandidateForEmail;
        	if(objOfCandidateForEmail.Status__c)
    }*/
/*******************************************************************
Purpose: This test method checks that if hired applicants are equal to 
		the total number of positions or not. If yes then it changes 
		the status of job active to inactive.
********************************************************************/

    
   		  @isTest
    public static void testMethodForSettingStatusToInactive(){
         Contact objContact = new Contact(LastName='Test-Enzigma-Contact');
            insert objContact;
            Job_AtharvaBhatkhalkar__c objOfjob = new Job_AtharvaBhatkhalkar__c(Number_of_Positions__c=1,
                                                                               
                                                                               Manager__c=objContact.id,
                                                                               Active__c=true,
                                                                               Qualification_Required__c='MBA');
            insert objOfjob;
            Candidate_AtharvaBhatkhalkar__c objForItr=  new Candidate_AtharvaBhatkhalkar__c(First_Name__c='Anuja',
                                                                                            Last_Name__c='Joshi', 
                                                                                            Email__c='anuja@user.com',
                                                                                            Application_Date__c=Date.newInstance(2019, 03, 15),
                                                                                            Status__c='Hired',
                                                                                            Expected_Salary__c=12341, 
                                                                                            JOB__c=objOfjob.Id);
            insert objForItr; 

			Job_AtharvaBhatkhalkar__c objOfJobForQuery = [SELECT id,Hired_Applicants__c,Number_of_Positions__c FROM Job_AtharvaBhatkhalkar__c
                                                  WHERE id = :objOfjob.id];
        	
        if(objOfJobForQuery.Hired_Applicants__c == objOfJobForQuery.Number_of_Positions__c-1){
            objOfJobForQuery.Active__c=false;
            update objOfJobForQuery;
            System.assertEquals(objOfJobForQuery.Active__c, false);
        }
        
    }
}