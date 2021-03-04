CREATE USER banking WITH LOGIN PASSWORD '1qazZAQ!';
CREATE USER keycloak WITH LOGIN PASSWORD '1qazZAQ!';
CREATE DATABASE bankin; 
CREATE DATABASE keycloakdb;
alter database banking owner to banking;
alter database keycloakdb owner to keycloak;
