public class AvoideDelOfAccHandler {
    public Static Void avoidDel(list<Account> RecToDelete) {
        Set<ID> AccID = New Set<ID>();
        Map<id,Account> AccList = New map<id,Account>([SELECT ID,(SELECT Id From Contacts) From Account Where Id in:AccID]);
        IF(!RecToDelete.isEmpty())
        {
            for(Account Acc : RecToDelete)
            {
                AccID.add(Acc.id);
            }
        }
        if(!Acclist.isEmpty()){
            for(Account Acc : RecToDelete)
            {
                if(Acclist.get(Acc.id).contacts.size()>0){
                    Acc.addError('You Dont Have Sufficient Previlage');
                }
            }
        }
        
    }
    public Static Void updateValue(list<Account> newList) {
        if(!newList.isempty()){
            for(account acc : newList){
                if(acc.BillingCity == null){
                    acc.BillingCity = 'Mumbai NY';
                    acc.ShippingCity = acc.BillingCity;
                }
                if(acc.BillingCountry == null){
                    acc.BillingCountry = 'India';
                    acc.ShippingCountry = acc.BillingCountry;
                }
                if(acc.BillingState == null){
                    acc.BillingState = 'Maharashtra';
                    acc.ShippingState = acc.BillingState;
                }
            }
        }
    }
    public Static Void AvoidDelete(list<Account> delacc ){
        if(!delacc.isEmpty())
        {
            for(Account Acc : delacc)
            {
                if(Acc.ParentId != null)
                {
                    Acc.adderror('You cannot Delete ');
                }
            }
        }
    }
    
}