public with sharing class ApexClassFour {
    public Static void ApexClassFour() 
    {
        list<Account> AccN = New List<Account>();
        list<Account> AccToupsert = New List<Account>();
        
        Accn = [SELECT Id,Name,Rating,Industry From Account Where Name like '%101%'];
        
        if (!Accn.IsEmpty()) 
        {
            for (Account Ac : Accn)
            {
                Ac.Name = 'DmlTest';
                Ac.Rating = 'Hot';
                Ac.Industry = 'Banking';
                AccToupsert.add(Ac);
            }
        }
        if (!AccToupsert.IsEmpty()) 
        {
            upsert AccToupsert;
        }else 
        {
            Insert AccToupsert;
        }
    }
}