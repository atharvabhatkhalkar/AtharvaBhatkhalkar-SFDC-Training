@IsTest
public class AddPrimaryContactTest {
    
    @IsTest
    public static void testing() {
        List<account> listOfAccount = new List<account>();
        for (Integer i=0; i<50;i++) {
            account objOfAccount = new account(name=string.valueOf(i),billingstate='NY');
            system.debug('account objOfAccount = '+objOfAccount);
            listOfAccount.add(objOfAccount);
        }
        for (Integer i=0; i<50;i++) {
            account objOfAccountForSecond = new account(name=string.valueOf(50+i),billingstate='CA');
            system.debug('account objOfAccountForSecond = '+objOfAccountForSecond);
            listOfAccount.add(objOfAccountForSecond);
        }      
        insert listOfAccount;
        Test.startTest();
        contact c = new contact(lastname='alex');
        AddPrimaryContact apc = new AddPrimaryContact(c,'CA');
        system.debug('apc = '+apc);
        System.enqueueJob(apc);
        Test.stopTest();
        List<contact> c_lst = new List<contact>([select id from contact]);
        Integer size = c_lst.size();
        system.assertEquals(50, size);
    }

}