import { LightningElement,track,wire,api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent'; //module is imported to display a notification message on the UI
import { NavigationMixin, CurrentPageReference } from 'lightning/navigation'; // module is imported to handle navigation to another page.
import setChangeUser  from '@salesforce/apex/ChangeOwner.changeUser'; // in this we will change the owner of selected Accounts
import getUserList from '@salesforce/apex/ChangeOwner.getUser';  // fething the ActiveUsers


export default class ChangeOwner extends NavigationMixin (LightningElement){
//Boolean tracked variable to indicate if modal is open or not default value is false as modal is closed when page is loaded 
@track isModalOpen = false;
@track selectedUserId;    // user code variables
@track userOptions = [];  // user code variables
@api accSelIds;           // list of Account ids
checkboxVal = false;       // email Check Box
@track recordIds;
@track objectSuffix;



showToast( message,varianttype)  // showToast Event Method
  {
    const evt = new ShowToastEvent({
    message: message,
    variant: varianttype,
    mode: 'dismissable'
      });
    this.dispatchEvent(evt);
  }


connectedCallback() {       // connect call back for user
if(!this.accSelIds || this.accSelIds.length === 0)
{
    this.showToast('Select at least one record and try again.','error');
    this.handleClick()();

}else
{
this.isModalOpen = true;
getUserList().then(result => {
  this.userOptions = result.map(user => ({label: user.Name, value: user.Id}));
})
.catch(error => console.error('Error fetching user list', error));
}
}
handleChange(event) {
this.selectedUserId = event.target.value;    // Set the selecteduserid property to the new value of the input element
}
handleChangeUser() {
if(this.selectedUserId){
  setChangeUser({ userId: this.selectedUserId, recordId: this.accSelIds , emailSelected : this.checkboxVal})
  .then(result =>
    {
      console.log(result);
      this.isModalOpen = false;
      this.showToast('Owner has been changed Succesfully.', 'Success');
      this.objectSuffix = result;
      this.handleCancelClick();
    })
    .catch(error => {
      console.error(error);
      this.showToast(error.body.message, 'error');       // Handle any errors that occur
  });
      }else
    {
      this.showToast('Enter a new owner for this record.', 'error');
    }
}
checkBoxClicked(event) {
this.checkboxVal = event.target.checked;
}



handleRecordIdChange(event) {
    this.recordIds = event.target.value;
}

handleCancelClick() {
    setTimeout(
        function() {
            window.history.back();
        },
        1
    ); 
}
handleClick(){
  setTimeout(
    function() {
        window.history.back();
    },
    0
);
}
}