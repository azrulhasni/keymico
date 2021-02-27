import { Injectable } from '@angular/core';
import { HttpResponse } from '@angular/common/http';
import { Resolve, ActivatedRouteSnapshot, Routes, Router } from '@angular/router';
import { Observable, of, EMPTY } from 'rxjs';
import { flatMap } from 'rxjs/operators';

import { Authority } from 'app/shared/constants/authority.constants';
import { UserRouteAccessService } from 'app/core/auth/user-route-access-service';
import { IBankAccountBanking, BankAccountBanking } from 'app/shared/model/bank-account-banking.model';
import { BankAccountBankingService } from './bank-account-banking.service';
import { BankAccountBankingComponent } from './bank-account-banking.component';
import { BankAccountBankingDetailComponent } from './bank-account-banking-detail.component';
import { BankAccountBankingUpdateComponent } from './bank-account-banking-update.component';

@Injectable({ providedIn: 'root' })
export class BankAccountBankingResolve implements Resolve<IBankAccountBanking> {
  constructor(private service: BankAccountBankingService, private router: Router) {}

  resolve(route: ActivatedRouteSnapshot): Observable<IBankAccountBanking> | Observable<never> {
    const id = route.params['id'];
    if (id) {
      return this.service.find(id).pipe(
        flatMap((bankAccount: HttpResponse<BankAccountBanking>) => {
          if (bankAccount.body) {
            return of(bankAccount.body);
          } else {
            this.router.navigate(['404']);
            return EMPTY;
          }
        })
      );
    }
    return of(new BankAccountBanking());
  }
}

export const bankAccountRoute: Routes = [
  {
    path: '',
    component: BankAccountBankingComponent,
    data: {
      authorities: [Authority.USER],
      pageTitle: 'BankAccounts',
    },
    canActivate: [UserRouteAccessService],
  },
  {
    path: ':id/view',
    component: BankAccountBankingDetailComponent,
    resolve: {
      bankAccount: BankAccountBankingResolve,
    },
    data: {
      authorities: [Authority.USER],
      pageTitle: 'BankAccounts',
    },
    canActivate: [UserRouteAccessService],
  },
  {
    path: 'new',
    component: BankAccountBankingUpdateComponent,
    resolve: {
      bankAccount: BankAccountBankingResolve,
    },
    data: {
      authorities: [Authority.USER],
      pageTitle: 'BankAccounts',
    },
    canActivate: [UserRouteAccessService],
  },
  {
    path: ':id/edit',
    component: BankAccountBankingUpdateComponent,
    resolve: {
      bankAccount: BankAccountBankingResolve,
    },
    data: {
      authorities: [Authority.USER],
      pageTitle: 'BankAccounts',
    },
    canActivate: [UserRouteAccessService],
  },
];
