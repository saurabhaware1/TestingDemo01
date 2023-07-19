@istest
public class ChangeOwnerTestClass {
    
    @istest static void testuser()
    { // test data for user
        user users = new user();
        users.FirstName = 'Test01';
        users.LastName = 'UserOne';
        users.Email = 'testUserOne@skill.in';
        users.Alias = 'stUser';
        users.Username = 'testUserOne@skill.in';
        users.EmailEncodingKey = 'UTF-8';
        users.LocaleSidKey = 'en_US';
        users.LanguageLocaleKey = 'en_US';
        users.TimeZoneSidKey = 'America/Los_Angeles';
        users.ProfileId = UserInfo.getProfileId();
        insert users;
        
        // test data for the account
        Account accounts = new Account();
        accounts.Name = 'test01';
        insert accounts;
        
        list<id> accid = new list<id>();
        accid.add(accounts.Id);
        
        
        Test.startTest();
        ChangeOwner.changeUser(users.Id ,accid,true);
        Test.stopTest();
        
        
        Account updatedAccount = [SELECT OwnerId FROM Account WHERE Id = :accounts.Id];
        System.assertEquals(users.Id, updatedAccount.OwnerId);
        
        
        List<EmailMessage> sentEmails = [SELECT Id FROM EmailMessage WHERE ParentId = :accounts.Id];
        System.assertEquals(1, sentEmails.size());
        Test.startTest();
        ChangeOwner.changeUser(users.Id, accid, false);
        Test.stopTest();
        sentEmails = [SELECT Id FROM EmailMessage WHERE ParentId = :accounts.Id];
        System.assertEquals(0, sentEmails.size());
        
    }  
}