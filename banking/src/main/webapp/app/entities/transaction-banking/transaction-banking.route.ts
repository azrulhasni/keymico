import { Injectable } from '@angular/core';
import { HttpResponse } from '@angular/common/http';
import { Resolve, ActivatedRouteSnapshot, Routes, Router } from '@angular/router';
import { Observable, of, EMPTY } from 'rxjs';
import { flatMap } from 'rxjs/operators';

import { Authority } from 'app/shared/constants/authority.constants';
import { UserRouteAccessService } from 'app/core/auth/user-route-access-service';
import { ITransactionBanking, TransactionBanking } from 'app/shared/model/transaction-banking.model';
import { TransactionBankingService } from './transaction-banking.service';
import { TransactionBankingComponent } from './transaction-banking.component';
import { TransactionBankingDetailComponent } from './transaction-banking-detail.component';
import { TransactionBankingUpdateComponent } from './transaction-banking-update.component';

@Injectable({ providedIn: 'root' })
export class TransactionBankingResolve implements Resolve<ITransactionBanking> {
  constructor(private service: TransactionBankingService, private router: Router) {}

  resolve(route: ActivatedRouteSnapshot): Observable<ITransactionBanking> | Observable<never> {
    const id = route.params['id'];
    if (id) {
      return this.service.find(id).pipe(
        flatMap((transaction: HttpResponse<TransactionBanking>) => {
          if (transaction.body) {
            return of(transaction.body);
          } else {
            this.router.navigate(['404']);
            return EMPTY;
          }
        })
      );
    }
    return of(new TransactionBanking());
  }
}

export const transactionRoute: Routes = [
  {
    path: '',
    component: TransactionBankingComponent,
    data: {
      authorities: [Authority.USER],
      pageTitle: 'Transactions',
    },
    canActivate: [UserRouteAccessService],
  },
  {
    path: ':id/view',
    component: TransactionBankingDetailComponent,
    resolve: {
      transaction: TransactionBankingResolve,
    },
    data: {
      authorities: [Authority.USER],
      pageTitle: 'Transactions',
    },
    canActivate: [UserRouteAccessService],
  },
  {
    path: 'new',
    component: TransactionBankingUpdateComponent,
    resolve: {
      transaction: TransactionBankingResolve,
    },
    data: {
      authorities: [Authority.USER],
      pageTitle: 'Transactions',
    },
    canActivate: [UserRouteAccessService],
  },
  {
    path: ':id/edit',
    component: TransactionBankingUpdateComponent,
    resolve: {
      transaction: TransactionBankingResolve,
    },
    data: {
      authorities: [Authority.USER],
      pageTitle: 'Transactions',
    },
    canActivate: [UserRouteAccessService],
  },
];
