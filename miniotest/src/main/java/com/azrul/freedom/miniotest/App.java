/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.azrul.freedom.miniotest;

import io.minio.BucketExistsArgs;
import io.minio.MakeBucketArgs;
import io.minio.MinioClient;
import io.minio.PutObjectArgs;
import io.minio.errors.MinioException;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertificateException;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import okhttp3.OkHttpClient;

/**
 *
 * @author azrul
 */
public class App {

    public static void main(String[] args) {

        App app = new App();
        app.run();
    }

    public void run() {
        try {
            OkHttpClient okHttpClient = getUnsafeOkHttpClient();
            
                // socket timeout

            MinioClient minioClient
                    = MinioClient.builder()
                            //.httpClient(okHttpClient)
                            .endpoint("https://host1:9000")
                            .credentials("mystoreuser", "1qazZAQ!")
                            .build();

            // Make 'myuploads' bucket if not exist.
            /*boolean found
                    = minioClient.bucketExists(BucketExistsArgs.builder().bucket("myuploads2").build());
            if (!found) {
                // Make a new bucket called 'asiatrip'.
                minioClient.makeBucket(MakeBucketArgs.builder().bucket("myuploads2").build());
            } else {
                System.out.println("Bucket 'myuploads2' already exists.");
            }*/

            URL resource = getClass().getClassLoader().getResource("pubsub (2).png");
            InputStream is = resource.openStream();

            // ByteArrayInputStream bais = new ByteArrayInputStream(builder.toString().getBytes("UTF-8"));
            // Create object 'my-objectname' in 'my-bucketname' with content from the input stream.
            minioClient.putObject(
                    PutObjectArgs.builder().bucket("myuploads").object("mystuff/pubsub (2).png").stream(
                            is, is.available(), -1)
                            .build());
            is.close();
            System.out.println("Uploaded");
        } catch (MinioException e) {
            System.out.println("Error occurred: " + e);
            System.out.println("HTTP trace: " + e.getMessage());
        } catch (InvalidKeyException | IOException | NoSuchAlgorithmException ex) {
            Logger.getLogger(App.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private OkHttpClient getUnsafeOkHttpClient() {
        try {
            final TrustManager[] trustAllCerts = new TrustManager[]{
                new X509TrustManager() {

                    @Override
                    public void checkClientTrusted(java.security.cert.X509Certificate[] chain,
                            String authType) throws
                            CertificateException {
                    }

                    @Override
                    public void checkServerTrusted(java.security.cert.X509Certificate[] chain,
                            String authType) throws
                            CertificateException {
                    }

                    @Override
                    public java.security.cert.X509Certificate[] getAcceptedIssuers() {
                        return new java.security.cert.X509Certificate[]{};
                    }
                }
            };

            final SSLContext sslContext = SSLContext.getInstance("SSL");
            sslContext.init(null, trustAllCerts, new java.security.SecureRandom());

            final SSLSocketFactory sslSocketFactory = sslContext.getSocketFactory();

            OkHttpClient.Builder builder = new OkHttpClient.Builder();
            builder.sslSocketFactory(sslSocketFactory, (X509TrustManager) trustAllCerts[0]);

            builder.hostnameVerifier(new HostnameVerifier() {
                @Override
                public boolean verify(String hostname, SSLSession session) {
                    return true;
                }
            });

            return builder
                    .connectTimeout(1, TimeUnit.HOURS)
                    .readTimeout(1,TimeUnit.HOURS)
                    .build();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
