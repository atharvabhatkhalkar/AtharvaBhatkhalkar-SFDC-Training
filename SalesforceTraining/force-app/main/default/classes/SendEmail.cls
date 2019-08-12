/********************************************************************** 
Name: SendEmail 
Copyright © 2019 Enzigma Company Inc. 
====================================================== 
====================================================== 
Purpose: This class contains a future method which
		sends email attached with the details of the 
		student record pdf. 
------- 
====================================================== 
====================================================== 
History 
------- 
VERSION AUTHOR DATE DETAIL FEATURES/CSR/TTP 
1.0 - Atharva Bhatkhalkar 08/12/2019  
***********************************************************************/ 


global class SendEmail {
    
/*******************************************************************
Purpose: This method is a future method which is used to send the email
		to the candidate upon the change of status to Hired.
Parameters: Email address and Id
Throws [Exceptions]: 
********************************************************************/

    
    @future(callout=true)
    global static void SendToCandidate(String EmailAddress, String Id){
        system.debug('email=='+EmailAddress);
        PageReference pdf = new PageReference('https://c.ap15.visual.force.com/apex/CandidateDetailPDF?id='+id);
        Messaging.EmailFileAttachment objOfAttach = new Messaging.EmailFileAttachment();
        Messaging.SingleEmailMessage singleEmailObj = new Messaging.SingleEmailMessage();
        
        Blob body;
        
        try {
            
            body = pdf.getContentAsPDF();
            system.debug('Check wether it is getting or not'+body);
        } catch (VisualforceException e) {
            e.getMessage();
        }
        objOfAttach.setFileName('Detail of the student record.pdf');
        objOfAttach.setBody(body);
        singleEmailObj.setSubject('Sending email');
        String[] sendTo = new String[] {EmailAddress};
        singleEmailObj.setToAddresses(sendTo);
        singleEmailObj.setPlainTextBody('below are the details of the student');
        singleEmailObj.setFileAttachments(new Messaging.EmailFileAttachment[]{objOfAttach});
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{singleEmailObj});
    }
}