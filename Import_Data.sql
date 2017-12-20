insert into MYUSER(userNo,userNickname,userPassword,userBalance,userSex,userBirthday,useZipCode,userEMail,userPhone,userAddress)
values('15012000','普莱德','prideFA01',0,'M',to_date('20-01-1992', 'dd-mm-yyyy'),'100084','pride@FA.com','18823451234','亚美斯特里斯');

insert into MYUSER(userNo,userNickname,userPassword,userBalance,userSex,userBirthday,useZipCode,userEMail,userPhone,userAddress)
values('15012001','拉斯','wrathFA02',0,'M',to_date('20-01-1994', 'dd-mm-yyyy'),'100085','wrath@FA.com','18823451235','伊修瓦尔');

insert into MYUSER(userNo,userNickname,userPassword,userBalance,userSex,userBirthday,useZipCode,userEMail,userPhone,userAddress)
values('15012002','斯洛斯','slothFA03',0,'M',to_date('20-01-1996', 'dd-mm-yyyy'),'100086','sloth@FA.com','18823451236','新国');

insert into MYUSER(userNo,userNickname,userPassword,userBalance,userSex,userBirthday,useZipCode,userEMail,userPhone,userAddress)
values('15012003','格拉特尼','gluttonyFA04',0,'M',to_date('20-01-1998', 'dd-mm-yyyy'),'100087','gluttony@FA.com','18823451237','多拉克马');

insert into MYUSER(userNo,userNickname,userPassword,userBalance,userSex,userBirthday,useZipCode,userEMail,userPhone,userAddress)
values('15012004','拉斯特','lustFA05',0,'F',to_date('20-01-2000', 'dd-mm-yyyy'),'100088','lust@FA.com','18823451238','布里克兹');

insert into MYUSER(userNo,userNickname,userPassword,userBalance,userSex,userBirthday,useZipCode,userEMail,userPhone,userAddress)
values('15012005','恩维','envyFA06',0,'M',to_date('20-01-2002', 'dd-mm-yyyy'),'100089','envy@FA.com','18823451239','阿尔路哥');

insert into MYUSER(userNo,userNickname,userPassword,userBalance,userSex,userBirthday,useZipCode,userEMail,userPhone,userAddress)
values('15012006','格利德','greedyFA07',0,'M',to_date('20-01-2003', 'dd-mm-yyyy'),'100090','greedy@FA.com','18823451240','克塞尔克尔斯');

commit;

insert into SHOP (shopNo, shopName, shopPassword, shopkeeperName, shopkeeperSex, shopkeeperBirthday, shopkeeperEMail, shopPhone, shopAdress)
values('14012003','EdwardFA','EdwardFA01','爱德','M',to_date('20-01-2002', 'dd-mm-yyyy'),'Edward@FA.com','13012345678','亚美斯特里斯');

insert into SHOP (shopNo, shopName, shopPassword, shopkeeperName, shopkeeperSex, shopkeeperBirthday, shopkeeperEMail, shopPhone, shopAdress)
values('14012004','AlphonseFA','AlphsFA02','阿尔','M',to_date('20-01-2001', 'dd-mm-yyyy'),'Alphonse@FA.com','13012345688','伊修瓦尔');

insert into SHOP (shopNo, shopName, shopPassword, shopkeeperName, shopkeeperSex, shopkeeperBirthday, shopkeeperEMail, shopPhone, shopAdress)
values('14012005','MustangFA','MustgFA03','马斯坦','M',to_date('20-01-1998', 'dd-mm-yyyy'),'Mustang@FA.com','13012345698','布里克兹');

insert into SHOP (shopNo, shopName, shopPassword, shopkeeperName, shopkeeperSex, shopkeeperBirthday, shopkeeperEMail, shopPhone, shopAdress)
values('14012006','HawkeyeFA','HkeyeFA04','霍克艾','F',to_date('20-01-1996', 'dd-mm-yyyy'),'Hawkeye@FA.com','13012345708','伊修瓦尔');

insert into SHOP (shopNo, shopName, shopPassword, shopkeeperName, shopkeeperSex, shopkeeperBirthday, shopkeeperEMail, shopPhone, shopAdress)
values('14012007','KimbleeFA','KbleeFA05','金布利','M',to_date('20-01-2000', 'dd-mm-yyyy'),'Kimblee@FA.com','13012345718','多拉克马');

commit;


insert into COMPANY(companyNo, companyName, companyAddress, companyZipCode,companyContactName, companyContactEMail, companyContactPhone)
values('12012004','Mi','北京','100084','雷军','Leijun@mi.com','18212345678');

insert into COMPANY(companyNo, companyName, companyAddress, companyZipCode,companyContactName, companyContactEMail, companyContactPhone)
values('12012005','Lenovo','北京','100084','柳传志','Liuchuanzhi@lenovo.com','18212345679');

insert into COMPANY(companyNo, companyName, companyAddress, companyZipCode, companyContactName, companyContactEMail, companyContactPhone)
values('12012006','Apple','Califonia','C91355','Jobs','Jobs@apple.com','18212345681');

commit;



insert into SUPPLY (supplyNo,companyNo, supplyBrand, supplyCpu, supplyGpu, supplyMemory, supplyHDD, supplySSD, supplyPrice)
values('13012003','12012004','Mi','Intel Core i7-7500H','NVIDIA GeForce GTX 1080 SLI','8G','512G','','3999');

insert into SUPPLY (supplyNo,companyNo, supplyBrand, supplyCpu, supplyGpu, supplyMemory, supplyHDD, supplySSD, supplyPrice)
values('13012004','12012005','Lenovo','Intel Core i7-7200M','NVIDIA GeForce GTX 970M','4G','1T','','4999');

insert into SUPPLY (supplyNo,companyNo, supplyBrand, supplyCpu, supplyGpu, supplyMemory, supplyHDD, supplySSD, supplyPrice)
values('13012005','12012006' ,'Apple','Intel Core m3','Intel HD Graphics 615','8G','512G','','9999');

insert into SUPPLY (supplyNo,companyNo, supplyBrand, supplyCpu, supplyGpu, supplyMemory, supplyHDD, supplySSD, supplyPrice)
values('13012006','12012005','ThinkPad','Intel Core i5-7200U','NVIDIA Geforce 940MX','4G','512G','128G','6999');

commit;


insert into STOCK (stockShopNo, stockPcNo, stockPcPrice, stockPcNum, stockPcState)
values('14012003','13012003',4999,1,'OnSale');

insert into STOCK (stockShopNo, stockPcNo, stockPcPrice, stockPcNum, stockPcState)
values('14012003','13012006',7999,2,'OnSale');

insert into STOCK (stockShopNo, stockPcNo, stockPcPrice, stockPcNum, stockPcState)
values('14012004','13012004',5999,3,'OnSale');

insert into STOCK (stockShopNo, stockPcNo, stockPcPrice, stockPcNum, stockPcState)
values('14012004','13012005',11999,4,'OnSale');

insert into STOCK (stockShopNo, stockPcNo, stockPcPrice, stockPcNum, stockPcState)
values('14012005','13012005',10999,5,'OnSale');

insert into STOCK (stockShopNo, stockPcNo, stockPcPrice, stockPcNum, stockPcState)
values('14012006','13012006',7699,6,'OnSale');

insert into STOCK (stockShopNo, stockPcNo, stockPcPrice, stockPcNum, stockPcState)
values('14012006','13012003',4988,0,'SoldOut');

insert into STOCK (stockShopNo, stockPcNo, stockPcPrice, stockPcNum, stockPcState)
values('14012007','13012003',5120,5,'Pulled');

commit;


insert into CHAT (chatUserNo, chatShopNo, chatRelease, chatTime, chatContent)
values('15012000','14012003','U',to_timestamp('2017-12-20 16:58:29','yyyy-mm-dd hh24:mi:ss'),'在嘛？');

insert into CHAT (chatUserNo, chatShopNo, chatRelease, chatTime, chatContent)
values('15012000','14012003','S',to_timestamp('2017-12-20 16:59:30','yyyy-mm-dd hh24:mi:ss'),'在的在的');

commit;



insert into EVALUATE (evaluateUserNo,evaluatePcNo,evaluateShopNo,evaluateTime,evaluateContent)
values('15012001','13012003','14012003',to_timestamp('2017-12-20 16:59:30','yyyy-mm-dd hh24:mi:ss'),'物美价廉！');

insert into EVALUATE (evaluateUserNo,evaluatePcNo,evaluateShopNo,evaluateTime,evaluateContent)
values('15012003','13012006','14012006',to_timestamp('2017-12-21 17:49:20','yyyy-mm-dd hh24:mi:ss'),'很棒啊');


commit;


insert into MYORDER (orderNo,orderUserNo,orderTime,orderReceiveName,orderReceivePhone,orderReceiveAddress,orderReceiveZipCode,orderPayMethod,orderState)
values ('11012003','15012004',to_timestamp('2017-12-21 17:49:20','yyyy-mm-dd hh24:mi:ss'),'霍恩海姆','18923457861','亚美斯特里斯','100084','online','Delivering');

insert into MYORDER (orderNo,orderUserNo,orderTime,orderReceiveName,orderReceivePhone,orderReceiveAddress,orderReceiveZipCode,orderPayMethod,orderState)
values('11012004','15012006',to_timestamp('2017-2-21 17:49:20','yyyy-mm-dd hh24:mi:ss'),'温蒂','18923457851','布里克兹','100089','cash','Finished');

insert into MYORDER (orderNo,orderUserNo,orderTime,orderReceiveName,orderReceivePhone,orderReceiveAddress,orderReceiveZipCode,orderPayMethod,orderState)
values('11012005','15012002',to_timestamp('2017-12-01 17:49:20','yyyy-mm-dd hh24:mi:ss'),'斯洛斯','18923427851','布里克兹','100089','cash','SendBack');

commit;


insert into SHIP (orderNo, shipNo, shipDate, shipState)
values('11012003','10012003',to_timestamp('2017-12-22 07:39:10','yyyy-mm-dd hh24:mi:ss'), '0');

insert into SHIP (orderNo, shipNo, shipDate, shipState)
values('11012004','10012004',to_timestamp('2017-2-22 13:29:20','yyyy-mm-dd hh24:mi:ss'), '1');

commit;


insert into TROLLEY(trolleyNo, userNo, trolleyShopNo, trolleyPcNo, trolleyPcQuantity, trolleyOrderNo)
values('09012003','15012004','14012003','13012003',2,'11012004');

insert into TROLLEY(trolleyNo, userNo, trolleyShopNo, trolleyPcNo, trolleyPcQuantity, trolleyOrderNo)
values('09012004','15012004','14012003','13012006',1,'11012003');

commit;

