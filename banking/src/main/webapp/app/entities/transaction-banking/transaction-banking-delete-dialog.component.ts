import { Component } from '@angular/core';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { JhiEventManager } from 'ng-jhipster';

import { ITransactionBanking } from 'app/shared/model/transaction-banking.model';
import { TransactionBankingService } from './transaction-banking.service';

@Component({
  templateUrl: './transaction-banking-delete-dialog.component.html',
})
export class TransactionBankingDeleteDialogComponent {
  transaction?: ITransactionBanking;

  constructor(
    protected transactionService: TransactionBankingService,
    public activeModal: NgbActiveModal,
    protected eventManager: JhiEventManager
  ) {}

  cancel(): void {
    this.activeModal.dismiss();
  }

  confirmDelete(id: number): void {
    this.transactionService.delete(id).subscribe(() => {
      this.eventManager.broadcast('transactionListModification');
      this.activeModal.close();
    });
  }
}
