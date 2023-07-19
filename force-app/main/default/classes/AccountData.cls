public with sharing class AccountData {
    public class wrapclass{
        @AuraEnabled public Account AccRec{get;set;}
    } 
    
    @AuraEnabled
    public static void bulkAcc(list<wrapclass> accList){
        try {
            list<Account> acctoCreate = New list<Account>();
            if(!accList.isEmpty()){
                for(wrapclass g:accList ){
                    Account A = New Account();
                    A = g.AccRec;
                    acctoCreate.add(A);
                }
            }
            if(!acctoCreate.isEmpty()){
                insert acctoCreate;
            }
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }






    @AuraEnabled
    public static void accountCreate(String AName, String Aphone, Integer AnnualRevenue, String Awebsite){
        try {
            Account acc = new Account();
            acc.Name = AName;
            acc.Phone = Aphone;
            acc.AnnualRevenue =AnnualRevenue;
            acc.Website = Awebsite;
            insert acc;
           // return 'Account created successfully';
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    
}