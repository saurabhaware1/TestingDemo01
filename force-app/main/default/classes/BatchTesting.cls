Global class BatchTesting implements Database.batchable <sObject>,Database.stateful {
    integer RecProcess = 0; // Here We HAve Declare The Integer "Reprocess = 0" to KEep Track Of Record, Using Database.Stateful interphase
    
    Global Database.QueryLocator Start(Database.BatchableContext BC){
        String Q = 'SELECT ID, Name,Active__c From Account';
        return database.getQueryLocator(Q);
    }
    Global Void Execute (Database.BatchableContext BC , list<Account> AccList){
        for(Account Acc : AccList){
            if(Acc.Active__c == 'No'){
                Acc.Active__c =NUll;
                RecProcess = RecProcess+1; // HEre We Will Increment The Value by 1, So It Will Return The VAlue, And update AccList: Will Update thAt Count
            }
        }
        update AccList;
    }
    Global Void Finish (Database.BatchableContext BC){
        System.debug('Hi From Finish Method');
        System.debug('Final Count Of Number Of Rec Count -->' +RecProcess);
       
    }
}