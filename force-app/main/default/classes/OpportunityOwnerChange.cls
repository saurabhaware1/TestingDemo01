public class OpportunityOwnerChange {
    //  String newid;
    
    public Static Void changeOwner(list<Opportunity> Record){ 
        String newid = '2F0052w00000D5X8s';
        String userProfileName = [select id, Name from user].Name;
        
        if(!Record.isEmpty())
        { 
            for(Opportunity opp : Record)
            { 
                if(userProfileName == 'saurabh aware')
                {
                    opp.OwnerId = newid;
                    
                }
            }
        } 
    }
    
}