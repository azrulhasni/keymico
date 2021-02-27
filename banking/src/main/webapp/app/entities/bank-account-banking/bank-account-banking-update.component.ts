import { Component, OnInit } from '@angular/core';
import { HttpResponse } from '@angular/common/http';
// eslint-disable-next-line @typescript-eslint/no-unused-vars
import { FormBuilder, Validators } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { Observable } from 'rxjs';
import * as moment from 'moment';
import { DATE_TIME_FORMAT } from 'app/shared/constants/input.constants';

import { IBankAccountBanking, BankAccountBanking } from 'app/shared/model/bank-account-banking.model';
import { BankAccountBankingService } from './bank-account-banking.service';
import { ICustomerBanking } from 'app/shared/model/customer-banking.model';
import { CustomerBankingService } from 'app/entities/customer-banking/customer-banking.service';

@Component({
  selector: 'jhi-bank-account-banking-update',
  templateUrl: './bank-account-banking-update.component.html',
})
export class BankAccountBankingUpdateComponent implements OnInit {
  isSaving = false;
  customers: ICustomerBanking[] = [];

  editForm = this.fb.group({
    id: [],
    accountNumber: [],
    productId: [],
    openingDate: [],
    status: [],
    balance: [],
    customer: [],
  });

  constructor(
    protected bankAccountService: BankAccountBankingService,
    protected customerService: CustomerBankingService,
    protected activatedRoute: ActivatedRoute,
    private fb: FormBuilder
  ) {}

  ngOnInit(): void {
    this.activatedRoute.data.subscribe(({ bankAccount }) => {
      if (!bankAccount.id) {
        const today = moment().startOf('day');
        bankAccount.openingDate = today;
      }

      this.updateForm(bankAccount);

      this.customerService.query().subscribe((res: HttpResponse<ICustomerBanking[]>) => (this.customers = res.body || []));
    });
  }

  updateForm(bankAccount: IBankAccountBanking): void {
    this.editForm.patchValue({
      id: bankAccount.id,
      accountNumber: bankAccount.accountNumber,
      productId: bankAccount.productId,
      openingDate: bankAccount.openingDate ? bankAccount.openingDate.format(DATE_TIME_FORMAT) : null,
      status: bankAccount.status,
      balance: bankAccount.balance,
      customer: bankAccount.customer,
    });
  }

  previousState(): void {
    window.history.back();
  }

  save(): void {
    this.isSaving = true;
    const bankAccount = this.createFromForm();
    if (bankAccount.id !== undefined) {
      this.subscribeToSaveResponse(this.bankAccountService.update(bankAccount));
    } else {
      this.subscribeToSaveResponse(this.bankAccountService.create(bankAccount));
    }
  }

  private createFromForm(): IBankAccountBanking {
    return {
      ...new BankAccountBanking(),
      id: this.editForm.get(['id'])!.value,
      accountNumber: this.editForm.get(['accountNumber'])!.value,
      productId: this.editForm.get(['productId'])!.value,
      openingDate: this.editForm.get(['openingDate'])!.value
        ? moment(this.editForm.get(['openingDate'])!.value, DATE_TIME_FORMAT)
        : undefined,
      status: this.editForm.get(['status'])!.value,
      balance: this.editForm.get(['balance'])!.value,
      customer: this.editForm.get(['customer'])!.value,
    };
  }

  protected subscribeToSaveResponse(result: Observable<HttpResponse<IBankAccountBanking>>): void {
    result.subscribe(
      () => this.onSaveSuccess(),
      () => this.onSaveError()
    );
  }

  protected onSaveSuccess(): void {
    this.isSaving = false;
    this.previousState();
  }

  protected onSaveError(): void {
    this.isSaving = false;
  }

  trackById(index: number, item: ICustomerBanking): any {
    return item.id;
  }
}
