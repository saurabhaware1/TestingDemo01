public with sharing class QueableClassAccTrigger implements Queueable   {
    private list<Account> AccRec;
    
    public QueableClassAccTrigger(list<Account> AccountFromTrigger) {
       if(!AccountFromTrigger.isempty()){
            this.AccRec = AccountFromTrigger;
            system.debug('list Of Account --->' +AccountFromTrigger);
       }
    }
    
    public void execute (QueueableContext QC){
        system.debug('list Of Account --->' +AccRec);
        
        list<Contact> contoinsert = new list<contact>();
        for(Account Ac: AccRec){
            if(Ac.Rating == 'Hot' ){
                contact con = new contact();
                con.LastName = Ac.Name;
                con.AccountId = Ac.Id;
                contoinsert.add(con);
            }
        }
        if(!contoinsert.isempty()){
            system.debug('Contact TO INSERT--->' +contoinsert);
            
            insert contoinsert;
            system.debug('Contact TO INSERT--->' +contoinsert);
        }
        
        
    }
}