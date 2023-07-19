public with sharing class MixDmlError 
{
public Static Void  MixDmlError() 
{
Account A = New Account ();
A.name = 'Dml FromVS';
insert A;
}


public Static Void userMethod(String uname, String al, String em, String lname)
{
profile P = [SELECT ID From Profile Where Name = 'Standard User'];
UserRole R = [SELECT ID From UserRole Where Name  = 'Coo'];
user u = New User();
u.Alias = 'al';
u.email = 'em';
u.emailencodingKey ='UTF-8';
u.lastname= 'lname';
u.LanguageLocaleKey ='en_US';

u.localesidkey='en_US'; 
u.profileid = p.Id;
u.UserRoleId = r.Id;
u.timezonesidkey='America/Los_Angeles';
u.username=uname;
insert u;
}
}