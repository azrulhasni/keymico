package com.azrul.keymico.bank.domain;


import javax.persistence.*;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * A Customer.
 */
@Entity
@Table(name = "customer")
public class Customer implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "sequenceGenerator")
    @SequenceGenerator(name = "sequenceGenerator")
    private Long id;

    @Column(name = "cif_number")
    private String cifNumber;

    @Column(name = "first_name")
    private String firstName;

    @Column(name = "last_name")
    private String lastName;

    @Column(name = "ic_number")
    private String icNumber;

    @Column(name = "phone_number")
    private String phoneNumber;

    @OneToMany(mappedBy = "customer")
    private Set<BankAccount> accounts = new HashSet<>();

    // jhipster-needle-entity-add-field - JHipster will add fields here
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCifNumber() {
        return cifNumber;
    }

    public Customer cifNumber(String cifNumber) {
        this.cifNumber = cifNumber;
        return this;
    }

    public void setCifNumber(String cifNumber) {
        this.cifNumber = cifNumber;
    }

    public String getFirstName() {
        return firstName;
    }

    public Customer firstName(String firstName) {
        this.firstName = firstName;
        return this;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public Customer lastName(String lastName) {
        this.lastName = lastName;
        return this;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getIcNumber() {
        return icNumber;
    }

    public Customer icNumber(String icNumber) {
        this.icNumber = icNumber;
        return this;
    }

    public void setIcNumber(String icNumber) {
        this.icNumber = icNumber;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public Customer phoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
        return this;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Set<BankAccount> getAccounts() {
        return accounts;
    }

    public Customer accounts(Set<BankAccount> bankAccounts) {
        this.accounts = bankAccounts;
        return this;
    }

    public Customer addAccount(BankAccount bankAccount) {
        this.accounts.add(bankAccount);
        bankAccount.setCustomer(this);
        return this;
    }

    public Customer removeAccount(BankAccount bankAccount) {
        this.accounts.remove(bankAccount);
        bankAccount.setCustomer(null);
        return this;
    }

    public void setAccounts(Set<BankAccount> bankAccounts) {
        this.accounts = bankAccounts;
    }
    // jhipster-needle-entity-add-getters-setters - JHipster will add getters and setters here

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof Customer)) {
            return false;
        }
        return id != null && id.equals(((Customer) o).id);
    }

    @Override
    public int hashCode() {
        return 31;
    }

    // prettier-ignore
    @Override
    public String toString() {
        return "Customer{" +
            "id=" + getId() +
            ", cifNumber='" + getCifNumber() + "'" +
            ", firstName='" + getFirstName() + "'" +
            ", lastName='" + getLastName() + "'" +
            ", icNumber='" + getIcNumber() + "'" +
            ", phoneNumber='" + getPhoneNumber() + "'" +
            "}";
    }
}
