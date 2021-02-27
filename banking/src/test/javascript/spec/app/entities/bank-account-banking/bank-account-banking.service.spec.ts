import { TestBed, getTestBed } from '@angular/core/testing';
import { HttpClientTestingModule, HttpTestingController } from '@angular/common/http/testing';
import * as moment from 'moment';
import { DATE_TIME_FORMAT } from 'app/shared/constants/input.constants';
import { BankAccountBankingService } from 'app/entities/bank-account-banking/bank-account-banking.service';
import { IBankAccountBanking, BankAccountBanking } from 'app/shared/model/bank-account-banking.model';

describe('Service Tests', () => {
  describe('BankAccountBanking Service', () => {
    let injector: TestBed;
    let service: BankAccountBankingService;
    let httpMock: HttpTestingController;
    let elemDefault: IBankAccountBanking;
    let expectedResult: IBankAccountBanking | IBankAccountBanking[] | boolean | null;
    let currentDate: moment.Moment;

    beforeEach(() => {
      TestBed.configureTestingModule({
        imports: [HttpClientTestingModule],
      });
      expectedResult = null;
      injector = getTestBed();
      service = injector.get(BankAccountBankingService);
      httpMock = injector.get(HttpTestingController);
      currentDate = moment();

      elemDefault = new BankAccountBanking(0, 'AAAAAAA', 'AAAAAAA', currentDate, 0, 0);
    });

    describe('Service methods', () => {
      it('should find an element', () => {
        const returnedFromService = Object.assign(
          {
            openingDate: currentDate.format(DATE_TIME_FORMAT),
          },
          elemDefault
        );

        service.find(123).subscribe(resp => (expectedResult = resp.body));

        const req = httpMock.expectOne({ method: 'GET' });
        req.flush(returnedFromService);
        expect(expectedResult).toMatchObject(elemDefault);
      });

      it('should create a BankAccountBanking', () => {
        const returnedFromService = Object.assign(
          {
            id: 0,
            openingDate: currentDate.format(DATE_TIME_FORMAT),
          },
          elemDefault
        );

        const expected = Object.assign(
          {
            openingDate: currentDate,
          },
          returnedFromService
        );

        service.create(new BankAccountBanking()).subscribe(resp => (expectedResult = resp.body));

        const req = httpMock.expectOne({ method: 'POST' });
        req.flush(returnedFromService);
        expect(expectedResult).toMatchObject(expected);
      });

      it('should update a BankAccountBanking', () => {
        const returnedFromService = Object.assign(
          {
            accountNumber: 'BBBBBB',
            productId: 'BBBBBB',
            openingDate: currentDate.format(DATE_TIME_FORMAT),
            status: 1,
            balance: 1,
          },
          elemDefault
        );

        const expected = Object.assign(
          {
            openingDate: currentDate,
          },
          returnedFromService
        );

        service.update(expected).subscribe(resp => (expectedResult = resp.body));

        const req = httpMock.expectOne({ method: 'PUT' });
        req.flush(returnedFromService);
        expect(expectedResult).toMatchObject(expected);
      });

      it('should return a list of BankAccountBanking', () => {
        const returnedFromService = Object.assign(
          {
            accountNumber: 'BBBBBB',
            productId: 'BBBBBB',
            openingDate: currentDate.format(DATE_TIME_FORMAT),
            status: 1,
            balance: 1,
          },
          elemDefault
        );

        const expected = Object.assign(
          {
            openingDate: currentDate,
          },
          returnedFromService
        );

        service.query().subscribe(resp => (expectedResult = resp.body));

        const req = httpMock.expectOne({ method: 'GET' });
        req.flush([returnedFromService]);
        httpMock.verify();
        expect(expectedResult).toContainEqual(expected);
      });

      it('should delete a BankAccountBanking', () => {
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
