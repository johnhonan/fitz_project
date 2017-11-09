CREATE TABLESPACE my_app_db
  DATAFILE 'my_app_db.dat' 
    SIZE 20M
  ONLINE;

CREATE TEMPORARY TABLESPACE my_app_db_tmp
  TEMPFILE 'my_app_db_tmp1.dbf'
    SIZE 5M
    AUTOEXTEND ON;
    
CREATE USER my_app_user
  IDENTIFIED BY my_password
  DEFAULT TABLESPACE my_app_db
  TEMPORARY TABLESPACE my_app_db_tmp
  QUOTA 20M on my_app_db;


CREATE TABLE my_app_user.my_table (
    empno NUMBER(5) PRIMARY KEY,
    ename VARCHAR2(15));

CREATE TABLE my_app_user.my_table (
    empno NUMBER(5) PRIMARY KEY,
    ename VARCHAR2(15));

CREATE TABLE my_app_user.my_table (
    empno NUMBER(5) PRIMARY KEY,
    ename VARCHAR2(15));
CREATE TABLE my_app_user.my_table (
    empno NUMBER(5) PRIMARY KEY,
    ename VARCHAR2(15));
CREATE TABLE my_app_user.my_table (
    empno NUMBER(5) PRIMARY KEY,
    ename VARCHAR2(15));
