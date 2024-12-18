import { LightningElement, api, wire, track } from 'lwc';
import getOpportunities from '@salesforce/apex/AccountOpportunitiesController.getOpportunities';
import { refreshApex } from '@salesforce/apex'; // Import pour rafraîchir les données    handleRefresh() {
    


export default class AccountOpportunitiesViewer extends LightningElement {
    @api recordId;
    @track opportunities = [];  // Initialiser comme un tableau vide
    @track siOpportunities = false; // Nouvelle propriété pour vérifier les opportunités
        @track error = {};
   
   // @track error = null;
   wiredOpportunitiesResult;
    columns = [
        { label: 'Nom Opportunité', fieldName: 'Name', type: 'text' },
        { label: 'Montant', fieldName: 'Amount', type: 'currency' },
        { label: 'Date de Clôture', fieldName: 'CloseDate', type: 'date' },
        { label: 'Phase', fieldName: 'StageName', type: 'text' }
    ];

    @wire(getOpportunities, { accountId: '$recordId' }) //error
    wiredOpportunities(resultat) {
        this.wiredOpportunitiesResult=resultat;
const {data , error}=resultat;
              if (data) {
            this.opportunities = data;
            this.siOpportunities = data.length > 0;  // Vérifie si le tableau n'est pas vide
            this.error=null;
        } else if (error) {
            
            this.error = error;
            this.opportunities = [];    
            this.siOpportunities = false;
                }
        
        
        }
        handleRafraichir(){
            refreshApex(this.wiredOpportunitiesResult);
        }
        

}