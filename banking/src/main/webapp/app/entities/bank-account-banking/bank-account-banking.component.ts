import { Component, OnInit, OnDestroy } from '@angular/core';
import { HttpHeaders, HttpResponse } from '@angular/common/http';
import { Subscription } from 'rxjs';
import { JhiEventManager, JhiParseLinks } from 'ng-jhipster';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';

import { IBankAccountBanking } from 'app/shared/model/bank-account-banking.model';

import { ITEMS_PER_PAGE } from 'app/shared/constants/pagination.constants';
import { BankAccountBankingService } from './bank-account-banking.service';
import { BankAccountBankingDeleteDialogComponent } from './bank-account-banking-delete-dialog.component';

@Component({
  selector: 'jhi-bank-account-banking',
  templateUrl: './bank-account-banking.component.html',
})
export class BankAccountBankingComponent implements OnInit, OnDestroy {
  bankAccounts: IBankAccountBanking[];
  eventSubscriber?: Subscription;
  itemsPerPage: number;
  links: any;
  page: number;
  predicate: string;
  ascending: boolean;

  constructor(
    protected bankAccountService: BankAccountBankingService,
    protected eventManager: JhiEventManager,
    protected modalService: NgbModal,
    protected parseLinks: JhiParseLinks
  ) {
    this.bankAccounts = [];
    this.itemsPerPage = ITEMS_PER_PAGE;
    this.page = 0;
    this.links = {
      last: 0,
    };
    this.predicate = 'id';
    this.ascending = true;
  }

  loadAll(): void {
    this.bankAccountService
      .query({
        page: this.page,
        size: this.itemsPerPage,
        sort: this.sort(),
      })
      .subscribe((res: HttpResponse<IBankAccountBanking[]>) => this.paginateBankAccounts(res.body, res.headers));
  }

  reset(): void {
    this.page = 0;
    this.bankAccounts = [];
    this.loadAll();
  }

  loadPage(page: number): void {
    this.page = page;
    this.loadAll();
  }

  ngOnInit(): void {
    this.loadAll();
    this.registerChangeInBankAccounts();
  }

  ngOnDestroy(): void {
    if (this.eventSubscriber) {
      this.eventManager.destroy(this.eventSubscriber);
    }
  }

  trackId(index: number, item: IBankAccountBanking): number {
    // eslint-disable-next-line @typescript-eslint/no-unnecessary-type-assertion
    return item.id!;
  }

  registerChangeInBankAccounts(): void {
    this.eventSubscriber = this.eventManager.subscribe('bankAccountListModification', () => this.reset());
  }

  delete(bankAccount: IBankAccountBanking): void {
    const modalRef = this.modalService.open(BankAccountBankingDeleteDialogComponent, { size: 'lg', backdrop: 'static' });
    modalRef.componentInstance.bankAccount = bankAccount;
  }

  sort(): string[] {
    const result = [this.predicate + ',' + (this.ascending ? 'asc' : 'desc')];
    if (this.predicate !== 'id') {
      result.push('id');
    }
    return result;
  }

  protected paginateBankAccounts(data: IBankAccountBanking[] | null, headers: HttpHeaders): void {
    const headersLink = headers.get('link');
    this.links = this.parseLinks.parse(headersLink ? headersLink : '');
    if (data) {
      for (let i = 0; i < data.length; i++) {
        this.bankAccounts.push(data[i]);
      }
    }
  }
}
