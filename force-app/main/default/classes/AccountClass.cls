Global class AccountClass implements Database.Batchable  <sObject>{
    
    public Database.QueryLocator start(Database.BatchableContext  BC){
        string Q = 'SELECT Id,Name From Account';
        return database.getQueryLocator(Q);
    }
    
    public Void Execute(Database.BatchableContext BC,list<Account> recToUpdate){
        list<Account> records = new list<Account>();
        if(!recToUpdate.IsEmpty()){
            for(Account a: recToUpdate){
                if(a.Rating == 'cold'){
                    a.rating = 'warm';
                    records.add(a);
                }
                update records;
            }
        }
    }
    public void finish(Database.BatchableContext BC){
        // post logic
    }
}
//AccountClass ac = new AccountClass();
//Database.executeBatch(ac, 200);