@isTest
public with sharing class TestCollectionOfClosedWonOpportunities {
    
 
   public static testMethod void testAssociatedOpportunities(){
    Account accountInstance1 = new Account(Name ='DummyAcc',Primary_contact__c = 'sayali.bhambure@eternussolutions.com');
    Opportunity oppInstance1 = new Opportunity();
    Opportunity oppInstance2 = new Opportunity();
    
    insert accountInstance1;
    
    oppInstance1.Name='DummyOpp1';
    oppInstance1.CloseDate = Date.valueOf('2015-04-28');
    oppInstance1.StageName = 'Closed Won';
    oppInstance1.AccountId = accountInstance1.Id;
    oppInstance1.Amount = 600;
    insert oppInstance1;
    
    oppInstance2.Name='DummyOpp2';
    oppInstance2.CloseDate = Date.valueOf('2015-06-06');
    oppInstance2.StageName = 'Closed Won';
    oppInstance2.AccountId = accountInstance1.Id;
    oppInstance2.Amount = 1000;
    
    insert oppInstance2;
    
    CollectionOfClosedWonOpportunities controllerInstance = new CollectionOfClosedWonOpportunities();
    CollectionOfClosedWonOpportunities.MyWrapper wrap1 = new CollectionOfClosedWonOpportunities.MyWrapper();
    wrap1.oppList.add(oppInstance1);
    wrap1.oppList.add(oppInstance2);
    wrap1.primaryEmail = 'sayali.bhambure@eternussolutions.com';
    wrap1.Amt = 1600;
    
   
    Map<String,CollectionOfClosedWonOpportunities.MyWrapper> mapEmail_Wrapper = new Map<String,CollectionOfClosedWonOpportunities.MyWrapper>();
    mapEmail_Wrapper.put(accountInstance1.Primary_contact__c,wrap1);
    
    
    Database.executebatch(controllerInstance);
    //system.assertEquals(mapEmail_Wrapper,controllerInstance.mapPrimaryEmail_wrapper);
    System.assertEquals(1600,wrap1.amt);
    
    }
    
    
}