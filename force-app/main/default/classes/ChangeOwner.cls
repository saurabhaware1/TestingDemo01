public with sharing class ChangeOwner {
    
    public String setAccIds{get;set;}
   
    public ChangeOwner(ApexPages.StandardSetController controller) {
        setAccIds = '';
        Map<Id,SObject> mapAccs = new Map<Id,SObject>((List<SObject>) controller.getSelected());
        system.debug('id from 7-->' +mapAccs);
       
        if(!mapAccs.isEmpty()){
            setAccIds = String.join(new List<Id>(mapAccs.keySet()), ',');
            system.debug('id from 9-->' +setAccIds);
        }
    }
   
    @AuraEnabled(cacheable=true)
    public Static list<user> getUser()
    {
        list<user> u = new list<user>();
        u =[SELECT Id,Name FROM user where IsActive = true];
        return u;
    }
     /*@AuraEnabled
    public Static string getObjectSuffix(list<ID> recordId)
    {
        string objsuffix = string.valueof(recordId.get(0)).substring(0,3);
        return objsuffix;
    }*/
   
    @AuraEnabled
    public static string changeUser(string userId, list<ID> recordId, Boolean emailSelected) {
    List<SObject> acctoUpdate = new List<SObject>();
    if (!recordId.isEmpty() && userId != null) {
        Schema.SObjectType objectApiName  = recordId[0].getSObjectType();
        String queryString = 'SELECT Id, OwnerId FROM ' + objectApiName + ' WHERE Id IN :recordId';
        List<SObject> accList = Database.query(queryString);
        for (SObject acc : accList) {
            acc.put('OwnerId', userId);
            acctoUpdate.add(acc);
        }
        if (!acctoUpdate.isEmpty()) {
            update acctoUpdate;
            sendEmail(userId, emailSelected);
            System.debug('Updated owner ID successfully for ' + objectApiName + ' records with IDs: ' + acctoUpdate);
        }
    }
    string objsuffix = string.valueof(recordId.get(0)).substring(0,3);
    return objsuffix;
}

    // Method = Sent email to new User if  email Checkbox is selected
    public static void sendEmail(string userid, Boolean emailSelected) {
        User userRecord;
        if (userid != null) {
            userRecord = [SELECT Id, Name, Email FROM User WHERE Id = :userid LIMIT 1];
            String link = 'https://skillminds62-dev-ed.develop.my.salesforce.com/' + userid;
            String emailbody = 'Hi ' + userRecord.Name + ',\n\nThe records are assigned to you. \n\nThanks,\nSalesforce Team.\n' + link;
            if (emailSelected) {
                // Send email logic
                Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
                message.toAddresses = new String[] {userRecord.Email, 'saurabhaware26@gmail.com'};
                    message.subject = 'Position transferred to you';
                message.plainTextBody = emailbody;
                // Store all email in messages(Messaging.SingleEmailMessage[])
                Messaging.SingleEmailMessage[] messages = new List<Messaging.SingleEmailMessage> {message};
                    // Send email
                    Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
                if (results[0].success) {
                    System.debug('The email was sent successfully.');
                } else {
                    System.debug('The email failed to send: ' + results[0].errors[0].message);
                }
            }
        }
    }

}