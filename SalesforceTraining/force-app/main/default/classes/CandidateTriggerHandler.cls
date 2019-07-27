/********************************************************************** 
Name: CandidateTriggerHandler 
Copyright © 2019 Enzigma Company Inc. 
====================================================== 
====================================================== 
Purpose: This class is designed to control all the activities
of the triggers.
------- 
====================================================== 
====================================================== 
History 
------- 
VERSION AUTHOR DATE DETAIL FEATURES/CSR/TTP 
1.0 - Atharva Bhatkhalkar 03/04/2009 INITIAL DEVELOPMENT CSR: 
***********************************************************************/ 

public class CandidateTriggerHandler {
    
    Set<id> setOfId = new Set<id>();
/*******************************************************************
Purpose: This method gets the value of Expected_salary field from 
the trigger.new context variable and checks that is is not null
if it is null then using addError() it gives the error message.
Parameters: list of trigger.new
********************************************************************/
    
    
    public void expectedSalaryMissing(List<Candidate_AtharvaBhatkhalkar__c> lstOfCandidateInTrigger){
        
        for(Candidate_AtharvaBhatkhalkar__c objCandidate : lstOfCandidateInTrigger){
            setOfId.add(objCandidate.Job__c);
            if (objCandidate.Expected_Salary__c == null) {
                objCandidate.addError('Expected Salary field is missing');     
            }
        }
    }
    
/*******************************************************************
Purpose: This method checks that the job which candidate has applied is 
		inactive and gives the specific error.
Parameters: list of trigger.new
********************************************************************/

    public void inactiveJobApplied(List<Candidate_AtharvaBhatkhalkar__c> lstOfCandidateInTrigger){ 
         for(Candidate_AtharvaBhatkhalkar__c objCandidate : lstOfCandidateInTrigger){
             setOfId.add(objCandidate.Job__c);}
        map<Id,Job_AtharvaBhatkhalkar__c> mapJobs = new map<Id,Job_AtharvaBhatkhalkar__c>(
            [SELECT id,Active__c FROM Job_AtharvaBhatkhalkar__c WHERE id in :setOfId]
        );
        
        for(Candidate_AtharvaBhatkhalkar__c candidate : lstOfCandidateInTrigger){
            if(mapJobs.get(candidate.JOB__c).Active__c == false){
                candidate.addError('Applied job is inactive');
            }
        }        
    }
    
/*******************************************************************
Purpose: This method swaps the date with created date with the date 
		applied by the respective candidate. 
Parameters: list of trigger.new
********************************************************************/
    public void givenDateSwapBycreatedDate(List<Candidate_AtharvaBhatkhalkar__c> lstOfCandidateOfAftTrig){
        List<Candidate_AtharvaBhatkhalkar__c> lstOfCandidate = new List<Candidate_AtharvaBhatkhalkar__c>();
        for(Candidate_AtharvaBhatkhalkar__c itrCandidate : lstOfCandidateOfAftTrig){
            Candidate_AtharvaBhatkhalkar__c objCandidate = new Candidate_AtharvaBhatkhalkar__c (Id = itrCandidate.Id);
            objCandidate.Application_Date__c=Date.parse(objCandidate.CreatedDate.date().format());
            lstOfCandidate.add(objCandidate);
        }
        update lstOfCandidate;
}
    
    
/*******************************************************************
Purpose: This method sends email to respective candidate if the status 
		changes to hired
Parameters: list of trigger.new
********************************************************************/
public void sendEmail(List<Candidate_AtharvaBhatkhalkar__c> lstOfCandidateAfterInsertOrUpdate){
        Set<Id> setOfIdz= new Set<Id>();
        
        List<Messaging.SingleEmailMessage> lstOfMails = new List<Messaging.SingleEmailMessage>();
        
        for(Candidate_AtharvaBhatkhalkar__c itrOfCandidate : lstOfCandidateAfterInsertOrUpdate){
            setOfIdz.add(itrOfCandidate.JOB__c);
            if(itrOfCandidate.Email__c!=null){
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                List<String> sendTo = new List<String>();
                sendTo.add(itrOfCandidate.Email__c);
                mail.setToAddresses(sendTo);
                mail.setSubject('Important Notice ' + itrOfCandidate.LastModifiedDate);
                String strBody = 'All required candidate has been hired for this job on ';
                mail.setHtmlBody(strBody);
                lstOfMails.add(mail);
            }
        }
        Messaging.sendEmail(lstOfMails);
}
    
/*******************************************************************
Purpose: This method sets the status to inactive if the hired applicants
		number is equivalent to the number of positions.
Parameters: list of trigger.new
Returns: [optional]
Throws [Exceptions]: [optional]
********************************************************************/
   public void setStatusToInactive(List<Candidate_AtharvaBhatkhalkar__c> lstOfCandidateAfterInsertOrUpdate){
         for(Candidate_AtharvaBhatkhalkar__c objCandidate : lstOfCandidateAfterInsertOrUpdate){
             setOfId.add(objCandidate.Job__c);}
       
        List<Job_AtharvaBhatkhalkar__c> lstOfJobGlobal = new  List<Job_AtharvaBhatkhalkar__c>();
        List<Job_AtharvaBhatkhalkar__c> lstOfJobAppField= new List<Job_AtharvaBhatkhalkar__c>();
        
        lstOfJobAppField = [SELECT Active__c, Hired_Applicants__c, Number_of_Positions__c 
                            FROM Job_AtharvaBhatkhalkar__c WHERE Id in :setOfId];
        for(Job_AtharvaBhatkhalkar__c itrJob : lstOfJobAppField){
            if(itrJob.Hired_Applicants__c == itrJob.Number_of_Positions__c - 1){
                itrJob.Active__c=false;
                lstOfJobGlobal.add(itrJob);
            }
        }
        update lstOfJobGlobal;
    }
    
}