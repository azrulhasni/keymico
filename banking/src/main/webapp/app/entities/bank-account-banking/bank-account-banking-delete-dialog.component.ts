import { Component } from '@angular/core';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { JhiEventManager } from 'ng-jhipster';

import { IBankAccountBanking } from 'app/shared/model/bank-account-banking.model';
import { BankAccountBankingService } from './bank-account-banking.service';

@Component({
  templateUrl: './bank-account-banking-delete-dialog.component.html',
})
export class BankAccountBankingDeleteDialogComponent {
  bankAccount?: IBankAccountBanking;

  constructor(
    protected bankAccountService: BankAccountBankingService,
    public activeModal: NgbActiveModal,
    protected eventManager: JhiEventManager
  ) {}

  cancel(): void {
    this.activeModal.dismiss();
  }

  confirmDelete(id: number): void {
    this.bankAccountService.delete(id).subscribe(() => {
      this.eventManager.broadcast('bankAccountListModification');
      this.activeModal.close();
    });
  }
}
