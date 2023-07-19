trigger AccountUpdater on Account (before insert,before update,after insert,after update) {
    if(Trigger.isinsert && Trigger.isbefore)
    {
       AccountUpdaterHandler.accountUpdaterone(trigger.new);
    }
    if(((Trigger.isInsert || Trigger.isupdate ) && Trigger.isBefore ) || ((Trigger.isInsert || Trigger.isupdate) && Trigger.isAfter))
    {
       AccountUpdaterHandler.accConUpdatertwo(trigger.new);

    }
}