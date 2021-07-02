import { LightningElement, wire, track } from 'lwc';
import getCalendar from '@salesforce/apex/Calendar.getCalendar';
import {getRecord} from 'lightning/uiRecordApi';
import Id from '@salesforce/user/Id';
import NAME_FIELD from '@salesforce/schema/User.Name';

export default class Calendar extends LightningElement {
    userId = Id;
    @track name;
    @wire(getRecord, {
        recordId: Id,
        fields: [NAME_FIELD]
    }) wireuser({
        error,
        data
    }) {
        if (error) {
           this.error = error ; 
        } else if (data) {
            this.name = data.fields.Name.value;
        }
    }
    @track columns = [{
        label: 'Holiday name',
        fieldName: 'Name',
        type: 'text',
        sortable: true
    },
    {
        label: 'Date',
        fieldName: 'Date',
        type: 'text',
        sortable: true
    },
    {
        label: 'Description',
        fieldName: 'Description',
        type: 'text',
        sortable: true
    },
    {
        label: 'Locations',
        fieldName: 'Locations',
        type: 'text',
        sortable: true
    }
];
    @track error;
    @track calendarList ;
    @wire(getCalendar) calendarData;
}   