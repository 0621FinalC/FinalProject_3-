CREATE TABLE user_t (
    userId VARCHAR2(50)PRIMARY KEY,
    userName VARCHAR2(100) NOT NULL,
    password VARCHAR2(100) NOT NULL,
    userGen CHAR(1) CHECK(userGen IN ('m', 'f')),
    userEmail VARCHAR2(30) NOT NULL,
    userPhone VARCHAR2(20),
    userAddr VARCHAR2(40) NOT NULL,
    session_key VARCHAR(50) DEFAULT 'none' NOT NULL,
    session_limt TIMESTAMP,
    REGISTERDATE TIMESTAMP DEFAULT SYSDATE NOT NULL
);