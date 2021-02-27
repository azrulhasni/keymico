import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';

import { KeymicobankSharedModule } from 'app/shared/shared.module';
import { TransactionBankingComponent } from './transaction-banking.component';
import { TransactionBankingDetailComponent } from './transaction-banking-detail.component';
import { TransactionBankingUpdateComponent } from './transaction-banking-update.component';
import { TransactionBankingDeleteDialogComponent } from './transaction-banking-delete-dialog.component';
import { transactionRoute } from './transaction-banking.route';

@NgModule({
  imports: [KeymicobankSharedModule, RouterModule.forChild(transactionRoute)],
  declarations: [
    TransactionBankingComponent,
    TransactionBankingDetailComponent,
    TransactionBankingUpdateComponent,
    TransactionBankingDeleteDialogComponent,
  ],
  entryComponents: [TransactionBankingDeleteDialogComponent],
})
export class KeymicobankTransactionBankingModule {}
