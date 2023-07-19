public class AccountAndContact {
    public class ccontactwrappercls { // this is wrapper class
        @AuraEnabled public contact contactRec{get;set;}
        /* @AuraEnabled public string cFirstName{get;set};
@AuraEnabled public string cLastName{get;set};
@AuraEnabled  public string cEmail{get;set};
@AuraEnabled  public string cPhone{get;set};*/
    }
    @AuraEnabled(cacheable = true) 
    public static List<contact> getContactsone() {
        system.debug('hiii 11 from apex class');
                List<Contact> contacts =
            [SELECT Id, FirstName, Phone, Email, LastName FROM Contact WHERE CreatedDate =TODAY];
        system.debug('list'+contacts);
                //list<ccontactwrappercls> ConWrapList = new list<ccontactwrappercls>();

       /* for(contact c:contacts){
            ccontactwrappercls cw = new ccontactwrappercls();
            cw.contactRec = c;
            ConWrapList.add(cw);
        }*/

        return contacts;
    }
    @AuraEnabled
    public static void concreatetwo(list<Contact> conlist){
        
        try {
            if(!conlist.isempty()){
                list<contact> contoupdate = new list<contact>();
                for(Contact c:conlist){
                    contact con = new contact();
                    con.FirstName = c.FirstName;
                    con.LastName = c.LastName;
                    con.Email = c.Email;
                    con.Phone = c.Phone;
                    contoupdate.add(con);
                }
                if(!contoupdate.isempty()){
                    system.debug('list is--->'+contoupdate);
                    insert contoupdate;
                }
            } 
        }catch (Exception e) {
            system.debug( 'message--->' +e);
            system.debug( 'message--->' +e.getMessage());
            system.debug('messahe for line-->' +e.getLineNumber());
            throw new AuraHandledException(e.getMessage());
            
        }
    }
    
    
    
    /* @AuraEnabled
public static void createCon(list<contactwrappercls> conWrplist){
try {
if(!conWrplist.isempty()){
list<contact> contoupdate = new list<contact>();
for(contactwrappercls c:conWrplist){
contact con = new contact();
con.FirstName = c.cFirstName;
con.LastName = c.cLastName;
con.Email = c.cEmail;
con.Phone = c.cPhone;
contoupdate.add(con);
}
if(!contoupdate.isempty()){
insert contoupdate;
}
}

} catch (Exception e) {
throw new AuraHandledException(e.getMessage());
}
}


@AuraEnabled
public static void createAccountAndContact(String contactFirstName, String contactLastName, String contactEmail, String contactPhone) {
try {
Contact contact = new Contact( //here we created Contact instance And Assigning Values from lwc to thes apex variables
FirstName = contactFirstName,
LastName = contactLastName,
Email = contactEmail,
Phone = contactPhone
);
insert contact;
} catch (Exception e) {
throw new AuraHandledException(e.getMessage());
}
}
@AuraEnabled(cacheable = true)
public static List<Contact> getContacts() {
List<Contact> contacts =
[SELECT Id, Name, Phone, Email, LastName FROM Contact WHERE CreatedDate =TODAY];
return contacts;
}*/
    
}