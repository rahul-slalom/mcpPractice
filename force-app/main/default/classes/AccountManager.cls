@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {
	
        @HttpGet
    	global static Account getAccount() {
        RestRequest request = RestContext.request;
        System.debug('request.requestURI:'+request.requestURI);
        String accountId = request.requestURI.substring(
          request.requestURI.lastIndexOf('/Accounts/')+10);
            accountId = accountId.replace('/contacts', '');
            System.debug('accountId:'+accountId);
        Account result =  [SELECT Id, Name, (select Id,Name from Contacts ) FROM Account where id = :accountId];
        return result;
    }
}