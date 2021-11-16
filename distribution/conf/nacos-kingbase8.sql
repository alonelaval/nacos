/*
 * Copyright 1999-2018 Alibaba Group Holding Ltd.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/******************************************/
/*   数据库全名 = nacos   */
/*   表名称 = config_info   */
/******************************************/
CREATE TABLE "PUBLIC"."config_info" (
    "id" BIGINT NOT NULL,
    "data_id" CHARACTER VARYING(255 char) NOT NULL,
    "group_id" CHARACTER VARYING(255 char),
    "content" TEXT NOT NULL,
    "md5" CHARACTER VARYING(32 char),
    "gmt_create" TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW() NOT NULL,
    "gmt_modified" TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW() NOT NULL,
    "src_user" TEXT,
    "src_ip" CHARACTER VARYING(20 char),
    "app_name" CHARACTER VARYING(128 char),
    "tenant_id" CHARACTER VARYING(128 char) DEFAULT NULL::CHARACTER VARYING,
    "c_desc" CHARACTER VARYING(256 char),
    "c_use" CHARACTER VARYING(64 char),
    "effect" CHARACTER VARYING(64 char),
    "type" CHARACTER VARYING(64 char),
    "c_schema" TEXT
);


ALTER TABLE "PUBLIC"."config_info" OWNER TO "SYSTEM";


CREATE TABLE "PUBLIC"."config_info_aggr" (
    "id" BIGINT NOT NULL,
    "data_id" CHARACTER VARYING(255 char) NOT NULL,
    "group_id" CHARACTER VARYING(255 char) NOT NULL,
    "datum_id" CHARACTER VARYING(255 char) NOT NULL,
    "content" TEXT NOT NULL,
    "gmt_modified" TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    "app_name" CHARACTER VARYING(128 char),
    "tenant_id" CHARACTER VARYING(128 char) DEFAULT NULL::CHARACTER VARYING
);


ALTER TABLE "PUBLIC"."config_info_aggr" OWNER TO "SYSTEM";



CREATE SEQUENCE "PUBLIC"."config_info_aggr_id_SEQ"
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "PUBLIC"."config_info_aggr_id_SEQ" OWNER TO "SYSTEM";


ALTER SEQUENCE "PUBLIC"."config_info_aggr_id_SEQ" OWNED BY "PUBLIC"."config_info_aggr"."id";


CREATE TABLE "PUBLIC"."config_info_beta" (
    "id" BIGINT NOT NULL,
    "data_id" CHARACTER VARYING(255 char) NOT NULL,
    "group_id" CHARACTER VARYING(128 char) NOT NULL,
    "app_name" CHARACTER VARYING(128 char),
    "content" TEXT NOT NULL,
    "beta_ips" CHARACTER VARYING(1024 char),
    "md5" CHARACTER VARYING(32 char),
    "gmt_create" TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW() NOT NULL,
    "gmt_modified" TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW() NOT NULL,
    "src_user" TEXT,
    "src_ip" CHARACTER VARYING(20 char),
    "tenant_id" CHARACTER VARYING(128 char) DEFAULT NULL::CHARACTER VARYING
);


ALTER TABLE "PUBLIC"."config_info_beta" OWNER TO "SYSTEM";



CREATE SEQUENCE "PUBLIC"."config_info_beta_id_SEQ"
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "PUBLIC"."config_info_beta_id_SEQ" OWNER TO "SYSTEM";



ALTER SEQUENCE "PUBLIC"."config_info_beta_id_SEQ" OWNED BY "PUBLIC"."config_info_beta"."id";



CREATE SEQUENCE "PUBLIC"."config_info_id_SEQ"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "PUBLIC"."config_info_id_SEQ" OWNER TO "SYSTEM";



ALTER SEQUENCE "PUBLIC"."config_info_id_SEQ" OWNED BY "PUBLIC"."config_info"."id";



CREATE TABLE "PUBLIC"."config_info_tag" (
    "id" BIGINT NOT NULL,
    "data_id" CHARACTER VARYING(255 char) NOT NULL,
    "group_id" CHARACTER VARYING(128 char) NOT NULL,
    "tenant_id" CHARACTER VARYING(128 char) DEFAULT NULL::CHARACTER VARYING,
    "tag_id" CHARACTER VARYING(128 char) NOT NULL,
    "app_name" CHARACTER VARYING(128 char),
    "content" TEXT NOT NULL,
    "md5" CHARACTER VARYING(32 char),
    "gmt_create" TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW() NOT NULL,
    "gmt_modified" TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW() NOT NULL,
    "src_user" TEXT,
    "src_ip" CHARACTER VARYING(20 char)
);


ALTER TABLE "PUBLIC"."config_info_tag" OWNER TO "SYSTEM";



CREATE SEQUENCE "PUBLIC"."config_info_tag_id_SEQ"
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "PUBLIC"."config_info_tag_id_SEQ" OWNER TO "SYSTEM";



ALTER SEQUENCE "PUBLIC"."config_info_tag_id_SEQ" OWNED BY "PUBLIC"."config_info_tag"."id";



CREATE TABLE "PUBLIC"."config_tags_relation" (
    "id" BIGINT NOT NULL,
    "tag_name" CHARACTER VARYING(128 char) NOT NULL,
    "tag_type" CHARACTER VARYING(64 char),
    "data_id" CHARACTER VARYING(255 char) NOT NULL,
    "group_id" CHARACTER VARYING(128 char) NOT NULL,
    "tenant_id" CHARACTER VARYING(128 char) DEFAULT NULL::CHARACTER VARYING,
    "nid" BIGINT NOT NULL
);


ALTER TABLE "PUBLIC"."config_tags_relation" OWNER TO "SYSTEM";



CREATE SEQUENCE "PUBLIC"."config_tags_relation_nid_SEQ"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "PUBLIC"."config_tags_relation_nid_SEQ" OWNER TO "SYSTEM";



ALTER SEQUENCE "PUBLIC"."config_tags_relation_nid_SEQ" OWNED BY "PUBLIC"."config_tags_relation"."nid";




CREATE TABLE "PUBLIC"."group_capacity" (
    "id" BIGINT NOT NULL,
    "group_id" CHARACTER VARYING(128 char) DEFAULT NULL::CHARACTER VARYING NOT NULL,
    "quota" BIGINT DEFAULT 0 NOT NULL,
    "usage" BIGINT DEFAULT 0 NOT NULL,
    "max_size" BIGINT DEFAULT 0 NOT NULL,
    "max_aggr_count" BIGINT DEFAULT 0 NOT NULL,
    "max_aggr_size" BIGINT DEFAULT 0 NOT NULL,
    "max_history_count" BIGINT DEFAULT 0 NOT NULL,
    "gmt_create" TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW() NOT NULL,
    "gmt_modified" TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW() NOT NULL
);


ALTER TABLE "PUBLIC"."group_capacity" OWNER TO "SYSTEM";


CREATE SEQUENCE "PUBLIC"."group_capacity_id_SEQ"
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "PUBLIC"."group_capacity_id_SEQ" OWNER TO "SYSTEM";


ALTER SEQUENCE "PUBLIC"."group_capacity_id_SEQ" OWNED BY "PUBLIC"."group_capacity"."id";




CREATE TABLE "PUBLIC"."his_config_info" (
    "id" NUMERIC NOT NULL,
    "nid" BIGINT NOT NULL,
    "data_id" CHARACTER VARYING(255 char) NOT NULL,
    "group_id" CHARACTER VARYING(128 char) NOT NULL,
    "app_name" CHARACTER VARYING(128 char),
    "content" TEXT NOT NULL,
    "md5" CHARACTER VARYING(32 char),
    "gmt_create" TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW() NOT NULL,
    "gmt_modified" TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW() NOT NULL,
    "src_user" TEXT,
    "src_ip" CHARACTER VARYING(20 char),
    "op_type" CHARACTER(10 char),
    "tenant_id" CHARACTER VARYING(128 char) DEFAULT NULL::CHARACTER VARYING
);


ALTER TABLE "PUBLIC"."his_config_info" OWNER TO "SYSTEM";


CREATE SEQUENCE "PUBLIC"."his_config_info_nid_SEQ"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "PUBLIC"."his_config_info_nid_SEQ" OWNER TO "SYSTEM";



ALTER SEQUENCE "PUBLIC"."his_config_info_nid_SEQ" OWNED BY "PUBLIC"."his_config_info"."nid";




CREATE TABLE "PUBLIC"."permissions" (
    "role" CHARACTER VARYING(50 char) NOT NULL,
    "resource" CHARACTER VARYING(255 char) NOT NULL,
    "action" CHARACTER VARYING(8 char) NOT NULL
);


ALTER TABLE "PUBLIC"."permissions" OWNER TO "SYSTEM";



CREATE TABLE "PUBLIC"."roles" (
    "username" CHARACTER VARYING(50 char) NOT NULL,
    "role" CHARACTER VARYING(50 char) NOT NULL
);


ALTER TABLE "PUBLIC"."roles" OWNER TO "SYSTEM";


CREATE TABLE "PUBLIC"."tenant_capacity" (
    "id" BIGINT NOT NULL,
    "tenant_id" CHARACTER VARYING(128 char) DEFAULT NULL::CHARACTER VARYING NOT NULL,
    "quota" BIGINT DEFAULT 0 NOT NULL,
    "usage" BIGINT DEFAULT 0 NOT NULL,
    "max_size" BIGINT DEFAULT 0 NOT NULL,
    "max_aggr_count" BIGINT DEFAULT 0 NOT NULL,
    "max_aggr_size" BIGINT DEFAULT 0 NOT NULL,
    "max_history_count" BIGINT DEFAULT 0 NOT NULL,
    "gmt_create" TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW() NOT NULL,
    "gmt_modified" TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW() NOT NULL
);


ALTER TABLE "PUBLIC"."tenant_capacity" OWNER TO "SYSTEM";


CREATE SEQUENCE "PUBLIC"."tenant_capacity_id_SEQ"
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "PUBLIC"."tenant_capacity_id_SEQ" OWNER TO "SYSTEM";



ALTER SEQUENCE "PUBLIC"."tenant_capacity_id_SEQ" OWNED BY "PUBLIC"."tenant_capacity"."id";




CREATE TABLE "PUBLIC"."tenant_info" (
    "id" BIGINT NOT NULL,
    "kp" CHARACTER VARYING(128 char) NOT NULL,
    "tenant_id" CHARACTER VARYING(128 char) DEFAULT NULL::CHARACTER VARYING,
    "tenant_name" CHARACTER VARYING(128 char) DEFAULT NULL::CHARACTER VARYING,
    "tenant_desc" CHARACTER VARYING(256 char),
    "create_source" CHARACTER VARYING(32 char),
    "gmt_create" BIGINT NOT NULL,
    "gmt_modified" BIGINT NOT NULL
);


ALTER TABLE "PUBLIC"."tenant_info" OWNER TO "SYSTEM";


CREATE SEQUENCE "PUBLIC"."tenant_info_id_SEQ"
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "PUBLIC"."tenant_info_id_SEQ" OWNER TO "SYSTEM";


ALTER SEQUENCE "PUBLIC"."tenant_info_id_SEQ" OWNED BY "PUBLIC"."tenant_info"."id";



CREATE TABLE "PUBLIC"."users" (
    "username" CHARACTER VARYING(50 char) NOT NULL,
    "password" CHARACTER VARYING(500 char) NOT NULL,
    "enabled" BOOLEAN NOT NULL
);


ALTER TABLE "PUBLIC"."users" OWNER TO "SYSTEM";



ALTER TABLE ONLY "PUBLIC"."config_info" ALTER COLUMN "id" SET DEFAULT NEXTVAL('PUBLIC.config_info_id_SEQ'::REGCLASS);




ALTER TABLE ONLY "PUBLIC"."config_info_aggr" ALTER COLUMN "id" SET DEFAULT NEXTVAL('PUBLIC.config_info_aggr_id_SEQ'::REGCLASS);




ALTER TABLE ONLY "PUBLIC"."config_info_beta" ALTER COLUMN "id" SET DEFAULT NEXTVAL('PUBLIC.config_info_beta_id_SEQ'::REGCLASS);


ALTER TABLE ONLY "PUBLIC"."config_info_tag" ALTER COLUMN "id" SET DEFAULT NEXTVAL('PUBLIC.config_info_tag_id_SEQ'::REGCLASS);



ALTER TABLE ONLY "PUBLIC"."config_tags_relation" ALTER COLUMN "nid" SET DEFAULT NEXTVAL('PUBLIC.config_tags_relation_nid_SEQ'::REGCLASS);



ALTER TABLE ONLY "PUBLIC"."group_capacity" ALTER COLUMN "id" SET DEFAULT NEXTVAL('PUBLIC.group_capacity_id_SEQ'::REGCLASS);




ALTER TABLE ONLY "PUBLIC"."his_config_info" ALTER COLUMN "nid" SET DEFAULT NEXTVAL('PUBLIC.his_config_info_nid_SEQ'::REGCLASS);



ALTER TABLE ONLY "PUBLIC"."tenant_capacity" ALTER COLUMN "id" SET DEFAULT NEXTVAL('PUBLIC.tenant_capacity_id_SEQ'::REGCLASS);



ALTER TABLE ONLY "PUBLIC"."tenant_info" ALTER COLUMN "id" SET DEFAULT NEXTVAL('PUBLIC.tenant_info_id_SEQ'::REGCLASS);



ALTER TABLE ONLY "PUBLIC"."config_info"
    ADD CONSTRAINT "config_info_PKEY" PRIMARY KEY ("id");



ALTER TABLE ONLY "PUBLIC"."config_info_aggr"
    ADD CONSTRAINT "config_info_aggr_PKEY" PRIMARY KEY ("id");



ALTER TABLE ONLY "PUBLIC"."config_info_beta"
    ADD CONSTRAINT "config_info_beta_PKEY" PRIMARY KEY ("id");




ALTER TABLE ONLY "PUBLIC"."config_info_tag"
    ADD CONSTRAINT "config_info_tag_PKEY" PRIMARY KEY ("id");




ALTER TABLE ONLY "PUBLIC"."config_tags_relation"
    ADD CONSTRAINT "config_tags_relation_PKEY" PRIMARY KEY ("nid");




ALTER TABLE ONLY "PUBLIC"."group_capacity"
    ADD CONSTRAINT "group_capacity_PKEY" PRIMARY KEY ("id");




ALTER TABLE ONLY "PUBLIC"."his_config_info"
    ADD CONSTRAINT "his_config_info_PKEY" PRIMARY KEY ("nid");



ALTER TABLE ONLY "PUBLIC"."roles"
    ADD CONSTRAINT "idx_user_role" UNIQUE ("username", "role");



ALTER TABLE ONLY "PUBLIC"."tenant_capacity"
    ADD CONSTRAINT "tenant_capacity_PKEY" PRIMARY KEY ("id");



ALTER TABLE ONLY "PUBLIC"."tenant_info"
    ADD CONSTRAINT "tenant_info_PKEY" PRIMARY KEY ("id");



ALTER TABLE ONLY "PUBLIC"."config_info"
    ADD CONSTRAINT "uk_configinfo_datagrouptenant" UNIQUE ("data_id", "group_id", "tenant_id");


ALTER TABLE ONLY "PUBLIC"."config_info_aggr"
    ADD CONSTRAINT "uk_configinfoaggr_datagrouptenantdatum" UNIQUE ("data_id", "group_id", "tenant_id", "datum_id");



ALTER TABLE ONLY "PUBLIC"."config_info_beta"
    ADD CONSTRAINT "uk_configinfobeta_datagrouptenant" UNIQUE ("data_id", "group_id", "tenant_id");



ALTER TABLE ONLY "PUBLIC"."config_info_tag"
    ADD CONSTRAINT "uk_configinfotag_datagrouptenanttag" UNIQUE ("data_id", "group_id", "tenant_id", "tag_id");



ALTER TABLE ONLY "PUBLIC"."config_tags_relation"
    ADD CONSTRAINT "uk_configtagrelation_configidtag" UNIQUE ("id", "tag_name", "tag_type");



ALTER TABLE ONLY "PUBLIC"."group_capacity"
    ADD CONSTRAINT "uk_group_id" UNIQUE ("group_id");


ALTER TABLE ONLY "PUBLIC"."tenant_capacity"
    ADD CONSTRAINT "uk_tenant_id" UNIQUE ("tenant_id");



ALTER TABLE ONLY "PUBLIC"."tenant_info"
    ADD CONSTRAINT "uk_tenant_info_kptenantid" UNIQUE ("kp", "tenant_id");



ALTER TABLE ONLY "PUBLIC"."users"
    ADD CONSTRAINT "users_PKEY" PRIMARY KEY ("username");




CREATE INDEX idx_did ON PUBLIC.his_config_info USING BTREE (data_id);




CREATE INDEX idx_gmt_create ON PUBLIC.his_config_info USING BTREE (gmt_create);



CREATE INDEX idx_gmt_modified ON PUBLIC.his_config_info USING BTREE (gmt_modified);




CREATE INDEX idx_tenant_id ON PUBLIC.tenant_info USING BTREE (tenant_id);



CREATE INDEX idx_tenant_id2 ON PUBLIC.config_tags_relation USING BTREE (tenant_id);



CREATE INDEX uk_role_permission ON PUBLIC.permissions USING BTREE (role);


INSERT INTO users (username, password, enabled) VALUES ('nacos', '$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu', TRUE);

INSERT INTO roles (username, role) VALUES ('nacos', 'ROLE_ADMIN');

