#!/bin/bash

#Files needed (placed in CURRENT_WORKING_DIR)

    #MINIO
    #=====
 #1) 8 files representing private keys and public certs
 #1) Make sure go is installed
 
    #KEYCLOAK
 #2) JDBC jar file
 #3) standalone.proto.xml
    
    #COCKROACHDB
    #===========
 #4) No node.key or ca.crt, node.crt for first host. We will create them here. Make sure we copy them back to other hosts
 
 #5) Make sure all these are in /etc/hosts
138.68.83.11    host4
46.101.246.150  host3
46.101.63.38    host2
139.59.175.78   host1
127.0.0.1       keycloak
 #Make sure toime is sync to google
 
    #KEYCLOAK
    #=========
 #6)  Make sure Java 11 is installed
 
 
    #ONCE FINISH
    #==========
#7) Copy 7 minio certs to host2,3 and 4(
            #/home/minio/public.crt
            #/home/minio/public2.crt
            #/home/minio/private2.key
            #/home/minio/public3.crt
            #/home/minio/private3.key
            #/home/minio/public4.crt
            #/home/minio/private4.key )
            
#8) Copy 5 cockroach certs
            #/home/cockroach/ca.crt
            #/home/cockroach/certs2/node.host2.crt
            #/home/cockroach/certs2/node.host2.crt
            #/home/cockroach/certs3/node.host3.crt
            #/home/cockroach/certs3/node.host3.crt
 
export CURRENT_WORKING_DIR=/workingdir

export COCKROACH_DOWNLOAD_URL=https://binaries.cockroachdb.com/cockroach-v20.2.5.linux-amd64.tgz
export COCKROACH_UNZIPED_DIR=cockroach-v20.2.5.linux-amd64
export HOST=host1
export HOST2=host2
export HOST3=host3
export HOST4=host4

export CA_CRT=ca.crt
export NODE_ACCESS_LIST="139.59.175.78 host1 localhost 127.0.0.1" #space seperated hostname/ip address used to access host1

export OTHER_NODE1=host2
export OTHER_NODE1_CERT_FOLDER=/home/cockroach/certs2 
export OTHER_NODE1_ACCESS_LIST="46.101.63.38 host2 localhost 127.0.0.1" #space seperated hostname/ip

export OTHER_NODE2=host3
export OTHER_NODE2_CERT_FOLDER=/home/cockroach/certs3
export OTHER_NODE2_ACCESS_LIST="46.101.246.150 host3 localhost 127.0.0.1" #space seperated 

export MINIO_DOWNLOAD_URL=https://dl.min.io/server/minio/release/linux-amd64/minio
export MINIO_CLIENT_DOWNLOAD_URL=https://dl.min.io/client/mc/release/linux-amd64/mc
export GO_CERT_GENERATOR_URL=https://golang.org/src/crypto/tls/generate_cert.go?m=text
export MINIO_ADMIN_USERNAME=minio-admin
export MINIO_ADMIN_PASSWORD=1qazZAQ!
export MINIO_USERNAME=mystoreuser
export MINIO_PASSWORD=1qazZAQ!
#export MINIO_SERVERS=https://host1/mnt/data11\ https://host1/mnt/data12\ https://host2/mnt/data21\ https://host2/mnt/data22\ https://host3/mnt/data31\ https://host3/mnt/data32\ https://host4/mnt/data41\ https://host4/mnt/data42 #spaces must be excaped
export MINIO_SERVERS=https://host{1...4}/mnt/data{1...2}
export MINIO_ALIAS=mystore
export MINIO_BUCKET=myuploads

#export DISK1=data11
#export DISK2=data12
export DISK1=data1
export DISK2=data2
export DISK1_NAME=/dev/disk/by-id/scsi-0DO_Volume_data1
export DISK2_NAME=/dev/disk/by-id/scsi-0DO_Volume_data2

export KEYCLOAK_URL=https://github.com/keycloak/keycloak/releases/download/12.0.3/keycloak-12.0.3.tar.gz
export KEYCLOAK_UNZIPED_DIR=keycloak-12.0.3
export POSTGRESQL_JDBC_DOWNLOAD_URL=https://jdbc.postgresql.org/download/postgresql-42.2.19.jar
export POSTGRESQL_JDBC_JAR=postgresql-42.2.18.jar
export POSTGRESQL_JDBC_URL='jdbc:postgresql:\/\/host1:26257\/keycloakdb?sslmode=verify-full\&amp;sslrootcert=\/home\/cockroach\/certs\/ca\.crt' #!!!-this url must be escaped - use https://dwaves.de/tools/escape/

export BANKING_APP_PROD_CONFIG_FILENAME=application-prod.host1.yml
export CACERTS_LOC=/usr/lib/jvm/java-11-openjdk-amd64/lib/security/cacerts


#=====================COCKROACH DB===============
 useradd -m -p $(openssl passwd -crypt "1qazZAQ!") cockroach -s /bin/bash
usermod -aG sudo cockroach



#--download
mkdir /opt/$COCKROACH_UNZIPED_DIR
wget -c $COCKROACH_DOWNLOAD_URL -O - | tar -xzv --strip-components=1 -C /opt/$COCKROACH_UNZIPED_DIR
ln /opt/$COCKROACH_UNZIPED_DIR/cockroach /usr/local/bin/cockroach

mkdir /home/cockroach/certs
chown -R cockroach:cockroach /home/cockroach/certs

mkdir /home/cockroach/my-safe-directory
chown -R cockroach:cockroach /home/cockroach/my-safe-directory

cockroach cert create-ca \
--certs-dir=/home/cockroach/certs \
--ca-key=/home/cockroach/my-safe-directory/ca.key

#Copy the file (ca.crt) to other servers
cockroach cert create-node \
$NODE_ACCESS_LIST \
--certs-dir=/home/cockroach/certs \
--ca-key=/home/cockroach/my-safe-directory/ca.key

chmod 700 /home/cockroach/certs/node.crt
chmod 700 /home/cockroach/certs/node.key
chmod 744 /home/cockroach/certs/$CA_CRT

mkdir $OTHER_NODE1_CERT_FOLDER
mkdir $OTHER_NODE2_CERT_FOLDER

cp /home/cockroach/certs/$CA_CRT $OTHER_NODE1_CERT_FOLDER
cp /home/cockroach/certs/$CA_CRT $OTHER_NODE2_CERT_FOLDER

cockroach cert create-node \
$OTHER_NODE1_ACCESS_LIST \
--certs-dir=$OTHER_NODE1_CERT_FOLDER \
--ca-key=/home/cockroach/my-safe-directory/ca.key
mv $OTHER_NODE1_CERT_FOLDER/node.key $OTHER_NODE1_CERT_FOLDER/node.$OTHER_NODE1.key
mv $OTHER_NODE1_CERT_FOLDER/node.crt $OTHER_NODE1_CERT_FOLDER/node.$OTHER_NODE1.crt
#Copy the content of host2 to other servers

cockroach cert create-node \
$OTHER_NODE2_ACCESS_LIST \
--certs-dir=$OTHER_NODE2_CERT_FOLDER \
--ca-key=/home/cockroach/my-safe-directory/ca.key
mv $OTHER_NODE2_CERT_FOLDER/node.key $OTHER_NODE2_CERT_FOLDER/node.$OTHER_NODE2.key
mv $OTHER_NODE2_CERT_FOLDER/node.crt $OTHER_NODE2_CERT_FOLDER/node.$OTHER_NODE2.crt
#Copy the content of host3 to other servers


chown -R cockroach:cockroach $OTHER_NODE1_CERT_FOLDER
chown -R cockroach:cockroach $OTHER_NODE2_CERT_FOLDER
chown -R cockroach:cockroach /home/cockroach/certs/

#--setup systemd
cat << EOF | tee -a /etc/systemd/system/cockroach.service
[Unit]
Description=Cockroach Database cluster node
Requires=network.target

[Service]
Type=simple
WorkingDirectory=/home/cockroach
ExecStartPre=/bin/sleep 30
ExecStart=/usr/local/bin/cockroach start --certs-dir=/home/cockroach/certs --host=$HOST --http-host=$HOST --join=$HOST,$HOST2,$HOST3 --cache=25% --max-sql-memory=25%
ExecStop=/usr/local/bin/cockroach quit --certs-dir=/home/cockroach/certs --host=$HOST
Restart=always
RestartSec=10
RestartPreventExitStatus=0
StandardOutput=syslog
StandardError=syslog
SyslogIdentifier=cockroach
User=cockroach

[Install]
WantedBy=default.target
EOF

systemctl daemon-reload
systemctl enable cockroach
systemctl start cockroach
systemctl status cockroach

cockroach cert create-client \
    root \
    --certs-dir=/home/cockroach/certs \
    --ca-key=/home/cockroach/my-safe-directory/ca.key
    
chown -R cockroach:cockroach /home/cockroach/certs/

#--only for first host--
#su -m cockroach -c "cockroach init --certs-dir=\/home\/cockroach\/certs --host=$HOST1"
cockroach init --certs-dir=/home/cockroach/certs --host=$HOST


    
cockroach --certs-dir=/home/cockroach/certs --host=$HOST sql < $CURRENT_WORKING_DIR/keycloak_create_user_db.sql
cockroach --certs-dir=/home/cockroach/certs --database=keycloakdb --host=$HOST sql < $CURRENT_WORKING_DIR/keycloak_create_no_constraints.sql
cockroach --certs-dir=/home/cockroach/certs --database=keycloakdb --host=$HOST sql < $CURRENT_WORKING_DIR/keycloak_data.sql
cockroach --certs-dir=/home/cockroach/certs --database=keycloakdb --host=$HOST sql < $CURRENT_WORKING_DIR/keycloak_add_constraints.sql

#=====================MINIO===============


#-- add minio user
 useradd -m -p $(openssl passwd -crypt "1qazZAQ!") minio -s /bin/bash
usermod -aG sudo minio


mkdir -p /home/minio/.minio/certs/CAs

curl $GO_CERT_GENERATOR_URL \
  --create-dirs \
  -o /home/minio/generate_cert.go
cd /home/minio/
go run /home/minio/generate_cert.go -ca --host "$HOST"
mv /home/minio/cert.pem /home/minio/.minio/certs/public.crt
mv /home/minio/key.pem  /home/minio/.minio/certs/private.key
cp /home/minio/.minio/certs/public.crt /home/minio/
mv /home/minio/public.crt /home/minio/public1.crt 
cp /home/minio/public1.crt /home/minio/.minio/certs/CAs

go run /home/minio/generate_cert.go -ca --host "$HOST2"
mv /home/minio/cert.pem /home/minio/.minio/certs/public2.crt
cp /home/minio/.minio/certs/public2.crt /home/minio/
mv /home/minio/key.pem  /home/minio/private2.key
cp /home/minio/.minio/certs/public2.crt /home/minio/.minio/certs/CAs

go run /home/minio/generate_cert.go -ca --host "$HOST3"
mv /home/minio/cert.pem /home/minio/.minio/certs/public3.crt
cp /home/minio/.minio/certs/public3.crt /home/minio/
mv /home/minio/key.pem  /home/minio/private3.key
cp /home/minio/.minio/certs/public3.crt /home/minio/.minio/certs/CAs

go run /home/minio/generate_cert.go -ca --host "$HOST4"
mv /home/minio/cert.pem /home/minio/.minio/certs/public4.crt
cp /home/minio/.minio/certs/public4.crt /home/minio/
mv /home/minio/key.pem  /home/minio/private4.key
cp /home/minio/.minio/certs/public4.crt /home/minio/.minio/certs/CAs


#cd /home/minio

chown -R minio:minio /home/minio/




curl $MINIO_DOWNLOAD_URL \
  --create-dirs \
  -o /opt/minio-binaries/minio
chmod +x /opt/minio-binaries/minio

ln /opt/minio-binaries/minio /usr/local/bin/minio

#--For disks----
chown -R minio:minio /mnt/$DISK1
chmod u+rxw /mnt/$DISK1
chown -R minio:minio /mnt/$DISK2
chmod u+rxw /mnt/$DISK2

#---MINIO default info
cat << EOF | tee -a  /etc/default/minio
MINIO_ACCESS_KEY=$MINIO_ADMIN_USERNAME
MINIO_SECRET_KEY=$MINIO_ADMIN_PASSWORD
MINIO_VOLUMES=$MINIO_SERVERS
EOF

#-----Systemd config
cat << EOF | tee -a /etc/systemd/system/minio.service
[Unit]
Description=MinIO
Documentation=https://docs.min.io
Wants=network-online.target
After=network-online.target
AssertFileIsExecutable=/usr/local/bin/minio

[Service]
WorkingDirectory=/home/minio

User=minio
Group=minio

EnvironmentFile=/etc/default/minio
ExecStartPre=/bin/bash -c "if [ -z \"\${MINIO_VOLUMES}\" ]; then echo \"Variable MINIO_VOLUMES not set in /etc/default/minio\"; exit 1; fi"

ExecStart=/usr/local/bin/minio server \$MINIO_OPTS \$MINIO_VOLUMES

# Let systemd restart this service always
Restart=always

# Specifies the maximum file descriptor number that can be opened by this process
LimitNOFILE=65536

# Specifies the maximum number of threads this process can create
TasksMax=infinity

# Disable timeout logic and wait until process is stopped
TimeoutStopSec=infinity
SendSIGKILL=no

[Install]
WantedBy=multi-user.target

EOF

#---Run-------------------------------------

chown -R minio:minio /home/minio

systemctl daemon-reload
systemctl enable minio
systemctl start minio
systemctl status minio




#---Download and install Minio Client-------
curl $MINIO_CLIENT_DOWNLOAD_URL \
  --create-dirs \
  -o /opt/minio-binaries/mc
chmod +x /opt/minio-binaries/mc

ln /opt/minio-binaries/mc /usr/local/bin/mc

#---Create Minio user and bucket----------------------

mc --insecure alias set $MINIO_ALIAS https://$HOST:9000 $MINIO_ADMIN_USERNAME $MINIO_ADMIN_PASSWORD

#Alias mystore can be used to, say, add user
mc --insecure admin user add $MINIO_ALIAS $MINIO_USERNAME $MINIO_PASSWORD
mc --insecure admin policy set $MINIO_ALIAS readwrite user=$MINIO_USERNAME

#Also add a bucket
mc --insecure mb $MINIO_ALIAS/$MINIO_BUCKET

#-------------------KEYCLOAK------------------------------------------


 useradd -m -p $(openssl passwd -crypt "1qazZAQ!") keycloak -s /bin/bash
usermod -aG sudo keycloak


mkdir /opt/$KEYCLOAK_UNZIPED_DIR
wget -c $KEYCLOAK_URL -O - | tar -xzv --strip-components=1 -C /opt/$KEYCLOAK_UNZIPED_DIR

chown -R keycloak:keycloak /opt/$KEYCLOAK_UNZIPED_DIR

#download JDBC jar
curl $POSTGRESQL_JDBC_DOWNLOAD_URL \
  --create-dirs \
  -o $CURRENT_WORKING_DIR/$POSTGRESQL_JDBC_JAR

#--copy proto standalone xml to standalone xml
cp $CURRENT_WORKING_DIR/standalone.proto.xml /opt/$KEYCLOAK_UNZIPED_DIR/standalone/configuration
rm /opt/$KEYCLOAK_UNZIPED_DIR/standalone/configuration/standalone.xml
mv /opt/$KEYCLOAK_UNZIPED_DIR/standalone/configuration/standalone.proto.xml /opt/$KEYCLOAK_UNZIPED_DIR/standalone/configuration/standalone.xml

#--update standalone xml for jdbc url
sed -i -e "s/YYY_JDBC_URL_YYY/$POSTGRESQL_JDBC_URL/g" /opt/$KEYCLOAK_UNZIPED_DIR/standalone/configuration/standalone.xml

#--update standalone xml for self signed cert creation
sed -i -e "s/<keystore path=\"application\.keystore\" relative-to=\"jboss\.server\.config\.dir\" keystore-password=\"password\" alias=\"server\" key-password=\"password\" generate-self-signed-certificate-host=\"localhost\"\/>/<keystore path=\"application\.keystore\" relative-to=\"jboss\.server\.config\.dir\" keystore-password=\"password\" alias=\"keycloak\" key-password=\"password\" generate-self-signed-certificate-host=\"keycloak\"\/>/g" /opt/$KEYCLOAK_UNZIPED_DIR/standalone/configuration/standalone.xml




mkdir -p /opt/$KEYCLOAK_UNZIPED_DIR/modules/system/layers/keycloak/org/postgresql/main
cp $CURRENT_WORKING_DIR/$POSTGRESQL_JDBC_JAR /opt/$KEYCLOAK_UNZIPED_DIR/modules/system/layers/keycloak/org/postgresql/main

#----put JDBC jar in Keycloak
cat << EOF | tee -a /opt/$KEYCLOAK_UNZIPED_DIR/modules/system/layers/keycloak/org/postgresql/main/module.xml
<?xml version="1.0" ?>
<module xmlns="urn:jboss:module:1.3" name="org.postgresql">

    <resources>
        <resource-root path="$POSTGRESQL_JDBC_JAR"/>
    </resources>

    <dependencies>
        <module name="javax.api"/>
        <module name="javax.transaction.api"/>
    </dependencies>
</module>
EOF

chown -R keycloak:keycloak /opt/$KEYCLOAK_UNZIPED_DIR/modules/system/layers/keycloak/org/postgresql


#----declare Keycloak in systemd-------------
cat > /etc/systemd/system/keycloak.service <<EOF

[Unit]
Description=Keycloak
After=network.target

[Service]
Type=idle
User=keycloak
Group=keycloak
ExecStart=/opt/$KEYCLOAK_UNZIPED_DIR/bin/standalone.sh -Djboss.socket.binding.port-offset=1000 -b=0.0.0.0
TimeoutStartSec=600
TimeoutStopSec=600

[Install]
WantedBy=multi-user.target
EOF

#---run keycloak in systemd------
systemctl daemon-reload
systemctl enable keycloak
systemctl start keycloak
systemctl status keycloak


#-------------------APPLICATION ----------------------------------------------

 useradd -m -p $(openssl passwd -crypt "1qazZAQ!") banking -s /bin/bash
usermod -aG sudo banking


#--add minio cert to cacerts
openssl s_client -connect $HOST:9000 </dev/null | sudo sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > /tmp/minio.localhost.cer
keytool -noprompt -import -file "/tmp/minio.localhost.cer" -keystore "$CACERTS_LOC" -alias "minio" -storepass  changeit

#--add keycloak cert to cacerts
openssl s_client -connect $HOST:9443 </dev/null | sudo sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > /tmp/keycloak.localhost.cer
keytool -noprompt -import -file "/tmp/keycloak.localhost.cer" -keystore "$CACERTS_LOC" -alias "keycloak" -storepass  changeit

mkdir /opt/banking/
cp $CURRENT_WORKING_DIR/keymicobank-0.0.1-SNAPSHOT.jar /opt/banking/

mkdir /opt/banking/config
cp $CURRENT_WORKING_DIR/$BANKING_APP_PROD_CONFIG_FILENAME /opt/banking/config
mv /opt/banking/config/$BANKING_APP_PROD_CONFIG_FILENAME  /opt/banking/config/application-prod.yml
cp $CURRENT_WORKING_DIR/application.yml /opt/banking/config

cat > /etc/systemd/system/banking.service <<EOF

[Unit]
Description=BankingApp
After=network.target

[Service]
Type=idle
User=banking
Group=banking
ExecStart=java -jar /opt/banking/keymicobank-0.0.1-SNAPSHOT.jar --spring.profiles.active=prod --spring.config.name=application,application-prod --spring.config.location=file:///opt/banking/config/
TimeoutStartSec=600
TimeoutStopSec=600

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable banking
systemctl start banking
systemctl status banking