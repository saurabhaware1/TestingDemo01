import { LightningElement,wire, track} from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent'; // for toast notification
import ACCOUNT_OBJECT from '@salesforce/schema/Account';  // import object
import Name from '@salesforce/schema/Account.Name';// impport fields
import Phone from '@salesforce/schema/Account.Phone';
import Website from '@salesforce/schema/Account.Website';
import AnnualRevenue from '@salesforce/schema/Account.AnnualRevenue';

import getAccountList from '@salesforce/apex/account_create.getAccountList';
import accRecord from '@salesforce/apex/AccountData.accountCreate';
//import {deleteRecord} from 'lightning/uiRecordApi';
//import {refreshApex} from '@salesforce/apex';

export default class ShowContactDetails extends LightningElement {
    @track Name;
    @track AnnualRevenue;
    @track Website;
    @track Phone;
    @track isShowModal = false;
    @track accountList;
    @track AccList =[]


    showToast( message,varianttype)  // showToast Event Method
  {
    const evt = new ShowToastEvent({
    message: message,
    variant: varianttype,
    mode: 'dismissable'
      });
    this.dispatchEvent(evt);
  }
    handleAnnualRevenue(event){
        this.AnnualRevenue = event.target.value;

    }
      handleName(event){
        this.Name = event.target.value;
    }
      handlePhone(event){
        this.Phone = event.target.value;
    }
    handleWebsite(event){
        this.Website = event.target.value;
    }

    showModalBox() {  
        this.isShowModal = true;
    }

    hideModalBox() {  
        this.isShowModal = false;
    }

    @track columns = [
        { label: 'FirstName', fieldName: 'FirstName' },
        {label: 'LastName', fieldName: 'LastName' },
        { label:'Phone Number', fieldName:'Phone', type:'phone'},
        {label:'Email', fieldName:'Email',type:'text'},
        {label: '', type: 'button',typeAttributes: {
                                                iconName: 'utility:edit',
                                                name: 'deleteRecord',
                                                disabled: false,
                                                value: 'deleteBtn'
                                            }
        },
        {label:'', type: 'button', typeAttributes:{
                                                iconName:'utility:delete',
                                                name:'editRecord',
                                                disabled:false,
                                                value:'editBtn'
                                            }
        },
    ];


     //Method 2
    @wire (getAccountList) wiredAccounts({data,error}){
            if (data) {
                this.accountList = data;
            console.log(data); 
            } else if (error) {
            console.log(error);
            }
        }

    accountObject = ACCOUNT_OBJECT;  // object type
    accountFields = [Name, Phone, AnnualRevenue, Website]; // fields to be showin in form
    // shows toast message after account creation
    
    handleAccountCreated(){
        if(this.Name && this.Phone && this.Website && this.AnnualRevenue){
            accRecord({  
                AName: this.Name,
                AnnualRevenue: this.AnnualRevenue,
                Aphone: this.Phone,
                Awebsite: this.Website
            })
            .then(result =>
                {
                //this.isModalOpen = false;
                this.showToast('Account Created Succesfully.', 'Success');
                this.Name = '';
                this.AnnualRevenue = '';
                this.email = '';
                this.Website = '';
                window.location.reload();
                })
                .catch(error => {
                console.error(error);
                  this.showToast(error.body.message, 'error');       // Handle any errors that occur
                });
                }else
                {
                    this.showToast('Please fill the required fields.', 'error');
                }
            }



}