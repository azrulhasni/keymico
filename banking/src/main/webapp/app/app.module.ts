import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import './vendor';
import { KeymicobankSharedModule } from 'app/shared/shared.module';
import { KeymicobankCoreModule } from 'app/core/core.module';
import { KeymicobankAppRoutingModule } from './app-routing.module';
import { KeymicobankHomeModule } from './home/home.module';
import { KeymicobankEntityModule } from './entities/entity.module';
// jhipster-needle-angular-add-module-import JHipster will add new module here
import { MainComponent } from './layouts/main/main.component';
import { NavbarComponent } from './layouts/navbar/navbar.component';
import { FooterComponent } from './layouts/footer/footer.component';
import { PageRibbonComponent } from './layouts/profiles/page-ribbon.component';
import { ErrorComponent } from './layouts/error/error.component';

@NgModule({
  imports: [
    BrowserModule,
    KeymicobankSharedModule,
    KeymicobankCoreModule,
    KeymicobankHomeModule,
    // jhipster-needle-angular-add-module JHipster will add new module here
    KeymicobankEntityModule,
    KeymicobankAppRoutingModule,
  ],
  declarations: [MainComponent, NavbarComponent, ErrorComponent, PageRibbonComponent, FooterComponent],
  bootstrap: [MainComponent],
})
export class KeymicobankAppModule {}
