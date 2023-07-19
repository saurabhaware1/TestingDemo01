public class RollUpTriggerHandler 
{
    public Static Void emethod(list<contact> rollupcon)
    {
        list<Account> Counttoupdate = new list<Account>();
        list<Account> AccRec = new list<Account>();
        set<Id> conid = new set<Id>();
        
        if(!rollupcon.isEmpty())
        {
            for(Contact con : rollupcon)
            {
                conid.add(con.Id);  
            }
        }
        if(!conid.isEmpty())
        {
            AccRec=[SELECT ID,RollUpCon__c,(SELECT ID From Contacts where Id =: conid) From Account];   
        }
        if(!AccRec.isEmpty()){
            for(Account aon : AccRec)
            {
                aon.RollUpCon__c = aon.contacts.size();
                Counttoupdate.add(aon);
            }
        }
        if(!Counttoupdate.isEmpty()){
            update Counttoupdate;
        }
    }
}