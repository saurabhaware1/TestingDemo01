public class Calculator {
    public integer Num1,num2,result;
    
    public integer addition(integer a,integer b)
    {
        result = a+b;
        return result;
    }
    public integer Subtraction(integer a,integer b)
    {
        if(a>b){result = a-b;} else{result=b-a;}
        return result;
    }
    public integer Division(integer a,integer b)
    {
        result = a/b;
        return result;
    }
    public integer Multiplication (integer a,integer b)
    {
        result = a*b;
        return result;
    }
}