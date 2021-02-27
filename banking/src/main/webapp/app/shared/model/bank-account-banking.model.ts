import { Moment } from 'moment';
import { ICustomerBanking } from 'app/shared/model/customer-banking.model';

export interface IBankAccountBanking {
  id?: number;
  accountNumber?: string;
  productId?: string;
  openingDate?: Moment;
  status?: number;
  balance?: number;
  customer?: ICustomerBanking;
}

export class BankAccountBanking implements IBankAccountBanking {
  constructor(
    public id?: number,
    public accountNumber?: string,
    public productId?: string,
    public openingDate?: Moment,
    public status?: number,
    public balance?: number,
    public customer?: ICustomerBanking
  ) {}
}
