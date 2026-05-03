@IsTest
public class AccountManagerTest {

    @isTest static void testGetAccount() {
       Id accId =  createTestRecord();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://yourInstance.my.salesforce.com/services/apexrest/Accounts/'
            + accId+'/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account acc = AccountManager.getAccount();
        // Verify results
        System.assert(acc != null);
    }
        static Id createTestRecord() {
        // Create test record
        Account acc = new Account();
            acc.name ='test';
            insert acc;
            Contact cont = new Contact();
            cont.lastname ='last';
            cont.FirstName='first';
            cont.AccountId = acc.Id;
            insert cont;
            
            return acc.Id;
    }
}