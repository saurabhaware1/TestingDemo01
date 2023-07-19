public class MyLWCController {
    public List<Account> accounts { get; set; }
    
    public MyLWCController(ApexPages.StandardSetController controller) {
        system.debug('000__>' +ApexPages.CurrentPage().getParameters());
        String[] recordIds = ApexPages.CurrentPage().getParameters().get('recordIds').split(',');
                system.debug('000__>' +recordIds);

        accounts = [SELECT Id, Name FROM Account WHERE Id IN :recordIds];
        system.debug('11111'+accounts);
    }
}