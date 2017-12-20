CREATE TABLE MYUSER(
  userNo       char(8)                     NOT NULL,
  userNickname varchar2(12)                NOT NULL,
  userPassword varchar2(12)                NOT NULL,
  userBalance  number(12,2)    default  0  NOT NULL,
  userSex      char(1)                     NOT NULL,
  userBirthday date                        NOT NULL,
  useZipCode   char(6)                     NOT NULL,
  userEMail    varchar2(30)                NOT NULL,
  userPhone    char(11)                    NOT NULL,
  userAddress varchar2(40)                 NOT NULL,
  CONSTRAINT UserPK PRIMARY KEY (userNo),
  CONSTRAINT UserCK_PW CHECK (Length(userPassword) >= 6),
  --CONSTRAINT UserCK_AGE CHECK (floor(months_between(SYSDATE, userBirthday) / 12) >= 15),
  CONSTRAINT UserCK_SEX CHECK(userSex='M' or userSex='F'),
  CONSTRAINT UserCK_BL CHECK (userBalance>=0.00)
);

CREATE TABLE SHOP(
  shopNo                char(8)       NOT NULL,
  shopName              varchar2(24)  NOT NULL,
  shopPassword          varchar2(12)  NOT NULL,
  shopkeeperName        varchar2(12)  NOT NULL,
  shopkeeperSex         char(1)       NOT NULL,
  shopkeeperBirthday    date          NOT NULL,
  shopkeeperEMail       varchar2(30)  NOT NULL,
  shopPhone             char(11)      NOT NULL,
  shopAdress            varchar2(40)    NOT NULL,
  CONSTRAINT ShopPK PRIMARY KEY (shopNo),
  CONSTRAINT ShopPW CHECK (Length(shopPassword) >= 6),
 -- CONSTRAINT ShopAGE CHECK (floor(months_between(SYSDATE, shopBirthday) / 12) >= 15),
 CONSTRAINT ShopSEX CHECK (shopkeeperSex='M' or shopkeeperSex='F')
);


CREATE TABLE COMPANY(
  companyNo           char(8)       NOT NULL,  --���̱��
  companyName         varchar2(24)  NOT NULL,  --��������
  companyAddress      varchar2(40)  NOT NULL,  --���̵�ַ
  companyZipCode      char(6)       NOT NULL,  --������������
  companyContactName  varchar2(12)  NOT NULL,  --��ϵ������
  companyContactEMail varchar2(30)  NOT NULL,  --��ϵ�˵�������
  companyContactPhone char(11)      NOT NULL,  --��ϵ�˵绰
  CONSTRAINT CompanyPK PRIMARY KEY (companyNo)
);

CREATE TABLE SUPPLY(
  supplyNo      char(8)       NOT NULL,  --��Ʒ���
  companyNo     char(8)       NOT NULL,  --Ʒ��������˾���
  supplyBrand   varchar2(12)  NOT NULL,  --��ƷƷ��
  supplyCpu     varchar2(20)  NOT NULL,  --��Ʒcpu
  supplyGpu     varchar2(30)  NOT NULL,  --��Ʒgpu
  supplyMemory  varchar2(10)  NOT NULL,  --��Ʒ�ڴ�
  supplyHDD     varchar2(10)  NULL,		   --��Ʒ��еӲ��
  supplySSD     varchar2(10)  NULL,	     --��Ʒ��̬Ӳ��
  supplyPrice   number(8,2)   NOT NULL,  --��Ʒ������
  CONSTRAINT SupplyPK PRIMARY KEY (supplyNo),
  CONSTRAINT SupplyFK FOREIGN KEY (companyNo) REFERENCES COMPANY (companyNo)
);


CREATE TABLE STOCK(
  stockShopNo       char(8)                         NOT NULL,
  stockPcNo         char(8)                         NOT NULL,
  stockPcPrice      number(8,2) default  1          NOT NULL,
  stockPcNum        number(6)   default  0          NOT NULL,
  stockPcState      varchar2(7)                     NOT NULL,
  CONSTRAINT StockPK PRIMARY KEY (stockShopNo, stockPcNo),
  CONSTRAINT StockFK_shop FOREIGN KEY (stockShopNo) REFERENCES SHOP(shopNo),
  CONSTRAINT StockFK_Pc FOREIGN KEY (stockPcNo) REFERENCES SUPPLY (supplyNo),
  CONSTRAINT StockCK_NUM CHECK (stockPcNum >= 0),
  CONSTRAINT StockCK_STATE CHECK (stockPcState='OnSale' or stockPcState='Pulled' or stockPcState='SoldOut')
);


CREATE TABLE CHAT(
  chatUserNo  char(8)      NOT NULL,  --�û��˺�
  chatShopNo  char(8)      NOT NULL,  --�̵���
  chatRelease char(1)      NOT NULL,  --����
  chatTime    timestamp    NOT NULL,  --����ʱ��
  chatContent varchar2(200)NOT NULL,  --��������
  CONSTRAINT ChatPK PRIMARY KEY (chatUserNo,chatShopNo,chatRelease,chatTime)
);

CREATE TABLE EVALUATE(
  evaluateUserNo  char(8)       NOT NULL, --�û��˺�
  evaluatePcNo    char(8)       NOT NULL, --��Ʒ���
  evaluateShopNo  char(8)       NOT NULL, --�̵���
  evaluateTime    timestamp     NOT NULL, --����ʱ��
  evaluateContent varchar2(300) NOT NULL, --��������
  CONSTRAINT EvaluPK PRIMARY KEY (evaluateUserNo,evaluatePcNo,evaluateShopNo,evaluateTime),
  CONSTRAINT EvaluFK_USER FOREIGN KEY (evaluateUserNo) REFERENCES MYUSER (userNo),
  CONSTRAINT EvaluFK_SHOP FOREIGN KEY (evaluateShopNo) REFERENCES SHOP (shopNo),
  CONSTRAINT EvaluFK_Pc FOREIGN KEY (evaluatePcNo) REFERENCES SUPPLY (supplyNo)
);

CREATE TABLE MYORDER(
  orderNo             char(10)      NOT NULL,  --������
  orderUserNo         char(8)       NOT NULL,  --�µ��û����
  orderTime           timestamp     NOT NULL,  --�µ�ʱ��
  orderReceiveName    varchar2(12)  NOT NULL,  --�ջ�������
  orderReceivePhone   char(11)      NOT NULL,  --�ջ��˵绰
  orderReceiveAddress varchar2(40)  NOT NULL,  --�ջ���ַ
  orderReceiveZipCode char(6)       NOT NULL,  --�ջ���������
  orderPayMethod      varchar2(6)   NOT NULL,  --���ʽ
  orderState          varchar2(10)  NOT NULL,  --����״̬
  CONSTRAINT OrderPK PRIMARY KEY (orderNo),
  CONSTRAINT OrderFK FOREIGN KEY (orderUserNo) REFERENCES MYUSER(userNo),
  CONSTRAINT OrderCK_PAY CHECK (orderPayMethod='online' or orderPayMethod='cash'),
  CONSTRAINT OrderCK_STATE CHECK (orderState='SendBack' or orderState='Delivering' or orderState='Finished')
);

CREATE TABLE SHIP(
  orderNo    char(10)  NOT NULL,  --�������
  shipNo     char(8)   NOT NULL,  --���͵����
  shipDate   timestamp NOT NULL,  --���͵��µ�ʱ��
  shipState  char(1)   NOT NULL,  --����״̬
  CONSTRAINT ShipPK PRIMARY KEY (shipNo),
  CONSTRAINT ShipFK FOREIGN KEY (orderNo) REFERENCES MYORDER(orderNo),
  CONSTRAINT ShipCK CHECK (shipState='0' or shipState='1')
);

CREATE TABLE TROLLEY(
  trolleyNo         char(10)  NOT NULL,  --���ﳵ��Ŀ���
  userNo            char(8)   NOT NULL,  --�û����
  trolleyShopNo     char(8)   NOT NULL,  --�̵���
  trolleyPcNo       char(8)   NOT NULL,  --��Ʒ���
  trolleyPcQuantity number(6) NOT NULL,  --��������
  trolleyOrderNo    char(10)  NOT NULL,  --������
  CONSTRAINT TroPK PRIMARY KEY (trolleyNo),
  CONSTRAINT TroFK_USER FOREIGN KEY (userNo) REFERENCES MYUSER(userNo),
  CONSTRAINT TroFK_PC   FOREIGN KEY (trolleyShopNo,trolleyPcNo) REFERENCES STOCK(stockShopNo, stockPcNo),
  CONSTRAINT TroFK_ORDER FOREIGN key (trolleyOrderNo) REFERENCES MYORDER(orderNo),
  CONSTRAINT TroCK_QUANTT CHECK (trolleyPcQuantity>0)
);







