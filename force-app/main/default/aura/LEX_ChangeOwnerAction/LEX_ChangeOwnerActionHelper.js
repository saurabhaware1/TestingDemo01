({
	doChangeOwnerProcess: function(component, event) {
		component.set("v.isError", false);
		let selectedLookUpRecord = component.get("v.selectedLookUpRecord");
		if ($A.util.isEmpty(selectedLookUpRecord.Id)) {
			component.set("v.isError", true);
			component.set("v.messageError", 'Please select a user, and try it again.');
		} else {
			this.disableButton(component, true);
            this.assignOwner(component, 0);
		}
	},

    assignOwner: function(component, startInd) {
        let selectedLookUpRecord = component.get("v.selectedLookUpRecord");
        var action = component.get("c.changeOwnerProcess");
        action.setParams({
            "recordId": selectedLookUpRecord.Id,
            "lstAccIds": component.get("v.accSelIds"),
            "isSendEmail": component.get("v.isSendEmail"),
            "startInd": startInd
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var res = response.getReturnValue();
                var isSuccess = res.isSuccess;
                if (isSuccess) {
                    if (parseInt(res.nextInd) > -1) {
                        this.assignOwner(component, res.nextInd);
                    } else {
                        this.goBack(component);
                    }
                } else {
                    component.set("v.isError", true);
                    this.disableButton(component, false);
                    component.set("v.messageError", res.msg + '. Failed to execute these records ' + JSON.stringify(res.result));
                }
            }
        });
        $A.enqueueAction(action);
    },

	goBack: function(cmp) {
		setTimeout(
			function() {
				window.history.back();
			},
			1000
		);
	},

	disableButton: function(cmp, isDisable) {
        cmp.set("v.loading", isDisable);
		let btnCancel = cmp.find('btnCancel');
		let btnSubmit = cmp.find('btnSubmit');
		btnCancel.set('v.disabled', isDisable);
		btnSubmit.set('v.disabled', isDisable);
		btnSubmit.set('v.label', isDisable ? 'Saving...' : 'Submit');
		btnCancel.set('v.label', isDisable ? 'Saving...' : 'Cancel');
	}
})