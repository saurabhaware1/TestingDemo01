Global class ContactTestBC implements Database.Batchable <Sobject>  
{
    
    Global Database.QueryLocator Start(Database.BatchableContext BC)
    {
        System.debug('HI FROM Start METHOD');
        String Q = 'SELECT ID,Name,AssistantPhone,Languages__c,Level__c From contact ';
        return database.getQueryLocator(Q);
    }
    
    GLobal void Execute (Database.BatchableContext Bc, List<Contact> ConLIst)
    {
        System.debug('HI FROM Execute METHOD');
        
        For(Contact Con : ConLIst)
        {
            if(Con.AssistantPhone == null)
            {
                Con.AssistantPhone = '9856742233';
            }
            if(Con.Languages__c == 'English' )
            {
                Con.Languages__c = 'Hindi';
            }
            if(Con.level__c == 'Secondary')
            {
                Con.Level__c = 'Tertiary';
            }
        }
        update ConLIst;
    }
    
    Global Void Finish( database.BatchableContext BC)
    {
        list<Contact> comList = [Select FirstName, LastName From Contact where FirstName like 'R%'];
        Messaging.SingleEmailMessage GG = New Messaging.SingleEmailMessage();
        GG.toaddresses = New String[]{'Saurabh@skillminds.in'};
            GG.optoutpolicy = 'FILTER';
        GG.subject  = 'Contact Update Is Completed';
        GG.plaintextbody = 'Hey Dear {!User.Email} ,Whole Contact Batch is Updated, Next Batch Will Update Soon';
        String body;
        For(Contact com:comList)
        {
             body = 'Dear ' + com.FirstName + ', ';
        body += 'I confess this will come as a surprise to you.';
        body += 'I am John Alliston CEO of the Bank of Nigeria.';
        body += 'I write to request your cooperation in this ';
        body += 'urgent matter as I need a foreign partner ';
        body += 'in the assistance of transferring $47,110,000 ';
        body += 'to a US bank account. Please respond with ';
        body += 'your bank account # so I may deposit these funds.';
        }
        
        gg.setHtmlBody(body);
        
        Messaging.SingleEmailMessage[] messages =   new List<Messaging.SingleEmailMessage> {GG};
            Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
    }
}