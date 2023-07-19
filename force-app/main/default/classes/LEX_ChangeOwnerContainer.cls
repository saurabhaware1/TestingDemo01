public class LEX_ChangeOwnerContainer {


        public String setAccIds {get;set;}
    public String setAccId {get;set;}

    public LEX_ChangeOwnerContainer(ApexPages.StandardSetController controller) {
        setAccIds = '';
        Map<Id,Account> mapAccs = new Map<Id,Account>((List<Account>) controller.getSelected());
        if(!mapAccs.isEmpty()){
            setAccIds = String.join(new List<Id>(mapAccs.keySet()), ',');
        } 
    }

}