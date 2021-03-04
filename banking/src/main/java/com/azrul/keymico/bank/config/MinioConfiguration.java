/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.azrul.keymico.bank.config;

import io.minio.MinioClient;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 *
 * @author azrul
 */
@Configuration
public class MinioConfiguration {
    @Value("${minio.server.url}")
    String minioServerUrl;
    
    @Value("${minio.server.credential}")
    String minioServerCred;
    
    @Value("${minio.server.password}")
    String minioServerPwd;
    
    @Bean
    public MinioClient minioClient(){
        MinioClient minioClient
                    = MinioClient.builder()
                            .endpoint(minioServerUrl)
                            .credentials(minioServerCred, minioServerPwd)
                            .build();
        
        return minioClient;
    }
}
