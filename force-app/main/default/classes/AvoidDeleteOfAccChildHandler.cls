public class AvoidDeleteOfAccChildHandler {
    public static void checkAccountName(List<Account> oldAccounts){
        set<Id> accountIdSet = new set<Id>(); 
        Map<Id, Account> newAcc;
        for(Account acc: oldAccounts){
            accountIdSet.add(acc.Id);
        }
        if(!accountIdSet.isEmpty()){
            newAcc = new Map<Id, Account>([Select Id, Name, (Select id from contacts)
                                           from Account where Id =: accountIdSet]);
        }
        if(!newAcc.isEmpty()){
            for(Account accOldList: oldAccounts){ //trigger.old
                if(newAcc.get(accOldList.Id).contacts.size() >=2){
                    accOldList.addError('This account having more than 2 child contact');
                }
            }
        }
    }
    
}