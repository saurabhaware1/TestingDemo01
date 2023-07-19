public class LEX_ChangeOwnerAction {

    public static final Integer OPERATION_BATCH_SIZE = 10;

    @AuraEnabled
    public static Object changeOwnerProcess(String recordId, List < String > lstAccIds, Boolean isSendEmail, Integer startInd) {
        //Chunk by OPERATION_BATCH_SIZE
        List < String > lstAccsScope = new List < String > ();
        Integer nextInd = startInd + OPERATION_BATCH_SIZE;
        nextInd = nextInd >= lstAccIds.size() ? lstAccIds.size() : nextInd;
        for (Integer i = startInd; i < nextInd; i++) {
            lstAccsScope.add(lstAccIds[i]);
        }
        Savepoint sp = Database.setSavePoint();
        String accListForSendEmail = '';
        try {
            //Update Owner
            List < Account > lstAccsToUpdate = new List < Account > ();
            for (Account acc: [select Id, Name from Account where Id in: lstAccsScope]) {
                lstAccsToUpdate.add(new Account(Id = acc.id, ownerid = recordId));
                accListForSendEmail = String.isEmpty(accListForSendEmail) ? acc.Name + ' - ' + acc.Id : accListForSendEmail + '\n' + acc.Name + ' - ' + acc.Id;
            }
            update lstAccsToUpdate;
        } catch (DMLException e) {
            Database.rollback(sp);
            return new Map < String, Object > {
                'isSuccess' => false,
                'msg' => e.getDmlMessage(0),
                'result' => lstAccsScope
            };
        }
        //Send email result
        if (isSendEmail) {
            List < User > lstUsers = [select Id, Name, Email from User where Id =: recordId];
            List < EmailTemplate > lstEmails = [Select Id, Subject, Description, Body from EmailTemplate where DeveloperName = 'LEX_ChangeOwnerNotification'];
            if (!lstUsers.isEmpty() && !lstEmails.isEmpty()) {
                sendNotification(lstUsers[0], lstEmails[0], accListForSendEmail);
            }
        }
        return new Map < String, Object > {
            'isSuccess' => true,
            'msg' => 'Success!',
            'nextInd' => nextInd < lstAccIds.size() ? nextInd : -1,
            'result' => lstAccsScope
        };
    }

    private static String mergeFieldInBody(EmailTemplate emailTemplate, User u, String accListForSendEmail) {
        String body = emailTemplate.body;
        body = body.replace('{!User.Name}', u.Name);
        body = body.replace('{!#####}', accListForSendEmail);
        return body;
    }

    public static void sendNotification(User u, EmailTemplate emailTemplate, String accListForSendEmail) {
        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        message.setUseSignature(false);
        message.setBccSender(false);
        message.setSaveAsActivity(false);
        String body = mergeFieldInBody(emailTemplate, u, accListForSendEmail);
        message.toAddresses = new String[] { u.Email };
        message.setSubject(emailTemplate.Subject);
        message.setPlainTextBody(body);
        Messaging.SingleEmailMessage[] messages = new List < Messaging.SingleEmailMessage > { message };
        Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
        if (results[0].success) {
            System.debug('The email was sent successfully.');
        } else {
            System.debug('The email failed to send: ' + results[0].errors[0].message);
        }
    }
}