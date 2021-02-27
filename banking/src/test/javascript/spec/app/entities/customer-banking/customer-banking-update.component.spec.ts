import { ComponentFixture, TestBed, fakeAsync, tick } from '@angular/core/testing';
import { HttpResponse } from '@angular/common/http';
import { FormBuilder } from '@angular/forms';
import { of } from 'rxjs';

import { KeymicobankTestModule } from '../../../test.module';
import { CustomerBankingUpdateComponent } from 'app/entities/customer-banking/customer-banking-update.component';
import { CustomerBankingService } from 'app/entities/customer-banking/customer-banking.service';
import { CustomerBanking } from 'app/shared/model/customer-banking.model';

describe('Component Tests', () => {
  describe('CustomerBanking Management Update Component', () => {
    let comp: CustomerBankingUpdateComponent;
    let fixture: ComponentFixture<CustomerBankingUpdateComponent>;
    let service: CustomerBankingService;

    beforeEach(() => {
      TestBed.configureTestingModule({
        imports: [KeymicobankTestModule],
        declarations: [CustomerBankingUpdateComponent],
        providers: [FormBuilder],
      })
        .overrideTemplate(CustomerBankingUpdateComponent, '')
        .compileComponents();

      fixture = TestBed.createComponent(CustomerBankingUpdateComponent);
      comp = fixture.componentInstance;
      service = fixture.debugElement.injector.get(CustomerBankingService);
    });

    describe('save', () => {
      it('Should call update service on save for existing entity', fakeAsync(() => {
        // GIVEN
        const entity = new CustomerBanking(123);
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
        const entity = new CustomerBanking();
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
