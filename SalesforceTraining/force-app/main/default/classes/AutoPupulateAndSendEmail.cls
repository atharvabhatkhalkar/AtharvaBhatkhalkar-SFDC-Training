/********************************************************************** 
Name: AutoPopulateAndSendEmail() 
Copyright © 2019 Enzigma Company Inc. 
====================================================== 
====================================================== 
Purpose: This class auto populates the address fields from
		the Account's address to the contact's other address
		fields.
------- 
====================================================== 
====================================================== 
History 
------- 
VERSION AUTHOR DATE DETAIL FEATURES/CSR/TTP 
1.0 - Atharva Bhatkhalkar 03/04/2009 INITIAL DEVELOPMENT CSR:  
***********************************************************************/ 

public class AutoPupulateAndSendEmail {
    
/*******************************************************************
Purpose: This method is used for process builder to invoke after the 
		action like save. This method gets the ID as a parameter and 
		sets all the address fields of account to its corresponding 
		other fields in contact object.
Parameters: List of ID 
Throws [Exceptions]: Throws an error-AutoPopulateHasSomeError
********************************************************************/
    
    
    @InvocableMethod
    public static void RunForAutoPopulate(List<Id> lstOfId){
        try{
            system.debug('Does lstOfContact Conatain anything'+lstOfId);
            List<Contact> lstOfContactFetching = [SELECT ID,Account.BillingStreet,Account.BillingCity,Account.BillingState,
                                          Account.BillingPostalCode,Account.BillingCountry FROM Contact 
                                          WHERE id in : lstOfId];
            
            system.debug('Does lstOfAccount Conatin anything' +lstOfContactFetching);
            Contact objOfCotactForUpdate = new Contact();
            List<Contact> lstOfContact = new List<Contact>();
            for(Contact itrLstOfContact:lstOfContactFetching)  {
                objOfCotactForUpdate.id=itrLstOfContact.ID;
                objOfCotactForUpdate.OtherCity=itrLstOfContact.Account.BillingCity;
                objOfCotactForUpdate.OtherCountry=itrLstOfContact.Account.BillingCountry;
                objOfCotactForUpdate.OtherState=itrLstOfContact.Account.BillingState;
                objOfCotactForUpdate.OtherPostalCode=itrLstOfContact.Account.BillingPostalCode;
                lstOfContact.add(objOfCotactForUpdate);
            }  
            
            update lstOfContact;  
        }
        catch(Exception e){
            system.debug('AutoPopulateHasSomeError');
        }
    }
}