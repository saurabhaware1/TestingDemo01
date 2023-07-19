({
    doInit: function(cmp, event, helper) {
        let accSelIds = cmp.get("v.accSelIds");
        cmp.set("v.totalSelRecords", accSelIds.length);
        if ($A.util.isEmpty(accSelIds)) {
            cmp.set("v.isError", true);
            cmp.set("v.messageError", 'Please select at least one record, and try again.');
        }
    },
    
    doChangeOwnerProcess: function(cmp, event, helper) {
        helper.doChangeOwnerProcess(cmp, event);
    },

    goBack: function(cmp, event, helper) {
        helper.goBack(cmp);
    }
})