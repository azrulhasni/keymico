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
 
export CURRENT_WORKING_DIR=/home/azrulhasni

export COCKROACH_DOWNLOAD_URL=https://binaries.cockroachdb.com/cockroach-v20.2.5.linux-amd64.tgz
export COCKROACH_UNZIPED_DIR=cockroach-v20.2.5.linux-amd64
export HOST=host2
export OTHER_HOSTS=host1,host3
export HOST_EXT=ubuntu-s-4vcpu-8gb-lon1-02
export IP_ADDRS=46.101.52.93
export INT_IP_ADDRS=10.106.0.4 

export CA_CRT=ca.crt
export NODE_CRT=node2.crt
export NODE_KEY=node2.key


export MINIO_DOWNLOAD_URL=https://dl.min.io/server/minio/release/linux-amd64/minio
export MINIO_USERNAME=minio-admin
export MINIO_PASSWORD=1qazZAQ!
export MINIO_SERVERS=https://host1/mnt/data11\ https://host1/mnt/data12\ https://host2/mnt/data21\ https://host2/mnt/data22\ https://host3/mnt/data31\ https://host3/mnt/data32\ https://host4/mnt/data41\ https://host4/mnt/data42 #spaces must be excaped

export DISK1=data21
export DISK2=data22
export MINIO_PUBLIC_CERT=public2.crt
export MINIO_PRIVATE_KEY=private2.key

export OTHER_MINIO_PUBLIC_CERT1=public1.crt
export OTHER_MINIO_PRIVATE_KEY1=private1.key

export OTHER_MINIO_PUBLIC_CERT2=public3.crt
export OTHER_MINIO_PRIVATE_KEY2=private3.key

export OTHER_MINIO_PUBLIC_CERT3=public4.crt
export OTHER_MINIO_PRIVATE_KEY3=private4.key




export KEYCLOAK_URL=https://github.com/keycloak/keycloak/releases/download/12.0.3/keycloak-12.0.3.tar.gz
export KEYCLOAK_UNZIPED_DIR=keycloak-12.0.3
export POSTGRESQL_JDBC_JAR=postgresql-42.2.18.jar
export POSTGRESQL_JDBC_URL=jdbc:postgresql:\/\/host2:26257\/keycloakdb #!!!-this url must be escaped - use https://dwaves.de/tools/escape/





#=====================COCKROACH DB===============
sudo adduser --gecos "cockroach" --disabled-password --home "/home/cockroach" "cockroach"
sudo usermod -aG sudo cockroach

sudo su cockroach

#--as cockroach user
cd /opt
sudo wget -qO- $COCKROACH_DOWNLOAD_URL | sudo tar -xvz
sudo ln /opt/$COCKROACH_UNZIPED_DIR/cockroach /usr/local/bin/cockroach


#--setup certs


mkdir certs

cp $CURRENT_WORKING_DIR/$NODE_CRT /home/cockroach/certs
mv /home/cockroach/certs/$NODE_CRT /home/cockroach/certs/node.crt

cp $CURRENT_WORKING_DIR/$NODE_KEY /home/cockroach/certs
mv /home/cockroach/certs/$NODE_KEY /home/cockroach/certs/node.key

cp $CURRENT_WORKING_DIR/$CA_CRT /home/cockroach/certs/



#--setup systemd
cat << EOF | sudo tee -a /etc/systemd/system/cockroach.service
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

sudo systemctl daemon-reload
sudo systemctl enable cockroach
sudo systemctl start cockroach
sudo systemctl status cockroach

#=====================MINIO===============


#-- add minio user
sudo adduser --gecos "minio" --disabled-password --home "/home/minio" "minio"
sudo usermod -aG sudo minio

sudo su minio

mkdir -p /home/minio/.minio/certs/CAs


sudo mv $CURRENT_WORKING_DIR/$MINIO_PUBLIC_CERT /home/minio/.minio/certs/public.crt
sudo mv $CURRENT_WORKING_DIR/$MINIO_PRIVATE_KEY /home/minio/.minio/certs/private.key 


cp $CURRENT_WORKING_DIR/$OTHER_MINIO_PUBLIC_CERT1 /home/minio/.minio/certs/CAs
cp $CURRENT_WORKING_DIR/$OTHER_MINIO_PUBLIC_CERT2 /home/minio/.minio/certs/CAs
cp $CURRENT_WORKING_DIR/$OTHER_MINIO_PUBLIC_CERT3 /home/minio/.minio/certs/CAs

#cd /home/minio

#sudo chown -R minio:minio .minio

sudo curl $MINIO_DOWNLOAD_URL \
  --create-dirs \
  -o /opt/minio-binaries/minio
sudo chmod +x /opt/minio-binaries/minio

sudo ln /opt/minio-binaries/minio /usr/local/bin/minio

#--For disks----
sudo chown -R minio /mnt/$DISK1
sudo chmod u+rxw /mnt/$DISK1
sudo chown -R minio /mnt/$DISK2
sudo chmod u+rxw /mnt/$DISK2

#---MINIO default info
cat << EOF | sudo tee -a  /etc/default/minio
MINIO_ACCESS_KEY=$MINIO_USERNAME
MINIO_SECRET_KEY=$MINIO_PASSWORD
MINIO_VOLUMES=$MINIO_SERVERS
EOF

#-----Systemd config
cat << EOF | sudo tee -a /etc/systemd/system/minio.service
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
sudo systemctl daemon-reload
sudo systemctl enable minio
sudo systemctl start minio
sudo systemctl status minio

#-------------------KEYCLOAK------------------------------------------


sudo adduser --gecos "keycloak" --home "/home/keycloak" "keycloak"
sudo useradd -m -p $(openssl passwd -crypt "1qazZAQ!") keycloak -s /bin/bash
sudo usermod -aG sudo keycloak




sudo wget $KEYCLOAK_URL | sudo tar xvz - -C /opt/$KEYCLOAK_UNZIPED_DIR


sudo ln /opt/$KEYCLOAK_UNZIPED_DIR/bin/standalone.sh /usr/local/bin/keycloak-standalone.sh

#--copy proto standalone xml to standalone xml
sudo cp $CURRENT_WORKING_DIR/standalone.proto.xml /opt/$KEYCLOAK_UNZIPED_DIR/standalone/configuration
sudo rm /opt/$KEYCLOAK_UNZIPED_DIR/standalone/configuration/standalone.xml
sudo mv /opt/$KEYCLOAK_UNZIPED_DIR/standalone/configuration/standalone.proto.xml /opt/$KEYCLOAK_UNZIPED_DIR/standalone/configuration/standalone.xml

#--update standalone xml for jdbc url
sudo sed -i -e "s/##JDBC_URL##/$POSTGRESQL_JDBC_URL/g" /opt/$KEYCLOAK_UNZIPED_DIR/standalone/configuration/standalone.xml

#--update standalone xml for self signed cert creation
sudo sed -i -e "s/<keystore path=\"application\.keystore\" relative-to=\"jboss\.server\.config\.dir\" keystore-password=\"password\" alias=\"server\" key-password=\"password\" generate-self-signed-certificate-host=\"localhost\"\/>/<keystore path=\"application\.keystore\" relative-to=\"jboss\.server\.config\.dir\" keystore-password=\"password\" alias=\"$HOST\" key-password=\"password\" generate-self-signed-certificate-host=\"$HOST\"\/>/g" /opt/$KEYCLOAK_UNZIPED_DIR/standalone/configuration/standalone.xml

sudo mkdir -p /opt/$KEYCLOAK_UNZIPED_DIR/modules/system/layers/keycloak/org/postgresql/main
sudo cp $CURRENT_WORKING_DIR/$POSTGRESQL_JDBC_JAR /opt/$KEYCLOAK_UNZIPED_DIR/modules/system/layers/keycloak/org/postgresql/main

#----put JDBC jar in Keycloak
cat << EOF | sudo tee -a /etc/systemd/system/cockroach.service/opt/$KEYCLOAK_UNZIPED_DIR/modules/system/layers/keycloak/org/postgresql/main/module.xml
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

#-----get Java------------
sudo add-apt-repository ppa:openjdk-r/ppa
sudo apt-get update
sudo apt install openjdk-11-jdk

#----declare Keycloak in systemd-------------
cat > /etc/systemd/system/keycloak.service <<EOF

[Unit]
Description=Keycloak
After=network.target

[Service]
Type=idle
User=keycloak
Group=keycloak
ExecStart=/usr/local/bin/keycloak-standalone.sh -Djboss.socket.binding.port-offset=1000 -b=0.0.0.0
TimeoutStartSec=600
TimeoutStopSec=600

[Install]
WantedBy=multi-user.target
EOF

#---run keycloak in systemd------
sudo systemctl daemon-reload
sudo systemctl enable keycloak
sudo systemctl start keycloak
sudo systemctl status keycloak
