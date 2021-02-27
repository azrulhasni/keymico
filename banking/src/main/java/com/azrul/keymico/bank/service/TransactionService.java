package com.azrul.keymico.bank.service;

import com.azrul.keymico.bank.domain.Transaction;
import com.azrul.keymico.bank.repository.TransactionRepository;
import io.minio.GetObjectArgs;
import io.minio.MinioClient;
import io.minio.PutObjectArgs;
import io.minio.errors.ErrorResponseException;
import io.minio.errors.InsufficientDataException;
import io.minio.errors.InternalException;
import io.minio.errors.InvalidResponseException;
import io.minio.errors.ServerException;
import io.minio.errors.XmlParserException;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;
import java.util.logging.Level;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Service Implementation for managing {@link Transaction}.
 */
@Service
@Transactional
public class TransactionService {
    
    @Autowired
    MinioClient minioClient;

    private final Logger log = LoggerFactory.getLogger(TransactionService.class);

    private final TransactionRepository transactionRepository;

    public TransactionService(TransactionRepository transactionRepository) {
        this.transactionRepository = transactionRepository;
    }

    /**
     * Save a transaction.
     *
     * @param transaction the entity to save.
     * @return the persisted entity.
     */
    public Transaction save(Transaction transaction) {
        log.debug("Request to save Transaction : {}", transaction);
        if (transaction.getFileBinaries()!=null){
            try {
                InputStream is = new ByteArrayInputStream(transaction.getFileBinaries());
                minioClient.putObject(
                        PutObjectArgs.builder().bucket("myuploads").object(transaction.getTransactionId()+"/"+transaction.getFile()).stream(
                                is, is.available(), -1)
                                .build());
            } catch (IOException | ErrorResponseException | InsufficientDataException | InternalException | InvalidKeyException | InvalidResponseException | NoSuchAlgorithmException | ServerException | XmlParserException ex) {
                java.util.logging.Logger.getLogger(TransactionService.class.getName()).log(Level.SEVERE, null, ex);
            }
            transaction.setFileBinaries(null);
        }
        return transactionRepository.save(transaction);
    }

    /**
     * Get all the transactions.
     *
     * @param pageable the pagination information.
     * @return the list of entities.
     */
    @Transactional(readOnly = true)
    public Page<Transaction> findAll(Pageable pageable) {
        log.debug("Request to get all Transactions");
        return transactionRepository.findAll(pageable);
    }


    /**
     * Get one transaction by id.
     *
     * @param id the id of the entity.
     * @return the entity.
     */
    @Transactional(readOnly = true)
    public Optional<Transaction> findOne(Long id) {
        log.debug("Request to get Transaction : {}", id);
        return transactionRepository.findById(id).map(t->{
            try {
                String tid = t.getTransactionId();
                byte[] attachment = minioClient.getObject(GetObjectArgs
                        .builder().bucket("myuploads").object(tid+"/"+t.getFile()).build()).readAllBytes();
                t.setFileBinaries(attachment);
                
            } catch (ErrorResponseException | InsufficientDataException | InternalException | InvalidKeyException | InvalidResponseException | IOException | NoSuchAlgorithmException | ServerException | XmlParserException ex) {
                java.util.logging.Logger.getLogger(TransactionService.class.getName()).log(Level.SEVERE, null, ex);
            }
            return t;
        });
    }

    /**
     * Delete the transaction by id.
     *
     * @param id the id of the entity.
     */
    public void delete(Long id) {
        log.debug("Request to delete Transaction : {}", id);
        transactionRepository.deleteById(id);
    }
}
       
