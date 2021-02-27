import { Component, OnInit } from '@angular/core';
import { HttpResponse } from '@angular/common/http';
// eslint-disable-next-line @typescript-eslint/no-unused-vars
import { FormBuilder, Validators } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { Observable } from 'rxjs';
import * as moment from 'moment';
import { DATE_TIME_FORMAT } from 'app/shared/constants/input.constants';
import { JhiDataUtils, JhiFileLoadError, JhiEventManager, JhiEventWithContent } from 'ng-jhipster';

import { ITransactionBanking, TransactionBanking } from 'app/shared/model/transaction-banking.model';
import { TransactionBankingService } from './transaction-banking.service';
import { AlertError } from 'app/shared/alert/alert-error.model';

@Component({
  selector: 'jhi-transaction-banking-update',
  templateUrl: './transaction-banking-update.component.html',
})
export class TransactionBankingUpdateComponent implements OnInit {
  isSaving = false;

  editForm = this.fb.group({
    id: [],
    transactionId: [],
    file: [],
    fileBinaries: [],
    fileBinariesContentType: [],
    transactionType: [],
    amount: [],
    time: [],
    currency: [],
    sourceAccount: [],
    targetAccount: [],
  });

  constructor(
    protected dataUtils: JhiDataUtils,
    protected eventManager: JhiEventManager,
    protected transactionService: TransactionBankingService,
    protected activatedRoute: ActivatedRoute,
    private fb: FormBuilder
  ) {}

  ngOnInit(): void {
    this.activatedRoute.data.subscribe(({ transaction }) => {
      if (!transaction.id) {
        const today = moment().startOf('day');
        transaction.time = today;
      }

      this.updateForm(transaction);
    });
  }

  updateForm(transaction: ITransactionBanking): void {
    this.editForm.patchValue({
      id: transaction.id,
      transactionId: transaction.transactionId,
      file: transaction.file,
      fileBinaries: transaction.fileBinaries,
      fileBinariesContentType: transaction.fileBinariesContentType,
      transactionType: transaction.transactionType,
      amount: transaction.amount,
      time: transaction.time ? transaction.time.format(DATE_TIME_FORMAT) : null,
      currency: transaction.currency,
      sourceAccount: transaction.sourceAccount,
      targetAccount: transaction.targetAccount,
    });
  }

  byteSize(base64String: string): string {
    return this.dataUtils.byteSize(base64String);
  }

  openFile(contentType: string, base64String: string): void {
    this.dataUtils.openFile(contentType, base64String);
  }

  setFileData(event: any, field: string, isImage: boolean): void {
    this.dataUtils.loadFileToForm(event, this.editForm, field, isImage).subscribe(null, (err: JhiFileLoadError) => {
      this.eventManager.broadcast(
        new JhiEventWithContent<AlertError>('keymicobankApp.error', { message: err.message })
      );
    });
  }

  previousState(): void {
    window.history.back();
  }

  save(): void {
    this.isSaving = true;
    const transaction = this.createFromForm();
    if (transaction.id !== undefined) {
      this.subscribeToSaveResponse(this.transactionService.update(transaction));
    } else {
      this.subscribeToSaveResponse(this.transactionService.create(transaction));
    }
  }

  private createFromForm(): ITransactionBanking {
    return {
      ...new TransactionBanking(),
      id: this.editForm.get(['id'])!.value,
      transactionId: this.editForm.get(['transactionId'])!.value,
      file: this.editForm.get(['file'])!.value,
      fileBinariesContentType: this.editForm.get(['fileBinariesContentType'])!.value,
      fileBinaries: this.editForm.get(['fileBinaries'])!.value,
      transactionType: this.editForm.get(['transactionType'])!.value,
      amount: this.editForm.get(['amount'])!.value,
      time: this.editForm.get(['time'])!.value ? moment(this.editForm.get(['time'])!.value, DATE_TIME_FORMAT) : undefined,
      currency: this.editForm.get(['currency'])!.value,
      sourceAccount: this.editForm.get(['sourceAccount'])!.value,
      targetAccount: this.editForm.get(['targetAccount'])!.value,
    };
  }

  protected subscribeToSaveResponse(result: Observable<HttpResponse<ITransactionBanking>>): void {
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
