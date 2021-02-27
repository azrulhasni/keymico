import { TestBed, getTestBed } from '@angular/core/testing';
import { HttpClientTestingModule, HttpTestingController } from '@angular/common/http/testing';
import { CustomerBankingService } from 'app/entities/customer-banking/customer-banking.service';
import { ICustomerBanking, CustomerBanking } from 'app/shared/model/customer-banking.model';

describe('Service Tests', () => {
  describe('CustomerBanking Service', () => {
    let injector: TestBed;
    let service: CustomerBankingService;
    let httpMock: HttpTestingController;
    let elemDefault: ICustomerBanking;
    let expectedResult: ICustomerBanking | ICustomerBanking[] | boolean | null;

    beforeEach(() => {
      TestBed.configureTestingModule({
        imports: [HttpClientTestingModule],
      });
      expectedResult = null;
      injector = getTestBed();
      service = injector.get(CustomerBankingService);
      httpMock = injector.get(HttpTestingController);

      elemDefault = new CustomerBanking(0, 'AAAAAAA', 'AAAAAAA', 'AAAAAAA', 'AAAAAAA', 'AAAAAAA');
    });

    describe('Service methods', () => {
      it('should find an element', () => {
        const returnedFromService = Object.assign({}, elemDefault);

        service.find(123).subscribe(resp => (expectedResult = resp.body));

        const req = httpMock.expectOne({ method: 'GET' });
        req.flush(returnedFromService);
        expect(expectedResult).toMatchObject(elemDefault);
      });

      it('should create a CustomerBanking', () => {
        const returnedFromService = Object.assign(
          {
            id: 0,
          },
          elemDefault
        );

        const expected = Object.assign({}, returnedFromService);

        service.create(new CustomerBanking()).subscribe(resp => (expectedResult = resp.body));

        const req = httpMock.expectOne({ method: 'POST' });
        req.flush(returnedFromService);
        expect(expectedResult).toMatchObject(expected);
      });

      it('should update a CustomerBanking', () => {
        const returnedFromService = Object.assign(
          {
            cifNumber: 'BBBBBB',
            firstName: 'BBBBBB',
            lastName: 'BBBBBB',
            icNumber: 'BBBBBB',
            phoneNumber: 'BBBBBB',
          },
          elemDefault
        );

        const expected = Object.assign({}, returnedFromService);

        service.update(expected).subscribe(resp => (expectedResult = resp.body));

        const req = httpMock.expectOne({ method: 'PUT' });
        req.flush(returnedFromService);
        expect(expectedResult).toMatchObject(expected);
      });

      it('should return a list of CustomerBanking', () => {
        const returnedFromService = Object.assign(
          {
            cifNumber: 'BBBBBB',
            firstName: 'BBBBBB',
            lastName: 'BBBBBB',
            icNumber: 'BBBBBB',
            phoneNumber: 'BBBBBB',
          },
          elemDefault
        );

        const expected = Object.assign({}, returnedFromService);

        service.query().subscribe(resp => (expectedResult = resp.body));

        const req = httpMock.expectOne({ method: 'GET' });
        req.flush([returnedFromService]);
        httpMock.verify();
        expect(expectedResult).toContainEqual(expected);
      });

      it('should delete a CustomerBanking', () => {
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
