--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3
-- Dumped by pg_dump version 10.3

-- Started on 2021-02-26 23:36:27 +08

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4029 (class 0 OID 76800)
-- Dependencies: 239
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4058 (class 0 OID 77499)
-- Dependencies: 268
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4032 (class 0 OID 76818)
-- Dependencies: 242
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.authentication_execution VALUES ('c5b979bb-218b-4fdb-b772-a4dcb0365420', NULL, 'auth-cookie', 'master', '853011f8-32a4-4369-836a-f40ff7db3b47', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('5221eb90-01ac-49b3-bcf9-ee6a82c7b741', NULL, 'auth-spnego', 'master', '853011f8-32a4-4369-836a-f40ff7db3b47', 3, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('6121851c-8814-4319-be4d-59bf1f34f0d0', NULL, 'identity-provider-redirector', 'master', '853011f8-32a4-4369-836a-f40ff7db3b47', 2, 25, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('77830699-5b47-44ed-931c-add48aae3c2c', NULL, NULL, 'master', '853011f8-32a4-4369-836a-f40ff7db3b47', 2, 30, true, 'd98ae8ab-0aef-4636-9bdc-770a140bdb34', NULL);
INSERT INTO public.authentication_execution VALUES ('a0cac69a-5933-4b2a-a62b-ba1c68ad8f17', NULL, 'auth-username-password-form', 'master', 'd98ae8ab-0aef-4636-9bdc-770a140bdb34', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('4efeda70-65f6-44e4-89a8-d9e98ef376dd', NULL, NULL, 'master', 'd98ae8ab-0aef-4636-9bdc-770a140bdb34', 1, 20, true, '53394fc0-0c2c-446f-833e-08eebcc9bdef', NULL);
INSERT INTO public.authentication_execution VALUES ('28944f9e-8491-4558-9db9-58ee852197e5', NULL, 'conditional-user-configured', 'master', '53394fc0-0c2c-446f-833e-08eebcc9bdef', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('9e889846-7562-4342-9c4f-11a8d1eafe5f', NULL, 'auth-otp-form', 'master', '53394fc0-0c2c-446f-833e-08eebcc9bdef', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('dcbf1a06-a63e-4aaf-90ee-4b7d415baf0b', NULL, 'direct-grant-validate-username', 'master', '01660409-a7cd-4716-b11f-9539ba4a5761', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('49df8eec-acb3-49dd-80f7-00291b876d38', NULL, 'direct-grant-validate-password', 'master', '01660409-a7cd-4716-b11f-9539ba4a5761', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('704e97a4-fbf8-40ea-90e5-b0fe148e71a8', NULL, NULL, 'master', '01660409-a7cd-4716-b11f-9539ba4a5761', 1, 30, true, 'a0e68d7c-ccc0-4069-ae97-2a2ece5750dc', NULL);
INSERT INTO public.authentication_execution VALUES ('4afad9c0-d557-4930-b08d-59ad143bc697', NULL, 'conditional-user-configured', 'master', 'a0e68d7c-ccc0-4069-ae97-2a2ece5750dc', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('b38dd940-4a9a-42de-8cbb-9c02f2e43a40', NULL, 'direct-grant-validate-otp', 'master', 'a0e68d7c-ccc0-4069-ae97-2a2ece5750dc', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('8b20d10c-34db-47cd-9bf0-2b220f4d2958', NULL, 'registration-page-form', 'master', '42ab8141-4d02-4a56-a8dc-863ffd6a9bcc', 0, 10, true, '51d0fedd-610b-4692-91c3-9ceafd1a74dd', NULL);
INSERT INTO public.authentication_execution VALUES ('4da0d8dd-952d-4deb-9f57-a5ba849e80cb', NULL, 'registration-user-creation', 'master', '51d0fedd-610b-4692-91c3-9ceafd1a74dd', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('d370624b-5d84-4849-bb05-51e2ec193aff', NULL, 'registration-profile-action', 'master', '51d0fedd-610b-4692-91c3-9ceafd1a74dd', 0, 40, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('c0ddce64-d7ae-4e22-b217-0af90c374c99', NULL, 'registration-password-action', 'master', '51d0fedd-610b-4692-91c3-9ceafd1a74dd', 0, 50, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('68a22bd4-38e5-460f-9855-a612f10e3aef', NULL, 'registration-recaptcha-action', 'master', '51d0fedd-610b-4692-91c3-9ceafd1a74dd', 3, 60, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('a4a064e4-3879-4a89-a70f-28ef0c0c9b20', NULL, 'reset-credentials-choose-user', 'master', '5d0746eb-24fd-45bd-8544-8522c432fa91', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('722715db-45bc-4669-b1e6-3825c4a1c918', NULL, 'reset-credential-email', 'master', '5d0746eb-24fd-45bd-8544-8522c432fa91', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('860fbba1-e280-4d53-b116-550fb5aedf48', NULL, 'reset-password', 'master', '5d0746eb-24fd-45bd-8544-8522c432fa91', 0, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('90ca9fe5-cee1-40f2-8e3d-5225f0b8e1aa', NULL, NULL, 'master', '5d0746eb-24fd-45bd-8544-8522c432fa91', 1, 40, true, 'f2f8d53b-a435-4b6a-a391-c0e1fa22dbc2', NULL);
INSERT INTO public.authentication_execution VALUES ('f1c8cd33-5594-4c2b-bfe3-7ef442e19b0c', NULL, 'conditional-user-configured', 'master', 'f2f8d53b-a435-4b6a-a391-c0e1fa22dbc2', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('6b46e255-2876-4089-a371-00f5605791ca', NULL, 'reset-otp', 'master', 'f2f8d53b-a435-4b6a-a391-c0e1fa22dbc2', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('6d73675b-ae86-4746-a13c-013e634eef26', NULL, 'client-secret', 'master', '3d4ce894-9ded-4da6-952c-34cb784e85b7', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('d41221a4-7a5e-4203-837d-722fb7a30c68', NULL, 'client-jwt', 'master', '3d4ce894-9ded-4da6-952c-34cb784e85b7', 2, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('54c85ef7-a318-433f-bdd0-f9a9a1ced759', NULL, 'client-secret-jwt', 'master', '3d4ce894-9ded-4da6-952c-34cb784e85b7', 2, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('6b7564bf-34fe-4ede-a29a-c16ab4567203', NULL, 'client-x509', 'master', '3d4ce894-9ded-4da6-952c-34cb784e85b7', 2, 40, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('e0161ca7-6dcf-4a04-b432-bb7d99b4212c', NULL, 'idp-review-profile', 'master', '777c87d5-b01a-4ed5-8f15-09c55f1e76c1', 0, 10, false, NULL, '0a8ce568-e417-4e22-b6d5-46167b6fae66');
INSERT INTO public.authentication_execution VALUES ('368570b0-2a95-4372-881c-3186b8c73666', NULL, NULL, 'master', '777c87d5-b01a-4ed5-8f15-09c55f1e76c1', 0, 20, true, 'ea6c8fc6-5542-4aa1-ab29-4c7c31a4772f', NULL);
INSERT INTO public.authentication_execution VALUES ('170b0835-6fee-4220-9046-36066aa9a8f4', NULL, 'idp-create-user-if-unique', 'master', 'ea6c8fc6-5542-4aa1-ab29-4c7c31a4772f', 2, 10, false, NULL, '83a2a77e-9799-45ec-8e1d-3157ba31d6df');
INSERT INTO public.authentication_execution VALUES ('5f1bdc12-5f18-455b-b149-8d079387c5dd', NULL, NULL, 'master', 'ea6c8fc6-5542-4aa1-ab29-4c7c31a4772f', 2, 20, true, '7afd0e3d-3da2-490e-99de-274c542761fe', NULL);
INSERT INTO public.authentication_execution VALUES ('d400596e-1ce9-4d09-bd49-50f65c317134', NULL, 'idp-confirm-link', 'master', '7afd0e3d-3da2-490e-99de-274c542761fe', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('10112ea6-5a10-47c6-8e4d-fac152b4c67d', NULL, NULL, 'master', '7afd0e3d-3da2-490e-99de-274c542761fe', 0, 20, true, 'f821f7ac-c3b0-44b4-be96-d5cc7d46626e', NULL);
INSERT INTO public.authentication_execution VALUES ('846af95e-9e65-4bc8-ac39-e1412b575490', NULL, 'idp-email-verification', 'master', 'f821f7ac-c3b0-44b4-be96-d5cc7d46626e', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('e1670e7c-f6f3-4f8b-8e66-65ac280e1d2d', NULL, NULL, 'master', 'f821f7ac-c3b0-44b4-be96-d5cc7d46626e', 2, 20, true, 'a15fbe98-a94a-4d6f-adfb-dc2cb5059d3f', NULL);
INSERT INTO public.authentication_execution VALUES ('d85e174b-f0f7-424c-85ce-457d3c01b955', NULL, 'idp-username-password-form', 'master', 'a15fbe98-a94a-4d6f-adfb-dc2cb5059d3f', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('7d069cce-3733-4099-89d0-07f3109bf835', NULL, NULL, 'master', 'a15fbe98-a94a-4d6f-adfb-dc2cb5059d3f', 1, 20, true, 'dab2436f-5cf6-4394-b546-fc2f87f02913', NULL);
INSERT INTO public.authentication_execution VALUES ('14935511-7ed7-43c6-ac6f-079e8d2872a5', NULL, 'conditional-user-configured', 'master', 'dab2436f-5cf6-4394-b546-fc2f87f02913', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('30b22a9e-730f-4bd4-b57a-21cb72ccac09', NULL, 'auth-otp-form', 'master', 'dab2436f-5cf6-4394-b546-fc2f87f02913', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('b125d585-e456-42a8-9649-bb51a7162d4f', NULL, 'http-basic-authenticator', 'master', '3690453b-a8a5-42f4-b05d-3f225443be78', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('5c28bdf3-80b6-46be-86be-edf8c273df71', NULL, 'docker-http-basic-authenticator', 'master', '1f74e54e-3e1f-4ce7-bb1e-216d312921f4', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('67f9c7ad-7fc0-475d-acef-ddb20d7af9f6', NULL, 'no-cookie-redirect', 'master', 'e9ec0067-5dbd-4f50-a010-d459aab6b9b1', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('a50eb910-1301-4fea-9ac1-18b8407688c2', NULL, NULL, 'master', 'e9ec0067-5dbd-4f50-a010-d459aab6b9b1', 0, 20, true, '3c73d49f-73cc-4ce1-a572-5e10e6b3d12e', NULL);
INSERT INTO public.authentication_execution VALUES ('44e385e9-efa2-4492-905a-b839f5cc776f', NULL, 'basic-auth', 'master', '3c73d49f-73cc-4ce1-a572-5e10e6b3d12e', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('7dabc66d-90c3-4c00-a5e9-6850f9d9d908', NULL, 'basic-auth-otp', 'master', '3c73d49f-73cc-4ce1-a572-5e10e6b3d12e', 3, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('fe4343e8-1094-43bf-97d3-b23088766635', NULL, 'auth-spnego', 'master', '3c73d49f-73cc-4ce1-a572-5e10e6b3d12e', 3, 30, false, NULL, NULL);


--
-- TOC entry 4031 (class 0 OID 76812)
-- Dependencies: 241
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.authentication_flow VALUES ('853011f8-32a4-4369-836a-f40ff7db3b47', 'browser', 'browser based authentication', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('d98ae8ab-0aef-4636-9bdc-770a140bdb34', 'forms', 'Username, password, otp and other auth forms.', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('53394fc0-0c2c-446f-833e-08eebcc9bdef', 'Browser - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('01660409-a7cd-4716-b11f-9539ba4a5761', 'direct grant', 'OpenID Connect Resource Owner Grant', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('a0e68d7c-ccc0-4069-ae97-2a2ece5750dc', 'Direct Grant - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('42ab8141-4d02-4a56-a8dc-863ffd6a9bcc', 'registration', 'registration flow', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('51d0fedd-610b-4692-91c3-9ceafd1a74dd', 'registration form', 'registration form', 'master', 'form-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('5d0746eb-24fd-45bd-8544-8522c432fa91', 'reset credentials', 'Reset credentials for a user if they forgot their password or something', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('f2f8d53b-a435-4b6a-a391-c0e1fa22dbc2', 'Reset - Conditional OTP', 'Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('3d4ce894-9ded-4da6-952c-34cb784e85b7', 'clients', 'Base authentication for clients', 'master', 'client-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('777c87d5-b01a-4ed5-8f15-09c55f1e76c1', 'first broker login', 'Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('ea6c8fc6-5542-4aa1-ab29-4c7c31a4772f', 'User creation or linking', 'Flow for the existing/non-existing user alternatives', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('7afd0e3d-3da2-490e-99de-274c542761fe', 'Handle Existing Account', 'Handle what to do if there is existing account with same email/username like authenticated identity provider', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('f821f7ac-c3b0-44b4-be96-d5cc7d46626e', 'Account verification options', 'Method with which to verity the existing account', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('a15fbe98-a94a-4d6f-adfb-dc2cb5059d3f', 'Verify Existing Account by Re-authentication', 'Reauthentication of existing account', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('dab2436f-5cf6-4394-b546-fc2f87f02913', 'First broker login - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('3690453b-a8a5-42f4-b05d-3f225443be78', 'saml ecp', 'SAML ECP Profile Authentication Flow', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('1f74e54e-3e1f-4ce7-bb1e-216d312921f4', 'docker auth', 'Used by Docker clients to authenticate against the IDP', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('e9ec0067-5dbd-4f50-a010-d459aab6b9b1', 'http challenge', 'An authentication flow based on challenge-response HTTP Authentication Schemes', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('3c73d49f-73cc-4ce1-a572-5e10e6b3d12e', 'Authentication Options', 'Authentication options.', 'master', 'basic-flow', false, true);


--
-- TOC entry 4030 (class 0 OID 76806)
-- Dependencies: 240
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.authenticator_config VALUES ('0a8ce568-e417-4e22-b6d5-46167b6fae66', 'review profile config', 'master');
INSERT INTO public.authenticator_config VALUES ('83a2a77e-9799-45ec-8e1d-3157ba31d6df', 'create unique user config', 'master');


--
-- TOC entry 4033 (class 0 OID 76823)
-- Dependencies: 243
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.authenticator_config_entry VALUES ('0a8ce568-e417-4e22-b6d5-46167b6fae66', 'missing', 'update.profile.on.first.login');
INSERT INTO public.authenticator_config_entry VALUES ('83a2a77e-9799-45ec-8e1d-3157ba31d6df', 'false', 'require.password.update.after.registration');


--
-- TOC entry 4059 (class 0 OID 77514)
-- Dependencies: 269
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 3989 (class 0 OID 76107)
-- Dependencies: 199
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.client VALUES ('e0b2ad66-23ea-4d02-ad42-4a1d13ab8b5c', true, true, 'master-realm', 0, false, '95a18282-bc7b-40b4-a96e-e1e15f5fdd2c', NULL, true, NULL, false, 'master', NULL, 0, false, false, 'master Realm', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('1e6aae43-8e35-4bb4-9739-ffbf339d93c1', true, false, 'account', 0, false, 'd7eb02b6-b85e-4768-8759-5583d29432d5', '/realms/master/account/', false, NULL, false, 'master', 'openid-connect', 0, false, false, '${client_account}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('232eccda-02c3-4f38-8e98-1b3a3ee16167', true, false, 'account-console', 0, true, 'fb724bbf-4b09-432f-b00f-3b2c54a2977f', '/realms/master/account/', false, NULL, false, 'master', 'openid-connect', 0, false, false, '${client_account-console}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('80adc3d0-e97d-4f9b-b951-717dc57950db', true, false, 'broker', 0, false, '1923ba51-8867-419a-b38d-9028fe8194fb', NULL, false, NULL, false, 'master', 'openid-connect', 0, false, false, '${client_broker}', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('e84d5ad3-7309-45fa-be43-b548ba098044', true, false, 'security-admin-console', 0, true, '429ed97d-ae3e-4364-b291-0371c3894f6e', '/admin/master/console/', false, NULL, false, 'master', 'openid-connect', 0, false, false, '${client_security-admin-console}', false, 'client-secret', '${authAdminUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('c9a6d0f1-dd3c-44b7-adcf-3cf0d1fc0c0b', true, false, 'admin-cli', 0, true, 'e7401087-5e93-46f7-b650-db32d3ab9312', NULL, false, NULL, false, 'master', 'openid-connect', 0, false, false, '${client_admin-cli}', false, 'client-secret', NULL, NULL, NULL, false, false, true, false);


--
-- TOC entry 4013 (class 0 OID 76481)
-- Dependencies: 223
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.client_attributes VALUES ('232eccda-02c3-4f38-8e98-1b3a3ee16167', 'S256', 'pkce.code.challenge.method');
INSERT INTO public.client_attributes VALUES ('e84d5ad3-7309-45fa-be43-b548ba098044', 'S256', 'pkce.code.challenge.method');


--
-- TOC entry 4070 (class 0 OID 77816)
-- Dependencies: 280
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 3988 (class 0 OID 76104)
-- Dependencies: 198
-- Data for Name: client_default_roles; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.client_default_roles VALUES ('1e6aae43-8e35-4bb4-9739-ffbf339d93c1', 'd4d5d1e1-0ffa-4e9d-a9c3-ee1257602de9');
INSERT INTO public.client_default_roles VALUES ('1e6aae43-8e35-4bb4-9739-ffbf339d93c1', 'f3e0b206-c45d-45ce-8d14-d043d86d45d0');


--
-- TOC entry 4069 (class 0 OID 77672)
-- Dependencies: 279
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4015 (class 0 OID 76493)
-- Dependencies: 225
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4047 (class 0 OID 77273)
-- Dependencies: 257
-- Data for Name: client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.client_scope VALUES ('107f5a70-5651-40dd-8442-3436f97f2d0c', 'offline_access', 'master', 'OpenID Connect built-in scope: offline_access', 'openid-connect');
INSERT INTO public.client_scope VALUES ('5372997e-0ce5-4e11-bdd7-91aaf21cc167', 'role_list', 'master', 'SAML role list', 'saml');
INSERT INTO public.client_scope VALUES ('8ccdd1a5-425a-4155-b607-c6661b94e50c', 'profile', 'master', 'OpenID Connect built-in scope: profile', 'openid-connect');
INSERT INTO public.client_scope VALUES ('6e0bc4f6-b570-49b8-acd9-02cd6c853638', 'email', 'master', 'OpenID Connect built-in scope: email', 'openid-connect');
INSERT INTO public.client_scope VALUES ('a6cec969-2bed-407c-ae1e-4969b144b5ee', 'address', 'master', 'OpenID Connect built-in scope: address', 'openid-connect');
INSERT INTO public.client_scope VALUES ('92fb713f-4bae-4b2a-a145-9c31b8488486', 'phone', 'master', 'OpenID Connect built-in scope: phone', 'openid-connect');
INSERT INTO public.client_scope VALUES ('58e0f1c3-4300-4b61-af60-f3743c043c02', 'roles', 'master', 'OpenID Connect scope for add user roles to the access token', 'openid-connect');
INSERT INTO public.client_scope VALUES ('aee3504e-7537-4121-a25c-466d4d279bf6', 'web-origins', 'master', 'OpenID Connect scope for add allowed web origins to the access token', 'openid-connect');
INSERT INTO public.client_scope VALUES ('093ceff4-011f-4a3a-8eee-af70eb3c8a43', 'microprofile-jwt', 'master', 'Microprofile - JWT built-in scope', 'openid-connect');


--
-- TOC entry 4048 (class 0 OID 77288)
-- Dependencies: 258
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.client_scope_attributes VALUES ('107f5a70-5651-40dd-8442-3436f97f2d0c', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('107f5a70-5651-40dd-8442-3436f97f2d0c', '${offlineAccessScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('5372997e-0ce5-4e11-bdd7-91aaf21cc167', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('5372997e-0ce5-4e11-bdd7-91aaf21cc167', '${samlRoleListScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('8ccdd1a5-425a-4155-b607-c6661b94e50c', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('8ccdd1a5-425a-4155-b607-c6661b94e50c', '${profileScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('8ccdd1a5-425a-4155-b607-c6661b94e50c', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('6e0bc4f6-b570-49b8-acd9-02cd6c853638', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('6e0bc4f6-b570-49b8-acd9-02cd6c853638', '${emailScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('6e0bc4f6-b570-49b8-acd9-02cd6c853638', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('a6cec969-2bed-407c-ae1e-4969b144b5ee', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('a6cec969-2bed-407c-ae1e-4969b144b5ee', '${addressScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('a6cec969-2bed-407c-ae1e-4969b144b5ee', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('92fb713f-4bae-4b2a-a145-9c31b8488486', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('92fb713f-4bae-4b2a-a145-9c31b8488486', '${phoneScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('92fb713f-4bae-4b2a-a145-9c31b8488486', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('58e0f1c3-4300-4b61-af60-f3743c043c02', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('58e0f1c3-4300-4b61-af60-f3743c043c02', '${rolesScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('58e0f1c3-4300-4b61-af60-f3743c043c02', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('aee3504e-7537-4121-a25c-466d4d279bf6', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('aee3504e-7537-4121-a25c-466d4d279bf6', '', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('aee3504e-7537-4121-a25c-466d4d279bf6', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('093ceff4-011f-4a3a-8eee-af70eb3c8a43', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('093ceff4-011f-4a3a-8eee-af70eb3c8a43', 'true', 'include.in.token.scope');


--
-- TOC entry 4071 (class 0 OID 77874)
-- Dependencies: 281
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.client_scope_client VALUES ('1e6aae43-8e35-4bb4-9739-ffbf339d93c1', '5372997e-0ce5-4e11-bdd7-91aaf21cc167', true);
INSERT INTO public.client_scope_client VALUES ('232eccda-02c3-4f38-8e98-1b3a3ee16167', '5372997e-0ce5-4e11-bdd7-91aaf21cc167', true);
INSERT INTO public.client_scope_client VALUES ('c9a6d0f1-dd3c-44b7-adcf-3cf0d1fc0c0b', '5372997e-0ce5-4e11-bdd7-91aaf21cc167', true);
INSERT INTO public.client_scope_client VALUES ('80adc3d0-e97d-4f9b-b951-717dc57950db', '5372997e-0ce5-4e11-bdd7-91aaf21cc167', true);
INSERT INTO public.client_scope_client VALUES ('e0b2ad66-23ea-4d02-ad42-4a1d13ab8b5c', '5372997e-0ce5-4e11-bdd7-91aaf21cc167', true);
INSERT INTO public.client_scope_client VALUES ('e84d5ad3-7309-45fa-be43-b548ba098044', '5372997e-0ce5-4e11-bdd7-91aaf21cc167', true);
INSERT INTO public.client_scope_client VALUES ('1e6aae43-8e35-4bb4-9739-ffbf339d93c1', '8ccdd1a5-425a-4155-b607-c6661b94e50c', true);
INSERT INTO public.client_scope_client VALUES ('1e6aae43-8e35-4bb4-9739-ffbf339d93c1', '6e0bc4f6-b570-49b8-acd9-02cd6c853638', true);
INSERT INTO public.client_scope_client VALUES ('1e6aae43-8e35-4bb4-9739-ffbf339d93c1', '58e0f1c3-4300-4b61-af60-f3743c043c02', true);
INSERT INTO public.client_scope_client VALUES ('1e6aae43-8e35-4bb4-9739-ffbf339d93c1', 'aee3504e-7537-4121-a25c-466d4d279bf6', true);
INSERT INTO public.client_scope_client VALUES ('1e6aae43-8e35-4bb4-9739-ffbf339d93c1', 'a6cec969-2bed-407c-ae1e-4969b144b5ee', false);
INSERT INTO public.client_scope_client VALUES ('1e6aae43-8e35-4bb4-9739-ffbf339d93c1', '093ceff4-011f-4a3a-8eee-af70eb3c8a43', false);
INSERT INTO public.client_scope_client VALUES ('1e6aae43-8e35-4bb4-9739-ffbf339d93c1', '92fb713f-4bae-4b2a-a145-9c31b8488486', false);
INSERT INTO public.client_scope_client VALUES ('1e6aae43-8e35-4bb4-9739-ffbf339d93c1', '107f5a70-5651-40dd-8442-3436f97f2d0c', false);
INSERT INTO public.client_scope_client VALUES ('232eccda-02c3-4f38-8e98-1b3a3ee16167', '8ccdd1a5-425a-4155-b607-c6661b94e50c', true);
INSERT INTO public.client_scope_client VALUES ('232eccda-02c3-4f38-8e98-1b3a3ee16167', '6e0bc4f6-b570-49b8-acd9-02cd6c853638', true);
INSERT INTO public.client_scope_client VALUES ('232eccda-02c3-4f38-8e98-1b3a3ee16167', '58e0f1c3-4300-4b61-af60-f3743c043c02', true);
INSERT INTO public.client_scope_client VALUES ('232eccda-02c3-4f38-8e98-1b3a3ee16167', 'aee3504e-7537-4121-a25c-466d4d279bf6', true);
INSERT INTO public.client_scope_client VALUES ('232eccda-02c3-4f38-8e98-1b3a3ee16167', 'a6cec969-2bed-407c-ae1e-4969b144b5ee', false);
INSERT INTO public.client_scope_client VALUES ('232eccda-02c3-4f38-8e98-1b3a3ee16167', '093ceff4-011f-4a3a-8eee-af70eb3c8a43', false);
INSERT INTO public.client_scope_client VALUES ('232eccda-02c3-4f38-8e98-1b3a3ee16167', '92fb713f-4bae-4b2a-a145-9c31b8488486', false);
INSERT INTO public.client_scope_client VALUES ('232eccda-02c3-4f38-8e98-1b3a3ee16167', '107f5a70-5651-40dd-8442-3436f97f2d0c', false);
INSERT INTO public.client_scope_client VALUES ('c9a6d0f1-dd3c-44b7-adcf-3cf0d1fc0c0b', '8ccdd1a5-425a-4155-b607-c6661b94e50c', true);
INSERT INTO public.client_scope_client VALUES ('c9a6d0f1-dd3c-44b7-adcf-3cf0d1fc0c0b', '6e0bc4f6-b570-49b8-acd9-02cd6c853638', true);
INSERT INTO public.client_scope_client VALUES ('c9a6d0f1-dd3c-44b7-adcf-3cf0d1fc0c0b', '58e0f1c3-4300-4b61-af60-f3743c043c02', true);
INSERT INTO public.client_scope_client VALUES ('c9a6d0f1-dd3c-44b7-adcf-3cf0d1fc0c0b', 'aee3504e-7537-4121-a25c-466d4d279bf6', true);
INSERT INTO public.client_scope_client VALUES ('c9a6d0f1-dd3c-44b7-adcf-3cf0d1fc0c0b', 'a6cec969-2bed-407c-ae1e-4969b144b5ee', false);
INSERT INTO public.client_scope_client VALUES ('c9a6d0f1-dd3c-44b7-adcf-3cf0d1fc0c0b', '093ceff4-011f-4a3a-8eee-af70eb3c8a43', false);
INSERT INTO public.client_scope_client VALUES ('c9a6d0f1-dd3c-44b7-adcf-3cf0d1fc0c0b', '92fb713f-4bae-4b2a-a145-9c31b8488486', false);
INSERT INTO public.client_scope_client VALUES ('c9a6d0f1-dd3c-44b7-adcf-3cf0d1fc0c0b', '107f5a70-5651-40dd-8442-3436f97f2d0c', false);
INSERT INTO public.client_scope_client VALUES ('80adc3d0-e97d-4f9b-b951-717dc57950db', '8ccdd1a5-425a-4155-b607-c6661b94e50c', true);
INSERT INTO public.client_scope_client VALUES ('80adc3d0-e97d-4f9b-b951-717dc57950db', '6e0bc4f6-b570-49b8-acd9-02cd6c853638', true);
INSERT INTO public.client_scope_client VALUES ('80adc3d0-e97d-4f9b-b951-717dc57950db', '58e0f1c3-4300-4b61-af60-f3743c043c02', true);
INSERT INTO public.client_scope_client VALUES ('80adc3d0-e97d-4f9b-b951-717dc57950db', 'aee3504e-7537-4121-a25c-466d4d279bf6', true);
INSERT INTO public.client_scope_client VALUES ('80adc3d0-e97d-4f9b-b951-717dc57950db', 'a6cec969-2bed-407c-ae1e-4969b144b5ee', false);
INSERT INTO public.client_scope_client VALUES ('80adc3d0-e97d-4f9b-b951-717dc57950db', '093ceff4-011f-4a3a-8eee-af70eb3c8a43', false);
INSERT INTO public.client_scope_client VALUES ('80adc3d0-e97d-4f9b-b951-717dc57950db', '92fb713f-4bae-4b2a-a145-9c31b8488486', false);
INSERT INTO public.client_scope_client VALUES ('80adc3d0-e97d-4f9b-b951-717dc57950db', '107f5a70-5651-40dd-8442-3436f97f2d0c', false);
INSERT INTO public.client_scope_client VALUES ('e0b2ad66-23ea-4d02-ad42-4a1d13ab8b5c', '8ccdd1a5-425a-4155-b607-c6661b94e50c', true);
INSERT INTO public.client_scope_client VALUES ('e0b2ad66-23ea-4d02-ad42-4a1d13ab8b5c', '6e0bc4f6-b570-49b8-acd9-02cd6c853638', true);
INSERT INTO public.client_scope_client VALUES ('e0b2ad66-23ea-4d02-ad42-4a1d13ab8b5c', '58e0f1c3-4300-4b61-af60-f3743c043c02', true);
INSERT INTO public.client_scope_client VALUES ('e0b2ad66-23ea-4d02-ad42-4a1d13ab8b5c', 'aee3504e-7537-4121-a25c-466d4d279bf6', true);
INSERT INTO public.client_scope_client VALUES ('e0b2ad66-23ea-4d02-ad42-4a1d13ab8b5c', 'a6cec969-2bed-407c-ae1e-4969b144b5ee', false);
INSERT INTO public.client_scope_client VALUES ('e0b2ad66-23ea-4d02-ad42-4a1d13ab8b5c', '093ceff4-011f-4a3a-8eee-af70eb3c8a43', false);
INSERT INTO public.client_scope_client VALUES ('e0b2ad66-23ea-4d02-ad42-4a1d13ab8b5c', '92fb713f-4bae-4b2a-a145-9c31b8488486', false);
INSERT INTO public.client_scope_client VALUES ('e0b2ad66-23ea-4d02-ad42-4a1d13ab8b5c', '107f5a70-5651-40dd-8442-3436f97f2d0c', false);
INSERT INTO public.client_scope_client VALUES ('e84d5ad3-7309-45fa-be43-b548ba098044', '8ccdd1a5-425a-4155-b607-c6661b94e50c', true);
INSERT INTO public.client_scope_client VALUES ('e84d5ad3-7309-45fa-be43-b548ba098044', '6e0bc4f6-b570-49b8-acd9-02cd6c853638', true);
INSERT INTO public.client_scope_client VALUES ('e84d5ad3-7309-45fa-be43-b548ba098044', '58e0f1c3-4300-4b61-af60-f3743c043c02', true);
INSERT INTO public.client_scope_client VALUES ('e84d5ad3-7309-45fa-be43-b548ba098044', 'aee3504e-7537-4121-a25c-466d4d279bf6', true);
INSERT INTO public.client_scope_client VALUES ('e84d5ad3-7309-45fa-be43-b548ba098044', 'a6cec969-2bed-407c-ae1e-4969b144b5ee', false);
INSERT INTO public.client_scope_client VALUES ('e84d5ad3-7309-45fa-be43-b548ba098044', '093ceff4-011f-4a3a-8eee-af70eb3c8a43', false);
INSERT INTO public.client_scope_client VALUES ('e84d5ad3-7309-45fa-be43-b548ba098044', '92fb713f-4bae-4b2a-a145-9c31b8488486', false);
INSERT INTO public.client_scope_client VALUES ('e84d5ad3-7309-45fa-be43-b548ba098044', '107f5a70-5651-40dd-8442-3436f97f2d0c', false);


--
-- TOC entry 4049 (class 0 OID 77294)
-- Dependencies: 259
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.client_scope_role_mapping VALUES ('107f5a70-5651-40dd-8442-3436f97f2d0c', '099c9f17-3b4f-4db9-bb75-f32660f2b283');


--
-- TOC entry 3990 (class 0 OID 76119)
-- Dependencies: 200
-- Data for Name: client_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4036 (class 0 OID 76868)
-- Dependencies: 246
-- Data for Name: client_session_auth_status; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4014 (class 0 OID 76487)
-- Dependencies: 224
-- Data for Name: client_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4028 (class 0 OID 76706)
-- Dependencies: 238
-- Data for Name: client_session_prot_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 3991 (class 0 OID 76125)
-- Dependencies: 201
-- Data for Name: client_session_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4037 (class 0 OID 77005)
-- Dependencies: 247
-- Data for Name: client_user_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4067 (class 0 OID 77564)
-- Dependencies: 277
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.component VALUES ('f77e98e9-1ed4-4433-9245-b474d57fd899', 'Trusted Hosts', 'master', 'trusted-hosts', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO public.component VALUES ('6613109b-afb7-49ad-b191-d0ef17ab0c22', 'Consent Required', 'master', 'consent-required', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO public.component VALUES ('8f64b59e-c94b-44ea-9793-298a27b98a24', 'Full Scope Disabled', 'master', 'scope', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO public.component VALUES ('6daf7b5a-105d-4046-9064-923ba52c9023', 'Max Clients Limit', 'master', 'max-clients', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO public.component VALUES ('24b12bff-6a4c-46a1-8e8d-af8379bd3e9c', 'Allowed Protocol Mapper Types', 'master', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO public.component VALUES ('7b8ab5bf-05bc-46b7-b402-0f93b79c31c9', 'Allowed Client Scopes', 'master', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO public.component VALUES ('3909c702-071f-455b-9bdf-decb20bf51f7', 'Allowed Protocol Mapper Types', 'master', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'authenticated');
INSERT INTO public.component VALUES ('0ed2ed01-3559-4584-ae28-9b7db6b7907a', 'Allowed Client Scopes', 'master', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'authenticated');
INSERT INTO public.component VALUES ('9bc494fe-f9f5-49cb-b3d1-4e7736251374', 'fallback-HS256', 'master', 'hmac-generated', 'org.keycloak.keys.KeyProvider', 'master', NULL);
INSERT INTO public.component VALUES ('b9b7bebf-2db3-4a12-8b81-394be72165b5', 'fallback-RS256', 'master', 'rsa-generated', 'org.keycloak.keys.KeyProvider', 'master', NULL);


--
-- TOC entry 4066 (class 0 OID 77558)
-- Dependencies: 276
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.component_config VALUES ('a2d62f94-dc20-431a-a061-7a3a30f5c21e', '6daf7b5a-105d-4046-9064-923ba52c9023', 'max-clients', '200');
INSERT INTO public.component_config VALUES ('7597dba6-c841-4963-a193-ef8d8273320e', '7b8ab5bf-05bc-46b7-b402-0f93b79c31c9', 'allow-default-scopes', 'true');
INSERT INTO public.component_config VALUES ('f8bc2b82-57a3-4289-a446-1869a052d6bd', '0ed2ed01-3559-4584-ae28-9b7db6b7907a', 'allow-default-scopes', 'true');
INSERT INTO public.component_config VALUES ('c682ffed-e4c1-4c74-816a-951ffbd59e77', '24b12bff-6a4c-46a1-8e8d-af8379bd3e9c', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO public.component_config VALUES ('42c7f138-2473-4436-a6b4-35375a8d6272', '24b12bff-6a4c-46a1-8e8d-af8379bd3e9c', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO public.component_config VALUES ('415abfb1-cb7e-4113-b216-070ac603f36b', '24b12bff-6a4c-46a1-8e8d-af8379bd3e9c', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO public.component_config VALUES ('a9ddc461-75b0-449e-b04e-429058a54aff', '24b12bff-6a4c-46a1-8e8d-af8379bd3e9c', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO public.component_config VALUES ('521a4f2d-3f7b-4eb2-8714-d4118dfcecc5', '24b12bff-6a4c-46a1-8e8d-af8379bd3e9c', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');
INSERT INTO public.component_config VALUES ('9663738e-abd8-4c64-a8ae-57a208dbca2d', '24b12bff-6a4c-46a1-8e8d-af8379bd3e9c', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO public.component_config VALUES ('15920b18-10de-47ed-8ede-988ea862b7bc', '24b12bff-6a4c-46a1-8e8d-af8379bd3e9c', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');
INSERT INTO public.component_config VALUES ('c87fbe4b-19c6-4022-b28b-8290b3d08115', '24b12bff-6a4c-46a1-8e8d-af8379bd3e9c', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO public.component_config VALUES ('447d7d54-7dd5-434e-847d-86a2ab74c3a5', '3909c702-071f-455b-9bdf-decb20bf51f7', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO public.component_config VALUES ('fdafd221-a0f4-4bc9-9dcd-75a95bdb5e9a', '3909c702-071f-455b-9bdf-decb20bf51f7', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');
INSERT INTO public.component_config VALUES ('44ff32d6-f3bf-41cc-8b18-d5493a5b7c12', '3909c702-071f-455b-9bdf-decb20bf51f7', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO public.component_config VALUES ('2a359376-1421-480b-8037-b92c1a58a44d', '3909c702-071f-455b-9bdf-decb20bf51f7', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO public.component_config VALUES ('ad530880-209e-4325-bad8-0c5d30ed384a', '3909c702-071f-455b-9bdf-decb20bf51f7', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO public.component_config VALUES ('3218ae63-fafd-4832-8a10-bc45c1aadb1a', '3909c702-071f-455b-9bdf-decb20bf51f7', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO public.component_config VALUES ('d5937c1f-e880-4b20-ac7f-ec4457885e5a', '3909c702-071f-455b-9bdf-decb20bf51f7', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO public.component_config VALUES ('f447b939-07dd-4e78-83ab-698dbfa1821a', '3909c702-071f-455b-9bdf-decb20bf51f7', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');
INSERT INTO public.component_config VALUES ('473e8b29-c36b-481c-9857-c903e90e861e', 'f77e98e9-1ed4-4433-9245-b474d57fd899', 'client-uris-must-match', 'true');
INSERT INTO public.component_config VALUES ('f838d569-44a3-4a50-b67d-0c5bab9ef1aa', 'f77e98e9-1ed4-4433-9245-b474d57fd899', 'host-sending-registration-request-must-match', 'true');
INSERT INTO public.component_config VALUES ('fab7f187-06c0-4fea-a42d-b3a6b622f743', '9bc494fe-f9f5-49cb-b3d1-4e7736251374', 'secret', 'J5YGH_hnMOP9sXWQ057t2yVRHcacOQrNBANr-6QqPHZF4kLHnKQ19J3SWIly7XtnP5Qb4Gi_1wvpb7uUhrKObA');
INSERT INTO public.component_config VALUES ('bc3a9350-de1d-400b-abd1-03f87e2cf23e', '9bc494fe-f9f5-49cb-b3d1-4e7736251374', 'kid', 'b62586de-9127-48c3-adf1-24339d2a1ebe');
INSERT INTO public.component_config VALUES ('99a87135-10b2-463a-afb8-bd0b1a9d74b7', '9bc494fe-f9f5-49cb-b3d1-4e7736251374', 'algorithm', 'HS256');
INSERT INTO public.component_config VALUES ('2a668e31-c1b1-47b1-bdde-951845af82cc', '9bc494fe-f9f5-49cb-b3d1-4e7736251374', 'priority', '-100');
INSERT INTO public.component_config VALUES ('4ce54536-c886-4333-aca7-e9c62a3fa4a6', 'b9b7bebf-2db3-4a12-8b81-394be72165b5', 'algorithm', 'RS256');
INSERT INTO public.component_config VALUES ('cb0c94c0-d90c-4c79-874a-1c4944fc6761', 'b9b7bebf-2db3-4a12-8b81-394be72165b5', 'priority', '-100');
INSERT INTO public.component_config VALUES ('721adc1b-a9cb-45aa-b6ef-d2d17283e8ff', 'b9b7bebf-2db3-4a12-8b81-394be72165b5', 'privateKey', 'MIIEpAIBAAKCAQEAmsob70zMYI63l87V22J6zs70ArJI/svbrKnzQQtLM3lOihaetiNjt9/y1Gl7LoQzwbu59CsG/uZesRXemeYFQsmYbVOYiJ14YVxb2EFIWhGC+X27L1vvweytk4sVjnwfyf/PW5nqNtQ1nln9ql8vnBqnbwm3eKA9GfUL3GFVWv75o6nf9Ftc8xqD4NXu4jqAERQn+WVjfpazs0OPr+5+VQSJLnaE1dn/rO/WOXcwklBDdlzRyWKQl9RSpu5i5MlyBVpYbaKaF9F6DpOi/ER5FuHsu18gOBOg6zFUZy8nveJ85Ouh9wWKE2J/+eHZHUeYvwDevlpo1Oh054HHHQwxSQIDAQABAoIBAQCRxtBCMWi1cxNSxDfCMmAITv2dYHzAggsz9KakVlePdapTAHSegnvSWvYdt+2L5HO9++doHfGrtBfv3PHUrL29pZCJPdaEqxEJWGsjInBaau2XvCLCumn1j8n1D2LQ2vMxUVrfIPhkhLyukoAEqTp0YOHZACSrVPXWcWKnPX+eftPLqZxNgSP1mO3VczKEeoYHnvg7LYJnUqE1yF92iw0WKifCn9CxsK8KejSAagVL8MM6y7IsWapGz3JKU++/PjnURZM9glcktfvbDmZB6CMDTldg1WY5A1nrKnA6cofcjS+v02njMHwUrUxqzDXlKv5c2erSoklyMZ45fiDltP9RAoGBAOBIM0u/yT0XlvFA0Fh58d0gFfU/HtWg3W7hxCcogr+mlSsTH0zrnKmRb0LQRNuOiy9v4k4/rBVRWRzH6aOPyb9Jj5+Lt9HE2Ah3hRiVdWYHHopB7feisTZ+skLpDNS3OEll/55p/DBHqz/MU1l7pRpmLomXZzEIsOhpMUlB4+rlAoGBALCuCKtUCqvSlZ0K4xl9BaUaCu+0UyG4QeZpMXFq+D3HQxubkYmxazHEz2pTTpqfHQAaAqhvh3GuAkrONxzQ8+5M/AckEPrnsqTyWcdPK2X8EYhhJD9fmD+7y3FARa2R5hBaMIOneO9k7AAuyCDAUeKPYzaJJGapGjGd7kwkePKVAoGASYiCgPBlW0lTrM+SP5/jo5s0d871Hhd64jLVK/2FOK62M4Q2e/K3z4SmVOKR4OZQTgJB0WPg2LBuJhiJSp4HCFdm5mlZoEYIimYdVh0Se5wT8EKDcfB+Z56MdZGRKmDT7ISrlVWsYGvvAqDMJwd57zjXQzdHlvUBg4GRrjITNt0CgYANG3wtKbj48lCDLBGZDHtkuj/hdKFOORs6esdeQK9V9fh2jd4INw9ay90PaErGkdNW9JcJ4+xKdLxazF2uV5ohLbjs1rIjyxinwAsFDEyN7ltmoL5NrUvgPpBjQH9q1w4YXHiI692+9N/FS7MxKtNoWXbkztvSee0ljS/mmjYW2QKBgQCPy2xqNNaWhlnRPgszA+Tkr+tmcHqGQx/sZnL5WiAoKBFmnuu2VqbdAh/yY7qp/QwALUXeL59Nlt1JkjsTJmwQL5Xjccn7cMirg6fRY/KD9f2CjBkwk6ZY1SVGrukcSi/nN0puvm6hxwAkC0DWadgK1N5PkfsTU4gSg30Ezh0s5g==');
INSERT INTO public.component_config VALUES ('efe6c6f4-cc83-4c37-9690-e176b4a32eec', 'b9b7bebf-2db3-4a12-8b81-394be72165b5', 'certificate', 'MIICmzCCAYMCBgF33vUTLDANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjEwMjI2MTUyNzE5WhcNMzEwMjI2MTUyODU5WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCayhvvTMxgjreXztXbYnrOzvQCskj+y9usqfNBC0szeU6KFp62I2O33/LUaXsuhDPBu7n0Kwb+5l6xFd6Z5gVCyZhtU5iInXhhXFvYQUhaEYL5fbsvW+/B7K2TixWOfB/J/89bmeo21DWeWf2qXy+cGqdvCbd4oD0Z9QvcYVVa/vmjqd/0W1zzGoPg1e7iOoARFCf5ZWN+lrOzQ4+v7n5VBIkudoTV2f+s79Y5dzCSUEN2XNHJYpCX1FKm7mLkyXIFWlhtopoX0XoOk6L8RHkW4ey7XyA4E6DrMVRnLye94nzk66H3BYoTYn/54dkdR5i/AN6+WmjU6HTngccdDDFJAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAClC0xoqP/+7o/JbxP80nqjmyY67PoWhoJZqlnQNILkavTYHKIcH8QqU4uyLopBk5k33IasgvLWfbPUZjIW505NRIuun/sDx3TtUNP/Z1Q/IGMwBvA+0c6TVOdn1DIyhTJtLu7ZdVuKmoW+Q0bMPhH9jc9IewIeM7ZYHwJeigKM8YSmPQF2xC4YzmrvRaudAQDm4GY7jitPX17ZyRqtHBoCDlyAGyIRS0tvUF/sXBRcIzvdjNiOovy1k5Bv2lHTZPv4j+Tch+ziDB9qYBv70T8ybnrqdWlzhGCFISuMrKQ491HMgQ7fQHiKXBbcVd7CRo5662nG7bZRHsveFeNyGmDE=');


--
-- TOC entry 3992 (class 0 OID 76128)
-- Dependencies: 202
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.composite_role VALUES ('da22adfe-61c9-48e8-a18a-4f10d34283a2', 'c16d8df6-e4bf-433e-9ef3-72882cf99523');
INSERT INTO public.composite_role VALUES ('da22adfe-61c9-48e8-a18a-4f10d34283a2', '4274d7c7-9233-4c22-847e-26f3cc2b5ac1');
INSERT INTO public.composite_role VALUES ('da22adfe-61c9-48e8-a18a-4f10d34283a2', '4b8c9475-2e83-449c-bbae-7b24d5431ad4');
INSERT INTO public.composite_role VALUES ('da22adfe-61c9-48e8-a18a-4f10d34283a2', 'a9434baf-7055-4636-b76f-3f1bb3ad17f9');
INSERT INTO public.composite_role VALUES ('da22adfe-61c9-48e8-a18a-4f10d34283a2', 'f832749c-5217-4c05-921d-36c9c758e4c6');
INSERT INTO public.composite_role VALUES ('da22adfe-61c9-48e8-a18a-4f10d34283a2', '6b87bde0-e5fb-4774-a15d-4ffc738e55a5');
INSERT INTO public.composite_role VALUES ('da22adfe-61c9-48e8-a18a-4f10d34283a2', 'c44674be-31ba-4914-8c5e-78fd2f2e87d0');
INSERT INTO public.composite_role VALUES ('da22adfe-61c9-48e8-a18a-4f10d34283a2', 'acc7ec79-c512-4b7e-85ec-3af00a3e42c6');
INSERT INTO public.composite_role VALUES ('da22adfe-61c9-48e8-a18a-4f10d34283a2', '06ef3d63-aa61-4b54-8d7f-5d14fa7523e1');
INSERT INTO public.composite_role VALUES ('da22adfe-61c9-48e8-a18a-4f10d34283a2', '5f455db1-5de4-4e78-8d58-adbcc346b617');
INSERT INTO public.composite_role VALUES ('da22adfe-61c9-48e8-a18a-4f10d34283a2', '34baa524-ff1b-428d-91b2-cb6d251dbf95');
INSERT INTO public.composite_role VALUES ('da22adfe-61c9-48e8-a18a-4f10d34283a2', '976dfb45-c791-42d3-a170-1d7f84e40285');
INSERT INTO public.composite_role VALUES ('da22adfe-61c9-48e8-a18a-4f10d34283a2', 'c10b5ac5-7895-4f42-881c-9efa5faf3815');
INSERT INTO public.composite_role VALUES ('da22adfe-61c9-48e8-a18a-4f10d34283a2', 'a781c8fd-1604-4558-886a-55c712adffb8');
INSERT INTO public.composite_role VALUES ('da22adfe-61c9-48e8-a18a-4f10d34283a2', 'd9c483b4-6ef7-480a-b489-4be44d55bda8');
INSERT INTO public.composite_role VALUES ('da22adfe-61c9-48e8-a18a-4f10d34283a2', '34dcb700-0c70-4d0b-ae30-6e1c82317a46');
INSERT INTO public.composite_role VALUES ('da22adfe-61c9-48e8-a18a-4f10d34283a2', 'ba51b00c-437e-4964-8bf9-8962a8e915a4');
INSERT INTO public.composite_role VALUES ('da22adfe-61c9-48e8-a18a-4f10d34283a2', 'ad8c200e-9376-43f9-b19a-0bfae4ac8568');
INSERT INTO public.composite_role VALUES ('f832749c-5217-4c05-921d-36c9c758e4c6', '34dcb700-0c70-4d0b-ae30-6e1c82317a46');
INSERT INTO public.composite_role VALUES ('a9434baf-7055-4636-b76f-3f1bb3ad17f9', 'd9c483b4-6ef7-480a-b489-4be44d55bda8');
INSERT INTO public.composite_role VALUES ('a9434baf-7055-4636-b76f-3f1bb3ad17f9', 'ad8c200e-9376-43f9-b19a-0bfae4ac8568');
INSERT INTO public.composite_role VALUES ('f3e0b206-c45d-45ce-8d14-d043d86d45d0', '116f36b2-6fc0-4661-8b14-ae6d2ee6ecb2');
INSERT INTO public.composite_role VALUES ('4f7848d9-b0b2-455d-9ec7-90e56fbff4ac', '3e8cf08c-8ea9-4b1a-976b-2d3bd7ef662c');
INSERT INTO public.composite_role VALUES ('da22adfe-61c9-48e8-a18a-4f10d34283a2', '65dc8fe4-6ef9-4153-bef8-ca978f4e0431');


--
-- TOC entry 3993 (class 0 OID 76131)
-- Dependencies: 203
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.credential VALUES ('704de6d9-25a7-4ceb-9e9e-72ca53bc785f', NULL, 'password', '079d38b4-a0fc-426c-ab67-1dce6d83f1d3', 1614353383521, NULL, '{"value":"LM5cZdIpWUV1aEmWBxLrJCaNBEyzLuEhON0/LHMY1F4IxI1ikP1lMEghY/B0Wfhgww5Zu3fPsbV32YnJ+MQy7w==","salt":"sHe3+XWvlUBLeTkk3HcdoA==","additionalParameters":{}}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}', 10);


--
-- TOC entry 3987 (class 0 OID 76098)
-- Dependencies: 197
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.databasechangelog VALUES ('1.0.0.Final-KEYCLOAK-5461', 'sthorger@redhat.com', 'META-INF/jpa-changelog-1.0.0.Final.xml', '2021-02-13 02:57:12.782637', 1, 'EXECUTED', '7:4e70412f24a3f382c82183742ec79317', 'createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('1.0.0.Final-KEYCLOAK-5461', 'sthorger@redhat.com', 'META-INF/db2-jpa-changelog-1.0.0.Final.xml', '2021-02-13 02:57:12.797427', 2, 'MARK_RAN', '7:cb16724583e9675711801c6875114f28', 'createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('1.1.0.Beta1', 'sthorger@redhat.com', 'META-INF/jpa-changelog-1.1.0.Beta1.xml', '2021-02-13 02:57:12.834231', 3, 'EXECUTED', '7:0310eb8ba07cec616460794d42ade0fa', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('1.1.0.Final', 'sthorger@redhat.com', 'META-INF/jpa-changelog-1.1.0.Final.xml', '2021-02-13 02:57:12.837933', 4, 'EXECUTED', '7:5d25857e708c3233ef4439df1f93f012', 'renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('1.2.0.Beta1', 'psilva@redhat.com', 'META-INF/jpa-changelog-1.2.0.Beta1.xml', '2021-02-13 02:57:12.915354', 5, 'EXECUTED', '7:c7a54a1041d58eb3817a4a883b4d4e84', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('1.2.0.Beta1', 'psilva@redhat.com', 'META-INF/db2-jpa-changelog-1.2.0.Beta1.xml', '2021-02-13 02:57:12.918554', 6, 'MARK_RAN', '7:2e01012df20974c1c2a605ef8afe25b7', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('1.2.0.RC1', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.2.0.CR1.xml', '2021-02-13 02:57:12.982387', 7, 'EXECUTED', '7:0f08df48468428e0f30ee59a8ec01a41', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('1.2.0.RC1', 'bburke@redhat.com', 'META-INF/db2-jpa-changelog-1.2.0.CR1.xml', '2021-02-13 02:57:12.985571', 8, 'MARK_RAN', '7:a77ea2ad226b345e7d689d366f185c8c', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('1.2.0.Final', 'keycloak', 'META-INF/jpa-changelog-1.2.0.Final.xml', '2021-02-13 02:57:12.989569', 9, 'EXECUTED', '7:a3377a2059aefbf3b90ebb4c4cc8e2ab', 'update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('1.3.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.3.0.xml', '2021-02-13 02:57:13.073351', 10, 'EXECUTED', '7:04c1dbedc2aa3e9756d1a1668e003451', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('1.4.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.4.0.xml', '2021-02-13 02:57:13.122101', 11, 'EXECUTED', '7:36ef39ed560ad07062d956db861042ba', 'delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('1.4.0', 'bburke@redhat.com', 'META-INF/db2-jpa-changelog-1.4.0.xml', '2021-02-13 02:57:13.124428', 12, 'MARK_RAN', '7:d909180b2530479a716d3f9c9eaea3d7', 'delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('1.5.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.5.0.xml', '2021-02-13 02:57:13.178781', 13, 'EXECUTED', '7:cf12b04b79bea5152f165eb41f3955f6', 'delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('1.6.1_from15', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2021-02-13 02:57:13.206614', 14, 'EXECUTED', '7:7e32c8f05c755e8675764e7d5f514509', 'addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('1.6.1_from16-pre', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2021-02-13 02:57:13.208439', 15, 'MARK_RAN', '7:980ba23cc0ec39cab731ce903dd01291', 'delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('1.6.1_from16', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2021-02-13 02:57:13.210367', 16, 'MARK_RAN', '7:2fa220758991285312eb84f3b4ff5336', 'dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('1.6.1', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2021-02-13 02:57:13.212145', 17, 'EXECUTED', '7:d41d8cd98f00b204e9800998ecf8427e', 'empty', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('1.7.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.7.0.xml', '2021-02-13 02:57:13.259691', 18, 'EXECUTED', '7:91ace540896df890cc00a0490ee52bbc', 'createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('1.8.0', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.8.0.xml', '2021-02-13 02:57:13.303913', 19, 'EXECUTED', '7:c31d1646dfa2618a9335c00e07f89f24', 'addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('1.8.0-2', 'keycloak', 'META-INF/jpa-changelog-1.8.0.xml', '2021-02-13 02:57:13.309685', 20, 'EXECUTED', '7:df8bc21027a4f7cbbb01f6344e89ce07', 'dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part1', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2021-02-13 02:57:13.706402', 45, 'EXECUTED', '7:6a48ce645a3525488a90fbf76adf3bb3', 'addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('1.8.0', 'mposolda@redhat.com', 'META-INF/db2-jpa-changelog-1.8.0.xml', '2021-02-13 02:57:13.311991', 21, 'MARK_RAN', '7:f987971fe6b37d963bc95fee2b27f8df', 'addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('1.8.0-2', 'keycloak', 'META-INF/db2-jpa-changelog-1.8.0.xml', '2021-02-13 02:57:13.314721', 22, 'MARK_RAN', '7:df8bc21027a4f7cbbb01f6344e89ce07', 'dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('1.9.0', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.9.0.xml', '2021-02-13 02:57:13.327971', 23, 'EXECUTED', '7:ed2dc7f799d19ac452cbcda56c929e47', 'update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('1.9.1', 'keycloak', 'META-INF/jpa-changelog-1.9.1.xml', '2021-02-13 02:57:13.332315', 24, 'EXECUTED', '7:80b5db88a5dda36ece5f235be8757615', 'modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('1.9.1', 'keycloak', 'META-INF/db2-jpa-changelog-1.9.1.xml', '2021-02-13 02:57:13.334298', 25, 'MARK_RAN', '7:1437310ed1305a9b93f8848f301726ce', 'modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('1.9.2', 'keycloak', 'META-INF/jpa-changelog-1.9.2.xml', '2021-02-13 02:57:13.351064', 26, 'EXECUTED', '7:b82ffb34850fa0836be16deefc6a87c4', 'createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('authz-2.0.0', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-2.0.0.xml', '2021-02-13 02:57:13.403153', 27, 'EXECUTED', '7:9cc98082921330d8d9266decdd4bd658', 'createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('authz-2.5.1', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-2.5.1.xml', '2021-02-13 02:57:13.406444', 28, 'EXECUTED', '7:03d64aeed9cb52b969bd30a7ac0db57e', 'update tableName=RESOURCE_SERVER_POLICY', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('2.1.0-KEYCLOAK-5461', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.1.0.xml', '2021-02-13 02:57:13.442383', 29, 'EXECUTED', '7:f1f9fd8710399d725b780f463c6b21cd', 'createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('2.2.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.2.0.xml', '2021-02-13 02:57:13.451539', 30, 'EXECUTED', '7:53188c3eb1107546e6f765835705b6c1', 'addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('2.3.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.3.0.xml', '2021-02-13 02:57:13.462108', 31, 'EXECUTED', '7:d6e6f3bc57a0c5586737d1351725d4d4', 'createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('2.4.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.4.0.xml', '2021-02-13 02:57:13.465308', 32, 'EXECUTED', '7:454d604fbd755d9df3fd9c6329043aa5', 'customChange', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('2.5.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2021-02-13 02:57:13.468882', 33, 'EXECUTED', '7:57e98a3077e29caf562f7dbf80c72600', 'customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('2.5.0-unicode-oracle', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2021-02-13 02:57:13.470265', 34, 'MARK_RAN', '7:e4c7e8f2256210aee71ddc42f538b57a', 'modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('2.5.0-unicode-other-dbs', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2021-02-13 02:57:13.485565', 35, 'EXECUTED', '7:09a43c97e49bc626460480aa1379b522', 'modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('2.5.0-duplicate-email-support', 'slawomir@dabek.name', 'META-INF/jpa-changelog-2.5.0.xml', '2021-02-13 02:57:13.499085', 36, 'EXECUTED', '7:26bfc7c74fefa9126f2ce702fb775553', 'addColumn tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('2.5.0-unique-group-names', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2021-02-13 02:57:13.502416', 37, 'EXECUTED', '7:a161e2ae671a9020fff61e996a207377', 'addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('2.5.1', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.5.1.xml', '2021-02-13 02:57:13.50526', 38, 'EXECUTED', '7:37fc1781855ac5388c494f1442b3f717', 'addColumn tableName=FED_USER_CONSENT', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('3.0.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-3.0.0.xml', '2021-02-13 02:57:13.62393', 39, 'EXECUTED', '7:13a27db0dae6049541136adad7261d27', 'addColumn tableName=IDENTITY_PROVIDER', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('3.2.0-fix', 'keycloak', 'META-INF/jpa-changelog-3.2.0.xml', '2021-02-13 02:57:13.625953', 40, 'MARK_RAN', '7:550300617e3b59e8af3a6294df8248a3', 'addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('3.2.0-fix-with-keycloak-5416', 'keycloak', 'META-INF/jpa-changelog-3.2.0.xml', '2021-02-13 02:57:13.627894', 41, 'MARK_RAN', '7:e3a9482b8931481dc2772a5c07c44f17', 'dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('3.2.0-fix-offline-sessions', 'hmlnarik', 'META-INF/jpa-changelog-3.2.0.xml', '2021-02-13 02:57:13.632324', 42, 'EXECUTED', '7:72b07d85a2677cb257edb02b408f332d', 'customChange', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('3.2.0-fixed', 'keycloak', 'META-INF/jpa-changelog-3.2.0.xml', '2021-02-13 02:57:13.69399', 43, 'EXECUTED', '7:a72a7858967bd414835d19e04d880312', 'addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('3.3.0', 'keycloak', 'META-INF/jpa-changelog-3.3.0.xml', '2021-02-13 02:57:13.703534', 44, 'EXECUTED', '7:94edff7cf9ce179e7e85f0cd78a3cf2c', 'addColumn tableName=USER_ENTITY', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2021-02-13 02:57:13.709793', 46, 'EXECUTED', '7:e64b5dcea7db06077c6e57d3b9e5ca14', 'customChange', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2021-02-13 02:57:13.711322', 47, 'MARK_RAN', '7:fd8cf02498f8b1e72496a20afc75178c', 'dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2021-02-13 02:57:13.734355', 48, 'EXECUTED', '7:542794f25aa2b1fbabb7e577d6646319', 'addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('authn-3.4.0.CR1-refresh-token-max-reuse', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2021-02-13 02:57:13.745323', 49, 'EXECUTED', '7:edad604c882df12f74941dac3cc6d650', 'addColumn tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('3.4.0', 'keycloak', 'META-INF/jpa-changelog-3.4.0.xml', '2021-02-13 02:57:13.765497', 50, 'EXECUTED', '7:0f88b78b7b46480eb92690cbf5e44900', 'addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('3.4.0-KEYCLOAK-5230', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-3.4.0.xml', '2021-02-13 02:57:13.778827', 51, 'EXECUTED', '7:d560e43982611d936457c327f872dd59', 'createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('3.4.1', 'psilva@redhat.com', 'META-INF/jpa-changelog-3.4.1.xml', '2021-02-13 02:57:13.7812', 52, 'EXECUTED', '7:c155566c42b4d14ef07059ec3b3bbd8e', 'modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('3.4.2', 'keycloak', 'META-INF/jpa-changelog-3.4.2.xml', '2021-02-13 02:57:13.783328', 53, 'EXECUTED', '7:b40376581f12d70f3c89ba8ddf5b7dea', 'update tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('3.4.2-KEYCLOAK-5172', 'mkanis@redhat.com', 'META-INF/jpa-changelog-3.4.2.xml', '2021-02-13 02:57:13.785224', 54, 'EXECUTED', '7:a1132cc395f7b95b3646146c2e38f168', 'update tableName=CLIENT', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('4.0.0-KEYCLOAK-6335', 'bburke@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2021-02-13 02:57:13.788623', 55, 'EXECUTED', '7:d8dc5d89c789105cfa7ca0e82cba60af', 'createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('4.0.0-CLEANUP-UNUSED-TABLE', 'bburke@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2021-02-13 02:57:13.792454', 56, 'EXECUTED', '7:7822e0165097182e8f653c35517656a3', 'dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('4.0.0-KEYCLOAK-6228', 'bburke@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2021-02-13 02:57:13.810574', 57, 'EXECUTED', '7:c6538c29b9c9a08f9e9ea2de5c2b6375', 'dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('4.0.0-KEYCLOAK-5579-fixed', 'mposolda@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2021-02-13 02:57:13.864762', 58, 'EXECUTED', '7:6d4893e36de22369cf73bcb051ded875', 'dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('authz-4.0.0.CR1', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-4.0.0.CR1.xml', '2021-02-13 02:57:13.894336', 59, 'EXECUTED', '7:57960fc0b0f0dd0563ea6f8b2e4a1707', 'createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('authz-4.0.0.Beta3', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-4.0.0.Beta3.xml', '2021-02-13 02:57:13.898919', 60, 'EXECUTED', '7:2b4b8bff39944c7097977cc18dbceb3b', 'addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('authz-4.2.0.Final', 'mhajas@redhat.com', 'META-INF/jpa-changelog-authz-4.2.0.Final.xml', '2021-02-13 02:57:13.90672', 61, 'EXECUTED', '7:2aa42a964c59cd5b8ca9822340ba33a8', 'createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('authz-4.2.0.Final-KEYCLOAK-9944', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-authz-4.2.0.Final.xml', '2021-02-13 02:57:13.909727', 62, 'EXECUTED', '7:9ac9e58545479929ba23f4a3087a0346', 'addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('4.2.0-KEYCLOAK-6313', 'wadahiro@gmail.com', 'META-INF/jpa-changelog-4.2.0.xml', '2021-02-13 02:57:13.91164', 63, 'EXECUTED', '7:14d407c35bc4fe1976867756bcea0c36', 'addColumn tableName=REQUIRED_ACTION_PROVIDER', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('4.3.0-KEYCLOAK-7984', 'wadahiro@gmail.com', 'META-INF/jpa-changelog-4.3.0.xml', '2021-02-13 02:57:13.913649', 64, 'EXECUTED', '7:241a8030c748c8548e346adee548fa93', 'update tableName=REQUIRED_ACTION_PROVIDER', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('4.6.0-KEYCLOAK-7950', 'psilva@redhat.com', 'META-INF/jpa-changelog-4.6.0.xml', '2021-02-13 02:57:13.915281', 65, 'EXECUTED', '7:7d3182f65a34fcc61e8d23def037dc3f', 'update tableName=RESOURCE_SERVER_RESOURCE', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('4.6.0-KEYCLOAK-8377', 'keycloak', 'META-INF/jpa-changelog-4.6.0.xml', '2021-02-13 02:57:13.921324', 66, 'EXECUTED', '7:b30039e00a0b9715d430d1b0636728fa', 'createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('4.6.0-KEYCLOAK-8555', 'gideonray@gmail.com', 'META-INF/jpa-changelog-4.6.0.xml', '2021-02-13 02:57:13.924121', 67, 'EXECUTED', '7:3797315ca61d531780f8e6f82f258159', 'createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('4.7.0-KEYCLOAK-1267', 'sguilhen@redhat.com', 'META-INF/jpa-changelog-4.7.0.xml', '2021-02-13 02:57:13.938146', 68, 'EXECUTED', '7:c7aa4c8d9573500c2d347c1941ff0301', 'addColumn tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('4.7.0-KEYCLOAK-7275', 'keycloak', 'META-INF/jpa-changelog-4.7.0.xml', '2021-02-13 02:57:13.950493', 69, 'EXECUTED', '7:b207faee394fc074a442ecd42185a5dd', 'renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('4.8.0-KEYCLOAK-8835', 'sguilhen@redhat.com', 'META-INF/jpa-changelog-4.8.0.xml', '2021-02-13 02:57:13.954052', 70, 'EXECUTED', '7:ab9a9762faaba4ddfa35514b212c4922', 'addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('authz-7.0.0-KEYCLOAK-10443', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-7.0.0.xml', '2021-02-13 02:57:13.957918', 71, 'EXECUTED', '7:b9710f74515a6ccb51b72dc0d19df8c4', 'addColumn tableName=RESOURCE_SERVER', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('8.0.0-adding-credential-columns', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2021-02-13 02:57:13.961694', 72, 'EXECUTED', '7:ec9707ae4d4f0b7452fee20128083879', 'addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('8.0.0-updating-credential-data-not-oracle', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2021-02-13 02:57:13.965222', 73, 'EXECUTED', '7:03b3f4b264c3c68ba082250a80b74216', 'update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('8.0.0-updating-credential-data-oracle', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2021-02-13 02:57:13.966451', 74, 'MARK_RAN', '7:64c5728f5ca1f5aa4392217701c4fe23', 'update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('8.0.0-credential-cleanup-fixed', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2021-02-13 02:57:13.975148', 75, 'EXECUTED', '7:b48da8c11a3d83ddd6b7d0c8c2219345', 'dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('8.0.0-resource-tag-support', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2021-02-13 02:57:13.979787', 76, 'EXECUTED', '7:a73379915c23bfad3e8f5c6d5c0aa4bd', 'addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('9.0.0-always-display-client', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2021-02-13 02:57:13.986127', 77, 'EXECUTED', '7:39e0073779aba192646291aa2332493d', 'addColumn tableName=CLIENT', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('9.0.0-drop-constraints-for-column-increase', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2021-02-13 02:57:13.98784', 78, 'MARK_RAN', '7:81f87368f00450799b4bf42ea0b3ec34', 'dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('9.0.0-increase-column-size-federated-fk', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2021-02-13 02:57:13.999824', 79, 'EXECUTED', '7:20b37422abb9fb6571c618148f013a15', 'modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('9.0.0-recreate-constraints-after-column-increase', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2021-02-13 02:57:14.00137', 80, 'MARK_RAN', '7:1970bb6cfb5ee800736b95ad3fb3c78a', 'addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('9.0.1-add-index-to-client.client_id', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2021-02-13 02:57:14.004296', 81, 'EXECUTED', '7:45d9b25fc3b455d522d8dcc10a0f4c80', 'createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('9.0.1-KEYCLOAK-12579-drop-constraints', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2021-02-13 02:57:14.005648', 82, 'MARK_RAN', '7:890ae73712bc187a66c2813a724d037f', 'dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('9.0.1-KEYCLOAK-12579-add-not-null-constraint', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2021-02-13 02:57:14.008342', 83, 'EXECUTED', '7:0a211980d27fafe3ff50d19a3a29b538', 'addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('9.0.1-KEYCLOAK-12579-recreate-constraints', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2021-02-13 02:57:14.009708', 84, 'MARK_RAN', '7:a161e2ae671a9020fff61e996a207377', 'addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('9.0.1-add-index-to-events', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2021-02-13 02:57:14.012535', 85, 'EXECUTED', '7:01c49302201bdf815b0a18d1f98a55dc', 'createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('map-remove-ri', 'keycloak', 'META-INF/jpa-changelog-11.0.0.xml', '2021-02-13 02:57:14.01568', 86, 'EXECUTED', '7:3dace6b144c11f53f1ad2c0361279b86', 'dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('map-remove-ri', 'keycloak', 'META-INF/jpa-changelog-12.0.0.xml', '2021-02-13 02:57:14.020055', 87, 'EXECUTED', '7:578d0b92077eaf2ab95ad0ec087aa903', 'dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...', '', NULL, '3.5.4', NULL, NULL, '3156232572');
INSERT INTO public.databasechangelog VALUES ('12.1.0-add-realm-localization-table', 'keycloak', 'META-INF/jpa-changelog-12.0.0.xml', '2021-02-13 02:57:14.024789', 88, 'EXECUTED', '7:c95abe90d962c57a09ecaee57972835d', 'createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS', '', NULL, '3.5.4', NULL, NULL, '3156232572');


--
-- TOC entry 3986 (class 0 OID 76093)
-- Dependencies: 196
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.databasechangeloglock VALUES (1, false, NULL, NULL);
INSERT INTO public.databasechangeloglock VALUES (1000, false, NULL, NULL);
INSERT INTO public.databasechangeloglock VALUES (1001, false, NULL, NULL);


--
-- TOC entry 4072 (class 0 OID 77890)
-- Dependencies: 282
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.default_client_scope VALUES ('master', '107f5a70-5651-40dd-8442-3436f97f2d0c', false);
INSERT INTO public.default_client_scope VALUES ('master', '5372997e-0ce5-4e11-bdd7-91aaf21cc167', true);
INSERT INTO public.default_client_scope VALUES ('master', '8ccdd1a5-425a-4155-b607-c6661b94e50c', true);
INSERT INTO public.default_client_scope VALUES ('master', '6e0bc4f6-b570-49b8-acd9-02cd6c853638', true);
INSERT INTO public.default_client_scope VALUES ('master', 'a6cec969-2bed-407c-ae1e-4969b144b5ee', false);
INSERT INTO public.default_client_scope VALUES ('master', '92fb713f-4bae-4b2a-a145-9c31b8488486', false);
INSERT INTO public.default_client_scope VALUES ('master', '58e0f1c3-4300-4b61-af60-f3743c043c02', true);
INSERT INTO public.default_client_scope VALUES ('master', 'aee3504e-7537-4121-a25c-466d4d279bf6', true);
INSERT INTO public.default_client_scope VALUES ('master', '093ceff4-011f-4a3a-8eee-af70eb3c8a43', false);


--
-- TOC entry 3994 (class 0 OID 76137)
-- Dependencies: 204
-- Data for Name: event_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4060 (class 0 OID 77520)
-- Dependencies: 270
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4061 (class 0 OID 77526)
-- Dependencies: 271
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4074 (class 0 OID 77916)
-- Dependencies: 284
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4062 (class 0 OID 77535)
-- Dependencies: 272
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4063 (class 0 OID 77545)
-- Dependencies: 273
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4064 (class 0 OID 77548)
-- Dependencies: 274
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4065 (class 0 OID 77555)
-- Dependencies: 275
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4018 (class 0 OID 76539)
-- Dependencies: 228
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4068 (class 0 OID 77624)
-- Dependencies: 278
-- Data for Name: federated_user; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4044 (class 0 OID 77178)
-- Dependencies: 254
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4043 (class 0 OID 77175)
-- Dependencies: 253
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4019 (class 0 OID 76545)
-- Dependencies: 229
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4020 (class 0 OID 76555)
-- Dependencies: 230
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4025 (class 0 OID 76685)
-- Dependencies: 235
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4026 (class 0 OID 76691)
-- Dependencies: 236
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4042 (class 0 OID 77172)
-- Dependencies: 252
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 3995 (class 0 OID 76146)
-- Dependencies: 205
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.keycloak_role VALUES ('da22adfe-61c9-48e8-a18a-4f10d34283a2', 'master', false, '${role_admin}', 'admin', 'master', NULL, 'master');
INSERT INTO public.keycloak_role VALUES ('c16d8df6-e4bf-433e-9ef3-72882cf99523', 'master', false, '${role_create-realm}', 'create-realm', 'master', NULL, 'master');
INSERT INTO public.keycloak_role VALUES ('4274d7c7-9233-4c22-847e-26f3cc2b5ac1', 'e0b2ad66-23ea-4d02-ad42-4a1d13ab8b5c', true, '${role_create-client}', 'create-client', 'master', 'e0b2ad66-23ea-4d02-ad42-4a1d13ab8b5c', NULL);
INSERT INTO public.keycloak_role VALUES ('4b8c9475-2e83-449c-bbae-7b24d5431ad4', 'e0b2ad66-23ea-4d02-ad42-4a1d13ab8b5c', true, '${role_view-realm}', 'view-realm', 'master', 'e0b2ad66-23ea-4d02-ad42-4a1d13ab8b5c', NULL);
INSERT INTO public.keycloak_role VALUES ('a9434baf-7055-4636-b76f-3f1bb3ad17f9', 'e0b2ad66-23ea-4d02-ad42-4a1d13ab8b5c', true, '${role_view-users}', 'view-users', 'master', 'e0b2ad66-23ea-4d02-ad42-4a1d13ab8b5c', NULL);
INSERT INTO public.keycloak_role VALUES ('f832749c-5217-4c05-921d-36c9c758e4c6', 'e0b2ad66-23ea-4d02-ad42-4a1d13ab8b5c', true, '${role_view-clients}', 'view-clients', 'master', 'e0b2ad66-23ea-4d02-ad42-4a1d13ab8b5c', NULL);
INSERT INTO public.keycloak_role VALUES ('6b87bde0-e5fb-4774-a15d-4ffc738e55a5', 'e0b2ad66-23ea-4d02-ad42-4a1d13ab8b5c', true, '${role_view-events}', 'view-events', 'master', 'e0b2ad66-23ea-4d02-ad42-4a1d13ab8b5c', NULL);
INSERT INTO public.keycloak_role VALUES ('c44674be-31ba-4914-8c5e-78fd2f2e87d0', 'e0b2ad66-23ea-4d02-ad42-4a1d13ab8b5c', true, '${role_view-identity-providers}', 'view-identity-providers', 'master', 'e0b2ad66-23ea-4d02-ad42-4a1d13ab8b5c', NULL);
INSERT INTO public.keycloak_role VALUES ('acc7ec79-c512-4b7e-85ec-3af00a3e42c6', 'e0b2ad66-23ea-4d02-ad42-4a1d13ab8b5c', true, '${role_view-authorization}', 'view-authorization', 'master', 'e0b2ad66-23ea-4d02-ad42-4a1d13ab8b5c', NULL);
INSERT INTO public.keycloak_role VALUES ('06ef3d63-aa61-4b54-8d7f-5d14fa7523e1', 'e0b2ad66-23ea-4d02-ad42-4a1d13ab8b5c', true, '${role_manage-realm}', 'manage-realm', 'master', 'e0b2ad66-23ea-4d02-ad42-4a1d13ab8b5c', NULL);
INSERT INTO public.keycloak_role VALUES ('5f455db1-5de4-4e78-8d58-adbcc346b617', 'e0b2ad66-23ea-4d02-ad42-4a1d13ab8b5c', true, '${role_manage-users}', 'manage-users', 'master', 'e0b2ad66-23ea-4d02-ad42-4a1d13ab8b5c', NULL);
INSERT INTO public.keycloak_role VALUES ('34baa524-ff1b-428d-91b2-cb6d251dbf95', 'e0b2ad66-23ea-4d02-ad42-4a1d13ab8b5c', true, '${role_manage-clients}', 'manage-clients', 'master', 'e0b2ad66-23ea-4d02-ad42-4a1d13ab8b5c', NULL);
INSERT INTO public.keycloak_role VALUES ('976dfb45-c791-42d3-a170-1d7f84e40285', 'e0b2ad66-23ea-4d02-ad42-4a1d13ab8b5c', true, '${role_manage-events}', 'manage-events', 'master', 'e0b2ad66-23ea-4d02-ad42-4a1d13ab8b5c', NULL);
INSERT INTO public.keycloak_role VALUES ('c10b5ac5-7895-4f42-881c-9efa5faf3815', 'e0b2ad66-23ea-4d02-ad42-4a1d13ab8b5c', true, '${role_manage-identity-providers}', 'manage-identity-providers', 'master', 'e0b2ad66-23ea-4d02-ad42-4a1d13ab8b5c', NULL);
INSERT INTO public.keycloak_role VALUES ('a781c8fd-1604-4558-886a-55c712adffb8', 'e0b2ad66-23ea-4d02-ad42-4a1d13ab8b5c', true, '${role_manage-authorization}', 'manage-authorization', 'master', 'e0b2ad66-23ea-4d02-ad42-4a1d13ab8b5c', NULL);
INSERT INTO public.keycloak_role VALUES ('d9c483b4-6ef7-480a-b489-4be44d55bda8', 'e0b2ad66-23ea-4d02-ad42-4a1d13ab8b5c', true, '${role_query-users}', 'query-users', 'master', 'e0b2ad66-23ea-4d02-ad42-4a1d13ab8b5c', NULL);
INSERT INTO public.keycloak_role VALUES ('34dcb700-0c70-4d0b-ae30-6e1c82317a46', 'e0b2ad66-23ea-4d02-ad42-4a1d13ab8b5c', true, '${role_query-clients}', 'query-clients', 'master', 'e0b2ad66-23ea-4d02-ad42-4a1d13ab8b5c', NULL);
INSERT INTO public.keycloak_role VALUES ('ba51b00c-437e-4964-8bf9-8962a8e915a4', 'e0b2ad66-23ea-4d02-ad42-4a1d13ab8b5c', true, '${role_query-realms}', 'query-realms', 'master', 'e0b2ad66-23ea-4d02-ad42-4a1d13ab8b5c', NULL);
INSERT INTO public.keycloak_role VALUES ('ad8c200e-9376-43f9-b19a-0bfae4ac8568', 'e0b2ad66-23ea-4d02-ad42-4a1d13ab8b5c', true, '${role_query-groups}', 'query-groups', 'master', 'e0b2ad66-23ea-4d02-ad42-4a1d13ab8b5c', NULL);
INSERT INTO public.keycloak_role VALUES ('d4d5d1e1-0ffa-4e9d-a9c3-ee1257602de9', '1e6aae43-8e35-4bb4-9739-ffbf339d93c1', true, '${role_view-profile}', 'view-profile', 'master', '1e6aae43-8e35-4bb4-9739-ffbf339d93c1', NULL);
INSERT INTO public.keycloak_role VALUES ('f3e0b206-c45d-45ce-8d14-d043d86d45d0', '1e6aae43-8e35-4bb4-9739-ffbf339d93c1', true, '${role_manage-account}', 'manage-account', 'master', '1e6aae43-8e35-4bb4-9739-ffbf339d93c1', NULL);
INSERT INTO public.keycloak_role VALUES ('116f36b2-6fc0-4661-8b14-ae6d2ee6ecb2', '1e6aae43-8e35-4bb4-9739-ffbf339d93c1', true, '${role_manage-account-links}', 'manage-account-links', 'master', '1e6aae43-8e35-4bb4-9739-ffbf339d93c1', NULL);
INSERT INTO public.keycloak_role VALUES ('df3f396a-e2e2-43d6-bb56-2fa398604938', '1e6aae43-8e35-4bb4-9739-ffbf339d93c1', true, '${role_view-applications}', 'view-applications', 'master', '1e6aae43-8e35-4bb4-9739-ffbf339d93c1', NULL);
INSERT INTO public.keycloak_role VALUES ('3e8cf08c-8ea9-4b1a-976b-2d3bd7ef662c', '1e6aae43-8e35-4bb4-9739-ffbf339d93c1', true, '${role_view-consent}', 'view-consent', 'master', '1e6aae43-8e35-4bb4-9739-ffbf339d93c1', NULL);
INSERT INTO public.keycloak_role VALUES ('4f7848d9-b0b2-455d-9ec7-90e56fbff4ac', '1e6aae43-8e35-4bb4-9739-ffbf339d93c1', true, '${role_manage-consent}', 'manage-consent', 'master', '1e6aae43-8e35-4bb4-9739-ffbf339d93c1', NULL);
INSERT INTO public.keycloak_role VALUES ('67d55502-e982-4185-8297-f97a64b9154d', '1e6aae43-8e35-4bb4-9739-ffbf339d93c1', true, '${role_delete-account}', 'delete-account', 'master', '1e6aae43-8e35-4bb4-9739-ffbf339d93c1', NULL);
INSERT INTO public.keycloak_role VALUES ('b6f06920-ea69-458a-82c7-91cf03480618', '80adc3d0-e97d-4f9b-b951-717dc57950db', true, '${role_read-token}', 'read-token', 'master', '80adc3d0-e97d-4f9b-b951-717dc57950db', NULL);
INSERT INTO public.keycloak_role VALUES ('65dc8fe4-6ef9-4153-bef8-ca978f4e0431', 'e0b2ad66-23ea-4d02-ad42-4a1d13ab8b5c', true, '${role_impersonation}', 'impersonation', 'master', 'e0b2ad66-23ea-4d02-ad42-4a1d13ab8b5c', NULL);
INSERT INTO public.keycloak_role VALUES ('099c9f17-3b4f-4db9-bb75-f32660f2b283', 'master', false, '${role_offline-access}', 'offline_access', 'master', NULL, 'master');
INSERT INTO public.keycloak_role VALUES ('43c0f108-103d-4869-a7aa-a2d1dd83253d', 'master', false, '${role_uma_authorization}', 'uma_authorization', 'master', NULL, 'master');


--
-- TOC entry 4024 (class 0 OID 76682)
-- Dependencies: 234
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.migration_model VALUES ('mk5ls', '12.0.2', 1613156237);


--
-- TOC entry 4041 (class 0 OID 77162)
-- Dependencies: 251
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4040 (class 0 OID 77156)
-- Dependencies: 250
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4054 (class 0 OID 77441)
-- Dependencies: 264
-- Data for Name: policy_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4016 (class 0 OID 76526)
-- Dependencies: 226
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.protocol_mapper VALUES ('e29e4837-2a22-41b3-8dea-35129cb2bc71', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', '232eccda-02c3-4f38-8e98-1b3a3ee16167', NULL);
INSERT INTO public.protocol_mapper VALUES ('42424625-1cb0-4c2d-8851-3ccffb57fc54', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', 'e84d5ad3-7309-45fa-be43-b548ba098044', NULL);
INSERT INTO public.protocol_mapper VALUES ('5aa02597-6105-4750-913c-d614e584f3b2', 'role list', 'saml', 'saml-role-list-mapper', NULL, '5372997e-0ce5-4e11-bdd7-91aaf21cc167');
INSERT INTO public.protocol_mapper VALUES ('22899446-0e69-402e-84af-a0eb5493a62e', 'full name', 'openid-connect', 'oidc-full-name-mapper', NULL, '8ccdd1a5-425a-4155-b607-c6661b94e50c');
INSERT INTO public.protocol_mapper VALUES ('f37cfc75-5be6-444b-85a3-b486c5f4e5b1', 'family name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '8ccdd1a5-425a-4155-b607-c6661b94e50c');
INSERT INTO public.protocol_mapper VALUES ('4a96130e-add9-4c03-8adb-0cb685e0c520', 'given name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '8ccdd1a5-425a-4155-b607-c6661b94e50c');
INSERT INTO public.protocol_mapper VALUES ('4d9f62c9-caf2-49a7-8155-41e0a69ccb77', 'middle name', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '8ccdd1a5-425a-4155-b607-c6661b94e50c');
INSERT INTO public.protocol_mapper VALUES ('2be84922-91e2-4116-adb8-5d6a9efe40a5', 'nickname', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '8ccdd1a5-425a-4155-b607-c6661b94e50c');
INSERT INTO public.protocol_mapper VALUES ('15d00987-bb27-482f-a26b-3287c81182af', 'username', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '8ccdd1a5-425a-4155-b607-c6661b94e50c');
INSERT INTO public.protocol_mapper VALUES ('f2535a3e-7286-4fa5-a34b-6fe0739d5f16', 'profile', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '8ccdd1a5-425a-4155-b607-c6661b94e50c');
INSERT INTO public.protocol_mapper VALUES ('41bfab6e-53a7-428e-8e87-253ba77b9ddb', 'picture', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '8ccdd1a5-425a-4155-b607-c6661b94e50c');
INSERT INTO public.protocol_mapper VALUES ('ee6ccb25-7b52-457d-953d-674cdb6ad044', 'website', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '8ccdd1a5-425a-4155-b607-c6661b94e50c');
INSERT INTO public.protocol_mapper VALUES ('f84717e5-e9d6-4e86-a1af-404d4dbcd8de', 'gender', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '8ccdd1a5-425a-4155-b607-c6661b94e50c');
INSERT INTO public.protocol_mapper VALUES ('2bbed946-391d-48a4-b642-e65db20d9708', 'birthdate', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '8ccdd1a5-425a-4155-b607-c6661b94e50c');
INSERT INTO public.protocol_mapper VALUES ('3e5b58fe-09c5-4387-9f6d-55c4acfb35ed', 'zoneinfo', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '8ccdd1a5-425a-4155-b607-c6661b94e50c');
INSERT INTO public.protocol_mapper VALUES ('87c6ae89-e877-4500-9cd9-dea5858fda73', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '8ccdd1a5-425a-4155-b607-c6661b94e50c');
INSERT INTO public.protocol_mapper VALUES ('dbf08776-45f2-4734-bd3d-ac3821846fc4', 'updated at', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '8ccdd1a5-425a-4155-b607-c6661b94e50c');
INSERT INTO public.protocol_mapper VALUES ('a3621ccb-8050-4c09-b072-a89302a753ad', 'email', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '6e0bc4f6-b570-49b8-acd9-02cd6c853638');
INSERT INTO public.protocol_mapper VALUES ('71353eee-9556-4c79-b9b2-54b49cae6e8e', 'email verified', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '6e0bc4f6-b570-49b8-acd9-02cd6c853638');
INSERT INTO public.protocol_mapper VALUES ('28d35633-97b0-4056-af17-9d82160a3e95', 'address', 'openid-connect', 'oidc-address-mapper', NULL, 'a6cec969-2bed-407c-ae1e-4969b144b5ee');
INSERT INTO public.protocol_mapper VALUES ('32766ddb-6a36-4f05-92c4-7a9802d556cd', 'phone number', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '92fb713f-4bae-4b2a-a145-9c31b8488486');
INSERT INTO public.protocol_mapper VALUES ('54122b3c-741b-477e-abd2-93f0c73cf86a', 'phone number verified', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '92fb713f-4bae-4b2a-a145-9c31b8488486');
INSERT INTO public.protocol_mapper VALUES ('b2a87c0b-d9b2-437b-9a6a-befbbb201c73', 'realm roles', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, '58e0f1c3-4300-4b61-af60-f3743c043c02');
INSERT INTO public.protocol_mapper VALUES ('37b710f3-c6ab-480f-a708-c4fac5cdebad', 'client roles', 'openid-connect', 'oidc-usermodel-client-role-mapper', NULL, '58e0f1c3-4300-4b61-af60-f3743c043c02');
INSERT INTO public.protocol_mapper VALUES ('238f1959-ac6b-433c-9b78-668747abbb54', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', NULL, '58e0f1c3-4300-4b61-af60-f3743c043c02');
INSERT INTO public.protocol_mapper VALUES ('5ad699cc-176d-4e72-9fbe-491aca0de4d2', 'allowed web origins', 'openid-connect', 'oidc-allowed-origins-mapper', NULL, 'aee3504e-7537-4121-a25c-466d4d279bf6');
INSERT INTO public.protocol_mapper VALUES ('ed501641-d326-4423-81c5-9e251c1d04d0', 'upn', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '093ceff4-011f-4a3a-8eee-af70eb3c8a43');
INSERT INTO public.protocol_mapper VALUES ('cd7fb333-ada4-4c44-8e53-f80f03be5296', 'groups', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, '093ceff4-011f-4a3a-8eee-af70eb3c8a43');


--
-- TOC entry 4017 (class 0 OID 76533)
-- Dependencies: 227
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.protocol_mapper_config VALUES ('42424625-1cb0-4c2d-8851-3ccffb57fc54', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('42424625-1cb0-4c2d-8851-3ccffb57fc54', 'locale', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('42424625-1cb0-4c2d-8851-3ccffb57fc54', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('42424625-1cb0-4c2d-8851-3ccffb57fc54', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('42424625-1cb0-4c2d-8851-3ccffb57fc54', 'locale', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('42424625-1cb0-4c2d-8851-3ccffb57fc54', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('5aa02597-6105-4750-913c-d614e584f3b2', 'false', 'single');
INSERT INTO public.protocol_mapper_config VALUES ('5aa02597-6105-4750-913c-d614e584f3b2', 'Basic', 'attribute.nameformat');
INSERT INTO public.protocol_mapper_config VALUES ('5aa02597-6105-4750-913c-d614e584f3b2', 'Role', 'attribute.name');
INSERT INTO public.protocol_mapper_config VALUES ('22899446-0e69-402e-84af-a0eb5493a62e', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('22899446-0e69-402e-84af-a0eb5493a62e', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('22899446-0e69-402e-84af-a0eb5493a62e', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f37cfc75-5be6-444b-85a3-b486c5f4e5b1', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f37cfc75-5be6-444b-85a3-b486c5f4e5b1', 'lastName', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('f37cfc75-5be6-444b-85a3-b486c5f4e5b1', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f37cfc75-5be6-444b-85a3-b486c5f4e5b1', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f37cfc75-5be6-444b-85a3-b486c5f4e5b1', 'family_name', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('f37cfc75-5be6-444b-85a3-b486c5f4e5b1', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('4a96130e-add9-4c03-8adb-0cb685e0c520', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('4a96130e-add9-4c03-8adb-0cb685e0c520', 'firstName', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('4a96130e-add9-4c03-8adb-0cb685e0c520', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('4a96130e-add9-4c03-8adb-0cb685e0c520', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('4a96130e-add9-4c03-8adb-0cb685e0c520', 'given_name', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('4a96130e-add9-4c03-8adb-0cb685e0c520', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('4d9f62c9-caf2-49a7-8155-41e0a69ccb77', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('4d9f62c9-caf2-49a7-8155-41e0a69ccb77', 'middleName', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('4d9f62c9-caf2-49a7-8155-41e0a69ccb77', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('4d9f62c9-caf2-49a7-8155-41e0a69ccb77', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('4d9f62c9-caf2-49a7-8155-41e0a69ccb77', 'middle_name', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('4d9f62c9-caf2-49a7-8155-41e0a69ccb77', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('2be84922-91e2-4116-adb8-5d6a9efe40a5', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('2be84922-91e2-4116-adb8-5d6a9efe40a5', 'nickname', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('2be84922-91e2-4116-adb8-5d6a9efe40a5', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('2be84922-91e2-4116-adb8-5d6a9efe40a5', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('2be84922-91e2-4116-adb8-5d6a9efe40a5', 'nickname', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('2be84922-91e2-4116-adb8-5d6a9efe40a5', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('15d00987-bb27-482f-a26b-3287c81182af', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('15d00987-bb27-482f-a26b-3287c81182af', 'username', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('15d00987-bb27-482f-a26b-3287c81182af', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('15d00987-bb27-482f-a26b-3287c81182af', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('15d00987-bb27-482f-a26b-3287c81182af', 'preferred_username', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('15d00987-bb27-482f-a26b-3287c81182af', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('f2535a3e-7286-4fa5-a34b-6fe0739d5f16', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f2535a3e-7286-4fa5-a34b-6fe0739d5f16', 'profile', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('f2535a3e-7286-4fa5-a34b-6fe0739d5f16', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f2535a3e-7286-4fa5-a34b-6fe0739d5f16', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f2535a3e-7286-4fa5-a34b-6fe0739d5f16', 'profile', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('f2535a3e-7286-4fa5-a34b-6fe0739d5f16', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('41bfab6e-53a7-428e-8e87-253ba77b9ddb', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('41bfab6e-53a7-428e-8e87-253ba77b9ddb', 'picture', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('41bfab6e-53a7-428e-8e87-253ba77b9ddb', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('41bfab6e-53a7-428e-8e87-253ba77b9ddb', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('41bfab6e-53a7-428e-8e87-253ba77b9ddb', 'picture', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('41bfab6e-53a7-428e-8e87-253ba77b9ddb', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('ee6ccb25-7b52-457d-953d-674cdb6ad044', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('ee6ccb25-7b52-457d-953d-674cdb6ad044', 'website', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('ee6ccb25-7b52-457d-953d-674cdb6ad044', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('ee6ccb25-7b52-457d-953d-674cdb6ad044', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('ee6ccb25-7b52-457d-953d-674cdb6ad044', 'website', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('ee6ccb25-7b52-457d-953d-674cdb6ad044', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('f84717e5-e9d6-4e86-a1af-404d4dbcd8de', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f84717e5-e9d6-4e86-a1af-404d4dbcd8de', 'gender', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('f84717e5-e9d6-4e86-a1af-404d4dbcd8de', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f84717e5-e9d6-4e86-a1af-404d4dbcd8de', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f84717e5-e9d6-4e86-a1af-404d4dbcd8de', 'gender', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('f84717e5-e9d6-4e86-a1af-404d4dbcd8de', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('2bbed946-391d-48a4-b642-e65db20d9708', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('2bbed946-391d-48a4-b642-e65db20d9708', 'birthdate', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('2bbed946-391d-48a4-b642-e65db20d9708', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('2bbed946-391d-48a4-b642-e65db20d9708', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('2bbed946-391d-48a4-b642-e65db20d9708', 'birthdate', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('2bbed946-391d-48a4-b642-e65db20d9708', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('3e5b58fe-09c5-4387-9f6d-55c4acfb35ed', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('3e5b58fe-09c5-4387-9f6d-55c4acfb35ed', 'zoneinfo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('3e5b58fe-09c5-4387-9f6d-55c4acfb35ed', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('3e5b58fe-09c5-4387-9f6d-55c4acfb35ed', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('3e5b58fe-09c5-4387-9f6d-55c4acfb35ed', 'zoneinfo', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('3e5b58fe-09c5-4387-9f6d-55c4acfb35ed', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('87c6ae89-e877-4500-9cd9-dea5858fda73', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('87c6ae89-e877-4500-9cd9-dea5858fda73', 'locale', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('87c6ae89-e877-4500-9cd9-dea5858fda73', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('87c6ae89-e877-4500-9cd9-dea5858fda73', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('87c6ae89-e877-4500-9cd9-dea5858fda73', 'locale', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('87c6ae89-e877-4500-9cd9-dea5858fda73', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('dbf08776-45f2-4734-bd3d-ac3821846fc4', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('dbf08776-45f2-4734-bd3d-ac3821846fc4', 'updatedAt', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('dbf08776-45f2-4734-bd3d-ac3821846fc4', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('dbf08776-45f2-4734-bd3d-ac3821846fc4', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('dbf08776-45f2-4734-bd3d-ac3821846fc4', 'updated_at', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('dbf08776-45f2-4734-bd3d-ac3821846fc4', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('a3621ccb-8050-4c09-b072-a89302a753ad', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('a3621ccb-8050-4c09-b072-a89302a753ad', 'email', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('a3621ccb-8050-4c09-b072-a89302a753ad', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('a3621ccb-8050-4c09-b072-a89302a753ad', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('a3621ccb-8050-4c09-b072-a89302a753ad', 'email', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('a3621ccb-8050-4c09-b072-a89302a753ad', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('71353eee-9556-4c79-b9b2-54b49cae6e8e', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('71353eee-9556-4c79-b9b2-54b49cae6e8e', 'emailVerified', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('71353eee-9556-4c79-b9b2-54b49cae6e8e', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('71353eee-9556-4c79-b9b2-54b49cae6e8e', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('71353eee-9556-4c79-b9b2-54b49cae6e8e', 'email_verified', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('71353eee-9556-4c79-b9b2-54b49cae6e8e', 'boolean', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('28d35633-97b0-4056-af17-9d82160a3e95', 'formatted', 'user.attribute.formatted');
INSERT INTO public.protocol_mapper_config VALUES ('28d35633-97b0-4056-af17-9d82160a3e95', 'country', 'user.attribute.country');
INSERT INTO public.protocol_mapper_config VALUES ('28d35633-97b0-4056-af17-9d82160a3e95', 'postal_code', 'user.attribute.postal_code');
INSERT INTO public.protocol_mapper_config VALUES ('28d35633-97b0-4056-af17-9d82160a3e95', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('28d35633-97b0-4056-af17-9d82160a3e95', 'street', 'user.attribute.street');
INSERT INTO public.protocol_mapper_config VALUES ('28d35633-97b0-4056-af17-9d82160a3e95', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('28d35633-97b0-4056-af17-9d82160a3e95', 'region', 'user.attribute.region');
INSERT INTO public.protocol_mapper_config VALUES ('28d35633-97b0-4056-af17-9d82160a3e95', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('28d35633-97b0-4056-af17-9d82160a3e95', 'locality', 'user.attribute.locality');
INSERT INTO public.protocol_mapper_config VALUES ('32766ddb-6a36-4f05-92c4-7a9802d556cd', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('32766ddb-6a36-4f05-92c4-7a9802d556cd', 'phoneNumber', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('32766ddb-6a36-4f05-92c4-7a9802d556cd', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('32766ddb-6a36-4f05-92c4-7a9802d556cd', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('32766ddb-6a36-4f05-92c4-7a9802d556cd', 'phone_number', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('32766ddb-6a36-4f05-92c4-7a9802d556cd', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('54122b3c-741b-477e-abd2-93f0c73cf86a', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('54122b3c-741b-477e-abd2-93f0c73cf86a', 'phoneNumberVerified', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('54122b3c-741b-477e-abd2-93f0c73cf86a', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('54122b3c-741b-477e-abd2-93f0c73cf86a', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('54122b3c-741b-477e-abd2-93f0c73cf86a', 'phone_number_verified', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('54122b3c-741b-477e-abd2-93f0c73cf86a', 'boolean', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('b2a87c0b-d9b2-437b-9a6a-befbbb201c73', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config VALUES ('b2a87c0b-d9b2-437b-9a6a-befbbb201c73', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('b2a87c0b-d9b2-437b-9a6a-befbbb201c73', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('b2a87c0b-d9b2-437b-9a6a-befbbb201c73', 'realm_access.roles', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('b2a87c0b-d9b2-437b-9a6a-befbbb201c73', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('37b710f3-c6ab-480f-a708-c4fac5cdebad', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config VALUES ('37b710f3-c6ab-480f-a708-c4fac5cdebad', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('37b710f3-c6ab-480f-a708-c4fac5cdebad', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('37b710f3-c6ab-480f-a708-c4fac5cdebad', 'resource_access.${client_id}.roles', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('37b710f3-c6ab-480f-a708-c4fac5cdebad', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('ed501641-d326-4423-81c5-9e251c1d04d0', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('ed501641-d326-4423-81c5-9e251c1d04d0', 'username', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('ed501641-d326-4423-81c5-9e251c1d04d0', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('ed501641-d326-4423-81c5-9e251c1d04d0', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('ed501641-d326-4423-81c5-9e251c1d04d0', 'upn', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('ed501641-d326-4423-81c5-9e251c1d04d0', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('cd7fb333-ada4-4c44-8e53-f80f03be5296', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config VALUES ('cd7fb333-ada4-4c44-8e53-f80f03be5296', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('cd7fb333-ada4-4c44-8e53-f80f03be5296', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('cd7fb333-ada4-4c44-8e53-f80f03be5296', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('cd7fb333-ada4-4c44-8e53-f80f03be5296', 'groups', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('cd7fb333-ada4-4c44-8e53-f80f03be5296', 'String', 'jsonType.label');


--
-- TOC entry 3996 (class 0 OID 76153)
-- Dependencies: 206
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.realm VALUES ('master', 60, 300, 60, NULL, NULL, NULL, true, false, 0, NULL, 'master', 0, NULL, false, false, false, false, 'EXTERNAL', 1800, 36000, false, false, 'e0b2ad66-23ea-4d02-ad42-4a1d13ab8b5c', 1800, false, NULL, false, false, false, false, 0, 1, 30, 6, 'HmacSHA1', 'totp', '853011f8-32a4-4369-836a-f40ff7db3b47', '42ab8141-4d02-4a56-a8dc-863ffd6a9bcc', '01660409-a7cd-4716-b11f-9539ba4a5761', '5d0746eb-24fd-45bd-8544-8522c432fa91', '3d4ce894-9ded-4da6-952c-34cb784e85b7', 2592000, false, 900, true, false, '1f74e54e-3e1f-4ce7-bb1e-216d312921f4', 0, false, 0, 0);


--
-- TOC entry 3997 (class 0 OID 76171)
-- Dependencies: 207
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.realm_attribute VALUES ('_browser_header.contentSecurityPolicyReportOnly', '', 'master');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xContentTypeOptions', 'nosniff', 'master');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xRobotsTag', 'none', 'master');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xFrameOptions', 'SAMEORIGIN', 'master');
INSERT INTO public.realm_attribute VALUES ('_browser_header.contentSecurityPolicy', 'frame-src ''self''; frame-ancestors ''self''; object-src ''none'';', 'master');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xXSSProtection', '1; mode=block', 'master');
INSERT INTO public.realm_attribute VALUES ('_browser_header.strictTransportSecurity', 'max-age=31536000; includeSubDomains', 'master');
INSERT INTO public.realm_attribute VALUES ('bruteForceProtected', 'false', 'master');
INSERT INTO public.realm_attribute VALUES ('permanentLockout', 'false', 'master');
INSERT INTO public.realm_attribute VALUES ('maxFailureWaitSeconds', '900', 'master');
INSERT INTO public.realm_attribute VALUES ('minimumQuickLoginWaitSeconds', '60', 'master');
INSERT INTO public.realm_attribute VALUES ('waitIncrementSeconds', '60', 'master');
INSERT INTO public.realm_attribute VALUES ('quickLoginCheckMilliSeconds', '1000', 'master');
INSERT INTO public.realm_attribute VALUES ('maxDeltaTimeSeconds', '43200', 'master');
INSERT INTO public.realm_attribute VALUES ('failureFactor', '30', 'master');
INSERT INTO public.realm_attribute VALUES ('displayName', 'Keycloak', 'master');
INSERT INTO public.realm_attribute VALUES ('displayNameHtml', '<div class="kc-logo-text"><span>Keycloak</span></div>', 'master');
INSERT INTO public.realm_attribute VALUES ('offlineSessionMaxLifespanEnabled', 'false', 'master');
INSERT INTO public.realm_attribute VALUES ('offlineSessionMaxLifespan', '5184000', 'master');


--
-- TOC entry 4046 (class 0 OID 77188)
-- Dependencies: 256
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 3998 (class 0 OID 76177)
-- Dependencies: 208
-- Data for Name: realm_default_roles; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.realm_default_roles VALUES ('master', '099c9f17-3b4f-4db9-bb75-f32660f2b283');
INSERT INTO public.realm_default_roles VALUES ('master', '43c0f108-103d-4869-a7aa-a2d1dd83253d');


--
-- TOC entry 4023 (class 0 OID 76674)
-- Dependencies: 233
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 3999 (class 0 OID 76180)
-- Dependencies: 209
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.realm_events_listeners VALUES ('master', 'jboss-logging');


--
-- TOC entry 4079 (class 0 OID 78089)
-- Dependencies: 289
-- Data for Name: realm_localizations; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4000 (class 0 OID 76183)
-- Dependencies: 210
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.realm_required_credential VALUES ('password', 'password', true, true, 'master');


--
-- TOC entry 4001 (class 0 OID 76191)
-- Dependencies: 211
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4021 (class 0 OID 76565)
-- Dependencies: 231
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4002 (class 0 OID 76203)
-- Dependencies: 212
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.redirect_uris VALUES ('1e6aae43-8e35-4bb4-9739-ffbf339d93c1', '/realms/master/account/*');
INSERT INTO public.redirect_uris VALUES ('232eccda-02c3-4f38-8e98-1b3a3ee16167', '/realms/master/account/*');
INSERT INTO public.redirect_uris VALUES ('e84d5ad3-7309-45fa-be43-b548ba098044', '/admin/master/console/*');


--
-- TOC entry 4039 (class 0 OID 77019)
-- Dependencies: 249
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4038 (class 0 OID 77011)
-- Dependencies: 248
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.required_action_provider VALUES ('e8574246-8822-43e8-8488-49823cc9ae79', 'VERIFY_EMAIL', 'Verify Email', 'master', true, false, 'VERIFY_EMAIL', 50);
INSERT INTO public.required_action_provider VALUES ('2ed8723e-fb12-4f58-9d70-a3dcd07d993a', 'UPDATE_PROFILE', 'Update Profile', 'master', true, false, 'UPDATE_PROFILE', 40);
INSERT INTO public.required_action_provider VALUES ('03900ec8-6dc9-4983-bebe-fdaf65c8b690', 'CONFIGURE_TOTP', 'Configure OTP', 'master', true, false, 'CONFIGURE_TOTP', 10);
INSERT INTO public.required_action_provider VALUES ('eabc4fce-bbaa-429e-aa49-e0dc48a545eb', 'UPDATE_PASSWORD', 'Update Password', 'master', true, false, 'UPDATE_PASSWORD', 30);
INSERT INTO public.required_action_provider VALUES ('787f4efc-9b0b-4e33-ad06-3d24e4222bae', 'terms_and_conditions', 'Terms and Conditions', 'master', false, false, 'terms_and_conditions', 20);
INSERT INTO public.required_action_provider VALUES ('9e123546-da21-4f45-adde-e18982d3b495', 'update_user_locale', 'Update User Locale', 'master', true, false, 'update_user_locale', 1000);
INSERT INTO public.required_action_provider VALUES ('785c8025-7a50-412d-9143-9ec34cb3783c', 'delete_account', 'Delete Account', 'master', false, false, 'delete_account', 60);


--
-- TOC entry 4076 (class 0 OID 77973)
-- Dependencies: 286
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4056 (class 0 OID 77469)
-- Dependencies: 266
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4055 (class 0 OID 77454)
-- Dependencies: 265
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4050 (class 0 OID 77388)
-- Dependencies: 260
-- Data for Name: resource_server; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4075 (class 0 OID 77931)
-- Dependencies: 285
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4053 (class 0 OID 77426)
-- Dependencies: 263
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4051 (class 0 OID 77396)
-- Dependencies: 261
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4052 (class 0 OID 77411)
-- Dependencies: 262
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4077 (class 0 OID 77992)
-- Dependencies: 287
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4078 (class 0 OID 78002)
-- Dependencies: 288
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4003 (class 0 OID 76206)
-- Dependencies: 213
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.scope_mapping VALUES ('232eccda-02c3-4f38-8e98-1b3a3ee16167', 'f3e0b206-c45d-45ce-8d14-d043d86d45d0');


--
-- TOC entry 4057 (class 0 OID 77484)
-- Dependencies: 267
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4005 (class 0 OID 76212)
-- Dependencies: 215
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4027 (class 0 OID 76697)
-- Dependencies: 237
-- Data for Name: user_consent; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4073 (class 0 OID 77906)
-- Dependencies: 283
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4006 (class 0 OID 76218)
-- Dependencies: 216
-- Data for Name: user_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.user_entity VALUES ('079d38b4-a0fc-426c-ab67-1dce6d83f1d3', NULL, '54f9310b-4512-444f-89cf-452ab94a87f6', false, true, NULL, NULL, NULL, 'master', 'admin', 1613156284159, NULL, 0);


--
-- TOC entry 4007 (class 0 OID 76227)
-- Dependencies: 217
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4034 (class 0 OID 76829)
-- Dependencies: 244
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4035 (class 0 OID 76835)
-- Dependencies: 245
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4008 (class 0 OID 76233)
-- Dependencies: 218
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4045 (class 0 OID 77185)
-- Dependencies: 255
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4009 (class 0 OID 76239)
-- Dependencies: 219
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4010 (class 0 OID 76242)
-- Dependencies: 220
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.user_role_mapping VALUES ('43c0f108-103d-4869-a7aa-a2d1dd83253d', '079d38b4-a0fc-426c-ab67-1dce6d83f1d3');
INSERT INTO public.user_role_mapping VALUES ('099c9f17-3b4f-4db9-bb75-f32660f2b283', '079d38b4-a0fc-426c-ab67-1dce6d83f1d3');
INSERT INTO public.user_role_mapping VALUES ('f3e0b206-c45d-45ce-8d14-d043d86d45d0', '079d38b4-a0fc-426c-ab67-1dce6d83f1d3');
INSERT INTO public.user_role_mapping VALUES ('d4d5d1e1-0ffa-4e9d-a9c3-ee1257602de9', '079d38b4-a0fc-426c-ab67-1dce6d83f1d3');
INSERT INTO public.user_role_mapping VALUES ('da22adfe-61c9-48e8-a18a-4f10d34283a2', '079d38b4-a0fc-426c-ab67-1dce6d83f1d3');


--
-- TOC entry 4011 (class 0 OID 76245)
-- Dependencies: 221
-- Data for Name: user_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4022 (class 0 OID 76568)
-- Dependencies: 232
-- Data for Name: user_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4004 (class 0 OID 76209)
-- Dependencies: 214
-- Data for Name: username_login_failure; Type: TABLE DATA; Schema: public; Owner: keycloak
--



--
-- TOC entry 4012 (class 0 OID 76258)
-- Dependencies: 222
-- Data for Name: web_origins; Type: TABLE DATA; Schema: public; Owner: keycloak
--

INSERT INTO public.web_origins VALUES ('e84d5ad3-7309-45fa-be43-b548ba098044', '+');


-- Completed on 2021-02-26 23:36:28 +08

--
-- PostgreSQL database dump complete
--

