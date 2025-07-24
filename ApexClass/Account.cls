public with sharing class Account {
    public Account() {

    }

    public static list<List<Account>> getAccount()
    {
       list <list <Account>> accRecords = [select name , id from Account limit 100];
       return accRecords;
    } 

}