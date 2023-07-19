trigger CreateContactForAccount on Account (After insert) {
    if(Trigger.isInsert && Trigger.isAfter){

        system.enqueueJob(new QueableClassAccTrigger(trigger.new));
    }
}