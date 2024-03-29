package com.azrul.keymico.bank;

import com.tngtech.archunit.core.domain.JavaClasses;
import com.tngtech.archunit.core.importer.ClassFileImporter;
import com.tngtech.archunit.core.importer.ImportOption;
import org.junit.jupiter.api.Test;

import static com.tngtech.archunit.lang.syntax.ArchRuleDefinition.noClasses;

class ArchTest {

    @Test
    void servicesAndRepositoriesShouldNotDependOnWebLayer() {

        JavaClasses importedClasses = new ClassFileImporter()
            .withImportOption(ImportOption.Predefined.DO_NOT_INCLUDE_TESTS)
            .importPackages("com.azrul.keymico.bank");

        noClasses()
            .that()
                .resideInAnyPackage("com.azrul.keymico.bank.service..")
            .or()
                .resideInAnyPackage("com.azrul.keymico.bank.repository..")
            .should().dependOnClassesThat()
                .resideInAnyPackage("..com.azrul.keymico.bank.web..")
        .because("Services and repositories should not depend on web layer")
        .check(importedClasses);
    }
}
