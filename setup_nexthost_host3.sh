#!/bin/bash

#Files needed (placed in CURRENT_WORKING_DIR)
    #MINIO
 #1) 8 files representing private keys and public certs
    #KEYCLOAK
 #2) JDBC jar file
 #3) standalone.proto.xml
    #COCKROACHDB
 #4) ca.crt (1 file)
 #5) 6 files of (for 3 hosts - unlike MINIO, COCKROACHDB only needs 3) node.crt and node.key
 
 #Make sure Java 11 is installed
 #Make sure all these are in /etc/hosts
 #178.62.14.47 host4
#167.172.50.90 host3
#165.22.92.3  host2
#46.101.1.218 host1
#127.0.0.1 keycloak
 
 
export CURRENT_WORKING_DIR=/workingdir

export COCKROACH_DOWNLOAD_URL=https://binaries.cockroachdb.com/cockroach-v20.2.5.linux-amd64.tgz
export COCKROACH_UNZIPED_DIR=cockroach-v20.2.5.linux-amd64
export HOST=host3
export OTHER_HOSTS=host1,host2

export CA_CRT=ca.crt
export NODE_CRT=node.host3.crt
export NODE_KEY=node.host3.key


export MINIO_DOWNLOAD_URL=https://dl.min.io/server/minio/release/linux-amd64/minio
export MINIO_USERNAME=minio-admin
export MINIO_PASSWORD=1qazZAQ!

export MINIO_SERVERS=https://host{1...4}/mnt/data{1...2}

#export MINIO_SERVERS=https://host1/mnt/data11\ https://host1/mnt/data12\ https://host2/mnt/data21\ https://host2/mnt/data22\ https://host3/mnt/data31\ https://host3/mnt/data32\ https://host4/mnt/data41\ https://host4/mnt/data42 #spaces must be excaped

export DISK1=data1
export DISK2=data2
export DISK1_NAME=/dev/disk/by-id/scsi-0DO_Volume_data31
export DISK2_NAME=/dev/disk/by-id/scsi-0DO_Volume_data32

export MINIO_PUBLIC_CERT=public3.crt
export MINIO_PRIVATE_KEY=private3.key

export OTHER_MINIO_PUBLIC_CERT1=public1.crt

export OTHER_MINIO_PUBLIC_CERT2=public2.crt

export OTHER_MINIO_PUBLIC_CERT3=public4.crt


export KEYCLOAK_URL=https://github.com/keycloak/keycloak/releases/download/12.0.3/keycloak-12.0.3.tar.gz
export KEYCLOAK_UNZIPED_DIR=keycloak-12.0.3
export POSTGRESQL_JDBC_DOWNLOAD_URL=https://jdbc.postgresql.org/download/postgresql-42.2.19.jar
export POSTGRESQL_JDBC_JAR=postgresql-42.2.18.jar
export POSTGRESQL_JDBC_URL='jdbc:postgresql:\/\/host3:26257\/keycloakdb?sslmode=verify-full\&amp;sslrootcert=\/home\/cockroach\/certs\/ca\.crt'
export KEYCLOAK_DBUSER_PASSWORD=1qazZAQ!

#!!!-this url must be escaped - use https://dwaves.de/tools/escape/

export BANKING_APP_PROD_CONFIG_FILENAME=application-prod.host3.yml
export CACERTS_LOC=/usr/lib/jvm/java-11-openjdk-amd64/lib/security/cacerts



#=====================COCKROACH DB===============
 adduser --gecos "cockroach" --disabled-password --home "/home/cockroach" "cockroach"
usermod -aG sudo cockroach



#--download
mkdir /opt/$COCKROACH_UNZIPED_DIR
wget -c $COCKROACH_DOWNLOAD_URL -O - | tar -xzv --strip-components=1 -C /opt/$COCKROACH_UNZIPED_DIR
ln /opt/$COCKROACH_UNZIPED_DIR/cockroach /usr/local/bin/cockroach


#--setup certs
mkdir /home/cockroach/certs
chown -R cockroach:cockroach /home/cockroach/certs

cp $CURRENT_WORKING_DIR/$NODE_CRT /home/cockroach/certs
mv /home/cockroach/certs/$NODE_CRT /home/cockroach/certs/node.crt

cp $CURRENT_WORKING_DIR/$NODE_KEY /home/cockroach/certs
mv /home/cockroach/certs/$NODE_KEY /home/cockroach/certs/node.key

cp $CURRENT_WORKING_DIR/$CA_CRT /home/cockroach/certs/

chmod 700 /home/cockroach/certs/node.crt
chmod 700 /home/cockroach/certs/node.key
chmod 744 /home/cockroach/certs/$CA_CRT

chown -R cockroach:cockroach /home/cockroach/certs

#--setup systemd
cat << EOF | tee -a /etc/systemd/system/cockroach.service
[Unit]
Description=Cockroach Database cluster node
Requires=network.target

[Service]
Type=simple
WorkingDirectory=/home/cockroach
ExecStartPre=/bin/sleep 30
ExecStart=/usr/local/bin/cockroach start --certs-dir=/home/cockroach/certs --host=$HOST --http-host=$HOST --join=$HOST,$OTHER_HOSTS --cache=25% --max-sql-memory=25%
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

#=====================MINIO===============


#-- add minio user
 useradd -m -p $(openssl passwd -crypt "1qazZAQ!") minio -s /bin/bash
usermod -aG sudo minio


mkdir -p /home/minio/.minio/certs/CAs


mv $CURRENT_WORKING_DIR/$MINIO_PUBLIC_CERT /home/minio/.minio/certs/public.crt
mv $CURRENT_WORKING_DIR/$MINIO_PRIVATE_KEY /home/minio/.minio/certs/private.key 


cp $CURRENT_WORKING_DIR/$OTHER_MINIO_PUBLIC_CERT1 /home/minio/.minio/certs/CAs
cp $CURRENT_WORKING_DIR/$OTHER_MINIO_PUBLIC_CERT2 /home/minio/.minio/certs/CAs
cp $CURRENT_WORKING_DIR/$OTHER_MINIO_PUBLIC_CERT3 /home/minio/.minio/certs/CAs

#cd /home/minio

chown -R minio:minio /home/minio/.minio

curl $MINIO_DOWNLOAD_URL \
  --create-dirs \
  -o /opt/minio-binaries/minio
chmod +x /opt/minio-binaries/minio

ln /opt/minio-binaries/minio /usr/local/bin/minio

#--Create moun points for minio
mkdir -p /mnt/$DISK1
mount -o discard,defaults,noatime $DISK1_NAME /mnt/$DISK1
echo "$DISK1_NAME /mnt/$DISK1 ext4 defaults,nofail,discard 0 0" | sudo tee -a /etc/fstab

mkdir -p /mnt/$DISK2
mount -o discard,defaults,noatime $DISK2_NAME /mnt/$DISK2
echo "$DISK2_NAME /mnt/$DISK2 ext4 defaults,nofail,discard 0 0" | sudo tee -a /etc/fstab

#--For disks----
chown -R minio:minio /mnt/$DISK1
chmod u+rxw /mnt/$DISK1
chown -R minio:minio /mnt/$DISK2
chmod u+rxw /mnt/$DISK2

#---MINIO default info
cat << EOF | tee -a  /etc/default/minio
MINIO_ACCESS_KEY=$MINIO_USERNAME
MINIO_SECRET_KEY=$MINIO_PASSWORD
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

#---Run-------------
systemctl daemon-reload
systemctl enable minio
systemctl start minio
systemctl status minio

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

#--update standalone xml for keycloak dbuser password
sed -i -e "s/YYY_KEYCLOAK_DBUSER_PASSSWORD_YYY/$KEYCLOAK_DBUSER_PASSWORD/g" /opt/$KEYCLOAK_UNZIPED_DIR/standalone/configuration/standalone.xml

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

