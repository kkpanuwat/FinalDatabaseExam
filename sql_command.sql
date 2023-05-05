CREATE TABLE Address
(
	address_des  VARCHAR2(100)   CONSTRAINT  address_des NULL ,
	zipcode  VARCHAR2(5)  NULL ,
	address_id  VARCHAR2(3)  NOT NULL ,
	cus_id  VARCHAR(3)  NOT NULL 
);


CREATE  UNIQUE INDEX XPKAddress ON Address
(
	address_id  ASC,
	cus_id  ASC
);


ALTER TABLE Address
	ADD CONSTRAINT  XPKAddress PRIMARY KEY (address_id,cus_id);


CREATE TABLE Catalogues
(
	catalog_id  VARCHAR2(3)  NOT NULL ,
	catalog_name  VARCHAR2(20)  NULL ,
	catalog_date  DATE  NULL 
);


CREATE  UNIQUE INDEX XPKCatalogues ON Catalogues
(
	catalog_id  ASC
);


ALTER TABLE Catalogues
	ADD CONSTRAINT  XPKCatalogues PRIMARY KEY (catalog_id);


CREATE TABLE CataloguesHaveProduct
(
	catalogues_item_id  VARCHAR2(3)  NOT NULL ,
	price  INTEGER  NULL ,
	price_member  NUMBER  NULL ,
	catalog_id  VARCHAR2(3)  NULL ,
	product_id  VARCHAR2(3)  NULL 
);


CREATE  UNIQUE INDEX XPKCataloguesHaveProduct ON CataloguesHaveProduct
(
	catalogues_item_id  ASC
);


ALTER TABLE CataloguesHaveProduct
	ADD CONSTRAINT  XPKCataloguesHaveProduct PRIMARY KEY (catalogues_item_id);


CREATE TABLE ContactItems
(
	contact_id  VARCHAR2(3)  NOT NULL ,
	contact_items_value  VARCHAR2(100)  NULL ,
	contact_type_id  VARCHAR2(3)  NOT NULL 
);


CREATE  UNIQUE INDEX XPKContactItems ON ContactItems
(
	contact_id  ASC,
	contact_type_id  ASC
);


ALTER TABLE ContactItems
	ADD CONSTRAINT  XPKContactItems PRIMARY KEY (contact_id,contact_type_id);


CREATE TABLE ContactType
(
	contact_type_id  VARCHAR2(3)  NOT NULL ,
	contact_type_name  VARCHAR2(100)  NULL 
);


CREATE  UNIQUE INDEX XPKContactType ON ContactType
(
	contact_type_id  ASC
);


ALTER TABLE ContactType
	ADD CONSTRAINT  XPKContactType PRIMARY KEY (contact_type_id);


CREATE TABLE CreditCards
(
	credit_item_id  VARCHAR2(3)  NOT NULL ,
	crad_number  VARCHAR(20)  NULL ,
	cus_id  VARCHAR(3)  NOT NULL ,
	credit_card_type_id  VARCHAR2(3)  NULL 
);


CREATE  UNIQUE INDEX XPKCreditCards ON CreditCards
(
	credit_item_id  ASC,
	cus_id  ASC
);


ALTER TABLE CreditCards
	ADD CONSTRAINT  XPKCreditCards PRIMARY KEY (credit_item_id,cus_id);


CREATE TABLE CreditCardType
(
	credit_card_type_id  VARCHAR2(3)  NOT NULL ,
	credit_card_type_name  VARCHAR2(50)  NULL 
);


CREATE  UNIQUE INDEX XPKCreditCardType ON CreditCardType
(
	credit_card_type_id  ASC
);


ALTER TABLE CreditCardType
	ADD CONSTRAINT  XPKCreditCardType PRIMARY KEY (credit_card_type_id);


CREATE TABLE Customer
(
	cus_id  VARCHAR(3)  NOT NULL ,
	full_name  VARCHAR2(200)   CONSTRAINT  FullName NULL ,
	phone  VARCHAR2(10)  NULL ,
	email  VARCHAR2(100)  NULL 
);


CREATE  UNIQUE INDEX XPKCustomer ON Customer
(
	cus_id  ASC
);


ALTER TABLE Customer
	ADD CONSTRAINT  XPKCustomer PRIMARY KEY (cus_id);


CREATE TABLE Department
(
	department_id  VARCHAR2(3)  NOT NULL ,
	department_name  VARCHAR2(100)  NULL 
);


CREATE  UNIQUE INDEX XPKDepartment ON Department
(
	department_id  ASC
);


ALTER TABLE Department
	ADD CONSTRAINT  XPKDepartment PRIMARY KEY (department_id);


CREATE TABLE Email
(
	email_id  VARCHAR2(3)  NOT NULL ,
	date_send  DATE  NULL ,
	date_receive  DATE  NULL ,
	content  VARCHAR2(500)  NULL ,
	order_id  VARCHAR2(3)  NULL 
);


CREATE  UNIQUE INDEX XPKEmail ON Email
(
	email_id  ASC
);


ALTER TABLE Email
	ADD CONSTRAINT  XPKEmail PRIMARY KEY (email_id);


CREATE TABLE OrderDetail
(
	order_detail_id  VARCHAR2(3)  NOT NULL ,
	order_id  VARCHAR2(3)  NOT NULL ,
	catalogues_item_id  VARCHAR2(3)  NOT NULL ,
	amount  INTEGER  NULL ,
	qty  INTEGER  NULL 
);


CREATE  UNIQUE INDEX XPKOrderDetail ON OrderDetail
(
	order_detail_id  ASC,
	order_id  ASC,
	catalogues_item_id  ASC
);


ALTER TABLE OrderDetail
	ADD CONSTRAINT  XPKOrderDetail PRIMARY KEY (order_detail_id,order_id,catalogues_item_id);


CREATE TABLE Orders
(
	order_id  VARCHAR2(3)  NOT NULL ,
	total  Integer  NULL ,
	disscount  INTEGER  NULL ,
	create_at  DATE  NULL ,
	update_at  DATE  NULL ,
	delete_ay  DATE  NULL ,
	contact_type_id  VARCHAR2(3)  NULL ,
	contact_id  VARCHAR2(3)  NULL ,
	cus_id  VARCHAR(3)  NULL ,
	staff_id  VARCHAR2(3)  NULL ,
	order_status_id  VARCHAR2(3)  NULL ,
	credit_item_id  VARCHAR2(3)  NULL ,
	address_id  VARCHAR2(3)  NULL ,
	shiping_id  VARCHAR2(3)  NULL 
);


CREATE  UNIQUE INDEX XPKOrder ON Orders
(
	order_id  ASC
);


ALTER TABLE Orders
	ADD CONSTRAINT  XPKOrder PRIMARY KEY (order_id);


CREATE TABLE OrderStatus
(
	order_status_id  VARCHAR2(3)  NOT NULL ,
	order_status_name  VARCHAR2(50)  NULL 
);


CREATE  UNIQUE INDEX XPKOrderStatus ON OrderStatus
(
	order_status_id  ASC
);


ALTER TABLE OrderStatus
	ADD CONSTRAINT  XPKOrderStatus PRIMARY KEY (order_status_id);


CREATE TABLE Product
(
	product_id  VARCHAR2(3)  NOT NULL ,
	product_name  VARCHAR2(20)  NULL ,
	product_dos  INTEGER  NULL ,
	description  VARCHAR2(20)  NULL ,
	product_type_id  VARCHAR2(3)  NULL 
);


CREATE  UNIQUE INDEX XPKProduct ON Product
(
	product_id  ASC
);


ALTER TABLE Product
	ADD CONSTRAINT  XPKProduct PRIMARY KEY (product_id);


CREATE TABLE ProductType
(
	product_type_id  VARCHAR2(3)  NOT NULL ,
	product_type_name  VARCHAR2(20)  NULL 
);


CREATE  UNIQUE INDEX XPKProductType ON ProductType
(
	product_type_id  ASC
);


ALTER TABLE ProductType
	ADD CONSTRAINT  XPKProductType PRIMARY KEY (product_type_id);


CREATE TABLE Shipings
(
	shiping_id  VARCHAR2(3)  NOT NULL ,
	shiping_name  VARCHAR2(50)  NULL ,
	cost  INTEGER  NULL ,
	number_of_unit  INTEGER  NULL ,
	shiping_type_id  VARCHAR2(3)  NULL ,
	shiping_rat_per_shipment  INTEGER  NULL ,
	shiping_rat_per_item  INTEGER  NULL 
);


CREATE  UNIQUE INDEX XPKShipings ON Shipings
(
	shiping_id  ASC
);


ALTER TABLE Shipings
	ADD CONSTRAINT  XPKShipings PRIMARY KEY (shiping_id);


CREATE TABLE ShipingType
(
	shiping_type_id  VARCHAR2(3)  NOT NULL ,
	shiping_type_name  VARCHAR2(100)  NULL ,
	description  VARCHAR2(500)  NULL ,
	min_date  INTEGER  NULL ,
	max_date  INTEGER  NULL 
);


CREATE  UNIQUE INDEX XPKShipingType ON ShipingType
(
	shiping_type_id  ASC
);


ALTER TABLE ShipingType
	ADD CONSTRAINT  XPKShipingType PRIMARY KEY (shiping_type_id);


CREATE TABLE Staff
(
	staff_id  VARCHAR2(3)  NOT NULL ,
	staff_name  VARCHAR2(100)  NULL ,
	salary  INTEGER  NULL ,
	department_id  VARCHAR2(3)  NULL 
);


CREATE  UNIQUE INDEX XPKStaff ON Staff
(
	staff_id  ASC
);


ALTER TABLE Staff
	ADD CONSTRAINT  XPKStaff PRIMARY KEY (staff_id);


ALTER TABLE Address
	ADD (CONSTRAINT  R_6 FOREIGN KEY (cus_id) REFERENCES Customer(cus_id));


ALTER TABLE CataloguesHaveProduct
	ADD (CONSTRAINT  R_33 FOREIGN KEY (catalog_id) REFERENCES Catalogues(catalog_id) ON DELETE SET NULL);


ALTER TABLE CataloguesHaveProduct
	ADD (CONSTRAINT  R_34 FOREIGN KEY (product_id) REFERENCES Product(product_id) ON DELETE SET NULL);


ALTER TABLE ContactItems
	ADD (CONSTRAINT  R_8 FOREIGN KEY (contact_type_id) REFERENCES ContactType(contact_type_id));


ALTER TABLE CreditCards
	ADD (CONSTRAINT  R_11 FOREIGN KEY (cus_id) REFERENCES Customer(cus_id));


ALTER TABLE CreditCards
	ADD (CONSTRAINT  R_12 FOREIGN KEY (credit_card_type_id) REFERENCES CreditCardType(credit_card_type_id) ON DELETE SET NULL);


ALTER TABLE Email
	ADD (CONSTRAINT  R_44 FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE SET NULL);


ALTER TABLE OrderDetail
	ADD (CONSTRAINT  R_31 FOREIGN KEY (order_id) REFERENCES Orders(order_id));


ALTER TABLE OrderDetail
	ADD (CONSTRAINT  R_32 FOREIGN KEY (catalogues_item_id) REFERENCES CataloguesHaveProduct(catalogues_item_id));


ALTER TABLE Orders
	ADD (CONSTRAINT  R_16 FOREIGN KEY (contact_id,contact_type_id) REFERENCES ContactItems(contact_id,contact_type_id) ON DELETE SET NULL);


ALTER TABLE Orders
	ADD (CONSTRAINT  R_30 FOREIGN KEY (cus_id) REFERENCES Customer(cus_id) ON DELETE SET NULL);


ALTER TABLE Orders
	ADD (CONSTRAINT  R_37 FOREIGN KEY (staff_id) REFERENCES Staff(staff_id) ON DELETE SET NULL);


ALTER TABLE Orders
	ADD (CONSTRAINT  R_38 FOREIGN KEY (order_status_id) REFERENCES OrderStatus(order_status_id) ON DELETE SET NULL);


ALTER TABLE Orders
	ADD (CONSTRAINT  R_39 FOREIGN KEY (credit_item_id,cus_id) REFERENCES CreditCards(credit_item_id,cus_id) ON DELETE SET NULL);


ALTER TABLE Orders
	ADD (CONSTRAINT  R_40 FOREIGN KEY (address_id,cus_id) REFERENCES Address(address_id,cus_id) ON DELETE SET NULL);


ALTER TABLE Orders
	ADD (CONSTRAINT  R_42 FOREIGN KEY (shiping_id) REFERENCES Shipings(shiping_id) ON DELETE SET NULL);


ALTER TABLE Product
	ADD (CONSTRAINT  R_6 FOREIGN KEY (product_type_id) REFERENCES ProductType(product_type_id) ON DELETE SET NULL);


ALTER TABLE Shipings
	ADD (CONSTRAINT  R_41 FOREIGN KEY (shiping_type_id) REFERENCES ShipingType(shiping_type_id) ON DELETE SET NULL);


ALTER TABLE Staff
	ADD (CONSTRAINT  R_36 FOREIGN KEY (department_id) REFERENCES Department(department_id) ON DELETE SET NULL);


CREATE  TRIGGER tI_Address BEFORE INSERT ON Address for each row
-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
-- INSERT trigger on Address 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
    /* Customer R/6 Address on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0000f21f", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Address"
    P2C_VERB_PHRASE="R/6", C2P_VERB_PHRASE="R/6", 
    FK_CONSTRAINT="R_6", FK_COLUMNS="cus_id" */
    SELECT count(*) INTO NUMROWS
      FROM Customer
      WHERE
        /* %JoinFKPK(:%New,Customer," = "," AND") */
        :new.cus_id = Customer.cus_id;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert Address because Customer does not exist.'
      );
    END IF;


-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
END;
/

CREATE  TRIGGER tD_Address AFTER DELETE ON Address for each row
-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
-- DELETE trigger on Address 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
    /* Address R/40 Orders on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="0000d5b0", PARENT_OWNER="", PARENT_TABLE="Address"
    CHILD_OWNER="", CHILD_TABLE="Orders"
    P2C_VERB_PHRASE="R/40", C2P_VERB_PHRASE="R/40", 
    FK_CONSTRAINT="R_40", FK_COLUMNS="address_id""cus_id" */
    UPDATE Orders
      SET
        /* %SetFK(Orders,NULL) */
        Orders.cus_id = NULL,
        Orders.address_id = NULL
      WHERE
        /* %JoinFKPK(Orders,:%Old," = "," AND") */
        Orders.cus_id = :old.cus_id AND
        Orders.address_id = :old.address_id;


-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
END;
/

CREATE  TRIGGER tU_Address AFTER UPDATE ON Address for each row
-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
-- UPDATE trigger on Address 
DECLARE NUMROWS INTEGER;
BEGIN
  /* Address R/40 Orders on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="000223a0", PARENT_OWNER="", PARENT_TABLE="Address"
    CHILD_OWNER="", CHILD_TABLE="Orders"
    P2C_VERB_PHRASE="R/40", C2P_VERB_PHRASE="R/40", 
    FK_CONSTRAINT="R_40", FK_COLUMNS="address_id""cus_id" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.cus_id <> :new.cus_id OR 
    :old.address_id <> :new.address_id
  THEN
    UPDATE Orders
      SET
        /* %SetFK(Orders,NULL) */
        Orders.cus_id = NULL,
        Orders.address_id = NULL
      WHERE
        /* %JoinFKPK(Orders,:%Old," = ",",") */
        Orders.cus_id = :old.cus_id AND
        Orders.address_id = :old.address_id;
  END IF;

  /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
  /* Customer R/6 Address on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Address"
    P2C_VERB_PHRASE="R/6", C2P_VERB_PHRASE="R/6", 
    FK_CONSTRAINT="R_6", FK_COLUMNS="cus_id" */
  SELECT count(*) INTO NUMROWS
    FROM Customer
    WHERE
      /* %JoinFKPK(:%New,Customer," = "," AND") */
      :new.cus_id = Customer.cus_id;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Address because Customer does not exist.'
    );
  END IF;


-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
END;
/

CREATE  TRIGGER tD_Catalogues AFTER DELETE ON Catalogues for each row
-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
-- DELETE trigger on Catalogues 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
    /* Catalogues R/33 CataloguesHaveProduct on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="0000e040", PARENT_OWNER="", PARENT_TABLE="Catalogues"
    CHILD_OWNER="", CHILD_TABLE="CataloguesHaveProduct"
    P2C_VERB_PHRASE="R/33", C2P_VERB_PHRASE="R/33", 
    FK_CONSTRAINT="R_33", FK_COLUMNS="catalog_id" */
    UPDATE CataloguesHaveProduct
      SET
        /* %SetFK(CataloguesHaveProduct,NULL) */
        CataloguesHaveProduct.catalog_id = NULL
      WHERE
        /* %JoinFKPK(CataloguesHaveProduct,:%Old," = "," AND") */
        CataloguesHaveProduct.catalog_id = :old.catalog_id;


-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
END;
/

CREATE  TRIGGER tU_Catalogues AFTER UPDATE ON Catalogues for each row
-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
-- UPDATE trigger on Catalogues 
DECLARE NUMROWS INTEGER;
BEGIN
  /* Catalogues R/33 CataloguesHaveProduct on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="00010abe", PARENT_OWNER="", PARENT_TABLE="Catalogues"
    CHILD_OWNER="", CHILD_TABLE="CataloguesHaveProduct"
    P2C_VERB_PHRASE="R/33", C2P_VERB_PHRASE="R/33", 
    FK_CONSTRAINT="R_33", FK_COLUMNS="catalog_id" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.catalog_id <> :new.catalog_id
  THEN
    UPDATE CataloguesHaveProduct
      SET
        /* %SetFK(CataloguesHaveProduct,NULL) */
        CataloguesHaveProduct.catalog_id = NULL
      WHERE
        /* %JoinFKPK(CataloguesHaveProduct,:%Old," = ",",") */
        CataloguesHaveProduct.catalog_id = :old.catalog_id;
  END IF;


-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
END;
/

CREATE  TRIGGER tI_CataloguesHaveProduct BEFORE INSERT ON CataloguesHaveProduct for each row
-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
-- INSERT trigger on CataloguesHaveProduct 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
    /* Catalogues R/33 CataloguesHaveProduct on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="00026227", PARENT_OWNER="", PARENT_TABLE="Catalogues"
    CHILD_OWNER="", CHILD_TABLE="CataloguesHaveProduct"
    P2C_VERB_PHRASE="R/33", C2P_VERB_PHRASE="R/33", 
    FK_CONSTRAINT="R_33", FK_COLUMNS="catalog_id" */
    UPDATE CataloguesHaveProduct
      SET
        /* %SetFK(CataloguesHaveProduct,NULL) */
        CataloguesHaveProduct.catalog_id = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM Catalogues
            WHERE
              /* %JoinFKPK(:%New,Catalogues," = "," AND") */
              :new.catalog_id = Catalogues.catalog_id
        ) 
        /* %JoinPKPK(CataloguesHaveProduct,:%New," = "," AND") */
         and CataloguesHaveProduct.catalogues_item_id = :new.catalogues_item_id;

    /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
    /* Product R/34 CataloguesHaveProduct on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Product"
    CHILD_OWNER="", CHILD_TABLE="CataloguesHaveProduct"
    P2C_VERB_PHRASE="R/34", C2P_VERB_PHRASE="R/34", 
    FK_CONSTRAINT="R_34", FK_COLUMNS="product_id" */
    UPDATE CataloguesHaveProduct
      SET
        /* %SetFK(CataloguesHaveProduct,NULL) */
        CataloguesHaveProduct.product_id = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM Product
            WHERE
              /* %JoinFKPK(:%New,Product," = "," AND") */
              :new.product_id = Product.product_id
        ) 
        /* %JoinPKPK(CataloguesHaveProduct,:%New," = "," AND") */
         and CataloguesHaveProduct.catalogues_item_id = :new.catalogues_item_id;


-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
END;
/

CREATE  TRIGGER tD_CataloguesHaveProduct AFTER DELETE ON CataloguesHaveProduct for each row
-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
-- DELETE trigger on CataloguesHaveProduct 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
    /* CataloguesHaveProduct R/32 OrderDetail on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00010396", PARENT_OWNER="", PARENT_TABLE="CataloguesHaveProduct"
    CHILD_OWNER="", CHILD_TABLE="OrderDetail"
    P2C_VERB_PHRASE="R/32", C2P_VERB_PHRASE="R/32", 
    FK_CONSTRAINT="R_32", FK_COLUMNS="catalogues_item_id" */
    SELECT count(*) INTO NUMROWS
      FROM OrderDetail
      WHERE
        /*  %JoinFKPK(OrderDetail,:%Old," = "," AND") */
        OrderDetail.catalogues_item_id = :old.catalogues_item_id;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete CataloguesHaveProduct because OrderDetail exists.'
      );
    END IF;


-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
END;
/

CREATE  TRIGGER tU_CataloguesHaveProduct AFTER UPDATE ON CataloguesHaveProduct for each row
-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
-- UPDATE trigger on CataloguesHaveProduct 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
  /* CataloguesHaveProduct R/32 OrderDetail on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="0003d5be", PARENT_OWNER="", PARENT_TABLE="CataloguesHaveProduct"
    CHILD_OWNER="", CHILD_TABLE="OrderDetail"
    P2C_VERB_PHRASE="R/32", C2P_VERB_PHRASE="R/32", 
    FK_CONSTRAINT="R_32", FK_COLUMNS="catalogues_item_id" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.catalogues_item_id <> :new.catalogues_item_id
  THEN
    SELECT count(*) INTO NUMROWS
      FROM OrderDetail
      WHERE
        /*  %JoinFKPK(OrderDetail,:%Old," = "," AND") */
        OrderDetail.catalogues_item_id = :old.catalogues_item_id;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update CataloguesHaveProduct because OrderDetail exists.'
      );
    END IF;
  END IF;

    /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
    /* Catalogues R/33 CataloguesHaveProduct on child update set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Catalogues"
    CHILD_OWNER="", CHILD_TABLE="CataloguesHaveProduct"
    P2C_VERB_PHRASE="R/33", C2P_VERB_PHRASE="R/33", 
    FK_CONSTRAINT="R_33", FK_COLUMNS="catalog_id" */
    UPDATE CataloguesHaveProduct
      SET
        /* %SetFK(CataloguesHaveProduct,NULL) */
        CataloguesHaveProduct.catalog_id = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM Catalogues
            WHERE
              /* %JoinFKPK(:%New,Catalogues," = "," AND") */
              :new.catalog_id = Catalogues.catalog_id
        ) 
        /* %JoinPKPK(CataloguesHaveProduct,:%New," = "," AND") */
         and CataloguesHaveProduct.catalogues_item_id = :new.catalogues_item_id;

    /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
    /* Product R/34 CataloguesHaveProduct on child update set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Product"
    CHILD_OWNER="", CHILD_TABLE="CataloguesHaveProduct"
    P2C_VERB_PHRASE="R/34", C2P_VERB_PHRASE="R/34", 
    FK_CONSTRAINT="R_34", FK_COLUMNS="product_id" */
    UPDATE CataloguesHaveProduct
      SET
        /* %SetFK(CataloguesHaveProduct,NULL) */
        CataloguesHaveProduct.product_id = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM Product
            WHERE
              /* %JoinFKPK(:%New,Product," = "," AND") */
              :new.product_id = Product.product_id
        ) 
        /* %JoinPKPK(CataloguesHaveProduct,:%New," = "," AND") */
         and CataloguesHaveProduct.catalogues_item_id = :new.catalogues_item_id;


-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
END;
/

CREATE  TRIGGER tI_ContactItems BEFORE INSERT ON ContactItems for each row
-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
-- INSERT trigger on ContactItems 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
    /* ContactType R/8 ContactItems on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0001078c", PARENT_OWNER="", PARENT_TABLE="ContactType"
    CHILD_OWNER="", CHILD_TABLE="ContactItems"
    P2C_VERB_PHRASE="R/8", C2P_VERB_PHRASE="R/8", 
    FK_CONSTRAINT="R_8", FK_COLUMNS="contact_type_id" */
    SELECT count(*) INTO NUMROWS
      FROM ContactType
      WHERE
        /* %JoinFKPK(:%New,ContactType," = "," AND") */
        :new.contact_type_id = ContactType.contact_type_id;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert ContactItems because ContactType does not exist.'
      );
    END IF;


-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
END;
/

CREATE  TRIGGER tD_ContactItems AFTER DELETE ON ContactItems for each row
-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
-- DELETE trigger on ContactItems 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
    /* ContactItems R/16 Orders on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="0000f227", PARENT_OWNER="", PARENT_TABLE="ContactItems"
    CHILD_OWNER="", CHILD_TABLE="Orders"
    P2C_VERB_PHRASE="R/16", C2P_VERB_PHRASE="R/16", 
    FK_CONSTRAINT="R_16", FK_COLUMNS="contact_id""contact_type_id" */
    UPDATE Orders
      SET
        /* %SetFK(Orders,NULL) */
        Orders.contact_type_id = NULL,
        Orders.contact_id = NULL
      WHERE
        /* %JoinFKPK(Orders,:%Old," = "," AND") */
        Orders.contact_type_id = :old.contact_type_id AND
        Orders.contact_id = :old.contact_id;


-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
END;
/

CREATE  TRIGGER tU_ContactItems AFTER UPDATE ON ContactItems for each row
-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
-- UPDATE trigger on ContactItems 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ContactItems R/16 Orders on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="0002415d", PARENT_OWNER="", PARENT_TABLE="ContactItems"
    CHILD_OWNER="", CHILD_TABLE="Orders"
    P2C_VERB_PHRASE="R/16", C2P_VERB_PHRASE="R/16", 
    FK_CONSTRAINT="R_16", FK_COLUMNS="contact_id""contact_type_id" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.contact_type_id <> :new.contact_type_id OR 
    :old.contact_id <> :new.contact_id
  THEN
    UPDATE Orders
      SET
        /* %SetFK(Orders,NULL) */
        Orders.contact_type_id = NULL,
        Orders.contact_id = NULL
      WHERE
        /* %JoinFKPK(Orders,:%Old," = ",",") */
        Orders.contact_type_id = :old.contact_type_id AND
        Orders.contact_id = :old.contact_id;
  END IF;

  /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
  /* ContactType R/8 ContactItems on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="ContactType"
    CHILD_OWNER="", CHILD_TABLE="ContactItems"
    P2C_VERB_PHRASE="R/8", C2P_VERB_PHRASE="R/8", 
    FK_CONSTRAINT="R_8", FK_COLUMNS="contact_type_id" */
  SELECT count(*) INTO NUMROWS
    FROM ContactType
    WHERE
      /* %JoinFKPK(:%New,ContactType," = "," AND") */
      :new.contact_type_id = ContactType.contact_type_id;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update ContactItems because ContactType does not exist.'
    );
  END IF;


-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
END;
/

CREATE  TRIGGER tD_ContactType AFTER DELETE ON ContactType for each row
-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
-- DELETE trigger on ContactType 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
    /* ContactType R/8 ContactItems on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0000f65d", PARENT_OWNER="", PARENT_TABLE="ContactType"
    CHILD_OWNER="", CHILD_TABLE="ContactItems"
    P2C_VERB_PHRASE="R/8", C2P_VERB_PHRASE="R/8", 
    FK_CONSTRAINT="R_8", FK_COLUMNS="contact_type_id" */
    SELECT count(*) INTO NUMROWS
      FROM ContactItems
      WHERE
        /*  %JoinFKPK(ContactItems,:%Old," = "," AND") */
        ContactItems.contact_type_id = :old.contact_type_id;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete ContactType because ContactItems exists.'
      );
    END IF;


-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
END;
/

CREATE  TRIGGER tU_ContactType AFTER UPDATE ON ContactType for each row
-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
-- UPDATE trigger on ContactType 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
  /* ContactType R/8 ContactItems on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00012abf", PARENT_OWNER="", PARENT_TABLE="ContactType"
    CHILD_OWNER="", CHILD_TABLE="ContactItems"
    P2C_VERB_PHRASE="R/8", C2P_VERB_PHRASE="R/8", 
    FK_CONSTRAINT="R_8", FK_COLUMNS="contact_type_id" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.contact_type_id <> :new.contact_type_id
  THEN
    SELECT count(*) INTO NUMROWS
      FROM ContactItems
      WHERE
        /*  %JoinFKPK(ContactItems,:%Old," = "," AND") */
        ContactItems.contact_type_id = :old.contact_type_id;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update ContactType because ContactItems exists.'
      );
    END IF;
  END IF;


-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
END;
/

CREATE  TRIGGER tI_CreditCards BEFORE INSERT ON CreditCards for each row
-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
-- INSERT trigger on CreditCards 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
    /* Customer R/11 CreditCards on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0002462a", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="CreditCards"
    P2C_VERB_PHRASE="R/11", C2P_VERB_PHRASE="R/11", 
    FK_CONSTRAINT="R_11", FK_COLUMNS="cus_id" */
    SELECT count(*) INTO NUMROWS
      FROM Customer
      WHERE
        /* %JoinFKPK(:%New,Customer," = "," AND") */
        :new.cus_id = Customer.cus_id;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert CreditCards because Customer does not exist.'
      );
    END IF;

    /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
    /* CreditCardType R/12 CreditCards on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CreditCardType"
    CHILD_OWNER="", CHILD_TABLE="CreditCards"
    P2C_VERB_PHRASE="R/12", C2P_VERB_PHRASE="R/12", 
    FK_CONSTRAINT="R_12", FK_COLUMNS="credit_card_type_id" */
    UPDATE CreditCards
      SET
        /* %SetFK(CreditCards,NULL) */
        CreditCards.credit_card_type_id = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM CreditCardType
            WHERE
              /* %JoinFKPK(:%New,CreditCardType," = "," AND") */
              :new.credit_card_type_id = CreditCardType.credit_card_type_id
        ) 
        /* %JoinPKPK(CreditCards,:%New," = "," AND") */
         and CreditCards.credit_item_id = :new.credit_item_id AND
        CreditCards.cus_id = :new.cus_id;


-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
END;
/

CREATE  TRIGGER tD_CreditCards AFTER DELETE ON CreditCards for each row
-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
-- DELETE trigger on CreditCards 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
    /* CreditCards R/39 Orders on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="0000debd", PARENT_OWNER="", PARENT_TABLE="CreditCards"
    CHILD_OWNER="", CHILD_TABLE="Orders"
    P2C_VERB_PHRASE="R/39", C2P_VERB_PHRASE="R/39", 
    FK_CONSTRAINT="R_39", FK_COLUMNS="credit_item_id""cus_id" */
    UPDATE Orders
      SET
        /* %SetFK(Orders,NULL) */
        Orders.credit_item_id = NULL,
        Orders.cus_id = NULL
      WHERE
        /* %JoinFKPK(Orders,:%Old," = "," AND") */
        Orders.credit_item_id = :old.credit_item_id AND
        Orders.cus_id = :old.cus_id;


-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
END;
/

CREATE  TRIGGER tU_CreditCards AFTER UPDATE ON CreditCards for each row
-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
-- UPDATE trigger on CreditCards 
DECLARE NUMROWS INTEGER;
BEGIN
  /* CreditCards R/39 Orders on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="00036e11", PARENT_OWNER="", PARENT_TABLE="CreditCards"
    CHILD_OWNER="", CHILD_TABLE="Orders"
    P2C_VERB_PHRASE="R/39", C2P_VERB_PHRASE="R/39", 
    FK_CONSTRAINT="R_39", FK_COLUMNS="credit_item_id""cus_id" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.credit_item_id <> :new.credit_item_id OR 
    :old.cus_id <> :new.cus_id
  THEN
    UPDATE Orders
      SET
        /* %SetFK(Orders,NULL) */
        Orders.credit_item_id = NULL,
        Orders.cus_id = NULL
      WHERE
        /* %JoinFKPK(Orders,:%Old," = ",",") */
        Orders.credit_item_id = :old.credit_item_id AND
        Orders.cus_id = :old.cus_id;
  END IF;

  /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
  /* Customer R/11 CreditCards on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="CreditCards"
    P2C_VERB_PHRASE="R/11", C2P_VERB_PHRASE="R/11", 
    FK_CONSTRAINT="R_11", FK_COLUMNS="cus_id" */
  SELECT count(*) INTO NUMROWS
    FROM Customer
    WHERE
      /* %JoinFKPK(:%New,Customer," = "," AND") */
      :new.cus_id = Customer.cus_id;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update CreditCards because Customer does not exist.'
    );
  END IF;

    /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
    /* CreditCardType R/12 CreditCards on child update set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CreditCardType"
    CHILD_OWNER="", CHILD_TABLE="CreditCards"
    P2C_VERB_PHRASE="R/12", C2P_VERB_PHRASE="R/12", 
    FK_CONSTRAINT="R_12", FK_COLUMNS="credit_card_type_id" */
    UPDATE CreditCards
      SET
        /* %SetFK(CreditCards,NULL) */
        CreditCards.credit_card_type_id = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM CreditCardType
            WHERE
              /* %JoinFKPK(:%New,CreditCardType," = "," AND") */
              :new.credit_card_type_id = CreditCardType.credit_card_type_id
        ) 
        /* %JoinPKPK(CreditCards,:%New," = "," AND") */
         and CreditCards.credit_item_id = :new.credit_item_id AND
        CreditCards.cus_id = :new.cus_id;


-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
END;
/

CREATE  TRIGGER tD_CreditCardType AFTER DELETE ON CreditCardType for each row
-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
-- DELETE trigger on CreditCardType 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
    /* CreditCardType R/12 CreditCards on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="0000e9e2", PARENT_OWNER="", PARENT_TABLE="CreditCardType"
    CHILD_OWNER="", CHILD_TABLE="CreditCards"
    P2C_VERB_PHRASE="R/12", C2P_VERB_PHRASE="R/12", 
    FK_CONSTRAINT="R_12", FK_COLUMNS="credit_card_type_id" */
    UPDATE CreditCards
      SET
        /* %SetFK(CreditCards,NULL) */
        CreditCards.credit_card_type_id = NULL
      WHERE
        /* %JoinFKPK(CreditCards,:%Old," = "," AND") */
        CreditCards.credit_card_type_id = :old.credit_card_type_id;


-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
END;
/

CREATE  TRIGGER tU_CreditCardType AFTER UPDATE ON CreditCardType for each row
-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
-- UPDATE trigger on CreditCardType 
DECLARE NUMROWS INTEGER;
BEGIN
  /* CreditCardType R/12 CreditCards on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="00010ca1", PARENT_OWNER="", PARENT_TABLE="CreditCardType"
    CHILD_OWNER="", CHILD_TABLE="CreditCards"
    P2C_VERB_PHRASE="R/12", C2P_VERB_PHRASE="R/12", 
    FK_CONSTRAINT="R_12", FK_COLUMNS="credit_card_type_id" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.credit_card_type_id <> :new.credit_card_type_id
  THEN
    UPDATE CreditCards
      SET
        /* %SetFK(CreditCards,NULL) */
        CreditCards.credit_card_type_id = NULL
      WHERE
        /* %JoinFKPK(CreditCards,:%Old," = ",",") */
        CreditCards.credit_card_type_id = :old.credit_card_type_id;
  END IF;


-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
END;
/

CREATE  TRIGGER tD_Customer AFTER DELETE ON Customer for each row
-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
-- DELETE trigger on Customer 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
    /* Customer R/6 Address on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00029957", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Address"
    P2C_VERB_PHRASE="R/6", C2P_VERB_PHRASE="R/6", 
    FK_CONSTRAINT="R_6", FK_COLUMNS="cus_id" */
    SELECT count(*) INTO NUMROWS
      FROM Address
      WHERE
        /*  %JoinFKPK(Address,:%Old," = "," AND") */
        Address.cus_id = :old.cus_id;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Customer because Address exists.'
      );
    END IF;

    /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
    /* Customer R/11 CreditCards on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="CreditCards"
    P2C_VERB_PHRASE="R/11", C2P_VERB_PHRASE="R/11", 
    FK_CONSTRAINT="R_11", FK_COLUMNS="cus_id" */
    SELECT count(*) INTO NUMROWS
      FROM CreditCards
      WHERE
        /*  %JoinFKPK(CreditCards,:%Old," = "," AND") */
        CreditCards.cus_id = :old.cus_id;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Customer because CreditCards exists.'
      );
    END IF;

    /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
    /* Customer R/30 Orders on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Orders"
    P2C_VERB_PHRASE="R/30", C2P_VERB_PHRASE="R/30", 
    FK_CONSTRAINT="R_30", FK_COLUMNS="cus_id" */
    UPDATE Orders
      SET
        /* %SetFK(Orders,NULL) */
        Orders.cus_id = NULL
      WHERE
        /* %JoinFKPK(Orders,:%Old," = "," AND") */
        Orders.cus_id = :old.cus_id;


-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
END;
/

CREATE  TRIGGER tU_Customer AFTER UPDATE ON Customer for each row
-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
-- UPDATE trigger on Customer 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
  /* Customer R/6 Address on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="0002f86a", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Address"
    P2C_VERB_PHRASE="R/6", C2P_VERB_PHRASE="R/6", 
    FK_CONSTRAINT="R_6", FK_COLUMNS="cus_id" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.cus_id <> :new.cus_id
  THEN
    SELECT count(*) INTO NUMROWS
      FROM Address
      WHERE
        /*  %JoinFKPK(Address,:%Old," = "," AND") */
        Address.cus_id = :old.cus_id;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Customer because Address exists.'
      );
    END IF;
  END IF;

  /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
  /* Customer R/11 CreditCards on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="CreditCards"
    P2C_VERB_PHRASE="R/11", C2P_VERB_PHRASE="R/11", 
    FK_CONSTRAINT="R_11", FK_COLUMNS="cus_id" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.cus_id <> :new.cus_id
  THEN
    SELECT count(*) INTO NUMROWS
      FROM CreditCards
      WHERE
        /*  %JoinFKPK(CreditCards,:%Old," = "," AND") */
        CreditCards.cus_id = :old.cus_id;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Customer because CreditCards exists.'
      );
    END IF;
  END IF;

  /* Customer R/30 Orders on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Orders"
    P2C_VERB_PHRASE="R/30", C2P_VERB_PHRASE="R/30", 
    FK_CONSTRAINT="R_30", FK_COLUMNS="cus_id" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.cus_id <> :new.cus_id
  THEN
    UPDATE Orders
      SET
        /* %SetFK(Orders,NULL) */
        Orders.cus_id = NULL
      WHERE
        /* %JoinFKPK(Orders,:%Old," = ",",") */
        Orders.cus_id = :old.cus_id;
  END IF;


-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
END;
/

CREATE  TRIGGER tD_Department AFTER DELETE ON Department for each row
-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
-- DELETE trigger on Department 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
    /* Department R/36 Staff on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="0000c16c", PARENT_OWNER="", PARENT_TABLE="Department"
    CHILD_OWNER="", CHILD_TABLE="Staff"
    P2C_VERB_PHRASE="R/36", C2P_VERB_PHRASE="R/36", 
    FK_CONSTRAINT="R_36", FK_COLUMNS="department_id" */
    UPDATE Staff
      SET
        /* %SetFK(Staff,NULL) */
        Staff.department_id = NULL
      WHERE
        /* %JoinFKPK(Staff,:%Old," = "," AND") */
        Staff.department_id = :old.department_id;


-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
END;
/

CREATE  TRIGGER tU_Department AFTER UPDATE ON Department for each row
-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
-- UPDATE trigger on Department 
DECLARE NUMROWS INTEGER;
BEGIN
  /* Department R/36 Staff on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="0000e922", PARENT_OWNER="", PARENT_TABLE="Department"
    CHILD_OWNER="", CHILD_TABLE="Staff"
    P2C_VERB_PHRASE="R/36", C2P_VERB_PHRASE="R/36", 
    FK_CONSTRAINT="R_36", FK_COLUMNS="department_id" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.department_id <> :new.department_id
  THEN
    UPDATE Staff
      SET
        /* %SetFK(Staff,NULL) */
        Staff.department_id = NULL
      WHERE
        /* %JoinFKPK(Staff,:%Old," = ",",") */
        Staff.department_id = :old.department_id;
  END IF;


-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
END;
/

CREATE  TRIGGER tI_Email BEFORE INSERT ON Email for each row
-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
-- INSERT trigger on Email 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
    /* Orders R/44 Email on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="0000e153", PARENT_OWNER="", PARENT_TABLE="Orders"
    CHILD_OWNER="", CHILD_TABLE="Email"
    P2C_VERB_PHRASE="R/44", C2P_VERB_PHRASE="R/44", 
    FK_CONSTRAINT="R_44", FK_COLUMNS="order_id" */
    UPDATE Email
      SET
        /* %SetFK(Email,NULL) */
        Email.order_id = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM Orders
            WHERE
              /* %JoinFKPK(:%New,Orders," = "," AND") */
              :new.order_id = Orders.order_id
        ) 
        /* %JoinPKPK(Email,:%New," = "," AND") */
         and Email.email_id = :new.email_id;


-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
END;
/

CREATE  TRIGGER tU_Email AFTER UPDATE ON Email for each row
-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
-- UPDATE trigger on Email 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
    /* Orders R/44 Email on child update set null */
    /* ERWIN_RELATION:CHECKSUM="0000e153", PARENT_OWNER="", PARENT_TABLE="Orders"
    CHILD_OWNER="", CHILD_TABLE="Email"
    P2C_VERB_PHRASE="R/44", C2P_VERB_PHRASE="R/44", 
    FK_CONSTRAINT="R_44", FK_COLUMNS="order_id" */
    UPDATE Email
      SET
        /* %SetFK(Email,NULL) */
        Email.order_id = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM Orders
            WHERE
              /* %JoinFKPK(:%New,Orders," = "," AND") */
              :new.order_id = Orders.order_id
        ) 
        /* %JoinPKPK(Email,:%New," = "," AND") */
         and Email.email_id = :new.email_id;


-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
END;
/

CREATE  TRIGGER tI_OrderDetail BEFORE INSERT ON OrderDetail for each row
-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
-- INSERT trigger on OrderDetail 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
    /* Orders R/31 OrderDetail on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00023fe5", PARENT_OWNER="", PARENT_TABLE="Orders"
    CHILD_OWNER="", CHILD_TABLE="OrderDetail"
    P2C_VERB_PHRASE="R/31", C2P_VERB_PHRASE="R/31", 
    FK_CONSTRAINT="R_31", FK_COLUMNS="order_id" */
    SELECT count(*) INTO NUMROWS
      FROM Orders
      WHERE
        /* %JoinFKPK(:%New,Orders," = "," AND") */
        :new.order_id = Orders.order_id;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert OrderDetail because Orders does not exist.'
      );
    END IF;

    /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
    /* CataloguesHaveProduct R/32 OrderDetail on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CataloguesHaveProduct"
    CHILD_OWNER="", CHILD_TABLE="OrderDetail"
    P2C_VERB_PHRASE="R/32", C2P_VERB_PHRASE="R/32", 
    FK_CONSTRAINT="R_32", FK_COLUMNS="catalogues_item_id" */
    SELECT count(*) INTO NUMROWS
      FROM CataloguesHaveProduct
      WHERE
        /* %JoinFKPK(:%New,CataloguesHaveProduct," = "," AND") */
        :new.catalogues_item_id = CataloguesHaveProduct.catalogues_item_id;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert OrderDetail because CataloguesHaveProduct does not exist.'
      );
    END IF;


-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
END;
/

CREATE  TRIGGER tU_OrderDetail AFTER UPDATE ON OrderDetail for each row
-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
-- UPDATE trigger on OrderDetail 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
  /* Orders R/31 OrderDetail on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00023f17", PARENT_OWNER="", PARENT_TABLE="Orders"
    CHILD_OWNER="", CHILD_TABLE="OrderDetail"
    P2C_VERB_PHRASE="R/31", C2P_VERB_PHRASE="R/31", 
    FK_CONSTRAINT="R_31", FK_COLUMNS="order_id" */
  SELECT count(*) INTO NUMROWS
    FROM Orders
    WHERE
      /* %JoinFKPK(:%New,Orders," = "," AND") */
      :new.order_id = Orders.order_id;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update OrderDetail because Orders does not exist.'
    );
  END IF;

  /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
  /* CataloguesHaveProduct R/32 OrderDetail on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CataloguesHaveProduct"
    CHILD_OWNER="", CHILD_TABLE="OrderDetail"
    P2C_VERB_PHRASE="R/32", C2P_VERB_PHRASE="R/32", 
    FK_CONSTRAINT="R_32", FK_COLUMNS="catalogues_item_id" */
  SELECT count(*) INTO NUMROWS
    FROM CataloguesHaveProduct
    WHERE
      /* %JoinFKPK(:%New,CataloguesHaveProduct," = "," AND") */
      :new.catalogues_item_id = CataloguesHaveProduct.catalogues_item_id;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update OrderDetail because CataloguesHaveProduct does not exist.'
    );
  END IF;


-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
END;
/

CREATE  TRIGGER tI_Orders BEFORE INSERT ON Orders for each row
-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
-- INSERT trigger on Orders 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
    /* ContactItems R/16 Orders on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="00079edb", PARENT_OWNER="", PARENT_TABLE="ContactItems"
    CHILD_OWNER="", CHILD_TABLE="Orders"
    P2C_VERB_PHRASE="R/16", C2P_VERB_PHRASE="R/16", 
    FK_CONSTRAINT="R_16", FK_COLUMNS="contact_id""contact_type_id" */
    UPDATE Orders
      SET
        /* %SetFK(Orders,NULL) */
        Orders.contact_type_id = NULL,
        Orders.contact_id = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM ContactItems
            WHERE
              /* %JoinFKPK(:%New,ContactItems," = "," AND") */
              :new.contact_type_id = ContactItems.contact_type_id AND
              :new.contact_id = ContactItems.contact_id
        ) 
        /* %JoinPKPK(Orders,:%New," = "," AND") */
         and Orders.order_id = :new.order_id;

    /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
    /* Customer R/30 Orders on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Orders"
    P2C_VERB_PHRASE="R/30", C2P_VERB_PHRASE="R/30", 
    FK_CONSTRAINT="R_30", FK_COLUMNS="cus_id" */
    UPDATE Orders
      SET
        /* %SetFK(Orders,NULL) */
        Orders.cus_id = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM Customer
            WHERE
              /* %JoinFKPK(:%New,Customer," = "," AND") */
              :new.cus_id = Customer.cus_id
        ) 
        /* %JoinPKPK(Orders,:%New," = "," AND") */
         and Orders.order_id = :new.order_id;

    /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
    /* Staff R/37 Orders on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Staff"
    CHILD_OWNER="", CHILD_TABLE="Orders"
    P2C_VERB_PHRASE="R/37", C2P_VERB_PHRASE="R/37", 
    FK_CONSTRAINT="R_37", FK_COLUMNS="staff_id" */
    UPDATE Orders
      SET
        /* %SetFK(Orders,NULL) */
        Orders.staff_id = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM Staff
            WHERE
              /* %JoinFKPK(:%New,Staff," = "," AND") */
              :new.staff_id = Staff.staff_id
        ) 
        /* %JoinPKPK(Orders,:%New," = "," AND") */
         and Orders.order_id = :new.order_id;

    /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
    /* OrderStatus R/38 Orders on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="OrderStatus"
    CHILD_OWNER="", CHILD_TABLE="Orders"
    P2C_VERB_PHRASE="R/38", C2P_VERB_PHRASE="R/38", 
    FK_CONSTRAINT="R_38", FK_COLUMNS="order_status_id" */
    UPDATE Orders
      SET
        /* %SetFK(Orders,NULL) */
        Orders.order_status_id = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM OrderStatus
            WHERE
              /* %JoinFKPK(:%New,OrderStatus," = "," AND") */
              :new.order_status_id = OrderStatus.order_status_id
        ) 
        /* %JoinPKPK(Orders,:%New," = "," AND") */
         and Orders.order_id = :new.order_id;

    /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
    /* CreditCards R/39 Orders on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CreditCards"
    CHILD_OWNER="", CHILD_TABLE="Orders"
    P2C_VERB_PHRASE="R/39", C2P_VERB_PHRASE="R/39", 
    FK_CONSTRAINT="R_39", FK_COLUMNS="credit_item_id""cus_id" */
    UPDATE Orders
      SET
        /* %SetFK(Orders,NULL) */
        Orders.credit_item_id = NULL,
        Orders.cus_id = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM CreditCards
            WHERE
              /* %JoinFKPK(:%New,CreditCards," = "," AND") */
              :new.credit_item_id = CreditCards.credit_item_id AND
              :new.cus_id = CreditCards.cus_id
        ) 
        /* %JoinPKPK(Orders,:%New," = "," AND") */
         and Orders.order_id = :new.order_id;

    /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
    /* Address R/40 Orders on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Address"
    CHILD_OWNER="", CHILD_TABLE="Orders"
    P2C_VERB_PHRASE="R/40", C2P_VERB_PHRASE="R/40", 
    FK_CONSTRAINT="R_40", FK_COLUMNS="address_id""cus_id" */
    UPDATE Orders
      SET
        /* %SetFK(Orders,NULL) */
        Orders.cus_id = NULL,
        Orders.address_id = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM Address
            WHERE
              /* %JoinFKPK(:%New,Address," = "," AND") */
              :new.cus_id = Address.cus_id AND
              :new.address_id = Address.address_id
        ) 
        /* %JoinPKPK(Orders,:%New," = "," AND") */
         and Orders.order_id = :new.order_id;

    /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
    /* Shipings R/42 Orders on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Shipings"
    CHILD_OWNER="", CHILD_TABLE="Orders"
    P2C_VERB_PHRASE="R/42", C2P_VERB_PHRASE="R/42", 
    FK_CONSTRAINT="R_42", FK_COLUMNS="shiping_id" */
    UPDATE Orders
      SET
        /* %SetFK(Orders,NULL) */
        Orders.shiping_id = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM Shipings
            WHERE
              /* %JoinFKPK(:%New,Shipings," = "," AND") */
              :new.shiping_id = Shipings.shiping_id
        ) 
        /* %JoinPKPK(Orders,:%New," = "," AND") */
         and Orders.order_id = :new.order_id;


-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
END;
/

CREATE  TRIGGER tD_Orders AFTER DELETE ON Orders for each row
-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
-- DELETE trigger on Orders 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
    /* Orders R/31 OrderDetail on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0001bf00", PARENT_OWNER="", PARENT_TABLE="Orders"
    CHILD_OWNER="", CHILD_TABLE="OrderDetail"
    P2C_VERB_PHRASE="R/31", C2P_VERB_PHRASE="R/31", 
    FK_CONSTRAINT="R_31", FK_COLUMNS="order_id" */
    SELECT count(*) INTO NUMROWS
      FROM OrderDetail
      WHERE
        /*  %JoinFKPK(OrderDetail,:%Old," = "," AND") */
        OrderDetail.order_id = :old.order_id;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Orders because OrderDetail exists.'
      );
    END IF;

    /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
    /* Orders R/44 Email on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Orders"
    CHILD_OWNER="", CHILD_TABLE="Email"
    P2C_VERB_PHRASE="R/44", C2P_VERB_PHRASE="R/44", 
    FK_CONSTRAINT="R_44", FK_COLUMNS="order_id" */
    UPDATE Email
      SET
        /* %SetFK(Email,NULL) */
        Email.order_id = NULL
      WHERE
        /* %JoinFKPK(Email,:%Old," = "," AND") */
        Email.order_id = :old.order_id;


-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
END;
/

CREATE  TRIGGER tU_Orders AFTER UPDATE ON Orders for each row
-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
-- UPDATE trigger on Orders 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
  /* Orders R/31 OrderDetail on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00098c11", PARENT_OWNER="", PARENT_TABLE="Orders"
    CHILD_OWNER="", CHILD_TABLE="OrderDetail"
    P2C_VERB_PHRASE="R/31", C2P_VERB_PHRASE="R/31", 
    FK_CONSTRAINT="R_31", FK_COLUMNS="order_id" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.order_id <> :new.order_id
  THEN
    SELECT count(*) INTO NUMROWS
      FROM OrderDetail
      WHERE
        /*  %JoinFKPK(OrderDetail,:%Old," = "," AND") */
        OrderDetail.order_id = :old.order_id;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Orders because OrderDetail exists.'
      );
    END IF;
  END IF;

  /* Orders R/44 Email on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Orders"
    CHILD_OWNER="", CHILD_TABLE="Email"
    P2C_VERB_PHRASE="R/44", C2P_VERB_PHRASE="R/44", 
    FK_CONSTRAINT="R_44", FK_COLUMNS="order_id" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.order_id <> :new.order_id
  THEN
    UPDATE Email
      SET
        /* %SetFK(Email,NULL) */
        Email.order_id = NULL
      WHERE
        /* %JoinFKPK(Email,:%Old," = ",",") */
        Email.order_id = :old.order_id;
  END IF;

    /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
    /* ContactItems R/16 Orders on child update set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="ContactItems"
    CHILD_OWNER="", CHILD_TABLE="Orders"
    P2C_VERB_PHRASE="R/16", C2P_VERB_PHRASE="R/16", 
    FK_CONSTRAINT="R_16", FK_COLUMNS="contact_id""contact_type_id" */
    UPDATE Orders
      SET
        /* %SetFK(Orders,NULL) */
        Orders.contact_type_id = NULL,
        Orders.contact_id = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM ContactItems
            WHERE
              /* %JoinFKPK(:%New,ContactItems," = "," AND") */
              :new.contact_type_id = ContactItems.contact_type_id AND
              :new.contact_id = ContactItems.contact_id
        ) 
        /* %JoinPKPK(Orders,:%New," = "," AND") */
         and Orders.order_id = :new.order_id;

    /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
    /* Customer R/30 Orders on child update set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Orders"
    P2C_VERB_PHRASE="R/30", C2P_VERB_PHRASE="R/30", 
    FK_CONSTRAINT="R_30", FK_COLUMNS="cus_id" */
    UPDATE Orders
      SET
        /* %SetFK(Orders,NULL) */
        Orders.cus_id = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM Customer
            WHERE
              /* %JoinFKPK(:%New,Customer," = "," AND") */
              :new.cus_id = Customer.cus_id
        ) 
        /* %JoinPKPK(Orders,:%New," = "," AND") */
         and Orders.order_id = :new.order_id;

    /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
    /* Staff R/37 Orders on child update set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Staff"
    CHILD_OWNER="", CHILD_TABLE="Orders"
    P2C_VERB_PHRASE="R/37", C2P_VERB_PHRASE="R/37", 
    FK_CONSTRAINT="R_37", FK_COLUMNS="staff_id" */
    UPDATE Orders
      SET
        /* %SetFK(Orders,NULL) */
        Orders.staff_id = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM Staff
            WHERE
              /* %JoinFKPK(:%New,Staff," = "," AND") */
              :new.staff_id = Staff.staff_id
        ) 
        /* %JoinPKPK(Orders,:%New," = "," AND") */
         and Orders.order_id = :new.order_id;

    /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
    /* OrderStatus R/38 Orders on child update set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="OrderStatus"
    CHILD_OWNER="", CHILD_TABLE="Orders"
    P2C_VERB_PHRASE="R/38", C2P_VERB_PHRASE="R/38", 
    FK_CONSTRAINT="R_38", FK_COLUMNS="order_status_id" */
    UPDATE Orders
      SET
        /* %SetFK(Orders,NULL) */
        Orders.order_status_id = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM OrderStatus
            WHERE
              /* %JoinFKPK(:%New,OrderStatus," = "," AND") */
              :new.order_status_id = OrderStatus.order_status_id
        ) 
        /* %JoinPKPK(Orders,:%New," = "," AND") */
         and Orders.order_id = :new.order_id;

    /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
    /* CreditCards R/39 Orders on child update set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CreditCards"
    CHILD_OWNER="", CHILD_TABLE="Orders"
    P2C_VERB_PHRASE="R/39", C2P_VERB_PHRASE="R/39", 
    FK_CONSTRAINT="R_39", FK_COLUMNS="credit_item_id""cus_id" */
    UPDATE Orders
      SET
        /* %SetFK(Orders,NULL) */
        Orders.credit_item_id = NULL,
        Orders.cus_id = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM CreditCards
            WHERE
              /* %JoinFKPK(:%New,CreditCards," = "," AND") */
              :new.credit_item_id = CreditCards.credit_item_id AND
              :new.cus_id = CreditCards.cus_id
        ) 
        /* %JoinPKPK(Orders,:%New," = "," AND") */
         and Orders.order_id = :new.order_id;

    /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
    /* Address R/40 Orders on child update set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Address"
    CHILD_OWNER="", CHILD_TABLE="Orders"
    P2C_VERB_PHRASE="R/40", C2P_VERB_PHRASE="R/40", 
    FK_CONSTRAINT="R_40", FK_COLUMNS="address_id""cus_id" */
    UPDATE Orders
      SET
        /* %SetFK(Orders,NULL) */
        Orders.cus_id = NULL,
        Orders.address_id = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM Address
            WHERE
              /* %JoinFKPK(:%New,Address," = "," AND") */
              :new.cus_id = Address.cus_id AND
              :new.address_id = Address.address_id
        ) 
        /* %JoinPKPK(Orders,:%New," = "," AND") */
         and Orders.order_id = :new.order_id;

    /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
    /* Shipings R/42 Orders on child update set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Shipings"
    CHILD_OWNER="", CHILD_TABLE="Orders"
    P2C_VERB_PHRASE="R/42", C2P_VERB_PHRASE="R/42", 
    FK_CONSTRAINT="R_42", FK_COLUMNS="shiping_id" */
    UPDATE Orders
      SET
        /* %SetFK(Orders,NULL) */
        Orders.shiping_id = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM Shipings
            WHERE
              /* %JoinFKPK(:%New,Shipings," = "," AND") */
              :new.shiping_id = Shipings.shiping_id
        ) 
        /* %JoinPKPK(Orders,:%New," = "," AND") */
         and Orders.order_id = :new.order_id;


-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
END;
/

CREATE  TRIGGER tD_OrderStatus AFTER DELETE ON OrderStatus for each row
-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
-- DELETE trigger on OrderStatus 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
    /* OrderStatus R/38 Orders on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="0000cca2", PARENT_OWNER="", PARENT_TABLE="OrderStatus"
    CHILD_OWNER="", CHILD_TABLE="Orders"
    P2C_VERB_PHRASE="R/38", C2P_VERB_PHRASE="R/38", 
    FK_CONSTRAINT="R_38", FK_COLUMNS="order_status_id" */
    UPDATE Orders
      SET
        /* %SetFK(Orders,NULL) */
        Orders.order_status_id = NULL
      WHERE
        /* %JoinFKPK(Orders,:%Old," = "," AND") */
        Orders.order_status_id = :old.order_status_id;


-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
END;
/

CREATE  TRIGGER tU_OrderStatus AFTER UPDATE ON OrderStatus for each row
-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
-- UPDATE trigger on OrderStatus 
DECLARE NUMROWS INTEGER;
BEGIN
  /* OrderStatus R/38 Orders on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="0000f4fe", PARENT_OWNER="", PARENT_TABLE="OrderStatus"
    CHILD_OWNER="", CHILD_TABLE="Orders"
    P2C_VERB_PHRASE="R/38", C2P_VERB_PHRASE="R/38", 
    FK_CONSTRAINT="R_38", FK_COLUMNS="order_status_id" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.order_status_id <> :new.order_status_id
  THEN
    UPDATE Orders
      SET
        /* %SetFK(Orders,NULL) */
        Orders.order_status_id = NULL
      WHERE
        /* %JoinFKPK(Orders,:%Old," = ",",") */
        Orders.order_status_id = :old.order_status_id;
  END IF;


-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
END;
/

CREATE  TRIGGER tI_Product BEFORE INSERT ON Product for each row
-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
-- INSERT trigger on Product 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
    /* ProductType R/6 Product on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="0000fcdc", PARENT_OWNER="", PARENT_TABLE="ProductType"
    CHILD_OWNER="", CHILD_TABLE="Product"
    P2C_VERB_PHRASE="R/6", C2P_VERB_PHRASE="R/6", 
    FK_CONSTRAINT="R_6", FK_COLUMNS="product_type_id" */
    UPDATE Product
      SET
        /* %SetFK(Product,NULL) */
        Product.product_type_id = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM ProductType
            WHERE
              /* %JoinFKPK(:%New,ProductType," = "," AND") */
              :new.product_type_id = ProductType.product_type_id
        ) 
        /* %JoinPKPK(Product,:%New," = "," AND") */
         and Product.product_id = :new.product_id;


-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
END;
/

CREATE  TRIGGER tD_Product AFTER DELETE ON Product for each row
-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
-- DELETE trigger on Product 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
    /* Product R/34 CataloguesHaveProduct on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="0000e4ac", PARENT_OWNER="", PARENT_TABLE="Product"
    CHILD_OWNER="", CHILD_TABLE="CataloguesHaveProduct"
    P2C_VERB_PHRASE="R/34", C2P_VERB_PHRASE="R/34", 
    FK_CONSTRAINT="R_34", FK_COLUMNS="product_id" */
    UPDATE CataloguesHaveProduct
      SET
        /* %SetFK(CataloguesHaveProduct,NULL) */
        CataloguesHaveProduct.product_id = NULL
      WHERE
        /* %JoinFKPK(CataloguesHaveProduct,:%Old," = "," AND") */
        CataloguesHaveProduct.product_id = :old.product_id;


-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
END;
/

CREATE  TRIGGER tU_Product AFTER UPDATE ON Product for each row
-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
-- UPDATE trigger on Product 
DECLARE NUMROWS INTEGER;
BEGIN
  /* Product R/34 CataloguesHaveProduct on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="00023115", PARENT_OWNER="", PARENT_TABLE="Product"
    CHILD_OWNER="", CHILD_TABLE="CataloguesHaveProduct"
    P2C_VERB_PHRASE="R/34", C2P_VERB_PHRASE="R/34", 
    FK_CONSTRAINT="R_34", FK_COLUMNS="product_id" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.product_id <> :new.product_id
  THEN
    UPDATE CataloguesHaveProduct
      SET
        /* %SetFK(CataloguesHaveProduct,NULL) */
        CataloguesHaveProduct.product_id = NULL
      WHERE
        /* %JoinFKPK(CataloguesHaveProduct,:%Old," = ",",") */
        CataloguesHaveProduct.product_id = :old.product_id;
  END IF;

    /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
    /* ProductType R/6 Product on child update set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="ProductType"
    CHILD_OWNER="", CHILD_TABLE="Product"
    P2C_VERB_PHRASE="R/6", C2P_VERB_PHRASE="R/6", 
    FK_CONSTRAINT="R_6", FK_COLUMNS="product_type_id" */
    UPDATE Product
      SET
        /* %SetFK(Product,NULL) */
        Product.product_type_id = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM ProductType
            WHERE
              /* %JoinFKPK(:%New,ProductType," = "," AND") */
              :new.product_type_id = ProductType.product_type_id
        ) 
        /* %JoinPKPK(Product,:%New," = "," AND") */
         and Product.product_id = :new.product_id;


-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
END;
/

CREATE  TRIGGER tD_ProductType AFTER DELETE ON ProductType for each row
-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
-- DELETE trigger on ProductType 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
    /* ProductType R/6 Product on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="0000bf9d", PARENT_OWNER="", PARENT_TABLE="ProductType"
    CHILD_OWNER="", CHILD_TABLE="Product"
    P2C_VERB_PHRASE="R/6", C2P_VERB_PHRASE="R/6", 
    FK_CONSTRAINT="R_6", FK_COLUMNS="product_type_id" */
    UPDATE Product
      SET
        /* %SetFK(Product,NULL) */
        Product.product_type_id = NULL
      WHERE
        /* %JoinFKPK(Product,:%Old," = "," AND") */
        Product.product_type_id = :old.product_type_id;


-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
END;
/

CREATE  TRIGGER tU_ProductType AFTER UPDATE ON ProductType for each row
-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
-- UPDATE trigger on ProductType 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ProductType R/6 Product on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="0000f1ab", PARENT_OWNER="", PARENT_TABLE="ProductType"
    CHILD_OWNER="", CHILD_TABLE="Product"
    P2C_VERB_PHRASE="R/6", C2P_VERB_PHRASE="R/6", 
    FK_CONSTRAINT="R_6", FK_COLUMNS="product_type_id" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.product_type_id <> :new.product_type_id
  THEN
    UPDATE Product
      SET
        /* %SetFK(Product,NULL) */
        Product.product_type_id = NULL
      WHERE
        /* %JoinFKPK(Product,:%Old," = ",",") */
        Product.product_type_id = :old.product_type_id;
  END IF;


-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
END;
/

CREATE  TRIGGER tI_Shipings BEFORE INSERT ON Shipings for each row
-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
-- INSERT trigger on Shipings 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
    /* ShipingType R/41 Shipings on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="000109da", PARENT_OWNER="", PARENT_TABLE="ShipingType"
    CHILD_OWNER="", CHILD_TABLE="Shipings"
    P2C_VERB_PHRASE="R/41", C2P_VERB_PHRASE="R/41", 
    FK_CONSTRAINT="R_41", FK_COLUMNS="shiping_type_id" */
    UPDATE Shipings
      SET
        /* %SetFK(Shipings,NULL) */
        Shipings.shiping_type_id = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM ShipingType
            WHERE
              /* %JoinFKPK(:%New,ShipingType," = "," AND") */
              :new.shiping_type_id = ShipingType.shiping_type_id
        ) 
        /* %JoinPKPK(Shipings,:%New," = "," AND") */
         and Shipings.shiping_id = :new.shiping_id;


-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
END;
/

CREATE  TRIGGER tD_Shipings AFTER DELETE ON Shipings for each row
-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
-- DELETE trigger on Shipings 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
    /* Shipings R/42 Orders on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="0000c112", PARENT_OWNER="", PARENT_TABLE="Shipings"
    CHILD_OWNER="", CHILD_TABLE="Orders"
    P2C_VERB_PHRASE="R/42", C2P_VERB_PHRASE="R/42", 
    FK_CONSTRAINT="R_42", FK_COLUMNS="shiping_id" */
    UPDATE Orders
      SET
        /* %SetFK(Orders,NULL) */
        Orders.shiping_id = NULL
      WHERE
        /* %JoinFKPK(Orders,:%Old," = "," AND") */
        Orders.shiping_id = :old.shiping_id;


-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
END;
/

CREATE  TRIGGER tU_Shipings AFTER UPDATE ON Shipings for each row
-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
-- UPDATE trigger on Shipings 
DECLARE NUMROWS INTEGER;
BEGIN
  /* Shipings R/42 Orders on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="000209e9", PARENT_OWNER="", PARENT_TABLE="Shipings"
    CHILD_OWNER="", CHILD_TABLE="Orders"
    P2C_VERB_PHRASE="R/42", C2P_VERB_PHRASE="R/42", 
    FK_CONSTRAINT="R_42", FK_COLUMNS="shiping_id" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.shiping_id <> :new.shiping_id
  THEN
    UPDATE Orders
      SET
        /* %SetFK(Orders,NULL) */
        Orders.shiping_id = NULL
      WHERE
        /* %JoinFKPK(Orders,:%Old," = ",",") */
        Orders.shiping_id = :old.shiping_id;
  END IF;

    /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
    /* ShipingType R/41 Shipings on child update set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="ShipingType"
    CHILD_OWNER="", CHILD_TABLE="Shipings"
    P2C_VERB_PHRASE="R/41", C2P_VERB_PHRASE="R/41", 
    FK_CONSTRAINT="R_41", FK_COLUMNS="shiping_type_id" */
    UPDATE Shipings
      SET
        /* %SetFK(Shipings,NULL) */
        Shipings.shiping_type_id = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM ShipingType
            WHERE
              /* %JoinFKPK(:%New,ShipingType," = "," AND") */
              :new.shiping_type_id = ShipingType.shiping_type_id
        ) 
        /* %JoinPKPK(Shipings,:%New," = "," AND") */
         and Shipings.shiping_id = :new.shiping_id;


-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
END;
/

CREATE  TRIGGER tD_ShipingType AFTER DELETE ON ShipingType for each row
-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
-- DELETE trigger on ShipingType 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
    /* ShipingType R/41 Shipings on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="0000ce47", PARENT_OWNER="", PARENT_TABLE="ShipingType"
    CHILD_OWNER="", CHILD_TABLE="Shipings"
    P2C_VERB_PHRASE="R/41", C2P_VERB_PHRASE="R/41", 
    FK_CONSTRAINT="R_41", FK_COLUMNS="shiping_type_id" */
    UPDATE Shipings
      SET
        /* %SetFK(Shipings,NULL) */
        Shipings.shiping_type_id = NULL
      WHERE
        /* %JoinFKPK(Shipings,:%Old," = "," AND") */
        Shipings.shiping_type_id = :old.shiping_type_id;


-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
END;
/

CREATE  TRIGGER tU_ShipingType AFTER UPDATE ON ShipingType for each row
-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
-- UPDATE trigger on ShipingType 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ShipingType R/41 Shipings on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="000101c1", PARENT_OWNER="", PARENT_TABLE="ShipingType"
    CHILD_OWNER="", CHILD_TABLE="Shipings"
    P2C_VERB_PHRASE="R/41", C2P_VERB_PHRASE="R/41", 
    FK_CONSTRAINT="R_41", FK_COLUMNS="shiping_type_id" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.shiping_type_id <> :new.shiping_type_id
  THEN
    UPDATE Shipings
      SET
        /* %SetFK(Shipings,NULL) */
        Shipings.shiping_type_id = NULL
      WHERE
        /* %JoinFKPK(Shipings,:%Old," = ",",") */
        Shipings.shiping_type_id = :old.shiping_type_id;
  END IF;


-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
END;
/

CREATE  TRIGGER tI_Staff BEFORE INSERT ON Staff for each row
-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
-- INSERT trigger on Staff 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
    /* Department R/36 Staff on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="0000f52d", PARENT_OWNER="", PARENT_TABLE="Department"
    CHILD_OWNER="", CHILD_TABLE="Staff"
    P2C_VERB_PHRASE="R/36", C2P_VERB_PHRASE="R/36", 
    FK_CONSTRAINT="R_36", FK_COLUMNS="department_id" */
    UPDATE Staff
      SET
        /* %SetFK(Staff,NULL) */
        Staff.department_id = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM Department
            WHERE
              /* %JoinFKPK(:%New,Department," = "," AND") */
              :new.department_id = Department.department_id
        ) 
        /* %JoinPKPK(Staff,:%New," = "," AND") */
         and Staff.staff_id = :new.staff_id;


-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
END;
/

CREATE  TRIGGER tD_Staff AFTER DELETE ON Staff for each row
-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
-- DELETE trigger on Staff 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
    /* Staff R/37 Orders on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="0000bae6", PARENT_OWNER="", PARENT_TABLE="Staff"
    CHILD_OWNER="", CHILD_TABLE="Orders"
    P2C_VERB_PHRASE="R/37", C2P_VERB_PHRASE="R/37", 
    FK_CONSTRAINT="R_37", FK_COLUMNS="staff_id" */
    UPDATE Orders
      SET
        /* %SetFK(Orders,NULL) */
        Orders.staff_id = NULL
      WHERE
        /* %JoinFKPK(Orders,:%Old," = "," AND") */
        Orders.staff_id = :old.staff_id;


-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
END;
/

CREATE  TRIGGER tU_Staff AFTER UPDATE ON Staff for each row
-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
-- UPDATE trigger on Staff 
DECLARE NUMROWS INTEGER;
BEGIN
  /* Staff R/37 Orders on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="0001ee92", PARENT_OWNER="", PARENT_TABLE="Staff"
    CHILD_OWNER="", CHILD_TABLE="Orders"
    P2C_VERB_PHRASE="R/37", C2P_VERB_PHRASE="R/37", 
    FK_CONSTRAINT="R_37", FK_COLUMNS="staff_id" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.staff_id <> :new.staff_id
  THEN
    UPDATE Orders
      SET
        /* %SetFK(Orders,NULL) */
        Orders.staff_id = NULL
      WHERE
        /* %JoinFKPK(Orders,:%Old," = ",",") */
        Orders.staff_id = :old.staff_id;
  END IF;

    /* ERwin Builtin Thursday, May 4, 2023 8:39:54 PM */
    /* Department R/36 Staff on child update set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Department"
    CHILD_OWNER="", CHILD_TABLE="Staff"
    P2C_VERB_PHRASE="R/36", C2P_VERB_PHRASE="R/36", 
    FK_CONSTRAINT="R_36", FK_COLUMNS="department_id" */
    UPDATE Staff
      SET
        /* %SetFK(Staff,NULL) */
        Staff.department_id = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM Department
            WHERE
              /* %JoinFKPK(:%New,Department," = "," AND") */
              :new.department_id = Department.department_id
        ) 
        /* %JoinPKPK(Staff,:%New," = "," AND") */
         and Staff.staff_id = :new.staff_id;


-- ERwin Builtin Thursday, May 4, 2023 8:39:54 PM
END;
/

