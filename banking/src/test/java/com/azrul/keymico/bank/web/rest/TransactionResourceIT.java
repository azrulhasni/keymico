package com.azrul.keymico.bank.web.rest;

import com.azrul.keymico.bank.KeymicobankApp;
import com.azrul.keymico.bank.config.TestSecurityConfiguration;
import com.azrul.keymico.bank.domain.Transaction;
import com.azrul.keymico.bank.repository.TransactionRepository;
import com.azrul.keymico.bank.service.TransactionService;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Base64Utils;
import javax.persistence.EntityManager;
import java.math.BigDecimal;
import java.time.Instant;
import java.time.ZonedDateTime;
import java.time.ZoneOffset;
import java.time.ZoneId;
import java.util.List;

import static com.azrul.keymico.bank.web.rest.TestUtil.sameInstant;
import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.Matchers.hasItem;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import com.azrul.keymico.bank.domain.enumeration.Currency;
/**
 * Integration tests for the {@link TransactionResource} REST controller.
 */
@SpringBootTest(classes = { KeymicobankApp.class, TestSecurityConfiguration.class })
@AutoConfigureMockMvc
@WithMockUser
public class TransactionResourceIT {

    private static final String DEFAULT_TRANSACTION_ID = "AAAAAAAAAA";
    private static final String UPDATED_TRANSACTION_ID = "BBBBBBBBBB";

    private static final String DEFAULT_FILE = "AAAAAAAAAA";
    private static final String UPDATED_FILE = "BBBBBBBBBB";

    private static final byte[] DEFAULT_FILE_BINARIES = TestUtil.createByteArray(1, "0");
    private static final byte[] UPDATED_FILE_BINARIES = TestUtil.createByteArray(1, "1");
    private static final String DEFAULT_FILE_BINARIES_CONTENT_TYPE = "image/jpg";
    private static final String UPDATED_FILE_BINARIES_CONTENT_TYPE = "image/png";

    private static final String DEFAULT_TRANSACTION_TYPE = "AAAAAAAAAA";
    private static final String UPDATED_TRANSACTION_TYPE = "BBBBBBBBBB";

    private static final BigDecimal DEFAULT_AMOUNT = new BigDecimal(1);
    private static final BigDecimal UPDATED_AMOUNT = new BigDecimal(2);

    private static final ZonedDateTime DEFAULT_TIME = ZonedDateTime.ofInstant(Instant.ofEpochMilli(0L), ZoneOffset.UTC);
    private static final ZonedDateTime UPDATED_TIME = ZonedDateTime.now(ZoneId.systemDefault()).withNano(0);

    private static final Currency DEFAULT_CURRENCY = Currency.USD;
    private static final Currency UPDATED_CURRENCY = Currency.MYR;

    private static final String DEFAULT_SOURCE_ACCOUNT = "AAAAAAAAAA";
    private static final String UPDATED_SOURCE_ACCOUNT = "BBBBBBBBBB";

    private static final String DEFAULT_TARGET_ACCOUNT = "AAAAAAAAAA";
    private static final String UPDATED_TARGET_ACCOUNT = "BBBBBBBBBB";

    @Autowired
    private TransactionRepository transactionRepository;

    @Autowired
    private TransactionService transactionService;

    @Autowired
    private EntityManager em;

    @Autowired
    private MockMvc restTransactionMockMvc;

    private Transaction transaction;

    /**
     * Create an entity for this test.
     *
     * This is a static method, as tests for other entities might also need it,
     * if they test an entity which requires the current entity.
     */
    public static Transaction createEntity(EntityManager em) {
        Transaction transaction = new Transaction()
            .transactionId(DEFAULT_TRANSACTION_ID)
            .file(DEFAULT_FILE)
            .fileBinaries(DEFAULT_FILE_BINARIES)
            .fileBinariesContentType(DEFAULT_FILE_BINARIES_CONTENT_TYPE)
            .transactionType(DEFAULT_TRANSACTION_TYPE)
            .amount(DEFAULT_AMOUNT)
            .time(DEFAULT_TIME)
            .currency(DEFAULT_CURRENCY)
            .sourceAccount(DEFAULT_SOURCE_ACCOUNT)
            .targetAccount(DEFAULT_TARGET_ACCOUNT);
        return transaction;
    }
    /**
     * Create an updated entity for this test.
     *
     * This is a static method, as tests for other entities might also need it,
     * if they test an entity which requires the current entity.
     */
    public static Transaction createUpdatedEntity(EntityManager em) {
        Transaction transaction = new Transaction()
            .transactionId(UPDATED_TRANSACTION_ID)
            .file(UPDATED_FILE)
            .fileBinaries(UPDATED_FILE_BINARIES)
            .fileBinariesContentType(UPDATED_FILE_BINARIES_CONTENT_TYPE)
            .transactionType(UPDATED_TRANSACTION_TYPE)
            .amount(UPDATED_AMOUNT)
            .time(UPDATED_TIME)
            .currency(UPDATED_CURRENCY)
            .sourceAccount(UPDATED_SOURCE_ACCOUNT)
            .targetAccount(UPDATED_TARGET_ACCOUNT);
        return transaction;
    }

    @BeforeEach
    public void initTest() {
        transaction = createEntity(em);
    }

    @Test
    @Transactional
    public void createTransaction() throws Exception {
        int databaseSizeBeforeCreate = transactionRepository.findAll().size();
        // Create the Transaction
        restTransactionMockMvc.perform(post("/api/transactions").with(csrf())
            .contentType(MediaType.APPLICATION_JSON)
            .content(TestUtil.convertObjectToJsonBytes(transaction)))
            .andExpect(status().isCreated());

        // Validate the Transaction in the database
        List<Transaction> transactionList = transactionRepository.findAll();
        assertThat(transactionList).hasSize(databaseSizeBeforeCreate + 1);
        Transaction testTransaction = transactionList.get(transactionList.size() - 1);
        assertThat(testTransaction.getTransactionId()).isEqualTo(DEFAULT_TRANSACTION_ID);
        assertThat(testTransaction.getFile()).isEqualTo(DEFAULT_FILE);
        assertThat(testTransaction.getFileBinaries()).isEqualTo(DEFAULT_FILE_BINARIES);
        assertThat(testTransaction.getFileBinariesContentType()).isEqualTo(DEFAULT_FILE_BINARIES_CONTENT_TYPE);
        assertThat(testTransaction.getTransactionType()).isEqualTo(DEFAULT_TRANSACTION_TYPE);
        assertThat(testTransaction.getAmount()).isEqualTo(DEFAULT_AMOUNT);
        assertThat(testTransaction.getTime()).isEqualTo(DEFAULT_TIME);
        assertThat(testTransaction.getCurrency()).isEqualTo(DEFAULT_CURRENCY);
        assertThat(testTransaction.getSourceAccount()).isEqualTo(DEFAULT_SOURCE_ACCOUNT);
        assertThat(testTransaction.getTargetAccount()).isEqualTo(DEFAULT_TARGET_ACCOUNT);
    }

    @Test
    @Transactional
    public void createTransactionWithExistingId() throws Exception {
        int databaseSizeBeforeCreate = transactionRepository.findAll().size();

        // Create the Transaction with an existing ID
        transaction.setId(1L);

        // An entity with an existing ID cannot be created, so this API call must fail
        restTransactionMockMvc.perform(post("/api/transactions").with(csrf())
            .contentType(MediaType.APPLICATION_JSON)
            .content(TestUtil.convertObjectToJsonBytes(transaction)))
            .andExpect(status().isBadRequest());

        // Validate the Transaction in the database
        List<Transaction> transactionList = transactionRepository.findAll();
        assertThat(transactionList).hasSize(databaseSizeBeforeCreate);
    }


    @Test
    @Transactional
    public void getAllTransactions() throws Exception {
        // Initialize the database
        transactionRepository.saveAndFlush(transaction);

        // Get all the transactionList
        restTransactionMockMvc.perform(get("/api/transactions?sort=id,desc"))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.[*].id").value(hasItem(transaction.getId().intValue())))
            .andExpect(jsonPath("$.[*].transactionId").value(hasItem(DEFAULT_TRANSACTION_ID)))
            .andExpect(jsonPath("$.[*].file").value(hasItem(DEFAULT_FILE)))
            .andExpect(jsonPath("$.[*].fileBinariesContentType").value(hasItem(DEFAULT_FILE_BINARIES_CONTENT_TYPE)))
            .andExpect(jsonPath("$.[*].fileBinaries").value(hasItem(Base64Utils.encodeToString(DEFAULT_FILE_BINARIES))))
            .andExpect(jsonPath("$.[*].transactionType").value(hasItem(DEFAULT_TRANSACTION_TYPE)))
            .andExpect(jsonPath("$.[*].amount").value(hasItem(DEFAULT_AMOUNT.intValue())))
            .andExpect(jsonPath("$.[*].time").value(hasItem(sameInstant(DEFAULT_TIME))))
            .andExpect(jsonPath("$.[*].currency").value(hasItem(DEFAULT_CURRENCY.toString())))
            .andExpect(jsonPath("$.[*].sourceAccount").value(hasItem(DEFAULT_SOURCE_ACCOUNT)))
            .andExpect(jsonPath("$.[*].targetAccount").value(hasItem(DEFAULT_TARGET_ACCOUNT)));
    }
    
    @Test
    @Transactional
    public void getTransaction() throws Exception {
        // Initialize the database
        transactionRepository.saveAndFlush(transaction);

        // Get the transaction
        restTransactionMockMvc.perform(get("/api/transactions/{id}", transaction.getId()))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.id").value(transaction.getId().intValue()))
            .andExpect(jsonPath("$.transactionId").value(DEFAULT_TRANSACTION_ID))
            .andExpect(jsonPath("$.file").value(DEFAULT_FILE))
            .andExpect(jsonPath("$.fileBinariesContentType").value(DEFAULT_FILE_BINARIES_CONTENT_TYPE))
            .andExpect(jsonPath("$.fileBinaries").value(Base64Utils.encodeToString(DEFAULT_FILE_BINARIES)))
            .andExpect(jsonPath("$.transactionType").value(DEFAULT_TRANSACTION_TYPE))
            .andExpect(jsonPath("$.amount").value(DEFAULT_AMOUNT.intValue()))
            .andExpect(jsonPath("$.time").value(sameInstant(DEFAULT_TIME)))
            .andExpect(jsonPath("$.currency").value(DEFAULT_CURRENCY.toString()))
            .andExpect(jsonPath("$.sourceAccount").value(DEFAULT_SOURCE_ACCOUNT))
            .andExpect(jsonPath("$.targetAccount").value(DEFAULT_TARGET_ACCOUNT));
    }
    @Test
    @Transactional
    public void getNonExistingTransaction() throws Exception {
        // Get the transaction
        restTransactionMockMvc.perform(get("/api/transactions/{id}", Long.MAX_VALUE))
            .andExpect(status().isNotFound());
    }

    @Test
    @Transactional
    public void updateTransaction() throws Exception {
        // Initialize the database
        transactionService.save(transaction);

        int databaseSizeBeforeUpdate = transactionRepository.findAll().size();

        // Update the transaction
        Transaction updatedTransaction = transactionRepository.findById(transaction.getId()).get();
        // Disconnect from session so that the updates on updatedTransaction are not directly saved in db
        em.detach(updatedTransaction);
        updatedTransaction
            .transactionId(UPDATED_TRANSACTION_ID)
            .file(UPDATED_FILE)
            .fileBinaries(UPDATED_FILE_BINARIES)
            .fileBinariesContentType(UPDATED_FILE_BINARIES_CONTENT_TYPE)
            .transactionType(UPDATED_TRANSACTION_TYPE)
            .amount(UPDATED_AMOUNT)
            .time(UPDATED_TIME)
            .currency(UPDATED_CURRENCY)
            .sourceAccount(UPDATED_SOURCE_ACCOUNT)
            .targetAccount(UPDATED_TARGET_ACCOUNT);

        restTransactionMockMvc.perform(put("/api/transactions").with(csrf())
            .contentType(MediaType.APPLICATION_JSON)
            .content(TestUtil.convertObjectToJsonBytes(updatedTransaction)))
            .andExpect(status().isOk());

        // Validate the Transaction in the database
        List<Transaction> transactionList = transactionRepository.findAll();
        assertThat(transactionList).hasSize(databaseSizeBeforeUpdate);
        Transaction testTransaction = transactionList.get(transactionList.size() - 1);
        assertThat(testTransaction.getTransactionId()).isEqualTo(UPDATED_TRANSACTION_ID);
        assertThat(testTransaction.getFile()).isEqualTo(UPDATED_FILE);
        assertThat(testTransaction.getFileBinaries()).isEqualTo(UPDATED_FILE_BINARIES);
        assertThat(testTransaction.getFileBinariesContentType()).isEqualTo(UPDATED_FILE_BINARIES_CONTENT_TYPE);
        assertThat(testTransaction.getTransactionType()).isEqualTo(UPDATED_TRANSACTION_TYPE);
        assertThat(testTransaction.getAmount()).isEqualTo(UPDATED_AMOUNT);
        assertThat(testTransaction.getTime()).isEqualTo(UPDATED_TIME);
        assertThat(testTransaction.getCurrency()).isEqualTo(UPDATED_CURRENCY);
        assertThat(testTransaction.getSourceAccount()).isEqualTo(UPDATED_SOURCE_ACCOUNT);
        assertThat(testTransaction.getTargetAccount()).isEqualTo(UPDATED_TARGET_ACCOUNT);
    }

    @Test
    @Transactional
    public void updateNonExistingTransaction() throws Exception {
        int databaseSizeBeforeUpdate = transactionRepository.findAll().size();

        // If the entity doesn't have an ID, it will throw BadRequestAlertException
        restTransactionMockMvc.perform(put("/api/transactions").with(csrf())
            .contentType(MediaType.APPLICATION_JSON)
            .content(TestUtil.convertObjectToJsonBytes(transaction)))
            .andExpect(status().isBadRequest());

        // Validate the Transaction in the database
        List<Transaction> transactionList = transactionRepository.findAll();
        assertThat(transactionList).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    public void deleteTransaction() throws Exception {
        // Initialize the database
        transactionService.save(transaction);

        int databaseSizeBeforeDelete = transactionRepository.findAll().size();

        // Delete the transaction
        restTransactionMockMvc.perform(delete("/api/transactions/{id}", transaction.getId()).with(csrf())
            .accept(MediaType.APPLICATION_JSON))
            .andExpect(status().isNoContent());

        // Validate the database contains one less item
        List<Transaction> transactionList = transactionRepository.findAll();
        assertThat(transactionList).hasSize(databaseSizeBeforeDelete - 1);
    }
}
