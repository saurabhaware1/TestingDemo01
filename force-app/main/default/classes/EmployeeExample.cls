public class EmployeeExample{
    /*public Void DmlMethod(){
try   
{
list<Account> newList = new list<Account>();
newlist =[SELECT ID, NAme,NumberOfEmployees From Account limit 1];
for(Account Acc: newlist){
system.debug('Number Of Employee -->' +Acc.NumberOfEmployees);
}

} 
catch(Exception E) 
{
system.debug('Empolyee Exception -->' +E.getCause());
system.debug('Empolyee Exception -->' +E.getMessage());

}
} 
public Static Void insertAcc (){
list<Account> AccList = New list<Account>();
for(integer i =0; i<=10; i++)
{
account Acc = new Account();
Acc.name = 'Test OneDel' +i;
Acc.Rating = 'Cold';
AccList.Add(Acc);
}
insert AccList;
} 
public Static Void methodOne(){
// Here we created list to Del Account 
list<Account> AccGoingToDel = New list<Account>();
// here we will retrive the record which will going to be deleted 
AccGoingToDel = [SELECT ID, Name From Account limit 10];

//here we will Save the All The Data in Delresult 
//Dtabase.delete is the parial Dml Method. With  If Some Rec Are Not Deleted THen Only Those rec will Be Roll back
database.DeleteResult[] DelResult =  database.delete(AccGoingToDel,false);

list<Account> DelAcc = New list<Account>();
list<Account> nonDelAcc = New List<Account>();

for(integer i = 0; i< DelResult.size(); i++){
if(DelResult[i].isSuccess()){
DelAcc.add(AccGoingToDel[i]);
} else {
nonDelAcc.add(AccGoingToDel[i]);
}
}
system.debug('Deleted Account Ids' +DelAcc);
system.debug('Deleted Account Ids' +DelAcc.size());
system.debug('NON-Deleted Account Ids' +nonDelAcc.size());
system.debug('NON-Deleted Account Ids' +nonDelAcc);
}*/
    public Static Void Mclass()
    {   
        Schema.DescribeSObjectResult AA = Account.Sobjecttype.getDescribe();
        //system.debug('Result Is-->' +AA);
        list<Schema.ChildRelationship> GG = AA.getChildrelationships();
        for(Schema.ChildRelationship ZZ: GG){
            System.debug('Child Relation Are---->' +ZZ.getRelationshipName());
            
        }
        
    } 
    public Static Void Mmclass()
    {   
        
    }
    
}