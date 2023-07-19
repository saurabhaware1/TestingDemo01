public with sharing class account_create {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getAccountList() {
        /*return [SELECT Id, Name, Type, Rating,
                Phone, OwnerId
            FROM Account];*/
         return  [ SELECT Id,FirstName,LastName,Phone, Email  FROM Contact order by CreatedDate desc limit 10];
    }
}