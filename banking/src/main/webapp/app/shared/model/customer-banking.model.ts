import { IBankAccountBanking } from 'app/shared/model/bank-account-banking.model';

export interface ICustomerBanking {
  id?: number;
  cifNumber?: string;
  firstName?: string;
  lastName?: string;
  icNumber?: string;
  phoneNumber?: string;
  accounts?: IBankAccountBanking[];
}

export class CustomerBanking implements ICustomerBanking {
  constructor(
    public id?: number,
    public cifNumber?: string,
    public firstName?: string,
    public lastName?: string,
    public icNumber?: string,
    public phoneNumber?: string,
    public accounts?: IBankAccountBanking[]
  ) {}
}
