Keymico: a resilient multi-cloud stack — or how to spend your holidays in a lockdown
====================================================================================

 

It all started with a tussle between Huawei and a US startup company CNEX in
2018 - and escalated to the US banning the usage of Huawei telecom technology in
2019 to the the UK banning Huawei equipment until September 2021 to the Trump
administration adding another year (until May 2021) to the 2019 Huawei ban
[<https://www.cnet.com/news/huawei-ban-full-timeline-us-sanctions-china-trump-biden-5g-phone-sales/>].
As a consequence, Huawei dropped to the 5th place in the global smartphone
ranking, with the company chairman admitting that 2020 will be “difficult" for
Huawei "as the [US continues to ban devices and
equipment](https://www.cnet.com/news/huawei-ban-full-timeline-us-sanctions-china-trump-biden-5g-phone-sales/) from
the Chinese telecom giant and phone maker".

A little known fact about Huawei: they also operate as a cloud service provider
(CSP). Now imagine that we are a user of their cloud service and these bans
hitting Huawei's telco business are expanding as we speak - how much risk would
we think this will cost your business? Even if Huawei's CSP business is not
banned and left alone (it was not), wouldn't our customers be worried? Would
they not move to a more reliable company - non dependent on Huawei?

 

![<https://techcrunch.com/2020/05/14/trump-adds-another-year-to-huawei-zte-ban/>](README.images/QXQQyb.jpg)

 

Now some would say that their CSP is American and would never abandon them -
well, big tech companies are known to abandon (or threaten to abandon ) a
particular market all the time. Google exited China, Uber exited South East
Asia, both Google and Facebook threaten to pull out of Australia due to a spat
about about paying local news their fair due.

 

How would you mitigate all these risks? Multi-cloud architecture is the answer.
*"Multicloud* architectures, in which multiple services are hosted by different
cloud providers, are the most common deployment"
[<https://www.oreilly.com/library/view/multicloud-architecture-migration/9781492050407/ch01.html>].
**In a multi-cloud architecture, if one CSP is out, you can always seamlessly
fallback to another**. The challenge of multi-cloud architecture is obvious, we
cannot leverage CSP specific cloud technology- as this would tie us to that
specific CSP only. So we have to find a neutral way (open source, third party or
standard) to go about multi-cloud - enter the Keymico stack.

 

In this article, we will introduce the Keymico stack. We will run through a test
environment where the stack is well… stacked up, and we will then test it for
resiliency.

 

 

The Keymico stack
-----------------

### Introduction

Keymico (Keycloak-Minio-CockroahDB) is a cloud neutral open source stack made of
3 software package that allows us to fulfil:

**Relational database function:** CockroachDB

**Object storage function:** Minio

**Identity broker/management function:** Keycloak

![](README.images/y5SSvZ.jpg)

In this article we will introduce this stack. We will look into how to set them
up and how to test their resiliency across multi availability zone (AZ)
deployment.

 

(These 3 functionalities are what I usually use cloud for - definitely it does
not cover every possible use case out there [no A.I. service for example]. Of
course, I am thinking of extension - e.g. Vault to help manage certificates and
security, Kafka for resilient messaging , Consul for networking etc. - so maybe
a Keymico+ stack in the future)

 

### Only for cloud?

The great thing about the Keymico stack is that it doesn’t have to be cloud. If
all you have is a bunch of VMs (and a CDN) you can quickly setup a super
resilient cloud-like infra-structure - even for on premise applications. This is
especially true for people working in sensitive or regulated industry such as
the military, financial services or even health.

 

### Alternative

An alternative to this stack is the full force Open Stack
[<https://www.openstack.org/>]. I, personally, find Open Stack to be very
complete - and maybe that is why it seems a tad overwhelming to setup. Then
again, I would love to see a comparison between Open Stack and Keymico just for
the heck of it :)

 

Archictecture
-------------

In this article we will use a simple banking restful application (called
Keymicobank) that will be distributed to 2 AZs / 3 VMs.

 

![](README.images/bK2Yox.jpg)

-   In this architecture, we will setup Minio, Keycloak and CockroachDB in 3 VMs
    in 2 different AZs. Minio will have a 4th VM in accordance to its minimal
    requirement

-   This is a test setup so we mix everything together in a single VM. In
    reality, you may want to separate your data and identity into different
    layers

-   Both CockhroachDB and Minio are sync across AZs so that data loss is
    minimised

-   We also mounted two disks per setup for Minio to use.

-   Keycloak is not setup as a cluster. Despite that, given that Keycloak’s
    database is highly available, Keycloak access is maintained even in the
    incident of an AZ failure.

-   All Keymico services are secured using self-signed TLS certificates. The
    application's (i.e. Keymico bank’s) services are secured at the Nginx load
    balancer level - also with a self-signed certificate

-   We emulate a CDN using an Nginx load balancer. Of course, in this test
    setup, if the single node load balancer fails then the whole setup fails. In
    reality, we would highly encourage the usage of CDN.

-   The Nginx load balancer is configured to round robin the requests to the
    applications. No session stickiness is expected as we assume data would
    always be sync between the database/object store nodes. In case of failure,
    Nginx will count the error up to maximum threshold, once exceeded, the
    server is considered unavailable and taken offline for an hour before retry.

 

Getting our hands dirty - Environment setup
-------------------------------------------

### What do we need

-   We would need 4 or 5 VMs, if possible internet facing for full effect (the
    VMs can be on a LAN, but, depending on your setup, you might not see the
    effect of multi-AZ failure test we are doing later)

    1.  3 VMs for our application + Keymico stack

    2.  1 VM for NGINX

    3.  Optionally, 1 VM for Jmeter to perform performance test (we can also run
        Jmeter on our laptop if we want)

-   Most of these commands should be the same across the VMs, so a tool like
    Ansible would definitely help. We will stick with plain bash for this
    article

-   Our VMs are Ubuntu based and therefore we will use Ubuntu specific command
    such as apt-get. You may want to find the equivalent command in your
    favourite OS

-   We will name (hostname) our VMs host1, host2 and host3. We will use plain
    old /etc/hosts for this. In reality, you may want to use proper DNS. We will
    put host1 and host3 in the same AZ and host2 in a different AZ all together.
    Please make sure that they can communicate with each other.

-   We will mount 2 disks per node for Minio to use. We name the disks diskN1
    and diskN2 with N designating the host number (e.g. host2 will have disk21
    and disk22). The disks are mounted on /mnt/diskN1 and /mnt/diskN2

-   We will also need SSH access to all hosts.

 

### Users for Host1, Host2 and Host3

Create users (notice the command to create user has a space in front of `sudo`
so that the command is not stored in bash history - you do not want people to
see the password by looking at history. Another - less automatable - option is
to take out `-p` and you will be prompt for a password):

-   cockroach

    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    >  sudo useradd -m -p $(openssl passwd -crypt "<some password>") cockroach -s /bin/bash
    > sudo usermod -aG sudo cockroach
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-   minio

    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    >  sudo useradd -m -p $(openssl passwd -crypt "<some password>") minio -s /bin/bash
    > sudo usermod -aG sudo minio
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-   keycloak

    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    >  sudo useradd -m -p $(openssl passwd -crypt "<some password>") keycloak -s /bin/bash
    > sudo usermod -aG sudo keycloak
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-   azrulhasni (this is my name, you can use yours :) ) - this will be the main
    SSH user

    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    >  sudo useradd -m -p $(openssl passwd -crypt "<some password>") azrulhasni -s /bin/bash
    > sudo usermod -aG sudo azrulhasni
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 

### Users for Host4

-   minio

    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    >  sudo useradd -m -p $(openssl passwd -crypt "<some password>") minio -s /bin/bash
    > sudo usermod -aG sudo minio
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-   azrulhasni - this will be the main SSH user

    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    >  sudo useradd -m -p $(openssl passwd -crypt "<some password>") azrulhasni -s /bin/bash
    > sudo usermod -aG sudo azrulhasni
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 

### User for Host 5

-   azrulhasni - this will be the main SSH user

    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    >  sudo useradd -m -p $(openssl passwd -crypt "<some password>") azrulhasni -s /bin/bash
    > sudo usermod -aG sudo azrulhasni
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 

 

### Directory structure for Host1, Host2 and Host3

-   /opt : This is where we put Keycloak’s, Minio’s and CockroachDB’s binary
    files

-   /mnt/diskN1: Minio mounted disk1. N designates the host number

-   /mnt/diskN2: Minio mounted disk2. N designates the host number

-   /home/azrulhasni: Application binary and main user home directory

-   /home/cockroach: Cockroach user home directory

-   /home/cockroach/certs: Cockroach DB certificates directory

-   /home/cockroach/my-safe-directory: Cockroach DB CA key directory

-   /home/minio: Minio user home directory

-   /home/keycloak: Keycloak user home directory

 

### Directory structure for Host4

-   /opt : This is where we put Minio’s binary files

-   /mnt/diskN1: Minio mounted disk1. N designates the host number

-   /mnt/diskN2: Minio mounted disk2. N designates the host number

-   /home/azrulhasni: Application binary and main user home directory

-   /home/minio: Minio user home directory

 

### Directory structure for Host5

-   /home/azrulhasni: Application binary

 

### Outgoing ports open for all hosts

-   All ports

 

### Incoming ports open for Host1, Host2 and Host3

-   8080: CockroachDB admin portal

-   9000: Minio service port and admin portal

-   9443: Keycloak HTTPS service and admin portal

-   18080: Application service port

-   26257: CockroachDB service port

 

### Incoming ports open for Host4

-   9000: Minio service port and admin portal

 

### Incoming ports open for Host5

-   8443: NGINX HTTPS service port

 

### Environment variables

The list below is the environment variables mainly for Host1.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
export CURRENT_WORKING_DIR=/home/azrulhasni

#-----------COCKROACHDB ENVIRONMENT VARIABLES---------------------
#-----------------------------------------------------------------

#Where to download CockroachDB
export COCKROACH_DOWNLOAD_URL=https://binaries.cockroachdb.com/cockroach-v20.2.5.linux-amd64.tgz
export COCKROACH_UNZIPED_DIR=cockroach-v20.2.5.linux-amd64

#The current host we are setting up
export HOST=host1 

#Other hosts for CockroachDB
export OTHER_HOSTS=host2,host3

#Name of CA cert file we will create for CockroachDB
export CA_CRT=ca.crt

#List of other access end point of Host 1
export NODE_ACCESS_LIST=10.106.0.2 46.101.1.218 host1 ubuntu-s-4vcpu-8gb-lon1-01 localhost 127.0.0.1 #space seperated hostname/ip address used to access host1

#We will create CockroachDB certs for other nodes in Host 1 itself. 
#So specifiy some info on those other nodes 
export OTHER_NODE1=host2
export OTHER_NODE1_CERT_FOLDER=/home/cockroach/certs2 
export OTHER_NODE1_ACCESS_LIST=10.106.0.4 46.101.52.93 host2 ubuntu-s-4vcpu-8gb-lon1-02 localhost 127.0.0.1 #space seperated hostname/ip

export OTHER_NODE2=host3
export OTHER_NODE2_CERT_FOLDER=/home/cockroach/certs3
export OTHER_NODE2_ACCESS_LIST=10.106.0.3 167.172.50.90 host3 ubuntu-s-4vcpu-8gb-lon1-03 localhost 127.0.0.1 #space seperated 


#-----------MINIO ENVIRONMENT VARIABLES---------------------
#-----------------------------------------------------------------

# --- Where to download Minio
export MINIO_DOWNLOAD_URL=https://dl.min.io/server/minio/release/linux-amd64/minio

#We will use the GO script below to generate certs for Minio
export GO_CERT_GENERATOR_URL=https://golang.org/src/crypto/tls/generate_cert.go?m=text

#Minio default users
export MINIO_USERNAME=minio-admin
 export MINIO_PASSWORD=1qazZAQ!

#Specify all minio server - we can use Minio expression language. 
#Spaces must be escaped
export MINIO_SERVERS=https://host1/mnt/data11\ https://host1/mnt/data12\ https://host2/mnt/data21\ https://host2/mnt/data22\ https://host3/mnt/data31\ https://host3/mnt/data32\ https://host4/mnt/data41\ https://host4/mnt/data42 

#Disk name for this host
export DISK1=data11
export DISK2=data12


#-----------KEYCLOAK ENVIRONMENT VARIABLES---------------------
#-----------------------------------------------------------------

#Where to download Keycloak
export KEYCLOAK_URL=https://github.com/keycloak/keycloak/releases/download/12.0.3/keycloak-12.0.3.tar.gz
export KEYCLOAK_UNZIPED_DIR=keycloak-12.0.3

#Postgresql JDBC jar must be provided
export POSTGRESQL_JDBC_JAR=postgresql-42.2.18.jar


export POSTGRESQL_JDBC_URL='jdbc:postgresql:\/\/host1:26257\/keycloakdb' 
#!!!-this url must be escaped - use https://dwaves.de/tools/escape/

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 

 

### CockroachDB setup

-   The instructions below came from CockroachDB
    website[<https://www.cockroachlabs.com/docs/v20.2/install-cockroachdb-linux>].
    You may want to visit the site for your platform specific setup.

-   We opt for the basic production topology
    [<https://www.cockroachlabs.com/docs/v20.2/topology-basic-production.html>]
    where all data is replicated to all nodes. Unfortunately, the VM provider we
    are using doesn’t really have AZ in the region of our choosing - so we opt
    for something out of the region and yet still configure CockroachDB to
    replicate everywhere - this seems to work (possibly because the regions we
    choose (LONDON and FRANKFURT) isn’t all that far from each other) but not
    recommended. In reality, if we are replicating data across region, we want
    to opt for a geo-based topology, e.g.
    [<https://www.cockroachlabs.com/docs/v20.2/topology-geo-partitioned-replicas.html>]

-   Download CockroachDB

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> sudo mkdir /opt/$COCKROACH_UNZIPED_DIR
wget -c $COCKROACH_DOWNLOAD_URL -O - | tar -xzv --strip-components=1 -C /opt/$COCKROACH_UNZIPED_DIR
ln /opt/$COCKROACH_UNZIPED_DIR/cockroach /usr/local/bin/cockroach
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-   Create certificate for Host1

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> sudo mkdir /home/cockroach/certs

> sudo mkdir /home/cockroach/my-safe-directory

> sudo cockroach cert create-ca \
--certs-dir=/home/cockroach/certs \
--ca-key=/home/cockroach/my-safe-directory/ca.key

> sudo cockroach cert create-node \
$NODE_ACCESS_LIST \
--certs-dir=/home/cockroach/certs \
--ca-key=/home/cockroach/my-safe-directory/ca.key

> sudo chown -R cockroach:cockroach /home/cockroach/certs
> sudo chown -R cockroach:cockroach /home/cockroach/my-safe-directory

> sudo chmod 700 /home/cockroach/certs/node.crt
> sudo chmod 700 /home/cockroach/certs/node.key
> sudo chmod 700 /home/cockroach/certs/$CA_CRT
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-   In Host1, we will create CockroachDB certificates for other nodes (Host2 and
    Host3)

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> sudo mkdir $OTHER_NODE1_CERT_FOLDER
> sudo mkdir $OTHER_NODE2_CERT_FOLDER

> sudo cockroach cert create-node \
$OTHER_NODE1_ACCESS_LIST \
--certs-dir=$OTHER_NODE1_CERT_FOLDER \
--ca-key=/home/cockroach/my-safe-directory/ca.key

> sudo mv $OTHER_NODE1_CERT_FOLDER/node.key $OTHER_NODE1_CERT_FOLDER/node.$OTHER_NODE1.key
> sudo mv $OTHER_NODE1_CERT_FOLDER/node.crt $OTHER_NODE1_CERT_FOLDER/node.$OTHER_NODE1.crt

> sudo cockroach cert create-node \
$OTHER_NODE2_ACCESS_LIST \
--certs-dir=$OTHER_NODE2_CERT_FOLDER \
--ca-key=/home/cockroach/my-safe-directory/ca.key
> sudo mv $OTHER_NODE2_CERT_FOLDER/node.key $OTHER_NODE2_CERT_FOLDER/node.$OTHER_NODE2.key
> sudo mv $OTHER_NODE2_CERT_FOLDER/node.crt $OTHER_NODE2_CERT_FOLDER/node.$OTHER_NODE2.crt

> sudo chown -R cockroach:cockroach $OTHER_NODE1_CERT_FOLDER
> sudo chown -R cockroach:cockroach $OTHER_NODE2_CERT_FOLDER
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-   Next, copy the files below to /home/azrulhasni on Host2 and Host3

    1) /home/cockroach/ca.crt

2) /home/cockroach/certs2/node.host2.crt

3) /home/cockroach/certs2/node.host2.crt

4) /home/cockroach/certs3/node.host3.crt

5) /home/cockroach/certs3/node.host3.crt

-   We will then create a configuration file for systemd so that we can start
    and stop CockroachDB easily

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 #--setup systemd
> sudo cat << EOF | tee -a /etc/systemd/system/cockroach.service
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
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-   Complete systemd setup and start the CockroachDB service

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> sudo systemctl daemon-reload
> sudo systemctl enable cockroach
> sudo systemctl start cockroach
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-   To see the status of CockroachDB, run

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> sudo systemctl status cockroach
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-   Since Host1 is the first host, we need to initialize CokcroachDB

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> sudo cockroach init --certs-dir=/home/cockroach/certs --host=$HOST1
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-   Then, create certificates for our banking user and keycloak user

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> sudo cockroach cert create-client \
    banking \
    --certs-dir=/home/cockroach/certs \
    --ca-key=/home/cockroach/my-safe-directory/ca.key
> sudo cockroach cert create-client \
    keycloak \
    --certs-dir=/home/cockroach/certs \
    --ca-key=/home/cockroach/my-safe-directory/ca.key
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-   Copy the certificates created in /home/cockroach/certs to /home/azrulhasni
    Host2 and Host3

 

asa
