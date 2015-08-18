@isTest
public with sharing class TestDuplicateLeadDeletion {
    
    public static testMethod void duplicateLeadDelete()
    {
        
        Lead lead1 = new lead(LastName='DummyLead',Company = 'ESPL',Status = 'Open - Not Contacted',Email='dummy@espl.com');
        insert lead1;
        Lead lead2 = new lead(LastName='DummyLead1',Company = 'ESPL',Status = 'Open - Not Contacted',Email='dummy@espl.com');
        insert lead2;
        
        Test.startTest();
        DuplicateLeadDeletion dup = new DuplicateLeadDeletion();
        Database.executeBatch(dup);
        Test.stopTest();
        
        List<Lead> lstDeleteLead = new List<Lead>();
        lstDeleteLead = [SELECT Id,LastName,Email FROM Lead where Email = 'dummy@espl.com'];
        System.assertEquals(1,lstDeleteLead.size());
    }

}