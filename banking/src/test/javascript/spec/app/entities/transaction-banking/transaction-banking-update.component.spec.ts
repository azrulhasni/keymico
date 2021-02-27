import { ComponentFixture, TestBed, fakeAsync, tick } from '@angular/core/testing';
import { HttpResponse } from '@angular/common/http';
import { FormBuilder } from '@angular/forms';
import { of } from 'rxjs';

import { KeymicobankTestModule } from '../../../test.module';
import { TransactionBankingUpdateComponent } from 'app/entities/transaction-banking/transaction-banking-update.component';
import { TransactionBankingService } from 'app/entities/transaction-banking/transaction-banking.service';
import { TransactionBanking } from 'app/shared/model/transaction-banking.model';

describe('Component Tests', () => {
  describe('TransactionBanking Management Update Component', () => {
    let comp: TransactionBankingUpdateComponent;
    let fixture: ComponentFixture<TransactionBankingUpdateComponent>;
    let service: TransactionBankingService;

    beforeEach(() => {
      TestBed.configureTestingModule({
        imports: [KeymicobankTestModule],
        declarations: [TransactionBankingUpdateComponent],
        providers: [FormBuilder],
      })
        .overrideTemplate(TransactionBankingUpdateComponent, '')
        .compileComponents();

      fixture = TestBed.createComponent(TransactionBankingUpdateComponent);
      comp = fixture.componentInstance;
      service = fixture.debugElement.injector.get(TransactionBankingService);
    });

    describe('save', () => {
      it('Should call update service on save for existing entity', fakeAsync(() => {
        // GIVEN
        const entity = new TransactionBanking(123);
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
        const entity = new TransactionBanking();
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
