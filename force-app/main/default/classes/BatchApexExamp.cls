global class BatchApexExamp implements Database.Batchable<sObject>, Schedulable, Queueable {
    public Database.QueryLocator start(Database.BatchableContext BC) {
        String query = 'SELECT Id, Name FROM Account Limit 5';
        return Database.getQueryLocator(query);
    }
    public void execute(Database.BatchableContext BC, List<Account> accList) {
        system.debug('public void execute(Database.BatchableContext BC, List<Account> accList)');
        // Process each batch of records here
    }
    public void execute(SchedulableContext SC) {
        system.debug(' public void execute(SchedulableContext SC) ');
        
        method1();
    }
    public void execute(QueueableContext Qc) {
        system.debug('public void execute(QueueableContext Qc) ');
        
        method1();
    }
    public void finish(Database.BatchableContext BC) {
        system.debug(' public void finish(Database.BatchableContext BC) ');
        
        // Perform any cleanup tasks here
        
    }
    @future
    public static void method1(){
        system.debug('  public static void method1() ');
        
        // Perform asynchronous processing here
    }
}