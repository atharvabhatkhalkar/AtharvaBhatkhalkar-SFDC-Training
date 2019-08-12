@isTest
public class LeadProcessorTest {
    
    @isTest    
    public static void testit() {
        List<lead> listOfLead = new List<lead>();
        for (Integer i = 0; i<200; i++) {
            Lead objOflead = new lead();
            objOflead.LastName = 'name'+i;
			objOflead.company = 'company';
            objOflead.Status =  'somestatus';
            listOfLead.add(objOflead);
        }
        insert listOfLead;
        
        test.startTest();
        
        Leadprocessor objOfleadprocessor = new Leadprocessor();
        Id batchId = Database.executeBatch(objOfleadprocessor);
        Test.stopTest();
            
    }

}