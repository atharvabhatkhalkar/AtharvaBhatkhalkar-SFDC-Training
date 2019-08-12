public class DailyLeadProcessor implements schedulable{
    
    public void execute(schedulableContext objOfSchedulable) {
        List<lead> listOfLead = new List<lead>();
        List<lead> listOfLeadGetting = new List<lead>([select id, leadsource from lead where leadsource = null]);
        for(lead leadObject : listOfLeadGetting) {
            leadObject.leadsource = 'Dreamforce';
            listOfLead.add(leadObject);
        }
        update listOfLead;
    }

}