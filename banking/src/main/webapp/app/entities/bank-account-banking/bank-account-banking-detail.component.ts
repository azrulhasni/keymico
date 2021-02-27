import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';

import { IBankAccountBanking } from 'app/shared/model/bank-account-banking.model';

@Component({
  selector: 'jhi-bank-account-banking-detail',
  templateUrl: './bank-account-banking-detail.component.html',
})
export class BankAccountBankingDetailComponent implements OnInit {
  bankAccount: IBankAccountBanking | null = null;

  constructor(protected activatedRoute: ActivatedRoute) {}

  ngOnInit(): void {
    this.activatedRoute.data.subscribe(({ bankAccount }) => (this.bankAccount = bankAccount));
  }

  previousState(): void {
    window.history.back();
  }
}
