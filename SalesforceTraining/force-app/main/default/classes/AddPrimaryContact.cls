public class AddPrimaryContact implements Queueable {
    public contact objOfContact;
    public String state;
    
    public AddPrimaryContact(Contact objOfContact, String state) {
        this.objOfContact = objOfContact;
        this.state = state;
    }
    
    public void execute(QueueableContext qc) {
        system.debug('this.c = '+this.objOfContact+' this.state = '+this.state);
        List<Account> acc_lst = new List<account>([select id, name, BillingState from account where account.BillingState = :this.state limit 200]);
        List<contact> c_lst = new List<contact>();
        for(account objOfAccount: acc_lst) {
            contact c = new contact();
            objOfContact = this.objOfContact.clone(false, false, false, false);
            objOfContact.AccountId = objOfAccount.Id;
            c_lst.add(objOfContact);
        }
        insert c_lst;
    }

}