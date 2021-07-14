--<사용자 DB>
CREATE TABLE user_t (
    USERID VARCHAR2(20)PRIMARY KEY,
    USERNAME VARCHAR2(20) NOT NULL,
    PASSWORD VARCHAR2(20) NOT NULL,
    GENDER CHAR(1) CHECK(GENDER IN ('m', 'w')),
    EMAIL VARCHAR2(30),
    PHONE VARCHAR2(20),
    ADDRESS VARCHAR2(300) NOT NULL,
    REGISTERDATE DATE DEFAULT SYSDATE  
);

ALTER TABLE user_t MODIFY phone CONSTRAINT user_phone_UK UNIQUE;
ALTER TABLE user_t MODIFY address CONSTRAINT user_address_UK UNIQUE;

--<가맹점 코드, 앱 어드민 키 db생성>
CREATE TABLE shop_info (
	cid	VARCHAR2(20) NOT NULL,
	app_admin_key VARCHAR2(40) NOT NULL
);

--<상품 DB>
CREATE TABLE product_t (
    PID NUMBER(30) PRIMARY KEY,
    CATEGORY VARCHAR2(20) NOT NULL,
    PRODUCTNAME VARCHAR2(50) NOT NULL,
	PRICE NUMBER(30) DEFAULT 0,
    EXPLANATION VARCHAR2(4000),
    PICTURE_URL VARCHAR2(500),
    REGISTERDATE DATE DEFAULT SYSDATE,
    INVENTORY NUMBER(20) NOT NULL
);

ALTER TABLE product_t MODIFY productname CONSTRAINT product_productname_UK UNIQUE;
ALTER TABLE product_t MODIFY registerdate CONSTRAINT product_registerdate_NN NOT NULL;

--<장바구니 DB : 일단 생성안함>
CREATE TABLE CART_T(
    CID NUMBER(20) NOT NULL PRIMARY KEY,
    USERID VARCHAR2(20) NOT NULL,
    PID NUMBER(30) NOT NULL,
    CARTQTY NUMBER DEFAULT 0
);
    
ALTER TABLE CART_T ADD CONSTRAINT CART_USERID_FK FOREIGN KEY(USERID) REFERENCES USER_T(USERID);
ALTER TABLE CART_T ADD CONSTRAINT CART_PID_FK FOREIGN KEY(PID) REFERENCES PRODUCT_T(PID);

--<주문 DB>
CREATE TABLE order_t(
	oid VARCHAR2(40),
	tid VARCHAR2(20),
	productname VARCHAR2(50),
	qty NUMBER(30),
	totalprice NUMBER(38),
	userid VARCHAR2(20),
	address VARCHAR2(40),
	phone VARCHAR2(20),
	orderstat VARCHAR2(20),
	orderdate DATE DEFAULT SYSDATE,
	ordermemo VARCHAR2(1024),
	paymentmethod VARCHAR2(20),
	approved_at DATE
);

ALTER TABLE order_t ADD CONSTRAINT order_oid_PK PRIMARY KEY(oid);
ALTER TABLE order_t MODIFY qty CONSTRAINT order_qty_NN NOT NULL;
ALTER TABLE order_t MODIFY totalprice CONSTRAINT order_totalprice_NN NOT NULL;
ALTER TABLE order_t ADD CONSTRAINT order_userid_FK FOREIGN KEY(userid) REFERENCES user_t(userid);
ALTER TABLE order_t ADD CONSTRAINT order_address_FK FOREIGN KEY(address) REFERENCES user_t(address);
ALTER TABLE order_t ADD CONSTRAINT order_phone_FK FOREIGN KEY(phone) REFERENCES user_t(phone);
ALTER TABLE order_t MODIFY orderdate CONSTRAINT order_orderdate_NN NOT NULL;

--<상세 주문정보 DB>
CREATE TABLE order_detail(
	oid VARCHAR2(40),
	productname VARCHAR2(50),
	item_qty NUMBER(30)
);

ALTER TABLE order_detail ADD CONSTRAINT orderd_oid_FK FOREIGN KEY(oid) REFERENCES order_t(oid);
ALTER TABLE order_detail ADD CONSTRAINT orderd_productname_FK FOREIGN KEY(productname) REFERENCES product_t(productname);
ALTER TABLE order_detail MODIFY item_qty CONSTRAINT orderd_itemqty_NN NOT NULL;


--<배송정보 DB>
CREATE TABLE delivery_info(
	oid VARCHAR2(40),
	sender VARCHAR2(20),
	rec_name VARCHAR2(20),
	rec_phone	VARCHAR2(20),
	rec_address	VARCHAR2(40),
	shipping_fee NUMBER(10)
);

ALTER TABLE delivery_info ADD CONSTRAINT delivery_oid_FK FOREIGN KEY(oid) REFERENCES order_t(oid);
ALTER TABLE delivery_info MODIFY sender CONSTRAINT delivery_sender_NN NOT NULL;
ALTER TABLE delivery_info MODIFY rec_name CONSTRAINT delivery_name_NN NOT NULL;
ALTER TABLE delivery_info MODIFY rec_phone CONSTRAINT delivery_phone_NN NOT NULL;
ALTER TABLE delivery_info MODIFY rec_address CONSTRAINT delivery_address_NN NOT NULL;
ALTER TABLE delivery_info MODIFY shipping_fee CONSTRAINT delivery_fee_NN NOT NULL;

SELECT * FROM CART_T;

SELECT * FROM product_t;

SELECT * FROM user_t;

SELECT * FROM ORDER_T;
