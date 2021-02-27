import { Injectable } from '@angular/core';
import { HttpResponse } from '@angular/common/http';
import { Resolve, ActivatedRouteSnapshot, Routes, Router } from '@angular/router';
import { Observable, of, EMPTY } from 'rxjs';
import { flatMap } from 'rxjs/operators';

import { Authority } from 'app/shared/constants/authority.constants';
import { UserRouteAccessService } from 'app/core/auth/user-route-access-service';
import { ICustomerBanking, CustomerBanking } from 'app/shared/model/customer-banking.model';
import { CustomerBankingService } from './customer-banking.service';
import { CustomerBankingComponent } from './customer-banking.component';
import { CustomerBankingDetailComponent } from './customer-banking-detail.component';
import { CustomerBankingUpdateComponent } from './customer-banking-update.component';

@Injectable({ providedIn: 'root' })
export class CustomerBankingResolve implements Resolve<ICustomerBanking> {
  constructor(private service: CustomerBankingService, private router: Router) {}

  resolve(route: ActivatedRouteSnapshot): Observable<ICustomerBanking> | Observable<never> {
    const id = route.params['id'];
    if (id) {
      return this.service.find(id).pipe(
        flatMap((customer: HttpResponse<CustomerBanking>) => {
          if (customer.body) {
            return of(customer.body);
          } else {
            this.router.navigate(['404']);
            return EMPTY;
          }
        })
      );
    }
    return of(new CustomerBanking());
  }
}

export const customerRoute: Routes = [
  {
    path: '',
    component: CustomerBankingComponent,
    data: {
      authorities: [Authority.USER],
      defaultSort: 'id,asc',
      pageTitle: 'Customers',
    },
    canActivate: [UserRouteAccessService],
  },
  {
    path: ':id/view',
    component: CustomerBankingDetailComponent,
    resolve: {
      customer: CustomerBankingResolve,
    },
    data: {
      authorities: [Authority.USER],
      pageTitle: 'Customers',
    },
    canActivate: [UserRouteAccessService],
  },
  {
    path: 'new',
    component: CustomerBankingUpdateComponent,
    resolve: {
      customer: CustomerBankingResolve,
    },
    data: {
      authorities: [Authority.USER],
      pageTitle: 'Customers',
    },
    canActivate: [UserRouteAccessService],
  },
  {
    path: ':id/edit',
    component: CustomerBankingUpdateComponent,
    resolve: {
      customer: CustomerBankingResolve,
    },
    data: {
      authorities: [Authority.USER],
      pageTitle: 'Customers',
    },
    canActivate: [UserRouteAccessService],
  },
];
