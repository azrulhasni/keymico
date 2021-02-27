import { TestBed, getTestBed } from '@angular/core/testing';
import { HttpClientTestingModule, HttpTestingController } from '@angular/common/http/testing';
import * as moment from 'moment';
import { DATE_TIME_FORMAT } from 'app/shared/constants/input.constants';
import { TransactionBankingService } from 'app/entities/transaction-banking/transaction-banking.service';
import { ITransactionBanking, TransactionBanking } from 'app/shared/model/transaction-banking.model';
import { Currency } from 'app/shared/model/enumerations/currency.model';

describe('Service Tests', () => {
  describe('TransactionBanking Service', () => {
    let injector: TestBed;
    let service: TransactionBankingService;
    let httpMock: HttpTestingController;
    let elemDefault: ITransactionBanking;
    let expectedResult: ITransactionBanking | ITransactionBanking[] | boolean | null;
    let currentDate: moment.Moment;

    beforeEach(() => {
      TestBed.configureTestingModule({
        imports: [HttpClientTestingModule],
      });
      expectedResult = null;
      injector = getTestBed();
      service = injector.get(TransactionBankingService);
      httpMock = injector.get(HttpTestingController);
      currentDate = moment();

      elemDefault = new TransactionBanking(
        0,
        'AAAAAAA',
        'AAAAAAA',
        'image/png',
        'AAAAAAA',
        'AAAAAAA',
        0,
        currentDate,
        Currency.USD,
        'AAAAAAA',
        'AAAAAAA'
      );
    });

    describe('Service methods', () => {
      it('should find an element', () => {
        const returnedFromService = Object.assign(
          {
            time: currentDate.format(DATE_TIME_FORMAT),
          },
          elemDefault
        );

        service.find(123).subscribe(resp => (expectedResult = resp.body));

        const req = httpMock.expectOne({ method: 'GET' });
        req.flush(returnedFromService);
        expect(expectedResult).toMatchObject(elemDefault);
      });

      it('should create a TransactionBanking', () => {
        const returnedFromService = Object.assign(
          {
            id: 0,
            time: currentDate.format(DATE_TIME_FORMAT),
          },
          elemDefault
        );

        const expected = Object.assign(
          {
            time: currentDate,
          },
          returnedFromService
        );

        service.create(new TransactionBanking()).subscribe(resp => (expectedResult = resp.body));

        const req = httpMock.expectOne({ method: 'POST' });
        req.flush(returnedFromService);
        expect(expectedResult).toMatchObject(expected);
      });

      it('should update a TransactionBanking', () => {
        const returnedFromService = Object.assign(
          {
            transactionId: 'BBBBBB',
            file: 'BBBBBB',
            fileBinaries: 'BBBBBB',
            transactionType: 'BBBBBB',
            amount: 1,
            time: currentDate.format(DATE_TIME_FORMAT),
            currency: 'BBBBBB',
            sourceAccount: 'BBBBBB',
            targetAccount: 'BBBBBB',
          },
          elemDefault
        );

        const expected = Object.assign(
          {
            time: currentDate,
          },
          returnedFromService
        );

        service.update(expected).subscribe(resp => (expectedResult = resp.body));

        const req = httpMock.expectOne({ method: 'PUT' });
        req.flush(returnedFromService);
        expect(expectedResult).toMatchObject(expected);
      });

      it('should return a list of TransactionBanking', () => {
        const returnedFromService = Object.assign(
          {
            transactionId: 'BBBBBB',
            file: 'BBBBBB',
            fileBinaries: 'BBBBBB',
            transactionType: 'BBBBBB',
            amount: 1,
            time: currentDate.format(DATE_TIME_FORMAT),
            currency: 'BBBBBB',
            sourceAccount: 'BBBBBB',
            targetAccount: 'BBBBBB',
          },
          elemDefault
        );

        const expected = Object.assign(
          {
            time: currentDate,
          },
          returnedFromService
        );

        service.query().subscribe(resp => (expectedResult = resp.body));

        const req = httpMock.expectOne({ method: 'GET' });
        req.flush([returnedFromService]);
        httpMock.verify();
        expect(expectedResult).toContainEqual(expected);
      });

      it('should delete a TransactionBanking', () => {
        service.delete(123).subscribe(resp => (expectedResult = resp.ok));

        const req = httpMock.expectOne({ method: 'DELETE' });
        req.flush({ status: 200 });
        expect(expectedResult);
      });
    });

    afterEach(() => {
      httpMock.verify();
    });
  });
});
