import { LightningElement, track, wire } from 'lwc';
import getContacts from '@salesforce/apex/AccountAndContact.concreatetwo';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getContactlist from '@salesforce/apex/AccountAndContact.getContactsone';
import { deleteRecord } from 'lightning/uiRecordApi';
import { updateRecord } from 'lightning/uiRecordApi';
import { refreshApex } from '@salesforce/apex';





export default class UserManagement extends LightningElement {
  @track contactList = [];
  fldsItemValues = [];
  @track showInputTable = false;
  @track contactListRows =[];
  @track columns = [
    { label: 'Name', fieldName: 'FirstName', editable: true},
    { label: 'LastName', fieldName: 'LastName',  editable: true},
    { label:'Email', fieldName:'Email', editable: true},
    {label:'Phone', fieldName:'Phone',  editable: true}
];
connectedCallback(){
  this.getcon();
  let contactListRow =[];
  this.handleaddRow(contactListRow);
}
getcon(){
  console.log('get con' );
  //alert('get con' );

  getContactlist().then(result => {
      this.contactList = result;
      
    //  alert('result' +result)
//this.error = undefined;
  })
  .catch(error => {
//this.error = error;
      this.contactList = undefined;
  });
  console.log('result' +this.contactList)

}





handleClick(){
    this.showInputTable = true;
  }

showToast(message, varianttype) {
    const evt = new ShowToastEvent({
      message: message,
      variant: varianttype,
      mode: 'dismissable'
    });
    this.dispatchEvent(evt);
  }

handleaddRow(){
    let contvar = {}; // here we define private contvar  the con obj 
    let randomId = Math.random() * 16; // with this we are generating random id 
    if((this.contactListRows).length > 0){ // here we are checking if this.contataclistrows have value then this length sould be greter than 0 
      contvar.index = this.contactListRows[(this.contactListRows).length - 1].index +1; 
      // above we r assigning index to the row we are creating on clicking on add row button based on previous row
    }else{   contvar.index = 1;} // if the length is not grettwe than 0 we are showing 1 row constant
    contvar.FirstName= null; // assigning null values to input fields
    contvar.LastName= null;
    contvar.Email= null;
    contvar.Phone= null;
    contvar.Id = randomId; // assigning random id to that contvar.id function
    this.contactListRows.push(contvar); // pushibng data to ui
  }

handleDeleteRow(event) {
    // console.log('heavy alert');
   //console.log(this.contactListRows[event.target.value].Id);
   //console.log('index--> ' ,event.target.dataset.index);
   //console.log('row id-->' +row.Id );
   // here we have define X vairable to which assigning specific value of that Row by Id, when on ui user click on any row that row have id
   // so with ,splice function we r checking row.idv=== x if it match will del this row
   const x = this.contactListRows[event.target.value].Id;
   this.contactListRows.splice(this.contactListRows.findIndex(row => row.Id ===  x ), 1);
   
   }


handleChange(event) {
    const y= event.target.dataset.id;    
    console.log('const y debug-->' ,y);
    const idtoFind = this.contactListRows[y].Id;
    console.log('id to find' ,idtoFind);

	var currentCapture = this.contactListRows.find(ele => ele.Id == idtoFind);
  console.log('current capture--->' ,currentCapture);
if(event.target.name === 'FirstName' ){
  currentCapture.FirstName = event.target.value;
}
if(event.target.name === 'LastName' ){
  currentCapture.LastName = event.target.value;
}
if(event.target.name === 'Email' ){
  currentCapture.Email = event.target.value;
}
if(event.target.name === 'Phone' ){
  currentCapture.Phone = event.target.value;
}
    console.log('current elememnt--->' ,event.target.name);
    }

handleSubmit(){
   // alert('hi from 69');
    if (this.contactListRows) {
      console.log('values-->' +JSON.stringify(this.contactListRows))
     getContacts({
        conlist: this.contactListRows
    
      })
        .then(() => {
          this.showToast('Contact created successfully.', 'success');
     
          window.location.reload();
        })
        .catch((error) => {
          console.error('Error creating account and contact', error);
          this.showToast('Contact not created.', 'error');
        });
    } else {
      this.showToast('Enter values in all fields.', 'error');
    }
  }
handlEdite(event) {
    this.saveDraftValues = event.detail.draftValues;
    const recordInputs = this.saveDraftValues.slice().map(draft => {
        const fields = Object.assign({}, draft);
        return { fields };
    });

    // Updateing the records using the UiRecordAPi
    const promises = recordInputs.map(recordInput => updateRecord(recordInput));
    Promise.all(promises).then(res => {
        this.ShowToast('Records Updated Successfully!', 'success');
        this.saveDraftValues = [];
        return this.refresh();
    }).catch(error => {
        this.ShowToast('An Error Occured!!', 'error');
    }).finally(() => {
        this.saveDraftValues = [];
    });
  }
     // This function is used to refresh the table once data updated
     async refresh() {
      await refreshApex(this.contactList);
  }


  handleDeleteRecord(event){
    var currentrecid = event.target.value;
      deleteRecord(currentrecid)
          .then(() => {
            this.showToast('Contact Deleted successfully.', 'success');
            refreshApex(this.contactList);
            alert((this.contactList).length)
          })
          .catch(error => {
            this.showToast('unable to delete.', 'error');


          });
  }




















}