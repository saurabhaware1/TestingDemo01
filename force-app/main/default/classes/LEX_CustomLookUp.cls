public class LEX_CustomLookUp {
    @AuraEnabled
    public static List < sObject > fetchLookUpValues(String searchKeyWord, String ObjectName) {
        String searchKey = searchKeyWord + '%';
        String userTyep = 'Standard';
        String whereClause = ObjectName == 'User' ? ' where Name LIKE: searchKey And profile.UserType =:userTyep And IsActive = true' : ' where Name LIKE: searchKey ';
        // Create a Dynamic SOQL Query For Fetch Record List with LIMIT 5   
        String sQuery = 'select id, Name from ' + ObjectName + whereClause + ' order by createdDate DESC limit 5';
        List < sObject > lstOfRecords = Database.query(sQuery);
        return lstOfRecords;
    }
}