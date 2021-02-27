import { Moment } from 'moment';
import { Currency } from 'app/shared/model/enumerations/currency.model';

export interface ITransactionBanking {
  id?: number;
  transactionId?: string;
  file?: string;
  fileBinariesContentType?: string;
  fileBinaries?: any;
  transactionType?: string;
  amount?: number;
  time?: Moment;
  currency?: Currency;
  sourceAccount?: string;
  targetAccount?: string;
}

export class TransactionBanking implements ITransactionBanking {
  constructor(
    public id?: number,
    public transactionId?: string,
    public file?: string,
    public fileBinariesContentType?: string,
    public fileBinaries?: any,
    public transactionType?: string,
    public amount?: number,
    public time?: Moment,
    public currency?: Currency,
    public sourceAccount?: string,
    public targetAccount?: string
  ) {}
}
