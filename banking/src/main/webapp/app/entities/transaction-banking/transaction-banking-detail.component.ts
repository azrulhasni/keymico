import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { JhiDataUtils } from 'ng-jhipster';

import { ITransactionBanking } from 'app/shared/model/transaction-banking.model';

@Component({
  selector: 'jhi-transaction-banking-detail',
  templateUrl: './transaction-banking-detail.component.html',
})
export class TransactionBankingDetailComponent implements OnInit {
  transaction: ITransactionBanking | null = null;

  constructor(protected dataUtils: JhiDataUtils, protected activatedRoute: ActivatedRoute) {}

  ngOnInit(): void {
    this.activatedRoute.data.subscribe(({ transaction }) => (this.transaction = transaction));
  }

  byteSize(base64String: string): string {
    return this.dataUtils.byteSize(base64String);
  }

  openFile(contentType = '', base64String: string): void {
    this.dataUtils.openFile(contentType, base64String);
  }

  previousState(): void {
    window.history.back();
  }
}
