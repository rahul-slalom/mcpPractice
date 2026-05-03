public with sharing class accountController {
    
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(String accName){
        try {
            if (Schema.sObjectType.Account.isAccessible()) {
                return [SELECT Id, Name, phone, rating, website FROM Account WHERE Name LIKE :('%' + accName + '%') LIMIT 10];
            } else {
                throw new AuraHandledException('You do not have permission to access Account records.');
            }
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static string insertAccount(String accName, String accPhone){
        try {
            Account acc = new Account();
            acc.Name = accName;
            acc.Phone = accPhone;
            insert acc;
            return acc.Id;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}