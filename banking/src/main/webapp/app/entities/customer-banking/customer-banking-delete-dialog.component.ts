import { Component } from '@angular/core';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { JhiEventManager } from 'ng-jhipster';

import { ICustomerBanking } from 'app/shared/model/customer-banking.model';
import { CustomerBankingService } from './customer-banking.service';

@Component({
  templateUrl: './customer-banking-delete-dialog.component.html',
})
export class CustomerBankingDeleteDialogComponent {
  customer?: ICustomerBanking;

  constructor(
    protected customerService: CustomerBankingService,
    public activeModal: NgbActiveModal,
    protected eventManager: JhiEventManager
  ) {}

  cancel(): void {
    this.activeModal.dismiss();
  }

  confirmDelete(id: number): void {
    this.customerService.delete(id).subscribe(() => {
      this.eventManager.broadcast('customerListModification');
      this.activeModal.close();
    });
  }
}
