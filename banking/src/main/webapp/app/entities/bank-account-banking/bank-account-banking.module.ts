import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';

import { KeymicobankSharedModule } from 'app/shared/shared.module';
import { BankAccountBankingComponent } from './bank-account-banking.component';
import { BankAccountBankingDetailComponent } from './bank-account-banking-detail.component';
import { BankAccountBankingUpdateComponent } from './bank-account-banking-update.component';
import { BankAccountBankingDeleteDialogComponent } from './bank-account-banking-delete-dialog.component';
import { bankAccountRoute } from './bank-account-banking.route';

@NgModule({
  imports: [KeymicobankSharedModule, RouterModule.forChild(bankAccountRoute)],
  declarations: [
    BankAccountBankingComponent,
    BankAccountBankingDetailComponent,
    BankAccountBankingUpdateComponent,
    BankAccountBankingDeleteDialogComponent,
  ],
  entryComponents: [BankAccountBankingDeleteDialogComponent],
})
export class KeymicobankBankAccountBankingModule {}
