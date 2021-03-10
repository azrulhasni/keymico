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

export HOST=host4

export MINIO_DOWNLOAD_URL=https://dl.min.io/server/minio/release/linux-amd64/minio
export MINIO_USERNAME=minio-admin
export MINIO_PASSWORD=1qazZAQ!

export MINIO_SERVERS=https://host{1...4}/mnt/data{1...2}

export DISK1=data1
export DISK2=data2
export DISK1_NAME=/dev/disk/by-id/scsi-0DO_Volume_data4b1 
export DISK2_NAME=/dev/disk/by-id/scsi-0DO_Volume_data4b2 

export MINIO_PUBLIC_CERT=public4.crt
export MINIO_PRIVATE_KEY=private4.key

export OTHER_MINIO_PUBLIC_CERT1=public1.crt
export OTHER_MINIO_PUBLIC_CERT2=public2.crt
export OTHER_MINIO_PUBLIC_CERT3=public3.crt

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

