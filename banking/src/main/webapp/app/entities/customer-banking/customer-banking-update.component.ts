import { Component, OnInit } from '@angular/core';
import { HttpResponse } from '@angular/common/http';
// eslint-disable-next-line @typescript-eslint/no-unused-vars
import { FormBuilder, Validators } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { Observable } from 'rxjs';

import { ICustomerBanking, CustomerBanking } from 'app/shared/model/customer-banking.model';
import { CustomerBankingService } from './customer-banking.service';

@Component({
  selector: 'jhi-customer-banking-update',
  templateUrl: './customer-banking-update.component.html',
})
export class CustomerBankingUpdateComponent implements OnInit {
  isSaving = false;

  editForm = this.fb.group({
    id: [],
    cifNumber: [],
    firstName: [],
    lastName: [],
    icNumber: [],
    phoneNumber: [],
  });

  constructor(protected customerService: CustomerBankingService, protected activatedRoute: ActivatedRoute, private fb: FormBuilder) {}

  ngOnInit(): void {
    this.activatedRoute.data.subscribe(({ customer }) => {
      this.updateForm(customer);
    });
  }

  updateForm(customer: ICustomerBanking): void {
    this.editForm.patchValue({
      id: customer.id,
      cifNumber: customer.cifNumber,
      firstName: customer.firstName,
      lastName: customer.lastName,
      icNumber: customer.icNumber,
      phoneNumber: customer.phoneNumber,
    });
  }

  previousState(): void {
    window.history.back();
  }

  save(): void {
    this.isSaving = true;
    const customer = this.createFromForm();
    if (customer.id !== undefined) {
      this.subscribeToSaveResponse(this.customerService.update(customer));
    } else {
      this.subscribeToSaveResponse(this.customerService.create(customer));
    }
  }

  private createFromForm(): ICustomerBanking {
    return {
      ...new CustomerBanking(),
      id: this.editForm.get(['id'])!.value,
      cifNumber: this.editForm.get(['cifNumber'])!.value,
      firstName: this.editForm.get(['firstName'])!.value,
      lastName: this.editForm.get(['lastName'])!.value,
      icNumber: this.editForm.get(['icNumber'])!.value,
      phoneNumber: this.editForm.get(['phoneNumber'])!.value,
    };
  }

  protected subscribeToSaveResponse(result: Observable<HttpResponse<ICustomerBanking>>): void {
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
}
