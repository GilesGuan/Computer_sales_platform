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
  companyNo           char(8)       NOT NULL,  --厂商编号
  companyName         varchar2(24)  NOT NULL,  --厂商名字
  companyAddress      varchar2(40)  NOT NULL,  --厂商地址
  companyZipCode      char(6)       NOT NULL,  --厂商邮政编码
  companyContactName  varchar2(12)  NOT NULL,  --联系人姓名
  companyContactEMail varchar2(30)  NOT NULL,  --联系人电子邮箱
  companyContactPhone char(11)      NOT NULL,  --联系人电话
  CONSTRAINT CompanyPK PRIMARY KEY (companyNo)
);

CREATE TABLE SUPPLY(
  supplyNo      char(8)       NOT NULL,  --商品编号
  companyNo     char(8)       NOT NULL,  --品牌所属公司编号
  supplyBrand   varchar2(12)  NOT NULL,  --商品品牌
  supplyCpu     varchar2(20)  NOT NULL,  --商品cpu
  supplyGpu     varchar2(30)  NOT NULL,  --商品gpu
  supplyMemory  varchar2(10)  NOT NULL,  --商品内存
  supplyHDD     varchar2(10)  NULL,		   --商品机械硬盘
  supplySSD     varchar2(10)  NULL,	     --商品固态硬盘
  supplyPrice   number(8,2)   NOT NULL,  --商品出厂价
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
  chatUserNo  char(8)      NOT NULL,  --用户账号
  chatShopNo  char(8)      NOT NULL,  --商店编号
  chatRelease char(1)      NOT NULL,  --发起方
  chatTime    timestamp    NOT NULL,  --聊天时间
  chatContent varchar2(200)NOT NULL,  --聊天内容
  CONSTRAINT ChatPK PRIMARY KEY (chatUserNo,chatShopNo,chatRelease,chatTime)
);

CREATE TABLE EVALUATE(
  evaluateUserNo  char(8)       NOT NULL, --用户账号
  evaluatePcNo    char(8)       NOT NULL, --商品编号
  evaluateShopNo  char(8)       NOT NULL, --商店编号
  evaluateTime    timestamp     NOT NULL, --评价时间
  evaluateContent varchar2(300) NOT NULL, --评价内容
  CONSTRAINT EvaluPK PRIMARY KEY (evaluateUserNo,evaluatePcNo,evaluateShopNo,evaluateTime),
  CONSTRAINT EvaluFK_USER FOREIGN KEY (evaluateUserNo) REFERENCES MYUSER (userNo),
  CONSTRAINT EvaluFK_SHOP FOREIGN KEY (evaluateShopNo) REFERENCES SHOP (shopNo),
  CONSTRAINT EvaluFK_Pc FOREIGN KEY (evaluatePcNo) REFERENCES SUPPLY (supplyNo)
);

CREATE TABLE MYORDER(
  orderNo             char(10)      NOT NULL,  --订单号
  orderUserNo         char(8)       NOT NULL,  --下单用户编号
  orderTime           timestamp     NOT NULL,  --下单时间
  orderReceiveName    varchar2(12)  NOT NULL,  --收货人姓名
  orderReceivePhone   char(11)      NOT NULL,  --收货人电话
  orderReceiveAddress varchar2(40)  NOT NULL,  --收货地址
  orderReceiveZipCode char(6)       NOT NULL,  --收货邮政编码
  orderPayMethod      varchar2(6)   NOT NULL,  --付款方式
  orderState          varchar2(10)  NOT NULL,  --订单状态
  CONSTRAINT OrderPK PRIMARY KEY (orderNo),
  CONSTRAINT OrderFK FOREIGN KEY (orderUserNo) REFERENCES MYUSER(userNo),
  CONSTRAINT OrderCK_PAY CHECK (orderPayMethod='online' or orderPayMethod='cash'),
  CONSTRAINT OrderCK_STATE CHECK (orderState='SendBack' or orderState='Delivering' or orderState='Finished')
);

CREATE TABLE SHIP(
  orderNo    char(10)  NOT NULL,  --订单编号
  shipNo     char(8)   NOT NULL,  --配送单编号
  shipDate   timestamp NOT NULL,  --配送单下单时间
  shipState  char(1)   NOT NULL,  --配送状态
  CONSTRAINT ShipPK PRIMARY KEY (shipNo),
  CONSTRAINT ShipFK FOREIGN KEY (orderNo) REFERENCES MYORDER(orderNo),
  CONSTRAINT ShipCK CHECK (shipState='0' or shipState='1')
);

CREATE TABLE TROLLEY(
  trolleyNo         char(10)  NOT NULL,  --购物车项目编号
  userNo            char(8)   NOT NULL,  --用户编号
  trolleyShopNo     char(8)   NOT NULL,  --商店编号
  trolleyPcNo       char(8)   NOT NULL,  --商品编号
  trolleyPcQuantity number(6) NOT NULL,  --购买数量
  trolleyOrderNo    char(10)  NOT NULL,  --订单号
  CONSTRAINT TroPK PRIMARY KEY (trolleyNo),
  CONSTRAINT TroFK_USER FOREIGN KEY (userNo) REFERENCES MYUSER(userNo),
  CONSTRAINT TroFK_PC   FOREIGN KEY (trolleyShopNo,trolleyPcNo) REFERENCES STOCK(stockShopNo, stockPcNo),
  CONSTRAINT TroFK_ORDER FOREIGN key (trolleyOrderNo) REFERENCES MYORDER(orderNo),
  CONSTRAINT TroCK_QUANTT CHECK (trolleyPcQuantity>0)
);







