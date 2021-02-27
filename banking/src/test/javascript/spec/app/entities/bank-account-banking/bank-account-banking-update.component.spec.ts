import { ComponentFixture, TestBed, fakeAsync, tick } from '@angular/core/testing';
import { HttpResponse } from '@angular/common/http';
import { FormBuilder } from '@angular/forms';
import { of } from 'rxjs';

import { KeymicobankTestModule } from '../../../test.module';
import { BankAccountBankingUpdateComponent } from 'app/entities/bank-account-banking/bank-account-banking-update.component';
import { BankAccountBankingService } from 'app/entities/bank-account-banking/bank-account-banking.service';
import { BankAccountBanking } from 'app/shared/model/bank-account-banking.model';

describe('Component Tests', () => {
  describe('BankAccountBanking Management Update Component', () => {
    let comp: BankAccountBankingUpdateComponent;
    let fixture: ComponentFixture<BankAccountBankingUpdateComponent>;
    let service: BankAccountBankingService;

    beforeEach(() => {
      TestBed.configureTestingModule({
        imports: [KeymicobankTestModule],
        declarations: [BankAccountBankingUpdateComponent],
        providers: [FormBuilder],
      })
        .overrideTemplate(BankAccountBankingUpdateComponent, '')
        .compileComponents();

      fixture = TestBed.createComponent(BankAccountBankingUpdateComponent);
      comp = fixture.componentInstance;
      service = fixture.debugElement.injector.get(BankAccountBankingService);
    });

    describe('save', () => {
      it('Should call update service on save for existing entity', fakeAsync(() => {
        // GIVEN
        const entity = new BankAccountBanking(123);
        spyOn(service, 'update').and.returnValue(of(new HttpResponse({ body: entity })));
        comp.updateForm(entity);
        // WHEN
        comp.save();
        tick(); // simulate async

        // THEN
        expect(service.update).toHaveBeenCalledWith(entity);
        expect(comp.isSaving).toEqual(false);
      }));

      it('Should call create service on save for new entity', fakeAsync(() => {
        // GIVEN
        const entity = new BankAccountBanking();
        spyOn(service, 'create').and.returnValue(of(new HttpResponse({ body: entity })));
        comp.updateForm(entity);
        // WHEN
        comp.save();
        tick(); // simulate async

        // THEN
        expect(service.create).toHaveBeenCalledWith(entity);
        expect(comp.isSaving).toEqual(false);
      }));
    });
  });
});
