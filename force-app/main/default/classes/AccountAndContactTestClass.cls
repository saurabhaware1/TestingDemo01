@isTest
public class AccountAndContactTestClass {
    @isTest
    static void testCreateAccountAndContact() {
        // Arrange
        String accountName = 'Test Account';
        String contactFirstName = 'John';
        String contactLastName = 'Doe';
        String contactEmail = 'johndoe@test.com';
        String contactPhone = '123-456-7890';
        
        // Act
        Test.startTest();
        Id contactId = new AccountAndContact().createAccountAndContact(accountName, contactFirstName, contactLastName, contactEmail, contactPhone);
        Test.stopTest();
        
        // Assert
        Account account = [SELECT Name,(SELECT AccountId FROM Contacts WHERE Id = :contactId) FROM Account];
        System.assertEquals(accountName, account.Name);
        
        Contact contact = [SELECT FirstName, LastName, Email, Phone FROM Contact WHERE Id = :contactId];
        System.assertEquals(contactFirstName, contact.FirstName);
        System.assertEquals(contactLastName, contact.LastName); 
        System.assertEquals(contactEmail, contact.Email);
        System.assertEquals(contactPhone, contact.Phone);
    }
    
}