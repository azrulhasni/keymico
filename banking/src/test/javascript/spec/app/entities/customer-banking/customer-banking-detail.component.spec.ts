import { ComponentFixture, TestBed } from '@angular/core/testing';
import { ActivatedRoute } from '@angular/router';
import { of } from 'rxjs';

import { KeymicobankTestModule } from '../../../test.module';
import { CustomerBankingDetailComponent } from 'app/entities/customer-banking/customer-banking-detail.component';
import { CustomerBanking } from 'app/shared/model/customer-banking.model';

describe('Component Tests', () => {
  describe('CustomerBanking Management Detail Component', () => {
    let comp: CustomerBankingDetailComponent;
    let fixture: ComponentFixture<CustomerBankingDetailComponent>;
    const route = ({ data: of({ customer: new CustomerBanking(123) }) } as any) as ActivatedRoute;

    beforeEach(() => {
      TestBed.configureTestingModule({
        imports: [KeymicobankTestModule],
        declarations: [CustomerBankingDetailComponent],
        providers: [{ provide: ActivatedRoute, useValue: route }],
      })
        .overrideTemplate(CustomerBankingDetailComponent, '')
        .compileComponents();
      fixture = TestBed.createComponent(CustomerBankingDetailComponent);
      comp = fixture.componentInstance;
    });

    describe('OnInit', () => {
      it('Should load customer on init', () => {
        // WHEN
        comp.ngOnInit();

        // THEN
        expect(comp.customer).toEqual(jasmine.objectContaining({ id: 123 }));
      });
    });
  });
});
