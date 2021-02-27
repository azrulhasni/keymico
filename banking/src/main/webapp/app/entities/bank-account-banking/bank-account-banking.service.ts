import { Injectable } from '@angular/core';
import { HttpClient, HttpResponse } from '@angular/common/http';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import * as moment from 'moment';

import { SERVER_API_URL } from 'app/app.constants';
import { createRequestOption } from 'app/shared/util/request-util';
import { IBankAccountBanking } from 'app/shared/model/bank-account-banking.model';

type EntityResponseType = HttpResponse<IBankAccountBanking>;
type EntityArrayResponseType = HttpResponse<IBankAccountBanking[]>;

@Injectable({ providedIn: 'root' })
export class BankAccountBankingService {
  public resourceUrl = SERVER_API_URL + 'api/bank-accounts';

  constructor(protected http: HttpClient) {}

  create(bankAccount: IBankAccountBanking): Observable<EntityResponseType> {
    const copy = this.convertDateFromClient(bankAccount);
    return this.http
      .post<IBankAccountBanking>(this.resourceUrl, copy, { observe: 'response' })
      .pipe(map((res: EntityResponseType) => this.convertDateFromServer(res)));
  }

  update(bankAccount: IBankAccountBanking): Observable<EntityResponseType> {
    const copy = this.convertDateFromClient(bankAccount);
    return this.http
      .put<IBankAccountBanking>(this.resourceUrl, copy, { observe: 'response' })
      .pipe(map((res: EntityResponseType) => this.convertDateFromServer(res)));
  }

  find(id: number): Observable<EntityResponseType> {
    return this.http
      .get<IBankAccountBanking>(`${this.resourceUrl}/${id}`, { observe: 'response' })
      .pipe(map((res: EntityResponseType) => this.convertDateFromServer(res)));
  }

  query(req?: any): Observable<EntityArrayResponseType> {
    const options = createRequestOption(req);
    return this.http
      .get<IBankAccountBanking[]>(this.resourceUrl, { params: options, observe: 'response' })
      .pipe(map((res: EntityArrayResponseType) => this.convertDateArrayFromServer(res)));
  }

  delete(id: number): Observable<HttpResponse<{}>> {
    return this.http.delete(`${this.resourceUrl}/${id}`, { observe: 'response' });
  }

  protected convertDateFromClient(bankAccount: IBankAccountBanking): IBankAccountBanking {
    const copy: IBankAccountBanking = Object.assign({}, bankAccount, {
      openingDate: bankAccount.openingDate && bankAccount.openingDate.isValid() ? bankAccount.openingDate.toJSON() : undefined,
    });
    return copy;
  }

  protected convertDateFromServer(res: EntityResponseType): EntityResponseType {
    if (res.body) {
      res.body.openingDate = res.body.openingDate ? moment(res.body.openingDate) : undefined;
    }
    return res;
  }

  protected convertDateArrayFromServer(res: EntityArrayResponseType): EntityArrayResponseType {
    if (res.body) {
      res.body.forEach((bankAccount: IBankAccountBanking) => {
        bankAccount.openingDate = bankAccount.openingDate ? moment(bankAccount.openingDate) : undefined;
      });
    }
    return res;
  }
}
