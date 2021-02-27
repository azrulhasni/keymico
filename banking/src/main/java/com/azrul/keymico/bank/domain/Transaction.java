package com.azrul.keymico.bank.domain;


import javax.persistence.*;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.ZonedDateTime;

import com.azrul.keymico.bank.domain.enumeration.Currency;

/**
 * A Transaction.
 */
@Entity
@Table(name = "transaction")
public class Transaction implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "sequenceGenerator")
    @SequenceGenerator(name = "sequenceGenerator")
    private Long id;

    @Column(name = "transaction_id")
    private String transactionId;

    @Column(name = "file")
    private String file;

    @Lob
    @Column(name = "file_binaries")
    private byte[] fileBinaries;

    @Column(name = "file_binaries_content_type")
    private String fileBinariesContentType;

    @Column(name = "transaction_type")
    private String transactionType;

    @Column(name = "amount", precision = 21, scale = 2)
    private BigDecimal amount;

    @Column(name = "time")
    private ZonedDateTime time;

    @Enumerated(EnumType.STRING)
    @Column(name = "currency")
    private Currency currency;

    @Column(name = "source_account")
    private String sourceAccount;

    @Column(name = "target_account")
    private String targetAccount;

    // jhipster-needle-entity-add-field - JHipster will add fields here
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTransactionId() {
        return transactionId;
    }

    public Transaction transactionId(String transactionId) {
        this.transactionId = transactionId;
        return this;
    }

    public void setTransactionId(String transactionId) {
        this.transactionId = transactionId;
    }

    public String getFile() {
        return file;
    }

    public Transaction file(String file) {
        this.file = file;
        return this;
    }

    public void setFile(String file) {
        this.file = file;
    }

    public byte[] getFileBinaries() {
        return fileBinaries;
    }

    public Transaction fileBinaries(byte[] fileBinaries) {
        this.fileBinaries = fileBinaries;
        return this;
    }

    public void setFileBinaries(byte[] fileBinaries) {
        this.fileBinaries = fileBinaries;
    }

    public String getFileBinariesContentType() {
        return fileBinariesContentType;
    }

    public Transaction fileBinariesContentType(String fileBinariesContentType) {
        this.fileBinariesContentType = fileBinariesContentType;
        return this;
    }

    public void setFileBinariesContentType(String fileBinariesContentType) {
        this.fileBinariesContentType = fileBinariesContentType;
    }

    public String getTransactionType() {
        return transactionType;
    }

    public Transaction transactionType(String transactionType) {
        this.transactionType = transactionType;
        return this;
    }

    public void setTransactionType(String transactionType) {
        this.transactionType = transactionType;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public Transaction amount(BigDecimal amount) {
        this.amount = amount;
        return this;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public ZonedDateTime getTime() {
        return time;
    }

    public Transaction time(ZonedDateTime time) {
        this.time = time;
        return this;
    }

    public void setTime(ZonedDateTime time) {
        this.time = time;
    }

    public Currency getCurrency() {
        return currency;
    }

    public Transaction currency(Currency currency) {
        this.currency = currency;
        return this;
    }

    public void setCurrency(Currency currency) {
        this.currency = currency;
    }

    public String getSourceAccount() {
        return sourceAccount;
    }

    public Transaction sourceAccount(String sourceAccount) {
        this.sourceAccount = sourceAccount;
        return this;
    }

    public void setSourceAccount(String sourceAccount) {
        this.sourceAccount = sourceAccount;
    }

    public String getTargetAccount() {
        return targetAccount;
    }

    public Transaction targetAccount(String targetAccount) {
        this.targetAccount = targetAccount;
        return this;
    }

    public void setTargetAccount(String targetAccount) {
        this.targetAccount = targetAccount;
    }
    // jhipster-needle-entity-add-getters-setters - JHipster will add getters and setters here

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof Transaction)) {
            return false;
        }
        return id != null && id.equals(((Transaction) o).id);
    }

    @Override
    public int hashCode() {
        return 31;
    }

    // prettier-ignore
    @Override
    public String toString() {
        return "Transaction{" +
            "id=" + getId() +
            ", transactionId='" + getTransactionId() + "'" +
            ", file='" + getFile() + "'" +
            ", fileBinaries='" + getFileBinaries() + "'" +
            ", fileBinariesContentType='" + getFileBinariesContentType() + "'" +
            ", transactionType='" + getTransactionType() + "'" +
            ", amount=" + getAmount() +
            ", time='" + getTime() + "'" +
            ", currency='" + getCurrency() + "'" +
            ", sourceAccount='" + getSourceAccount() + "'" +
            ", targetAccount='" + getTargetAccount() + "'" +
            "}";
    }
}
