import { Injectable } from '@angular/core';
import { HttpClient, HttpResponse } from '@angular/common/http';
import { Observable } from 'rxjs';

import { SERVER_API_URL } from 'app/app.constants';
import { createRequestOption } from 'app/shared/util/request-util';
import { ICustomerBanking } from 'app/shared/model/customer-banking.model';

type EntityResponseType = HttpResponse<ICustomerBanking>;
type EntityArrayResponseType = HttpResponse<ICustomerBanking[]>;

@Injectable({ providedIn: 'root' })
export class CustomerBankingService {
  public resourceUrl = SERVER_API_URL + 'api/customers';

  constructor(protected http: HttpClient) {}

  create(customer: ICustomerBanking): Observable<EntityResponseType> {
    return this.http.post<ICustomerBanking>(this.resourceUrl, customer, { observe: 'response' });
  }

  update(customer: ICustomerBanking): Observable<EntityResponseType> {
    return this.http.put<ICustomerBanking>(this.resourceUrl, customer, { observe: 'response' });
  }

  find(id: number): Observable<EntityResponseType> {
    return this.http.get<ICustomerBanking>(`${this.resourceUrl}/${id}`, { observe: 'response' });
  }

  query(req?: any): Observable<EntityArrayResponseType> {
    const options = createRequestOption(req);
    return this.http.get<ICustomerBanking[]>(this.resourceUrl, { params: options, observe: 'response' });
  }

  delete(id: number): Observable<HttpResponse<{}>> {
    return this.http.delete(`${this.resourceUrl}/${id}`, { observe: 'response' });
  }
}
