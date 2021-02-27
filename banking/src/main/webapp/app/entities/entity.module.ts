import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';

@NgModule({
  imports: [
    RouterModule.forChild([
      {
        path: 'customer-banking',
        loadChildren: () => import('./customer-banking/customer-banking.module').then(m => m.KeymicobankCustomerBankingModule),
      },
      {
        path: 'transaction-banking',
        loadChildren: () => import('./transaction-banking/transaction-banking.module').then(m => m.KeymicobankTransactionBankingModule),
      },
      {
        path: 'bank-account-banking',
        loadChildren: () => import('./bank-account-banking/bank-account-banking.module').then(m => m.KeymicobankBankAccountBankingModule),
      },
      /* jhipster-needle-add-entity-route - JHipster will add entity modules routes here */
    ]),
  ],
})
export class KeymicobankEntityModule {}
