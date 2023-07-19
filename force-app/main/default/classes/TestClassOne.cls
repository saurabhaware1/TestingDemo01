public class TestClassOne {
    /*public Static Void firstMethod(integer Rank){
if(Rank == 1 ){
system.debug('You Got Gold Medal');
}
else if(Rank == 2) {
system.debug('You Got Silver Medal');

} 
else if(Rank == 3) {
system.debug('You Got Bronze Medal');
} 
else{
system.debug('You Tried Your Best Keep going on');
}

}*/   // Normal If Else
    /*Public Void SecondM(integer Rank){
string Medal_Colour;
if(Rank == 1){
Medal_Colour = 'Gold';
system.debug('You Have Achived ' +Medal_Colour +'	' +'Congratulation');
} Else if(Rank == 2){
Medal_Colour = 'Silver';
system.debug('You Have Achived ' +Medal_Colour +'	' +'Congratulation');
} Else If(Rank == 3){
Medal_Colour = 'Bronze';
system.debug('You Have Achived ' +Medal_Colour +'	' +'Congratulation');

} else {
Medal_Colour = null;
System.debug('Try Harder NExt Time');
}

}*/   //if.... else if statment Ladder
    /*public Static  Void ThirdM(integer num){
//integer num = -3;
Switch on num{
when 2{
system.debug('Num Is Two');
}
when -3{
system.debug('Num Is Negative Three');
} when else{
system.debug('Num Is niether 2 or -3');
}
}
} */   // switch on expression
    /* public Static Void fm(integer i,integer p){  //while loop
while(i>=p){
system.debug('Print I -->' +i);
i--;

}
} */   //While loop
    /* public Static Void FifthMethod(){
for(integer i=0; i<=600; i++){
system.debug('The Value Of I-->' +i);
i+=2;
}
} */   //for loop
    /*public Static Void SixMethod(){
list <Account> Newlist = new list<Account>();
Newlist = [Select id,Name From Account];
for(Account Acc : NewList){
system.debug('NAme Of Account -->' +Acc.name);
system.debug('Id OF Account -->' +Acc.Id);

}
} */   // For loop
    /*public void TestMethodone (){
for(integer i=1;i<=10;i++)
{
if(i==5)
{
continue;
}
system.debug('Value Of i==' +i);
}
}*/
    /*public Static Void newCode(){
        list<String> NewList = New list<String>();
NewList.add('Saurabh');
NewList.add('Aware');
NewList.add('DYP');
NewList.add('Akash');
NewList.add('Sanket');
NewList.add('car');
system.debug('NAme IN List Are -->' +NewList);
system.debug('Size Of List-->' +NewLIst.size());
NewList.add('Autade');
system.debug('NAme IN List Are -->' +NewList);
system.debug('Size Of List-->' +NewLIst.size());
//newlist.clear();
system.debug('NAme IN List After Clearing List -->' +NewList);
system.debug('Size Of List After Claering-->' +NewLIst.size());
newlist.clone();
system.debug('NAme IN List After Clearing List -->' +NewList);
newlist.indexof('saurabh');
system.debug('Index Of zero' +newlist.get(3));
// system.debug('Index Of zero' +newlist.sort());
newlist.sort();
system.debug('Sorted List IS-->' +NewList);
//set
Set<String> newString = new set<String>();
newString.add('Saurabh');
newString.add('S0urabh');
newString.add('Saurah');
newString.add('Saurab');
newString.add('Sauabh');
newString.add('Saubh');
newString.add('MAngo');
newString.add('Fruit');
system.debug('Size Of Set Is' +newstring.size());
system.debug('Index of String ' +newstring.contains('SaUbh')); // contains meathod in Set Is Case SENsetive 
        
        //MAP Demo
        // A MAp IS Collection Of Key-value Pairs
        Map<integer,String> intomap = new Map<integer,String>();
        intomap.put(1,'saurabh');
        intomap.put(2,'Aware');
        system.debug('List Of Map' +Intomap);
        system.debug('Size Of Map-->' +Intomap.size());
        intomap.put(2, 'Avare');
        system.debug('List Of Map' +Intomap);
        system.debug('size Of Map-->' +Intomap.size());
        intomap.put(5,'aware');
        //intomap.remove(2);
        system.debug('Removing Key -->' +intomap.remove(2));
        system.debug('NewList Of Map-->' +intomap);
        set<Integer> newSet = new set<integer>();
        newset = intomap.keyset();
        system.debug('New Key Values-->' +newset);
    }*/   // Collection SET MAP LIST
}