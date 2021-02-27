import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';

import { ICustomerBanking } from 'app/shared/model/customer-banking.model';

@Component({
  selector: 'jhi-customer-banking-detail',
  templateUrl: './customer-banking-detail.component.html',
})
export class CustomerBankingDetailComponent implements OnInit {
  customer: ICustomerBanking | null = null;

  constructor(protected activatedRoute: ActivatedRoute) {}

  ngOnInit(): void {
    this.activatedRoute.data.subscribe(({ customer }) => (this.customer = customer));
  }

  previousState(): void {
    window.history.back();
  }
}
