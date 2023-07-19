Global class OneBatchClass Implements Database.Batchable<Sobject> {
    
    global Database.QueryLocator start (Database.BatchableContext BC ){
        string query = 'SELECT Id,name,rating, Type From Account';
        system.debug('hi from Start MEthod');
        
        return database.getQueryLocator(query);
    }
    
    global void Execute(Database.BatchableContext BC, list<Account> Acc){
        system.debug('hi from Execute MEthod');
        
        for(Account Ac :Acc)
        {
            if( Ac.rating == 'Cold' )
            {
                Ac.rating = 'Warm';
            }
            if(Ac.Rating == null){
                Ac.Rating = 'warm';
            }
        }
        update Acc;
    }
    
    global Void Finish(Database.BatchableContext BC ){
        system.debug('hi from Finish MEthod');
    }
}