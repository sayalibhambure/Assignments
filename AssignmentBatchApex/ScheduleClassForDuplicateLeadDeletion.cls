global with sharing class ScheduleClassForDuplicateLeadDeletion implements Schedulable {
    
     public static string cron = '0 0 0/3 * * ?';  //Every 3 hours
     
     global static String scheduleMe() {
     ScheduleClassForDuplicateLeadDeletion schedule = new ScheduleClassForDuplicateLeadDeletion();
     return System.schedule('DuplicateLeadDeletion', cron, schedule);
    }
     
    global void execute(SchedulableContext sc)
    {
      DuplicateLeadDeletion dupLead = new DuplicateLeadDeletion();
      Database.executeBatch(dupLead);
        
    }

}