public with sharing class ContactRec {
    public static void ContactRecone() {

        list<contact> con ;
        con = [SELECT ID from contact];
        system.debug('con list--->' +con);
                system.debug('con list--->' +con.size());

    }
}