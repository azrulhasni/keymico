import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';

import { KeymicobankSharedModule } from 'app/shared/shared.module';
import { CustomerBankingComponent } from './customer-banking.component';
import { CustomerBankingDetailComponent } from './customer-banking-detail.component';
import { CustomerBankingUpdateComponent } from './customer-banking-update.component';
import { CustomerBankingDeleteDialogComponent } from './customer-banking-delete-dialog.component';
import { customerRoute } from './customer-banking.route';

@NgModule({
  imports: [KeymicobankSharedModule, RouterModule.forChild(customerRoute)],
  declarations: [
    CustomerBankingComponent,
    CustomerBankingDetailComponent,
    CustomerBankingUpdateComponent,
    CustomerBankingDeleteDialogComponent,
  ],
  entryComponents: [CustomerBankingDeleteDialogComponent],
})
export class KeymicobankCustomerBankingModule {}
