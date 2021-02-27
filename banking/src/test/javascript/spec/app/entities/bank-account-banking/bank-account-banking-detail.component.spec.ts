import { ComponentFixture, TestBed } from '@angular/core/testing';
import { ActivatedRoute } from '@angular/router';
import { of } from 'rxjs';

import { KeymicobankTestModule } from '../../../test.module';
import { BankAccountBankingDetailComponent } from 'app/entities/bank-account-banking/bank-account-banking-detail.component';
import { BankAccountBanking } from 'app/shared/model/bank-account-banking.model';

describe('Component Tests', () => {
  describe('BankAccountBanking Management Detail Component', () => {
    let comp: BankAccountBankingDetailComponent;
    let fixture: ComponentFixture<BankAccountBankingDetailComponent>;
    const route = ({ data: of({ bankAccount: new BankAccountBanking(123) }) } as any) as ActivatedRoute;

    beforeEach(() => {
      TestBed.configureTestingModule({
        imports: [KeymicobankTestModule],
        declarations: [BankAccountBankingDetailComponent],
        providers: [{ provide: ActivatedRoute, useValue: route }],
      })
        .overrideTemplate(BankAccountBankingDetailComponent, '')
        .compileComponents();
      fixture = TestBed.createComponent(BankAccountBankingDetailComponent);
      comp = fixture.componentInstance;
    });

    describe('OnInit', () => {
      it('Should load bankAccount on init', () => {
        // WHEN
        comp.ngOnInit();

        // THEN
        expect(comp.bankAccount).toEqual(jasmine.objectContaining({ id: 123 }));
      });
    });
  });
});
