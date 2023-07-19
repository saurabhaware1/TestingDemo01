public with sharing class AccountUpdaterHandler {
    public static Void  accountUpdaterone(list<Account> recList) {
        list<Account> AccountToUpdate = new list<Account>();

        if(!recList.isempty()){
            for(Account Acc:recList){
                if(Acc.rating== 'hot' ){ 
                    acc.rating = 'Cold';
                    AccountToUpdate.add(Acc);
                }
            }
            if(!AccountToUpdate.isempty())
        {
            update AccountToUpdate;
        }
        }
    }
   public static void accConUpdatertwo(List<Account> conAccList) {
    List<Account> childRetrive = [SELECT Id, (SELECT Id FROM Contacts) FROM Account WHERE Id IN :conAccList];
    List<Account> accountToUpdate = new List<Account>();
    
    for (Account acc : childRetrive) {
        acc.Child_Con__c = acc.Contacts.size();
        accountToUpdate.add(acc);
    }
    
    if (!accountToUpdate.isEmpty()) {
        update accountToUpdate;
    }
}





}