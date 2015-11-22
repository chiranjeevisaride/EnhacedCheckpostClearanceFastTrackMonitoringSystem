CREATE USER CHECKPOST IDENTIFIED BY CHECKPOST
/
GRANT CONNECT,RESOURCE TO CHECKPOST
/
CONNECT CHECKPOST/CHECKPOST

ALTER TABLE CHECKPOST.APPLYFITNESS
 DROP PRIMARY KEY CASCADE;

DROP TABLE CHECKPOST.APPLYFITNESS CASCADE CONSTRAINTS;

CREATE TABLE CHECKPOST.APPLYFITNESS
(
  ID                   INTEGER                  NOT NULL,
  REG_ID               INTEGER,
  STATUS               VARCHAR2(100 BYTE)       DEFAULT 'OPEN',
  BREAKS_VALID         VARCHAR2(30 BYTE),
  POLUTION_VALID       VARCHAR2(30 BYTE),
  CONDITION_VALID      VARCHAR2(30 BYTE),
  COND_REJECT_DETAILS  VARCHAR2(4000 BYTE),
  EMP_ID               INTEGER,
  VALID_FROM           DATE,
  VALID_TO             DATE,
  PRINT_MATTER         VARCHAR2(4000 BYTE),
  CUST_ID              INTEGER,
  REG_VALID            VARCHAR2(30 BYTE)
)
TABLESPACE SYSTEM
PCTUSED    40
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


ALTER TABLE CHECKPOST.APPLYNOC
 DROP PRIMARY KEY CASCADE;

DROP TABLE CHECKPOST.APPLYNOC CASCADE CONSTRAINTS;

CREATE TABLE CHECKPOST.APPLYNOC
(
  ID            INTEGER                         NOT NULL,
  REG_ID        INTEGER,
  STATUS        VARCHAR2(100 BYTE)              DEFAULT 'OPEN',
  CUST_ID       INTEGER,
  REG_VALID     VARCHAR2(20 BYTE),
  TAX_PAID      VARCHAR2(20 BYTE),
  ANY_CASE      VARCHAR2(20 BYTE),
  CASE_DETAILS  VARCHAR2(4000 BYTE),
  EMP_ID        INTEGER,
  VALID_FROM    DATE,
  VALID_TO      DATE,
  PRINT_MATTER  VARCHAR2(4000 BYTE)
)
TABLESPACE SYSTEM
PCTUSED    40
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

COMMENT ON COLUMN CHECKPOST.APPLYNOC.STATUS IS 'OPEN,ACCEPT,REJECT';


DROP TABLE CHECKPOST.CUSTOMER CASCADE CONSTRAINTS;

CREATE TABLE CHECKPOST.CUSTOMER
(
  CUST_ID    INTEGER                            NOT NULL,
  NAME       VARCHAR2(100 BYTE),
  USERID     VARCHAR2(100 BYTE),
  PASSWORD   VARCHAR2(100 BYTE),
  MOBILE     VARCHAR2(12 BYTE),
  PHONE      VARCHAR2(12 BYTE),
  ADDRESS    VARCHAR2(100 BYTE),
  EMAIL      VARCHAR2(100 BYTE),
  CREATEDON  TIMESTAMP(6), 
  CONSTRAINT CUSTOMER_PK
  PRIMARY KEY
  (CUST_ID)
)
ORGANIZATION INDEX
LOGGING
TABLESPACE SYSTEM
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
MONITORING;


ALTER TABLE CHECKPOST.DIST
 DROP PRIMARY KEY CASCADE;

DROP TABLE CHECKPOST.DIST CASCADE CONSTRAINTS;

CREATE TABLE CHECKPOST.DIST
(
  DISTID  INTEGER                               NOT NULL,
  NAME    VARCHAR2(100 BYTE)
)
TABLESPACE SYSTEM
PCTUSED    40
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


ALTER TABLE CHECKPOST.DRIVING_LICENSE
 DROP PRIMARY KEY CASCADE;

DROP TABLE CHECKPOST.DRIVING_LICENSE CASCADE CONSTRAINTS;

CREATE TABLE CHECKPOST.DRIVING_LICENSE
(
  ID                INTEGER                     NOT NULL,
  DLID              VARCHAR2(100 BYTE)          DEFAULT '0',
  VALID_FROM        DATE,
  VALID_TO          DATE,
  NAME              VARCHAR2(1000 BYTE),
  DOB               DATE,
  BLOOD_GROUP       VARCHAR2(10 BYTE),
  ADDRESS           VARCHAR2(4000 BYTE),
  LIC_AUTHORITY     VARCHAR2(1000 BYTE),
  EMP_ID            INTEGER,
  PROOF_AGE         VARCHAR2(100 BYTE),
  PROOF_RESIDENCE   VARCHAR2(1000 BYTE),
  PHYSICAL_FITNESS  VARCHAR2(100 BYTE),
  MEDICAL_CERT      VARCHAR2(100 BYTE),
  CUST_ID           INTEGER,
  REJECT_REASON     VARCHAR2(4000 BYTE),
  STATUS            VARCHAR2(100 BYTE)          DEFAULT 'OPEN',
  COUNTRY           VARCHAR2(100 BYTE),
  STATE             VARCHAR2(100 BYTE),
  DISTID            INTEGER,
  MANDALID          INTEGER,
  CREATED_ON        TIMESTAMP(6),
  PHOTO_PATH        VARCHAR2(4000 BYTE)
)
TABLESPACE SYSTEM
PCTUSED    40
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

COMMENT ON COLUMN CHECKPOST.DRIVING_LICENSE.STATUS IS 'OPEN,CLOSE';



ALTER TABLE CHECKPOST.DRIVING_SLOT
 DROP PRIMARY KEY CASCADE;

DROP TABLE CHECKPOST.DRIVING_SLOT CASCADE CONSTRAINTS;

CREATE TABLE CHECKPOST.DRIVING_SLOT
(
  ID          INTEGER                           NOT NULL,
  SLOT_DATE   DATE,
  SLOT_TIME   VARCHAR2(30 BYTE),
  DRIVE_ID    INTEGER,
  EMP_ID      INTEGER,
  STATUS      VARCHAR2(100 BYTE)                DEFAULT 'OPEN',
  REASON      VARCHAR2(4000 BYTE),
  CREATED_ON  DATE
)
TABLESPACE SYSTEM
PCTUSED    40
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


ALTER TABLE CHECKPOST.EMPAUTHORIZATION
 DROP PRIMARY KEY CASCADE;

DROP TABLE CHECKPOST.EMPAUTHORIZATION CASCADE CONSTRAINTS;

CREATE TABLE CHECKPOST.EMPAUTHORIZATION
(
  USER_ID       VARCHAR2(4000 BYTE)             NOT NULL,
  USER_NAME     VARCHAR2(4000 BYTE),
  PASSWORD      VARCHAR2(4000 BYTE),
  CONFIRM_PASS  VARCHAR2(4000 BYTE),
  ROLE          VARCHAR2(4000 BYTE)
)
TABLESPACE SYSTEM
PCTUSED    40
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


ALTER TABLE CHECKPOST.EMPLOYEE
 DROP PRIMARY KEY CASCADE;

DROP TABLE CHECKPOST.EMPLOYEE CASCADE CONSTRAINTS;

CREATE TABLE CHECKPOST.EMPLOYEE
(
  ID          INTEGER                           NOT NULL,
  NAME        VARCHAR2(100 BYTE),
  PASSWORD    VARCHAR2(100 BYTE),
  ROLE        VARCHAR2(100 BYTE)                DEFAULT 'MANAGER',
  DISTID      INTEGER                           DEFAULT 0,
  MANDALID    INTEGER                           DEFAULT 0,
  USERID      VARCHAR2(100 BYTE),
  CREATED_ON  TIMESTAMP(6)
)
TABLESPACE SYSTEM
PCTUSED    40
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


DROP TABLE CHECKPOST.FITVALIDATION CASCADE CONSTRAINTS;

CREATE TABLE CHECKPOST.FITVALIDATION
(
  REG_NO              VARCHAR2(4000 BYTE),
  NAME                VARCHAR2(4000 BYTE),
  ADDR                VARCHAR2(4000 BYTE),
  DOB                 VARCHAR2(4000 BYTE),
  ENGIN_NO            VARCHAR2(4000 BYTE),
  FITNESS_ISSUE_DATE  VARCHAR2(4000 BYTE),
  REG_YEAR            VARCHAR2(4000 BYTE),
  FITNESS_EXPIRY      VARCHAR2(4000 BYTE),
  BREAK_WORKING       VARCHAR2(4000 BYTE),
  POLLUTION_FREE      VARCHAR2(4000 BYTE)
)
TABLESPACE SYSTEM
PCTUSED    40
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


DROP TABLE CHECKPOST.LICEVALIDATION CASCADE CONSTRAINTS;

CREATE TABLE CHECKPOST.LICEVALIDATION
(
  LICENSE_ID            VARCHAR2(4000 BYTE),
  NAME                  VARCHAR2(4000 BYTE),
  SON_WIFE_DAUGHTER_OF  VARCHAR2(4000 BYTE),
  ADDR                  VARCHAR2(4000 BYTE),
  DOB                   VARCHAR2(4000 BYTE),
  BLOOD_GROUP           VARCHAR2(4000 BYTE),
  VALID_FROM            VARCHAR2(4000 BYTE),
  VALID_UPTO            VARCHAR2(4000 BYTE),
  TYPE_OF_VEHICLE       VARCHAR2(4000 BYTE)
)
TABLESPACE SYSTEM
PCTUSED    40
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


ALTER TABLE CHECKPOST.MANDAL
 DROP PRIMARY KEY CASCADE;

DROP TABLE CHECKPOST.MANDAL CASCADE CONSTRAINTS;

CREATE TABLE CHECKPOST.MANDAL
(
  MANDALID  INTEGER                             NOT NULL,
  DISTID    INTEGER,
  NAME      VARCHAR2(100 BYTE),
  CODE      VARCHAR2(10 BYTE),
  ADDRESS   VARCHAR2(100 BYTE)
)
TABLESPACE SYSTEM
PCTUSED    40
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


ALTER TABLE CHECKPOST.NATIONAL_PERMIT
 DROP PRIMARY KEY CASCADE;

DROP TABLE CHECKPOST.NATIONAL_PERMIT CASCADE CONSTRAINTS;

CREATE TABLE CHECKPOST.NATIONAL_PERMIT
(
  ID             INTEGER                        NOT NULL,
  REG_ID         INTEGER,
  VALID_FROM     DATE,
  VALID_TO       DATE,
  PRINT_MATTER   VARCHAR2(4000 BYTE),
  STATUS         VARCHAR2(100 BYTE)             DEFAULT 'OPEN',
  CARRY_WEIGHT   VARCHAR2(1000 BYTE),
  REJECT_STATUS  VARCHAR2(100 BYTE),
  REJECT_DESC    VARCHAR2(4000 BYTE),
  EMP_ID         INTEGER,
  CUST_ID        INTEGER,
  NOC_CLEAR      VARCHAR2(30 BYTE),
  FITNESS_CLEAR  VARCHAR2(30 BYTE),
  CREATED_ON     TIMESTAMP(6),
  STATE_NAME     VARCHAR2(100 BYTE)
)
TABLESPACE SYSTEM
PCTUSED    40
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


DROP TABLE CHECKPOST.NOCVALIDATION CASCADE CONSTRAINTS;

CREATE TABLE CHECKPOST.NOCVALIDATION
(
  REG_NO            VARCHAR2(4000 BYTE),
  NAME              VARCHAR2(4000 BYTE),
  ADDR              VARCHAR2(4000 BYTE),
  CLASS_OF_VEHICLE  VARCHAR2(4000 BYTE),
  ENGIN_NO          VARCHAR2(4000 BYTE),
  CHASIS_NO         VARCHAR2(4000 BYTE),
  ANY_THEFT_CASE    VARCHAR2(4000 BYTE),
  TAX_PENDING       VARCHAR2(4000 BYTE),
  ISSUED_DATE       VARCHAR2(4000 BYTE)
)
TABLESPACE SYSTEM
PCTUSED    40
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


DROP TABLE CHECKPOST.PERMITVALIDATION CASCADE CONSTRAINTS;

CREATE TABLE CHECKPOST.PERMITVALIDATION
(
  REG_NO               VARCHAR2(4000 BYTE),
  NAME                 VARCHAR2(4000 BYTE),
  ADDR                 VARCHAR2(4000 BYTE),
  VEHICLE_DESCRIPTION  VARCHAR2(4000 BYTE),
  VALID_FROM           VARCHAR2(4000 BYTE),
  VALID_UPTO           VARCHAR2(4000 BYTE),
  ALLOWED_WEIGHT       VARCHAR2(4000 BYTE)
)
TABLESPACE SYSTEM
PCTUSED    40
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


DROP TABLE CHECKPOST.REGVALIDATION CASCADE CONSTRAINTS;

CREATE TABLE CHECKPOST.REGVALIDATION
(
  REG_NO            VARCHAR2(4000 BYTE),
  NAME              VARCHAR2(4000 BYTE),
  AGE               VARCHAR2(4000 BYTE),
  ADDR              VARCHAR2(4000 BYTE),
  CLASS_OF_VEHICLE  VARCHAR2(4000 BYTE),
  TYPE_OF_BODY      VARCHAR2(4000 BYTE),
  REG_DATE          VARCHAR2(4000 BYTE),
  COLOR             VARCHAR2(4000 BYTE),
  TYPE_VEHICLE      VARCHAR2(4000 BYTE),
  CHASIS_NO         VARCHAR2(4000 BYTE),
  ENGIN_NO          VARCHAR2(4000 BYTE),
  NATIONALITY       VARCHAR2(4000 BYTE)
)
TABLESPACE SYSTEM
PCTUSED    40
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


ALTER TABLE CHECKPOST.REG_VEHICLE
 DROP PRIMARY KEY CASCADE;

DROP TABLE CHECKPOST.REG_VEHICLE CASCADE CONSTRAINTS;

CREATE TABLE CHECKPOST.REG_VEHICLE
(
  ID          INTEGER                           NOT NULL,
  REG_NO      VARCHAR2(100 BYTE)                DEFAULT '0',
  OWNER_NAME  VARCHAR2(100 BYTE),
  ADDRESS     VARCHAR2(100 BYTE),
  ENG_NO      VARCHAR2(100 BYTE),
  CHASIS_NO   VARCHAR2(100 BYTE),
  BODY        VARCHAR2(100 BYTE),
  COLOR       VARCHAR2(100 BYTE),
  BRAND       VARCHAR2(100 BYTE),
  CC          VARCHAR2(100 BYTE),
  NOOFSEATS   INTEGER,
  BIKE_NAME   VARCHAR2(100 BYTE),
  DISTID      INTEGER,
  MANDALID    INTEGER,
  STATE       VARCHAR2(100 BYTE),
  COUNTRY     VARCHAR2(100 BYTE),
  CREATED_ON  TIMESTAMP(6),
  MANU_MONTH  VARCHAR2(2 BYTE),
  MANU_YEAR   VARCHAR2(4 BYTE),
  CUST_ID     INTEGER
)
TABLESPACE SYSTEM
PCTUSED    40
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


ALTER TABLE CHECKPOST.REG_VEHICLE_VALID
 DROP PRIMARY KEY CASCADE;

DROP TABLE CHECKPOST.REG_VEHICLE_VALID CASCADE CONSTRAINTS;

CREATE TABLE CHECKPOST.REG_VEHICLE_VALID
(
  ID          INTEGER                           NOT NULL,
  VALID_FROM  DATE,
  VALID_TO    DATE,
  REG_ID      VARCHAR2(100 BYTE),
  STATUS      INTEGER                           DEFAULT 0,
  EMP_ID      INTEGER,
  PHOTO_PATH  VARCHAR2(4000 BYTE),
  CREATED_ON  TIMESTAMP(6)
)
TABLESPACE SYSTEM
PCTUSED    40
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


ALTER TABLE CHECKPOST.SLOT
 DROP PRIMARY KEY CASCADE;

DROP TABLE CHECKPOST.SLOT CASCADE CONSTRAINTS;

CREATE TABLE CHECKPOST.SLOT
(
  ID          INTEGER                           NOT NULL,
  SLOT_DATE   DATE,
  SLOT_TIME   VARCHAR2(10 BYTE),
  REG_ID      INTEGER,
  EMP_ID      INTEGER,
  CREATED_ON  TIMESTAMP(6),
  FLAG        INTEGER                           DEFAULT 0,
  STATUS      VARCHAR2(100 BYTE)
)
TABLESPACE SYSTEM
PCTUSED    40
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

COMMENT ON COLUMN CHECKPOST.SLOT.FLAG IS '0-book, 1-completed, 2-transfer';

CREATE TABLE CHECKPOST.PENALITY
(
  ID             INTEGER                        NOT NULL,
  PENALITY_DATE  DATE,
  PENALITY_TIME  VARCHAR2(10 BYTE),
  FINE_AMT       FLOAT(126),
  OTHER_DESC     VARCHAR2(1000 BYTE),
  CLERK_ID       INTEGER,
  NOC            VARCHAR2(10 BYTE),
  PERMIT         VARCHAR2(10 BYTE),
  FITNESS        VARCHAR2(10 BYTE),
  REG            VARCHAR2(10 BYTE),
  OTHER          VARCHAR2(10 BYTE),
  CREATED_ON     TIMESTAMP(6),
  PAID_AMT       FLOAT(126),
  REG_NO         VARCHAR2(100 BYTE)
)
TABLESPACE SYSTEM
PCTUSED    40
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


CREATE UNIQUE INDEX CHECKPOST.PENALITY_PK ON CHECKPOST.PENALITY
(ID)
LOGGING
TABLESPACE SYSTEM
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;


CREATE UNIQUE INDEX CHECKPOST.APPLYFITNESS_PK ON CHECKPOST.APPLYFITNESS
(ID)
LOGGING
TABLESPACE SYSTEM
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;


CREATE UNIQUE INDEX CHECKPOST.APPLYNOC_PK ON CHECKPOST.APPLYNOC
(ID)
LOGGING
TABLESPACE SYSTEM
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;




CREATE UNIQUE INDEX CHECKPOST.DIST_PK ON CHECKPOST.DIST
(DISTID)
LOGGING
TABLESPACE SYSTEM
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;


CREATE UNIQUE INDEX CHECKPOST.DRIVING_LICENSE_PK ON CHECKPOST.DRIVING_LICENSE
(ID)
LOGGING
TABLESPACE SYSTEM
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;


CREATE UNIQUE INDEX CHECKPOST.DRIVING_SLOT_PK ON CHECKPOST.DRIVING_SLOT
(ID)
LOGGING
TABLESPACE SYSTEM
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;


CREATE UNIQUE INDEX CHECKPOST.EMPAUTHORIZATION_PK ON CHECKPOST.EMPAUTHORIZATION
(USER_ID)
LOGGING
TABLESPACE SYSTEM
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;


CREATE UNIQUE INDEX CHECKPOST.EMPLOYEE_PK ON CHECKPOST.EMPLOYEE
(ID)
LOGGING
TABLESPACE SYSTEM
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;


CREATE UNIQUE INDEX CHECKPOST.MANDAL_PK ON CHECKPOST.MANDAL
(MANDALID)
LOGGING
TABLESPACE SYSTEM
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;


CREATE UNIQUE INDEX CHECKPOST.NATIONAL_PERMIT_PK ON CHECKPOST.NATIONAL_PERMIT
(ID)
LOGGING
TABLESPACE SYSTEM
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;


CREATE UNIQUE INDEX CHECKPOST.REG_VEHICLE_PK ON CHECKPOST.REG_VEHICLE
(ID)
LOGGING
TABLESPACE SYSTEM
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;


CREATE UNIQUE INDEX CHECKPOST.REG_VEHICLE_VALID_PK ON CHECKPOST.REG_VEHICLE_VALID
(ID)
LOGGING
TABLESPACE SYSTEM
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;


CREATE UNIQUE INDEX CHECKPOST.SLOT_PK ON CHECKPOST.SLOT
(ID)
LOGGING
TABLESPACE SYSTEM
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;

CREATE SEQUENCE   "APPLYFITNESS_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE
/

CREATE OR REPLACE TRIGGER CHECKPOST.APPLYFITNESS_TRG
BEFORE INSERT
ON CHECKPOST.APPLYFITNESS REFERENCING NEW AS New OLD AS Old
FOR EACH ROW
DECLARE
  N NUMBER;
BEGIN
-- For Toad:  Highlight column ID
  Select APPLYFITNESS_SEQ.nextval into n from dual;
  :new.ID := N;
END APPLYFITNESS_TRG;
/

CREATE SEQUENCE   "APPLYNOC_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE
/

CREATE OR REPLACE TRIGGER CHECKPOST.APPLYNOC_TRG
BEFORE INSERT
ON CHECKPOST.APPLYNOC REFERENCING NEW AS New OLD AS Old
FOR EACH ROW
DECLARE
  N NUMBER;
BEGIN
-- For Toad:  Highlight column ID
  Select APPLYNOC_SEQ.nextval into n from dual;
  :new.ID := N;
END APPLYNOC_TRG;
/

CREATE SEQUENCE   "CUSTOMER_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE
/

CREATE OR REPLACE TRIGGER CHECKPOST.CUSTOMER_TRG
BEFORE INSERT
ON CHECKPOST.CUSTOMER REFERENCING NEW AS New OLD AS Old
FOR EACH ROW
DECLARE
  N NUMBER;
BEGIN
-- For Toad:  Highlight column CUST_ID
  Select CUSTOMER_SEQ.nextval into n from dual;
  :new.CUST_ID := N;
END CUSTOMER_TRG;
/

CREATE SEQUENCE   "DRIVING_LICENSE_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE
/

CREATE OR REPLACE TRIGGER CHECKPOST.DRIVING_LICENSE_TRG
BEFORE INSERT
ON CHECKPOST.DRIVING_LICENSE REFERENCING NEW AS New OLD AS Old
FOR EACH ROW
DECLARE
  N NUMBER;
BEGIN
-- For Toad:  Highlight column ID
  Select DRIVING_LICENSE_SEQ.nextval into n from dual;
  :new.ID := N;
END DRIVING_LICENSE_TRG;
/

CREATE SEQUENCE   "DRIVING_SLOT_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE
/

CREATE OR REPLACE TRIGGER CHECKPOST.DRIVING_SLOT_TRG
BEFORE INSERT
ON CHECKPOST.DRIVING_SLOT REFERENCING NEW AS New OLD AS Old
FOR EACH ROW
DECLARE
  N NUMBER;
BEGIN
-- For Toad:  Highlight column ID
  Select DRIVING_SLOT_SEQ.nextval into n from dual;
  :new.ID := N;
END DRIVING_SLOT_TRG;
/

CREATE SEQUENCE   "EMPLOYEE_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE
/

CREATE OR REPLACE TRIGGER CHECKPOST.EMPLOYEE_TRG
BEFORE INSERT
ON CHECKPOST.EMPLOYEE REFERENCING NEW AS New OLD AS Old
FOR EACH ROW
DECLARE
  N NUMBER;
BEGIN
-- For Toad:  Highlight column ID
  Select EMPLOYEE_SEQ.nextval into n from dual;
  :new.ID := N;
END EMPLOYEE_TRG;
/

CREATE SEQUENCE   "NATIONAL_PERMIT_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE
/

CREATE OR REPLACE TRIGGER CHECKPOST.NATIONAL_PERMIT_TRG
BEFORE INSERT
ON CHECKPOST.NATIONAL_PERMIT REFERENCING NEW AS New OLD AS Old
FOR EACH ROW
DECLARE
  N NUMBER;
BEGIN
-- For Toad:  Highlight column ID
  Select NATIONAL_PERMIT_SEQ.nextval into n from dual;
  :new.ID := N;
END NATIONAL_PERMIT_TRG;
/

CREATE SEQUENCE   "REG_VEHICLE_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE
/

CREATE OR REPLACE TRIGGER CHECKPOST.REG_VEHICLE_TRG
BEFORE INSERT
ON CHECKPOST.REG_VEHICLE REFERENCING NEW AS New OLD AS Old
FOR EACH ROW
DECLARE
  N NUMBER;
BEGIN
-- For Toad:  Highlight column ID
  Select REG_VEHICLE_SEQ.nextval into n from dual;
  :new.ID := N;
END REG_VEHICLE_TRG;
/

CREATE SEQUENCE   "REG_VEHICLE_VALID_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE
/

CREATE OR REPLACE TRIGGER CHECKPOST.REG_VEHICLE_VALID_TRG
BEFORE INSERT
ON CHECKPOST.REG_VEHICLE_VALID REFERENCING NEW AS New OLD AS Old
FOR EACH ROW
DECLARE
  N NUMBER;
BEGIN
-- For Toad:  Highlight column ID
  Select REG_VEHICLE_VALID_SEQ.nextval into n from dual;
  :new.ID := N;
END REG_VEHICLE_VALID_TRG;
/

CREATE SEQUENCE   "SLOT_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE
/

CREATE OR REPLACE TRIGGER CHECKPOST.SLOT_TRG
BEFORE INSERT
ON CHECKPOST.SLOT REFERENCING NEW AS New OLD AS Old
FOR EACH ROW
DECLARE
  N NUMBER;
BEGIN
-- For Toad:  Highlight column ID
  Select SLOT_SEQ.nextval into n from dual;
  :new.ID := N;
END SLOT_TRG;
/

CREATE SEQUENCE   "PENALITY_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE
/

CREATE OR REPLACE TRIGGER CHECKPOST.PENALITY_TRG
BEFORE INSERT
ON CHECKPOST.PENALITY REFERENCING NEW AS New OLD AS Old
FOR EACH ROW
DECLARE
  N NUMBER;
BEGIN
-- For Toad:  Highlight column ID
  Select PENALITY_SEQ.nextval into n from dual;
  :new.ID := N;
END PENALITY_TRG;
/


ALTER TABLE CHECKPOST.APPLYFITNESS ADD (
  CONSTRAINT APPLYFITNESS_PK
  PRIMARY KEY
  (ID)
  USING INDEX CHECKPOST.APPLYFITNESS_PK);

ALTER TABLE CHECKPOST.APPLYNOC ADD (
  CONSTRAINT APPLYNOC_PK
  PRIMARY KEY
  (ID)
  USING INDEX CHECKPOST.APPLYNOC_PK);

ALTER TABLE CHECKPOST.DIST ADD (
  CONSTRAINT DIST_PK
  PRIMARY KEY
  (DISTID)
  USING INDEX CHECKPOST.DIST_PK);

ALTER TABLE CHECKPOST.DRIVING_LICENSE ADD (
  CONSTRAINT DRIVING_LICENSE_PK
  PRIMARY KEY
  (ID)
  USING INDEX CHECKPOST.DRIVING_LICENSE_PK);

ALTER TABLE CHECKPOST.DRIVING_SLOT ADD (
  CONSTRAINT DRIVING_SLOT_PK
  PRIMARY KEY
  (ID)
  USING INDEX CHECKPOST.DRIVING_SLOT_PK);

ALTER TABLE CHECKPOST.EMPAUTHORIZATION ADD (
  CONSTRAINT EMPAUTHORIZATION_PK
  PRIMARY KEY
  (USER_ID)
  USING INDEX CHECKPOST.EMPAUTHORIZATION_PK);

ALTER TABLE CHECKPOST.EMPLOYEE ADD (
  CONSTRAINT EMPLOYEE_PK
  PRIMARY KEY
  (ID)
  USING INDEX CHECKPOST.EMPLOYEE_PK);

ALTER TABLE CHECKPOST.MANDAL ADD (
  CONSTRAINT MANDAL_PK
  PRIMARY KEY
  (MANDALID)
  USING INDEX CHECKPOST.MANDAL_PK);

ALTER TABLE CHECKPOST.NATIONAL_PERMIT ADD (
  CONSTRAINT NATIONAL_PERMIT_PK
  PRIMARY KEY
  (ID)
  USING INDEX CHECKPOST.NATIONAL_PERMIT_PK);

ALTER TABLE CHECKPOST.REG_VEHICLE ADD (
  CONSTRAINT REG_VEHICLE_PK
  PRIMARY KEY
  (ID)
  USING INDEX CHECKPOST.REG_VEHICLE_PK);

ALTER TABLE CHECKPOST.PENALITY ADD (
  CONSTRAINT PENALITY_PK
  PRIMARY KEY
  (ID)
  USING INDEX CHECKPOST.PENALITY_PK);

ALTER TABLE CHECKPOST.REG_VEHICLE_VALID ADD (
  CONSTRAINT REG_VEHICLE_VALID_PK
  PRIMARY KEY
  (ID)
  USING INDEX CHECKPOST.REG_VEHICLE_VALID_PK);

ALTER TABLE CHECKPOST.SLOT ADD (
  CONSTRAINT SLOT_PK
  PRIMARY KEY
  (ID)
  USING INDEX CHECKPOST.SLOT_PK);
Insert into CHECKPOST.DIST
   (DISTID, 
    NAME)
 Values
   (1, 'ADILABAD');
Insert into CHECKPOST.DIST
   (DISTID, 
    NAME)
 Values
   (2, 'ANANTAPUR');
Insert into CHECKPOST.DIST
   (DISTID, 
    NAME)
 Values
   (3, 'CHITTOOR');
Insert into CHECKPOST.DIST
   (DISTID, 
    NAME)
 Values
   (4, 'CUDDAPAH');
Insert into CHECKPOST.DIST
   (DISTID, 
    NAME)
 Values
   (5, 'EAST GODAVARI');
Insert into CHECKPOST.DIST
   (DISTID, 
    NAME)
 Values
   (6, 'GUNTUR');
Insert into CHECKPOST.DIST
   (DISTID, 
    NAME)
 Values
   (7, 'HYDERABAD');
Insert into CHECKPOST.DIST
   (DISTID, 
    NAME)
 Values
   (8, 'KARIM NAGAR');
Insert into CHECKPOST.DIST
   (DISTID, 
    NAME)
 Values
   (9, 'KHAMMAM');
Insert into CHECKPOST.DIST
   (DISTID, 
    NAME)
 Values
   (10, 'KRISHNA');
Insert into CHECKPOST.DIST
   (DISTID, 
    NAME)
 Values
   (11, 'KURNOOL');
Insert into CHECKPOST.DIST
   (DISTID, 
    NAME)
 Values
   (12, 'MAHABOOB NAGAR');
Insert into CHECKPOST.DIST
   (DISTID, 
    NAME)
 Values
   (13, 'MEDAK');
Insert into CHECKPOST.DIST
   (DISTID, 
    NAME)
 Values
   (14, 'NALGONDA');
Insert into CHECKPOST.DIST
   (DISTID, 
    NAME)
 Values
   (15, 'NELLORE');
Insert into CHECKPOST.DIST
   (DISTID, 
    NAME)
 Values
   (16, 'NIZAMABAD');
Insert into CHECKPOST.DIST
   (DISTID, 
    NAME)
 Values
   (17, 'PRAKASAM');
Insert into CHECKPOST.DIST
   (DISTID, 
    NAME)
 Values
   (18, 'RANGA REDDY');
Insert into CHECKPOST.DIST
   (DISTID, 
    NAME)
 Values
   (19, 'SRIKAKULAM');
Insert into CHECKPOST.DIST
   (DISTID, 
    NAME)
 Values
   (20, 'VIJAYANAGARAM');
Insert into CHECKPOST.DIST
   (DISTID, 
    NAME)
 Values
   (21, 'VISHAKAPATNAM');
Insert into CHECKPOST.DIST
   (DISTID, 
    NAME)
 Values
   (22, 'WARANGAL');
Insert into CHECKPOST.DIST
   (DISTID, 
    NAME)
 Values
   (23, 'WEST GODAVARI');
COMMIT;

Insert into CHECKPOST.EMPLOYEE
   (ID, 
    NAME, PASSWORD, ROLE, DISTID, MANDALID, 
    USERID, CREATED_ON)
 Values
   (1, 'Administrator', 'admin', 'Admin', 0, 
    0, 'admin', TO_TIMESTAMP('10/2/2012 12:00:00.000000 AM','fmMMfm/fmDDfm/YYYY fmHH12fm:MI:SS.FF AM'));
COMMIT;

Insert into CHECKPOST.MANDAL
   (MANDALID, 
    DISTID, NAME, CODE, ADDRESS)
 Values
   (2, 7, 'AMEERPET', 'AP010', 'Ameerpet, Near Hunmantha Rao Function Hall, RTA Office, Hyd, 50045');
Insert into CHECKPOST.MANDAL
   (MANDALID, 
    DISTID, NAME, CODE, ADDRESS)
 Values
   (1, 7, 'ABIDS', 'AP009', 'Abids RTA Office, Hyd, 50032');
COMMIT;


Insert into CHECKPOST.PENALITY
   (ID, 
    PENALITY_DATE, PENALITY_TIME, FINE_AMT, OTHER_DESC, CLERK_ID, 
    NOC, PERMIT, FITNESS, REG, OTHER, 
    CREATED_ON, PAID_AMT, REG_NO)
 Values
   (1, TO_DATE('02/17/2012 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), '20:13', 1000, 'drunk and drive', 
    22, 'YES', 'YES', 'YES', 'YES', 
    'YES', TO_TIMESTAMP('2/17/2012 4:15:56.843000 PM','fmMMfm/fmDDfm/YYYY fmHH12fm:MI:SS.FF AM'), 1000, '41');
COMMIT;