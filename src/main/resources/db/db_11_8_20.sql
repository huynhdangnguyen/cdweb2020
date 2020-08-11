-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: parkinglotmanagement
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer` (
  `id` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `addr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `gender` int(2) DEFAULT NULL,
  `phoneno` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `createdby` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `createddate` timestamp NULL DEFAULT NULL,
  `modifiedby` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `modifieddate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk1_customer_user` (`createdby`),
  KEY `fk2_customer_user` (`modifiedby`),
  CONSTRAINT `fk1_customer_user` FOREIGN KEY (`createdby`) REFERENCES `user` (`id`),
  CONSTRAINT `fk2_customer_user` FOREIGN KEY (`modifiedby`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('264105640','Nguyá»…n Äá»©c Long','691/7, Linh Trung, Thá»§ Äá»©c, HCM',1,'0968451361',1,NULL,NULL,NULL,NULL),('264120365','TrÆ°Æ¡ng Thanh Minh','79, Linh TÃ¢y, Thá»§ Äá»©c, HCM',1,'0966225661',0,NULL,NULL,NULL,NULL),('264186130','Táº¡ Thá»‹ Kim Anh','18C, Linh Trung, Thá»§ Äá»©c, HCM',0,'0988651512',1,NULL,NULL,NULL,NULL),('285723691','Nguyá»…n VÄƒn Ãi','197A, ÄÆ°á»ng Sá»‘ 1, Linh Trung, Thá»§ Äá»©c, HCM',1,'0906541685',1,NULL,NULL,NULL,NULL),('296705613','Nguyá»…n Thá»‹ Minh','164, An Má»¹, Thá»§ Dáº§u Má»™t, BÃ¬nh DÆ°Æ¡ng',0,'0988643579',1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_rentdetail` bigint(20) DEFAULT NULL,
  `id_customer` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `plateinimage` mediumblob,
  `faceinimage` mediumblob,
  `plateoutimage` mediumblob,
  `faceoutimage` mediumblob,
  `plateno` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `indate` timestamp NULL DEFAULT NULL,
  `outdate` timestamp NULL DEFAULT NULL,
  `price` int(10) DEFAULT NULL,
  `createdby` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_history_rentdetail_idx` (`id_rentdetail`),
  KEY `fk_history_customer` (`id_customer`),
  KEY `fk_history_user` (`createdby`),
  CONSTRAINT `fk_history_customer` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id`),
  CONSTRAINT `fk_history_rentdetail` FOREIGN KEY (`id_rentdetail`) REFERENCES `rentdetail` (`id`),
  CONSTRAINT `fk_history_user` FOREIGN KEY (`createdby`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` VALUES (1,1,'285723691',_binary 'ÿ\Øÿ\à\0JFIF\0\0`\0`\0\0ÿ\Û\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342ÿ\Û\0C			\r\r2!!22222222222222222222222222222222222222222222222222ÿÀ\0/\Ø\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁR\Ñð$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\á\â\ã\ä\å\æ\ç\è\é\êñòóôõö÷øùúÿ\Ä\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3Rðbr\Ñ\n$4\á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\â\ã\ä\å\æ\ç\è\é\êòóôõö÷øùúÿ\Ú\0\0\0?\0v\ìU{\Æÿ\0R;™\\kKœ\äB\çðªpÊ·6\áÑ—\æ\Ï\"«™-¨¤\Í8S\Z´® 98Pk—•¥šM‘\ã5\×\êvbòÜ m¬Eq“ù–w1\ØW©5phi1ñiP“‹ˆ–G=9®g\ÄP[Á¨*[mh\È85§¬k¯.!²b©ýMs.I’I>¦©šD\ÙÑ´h¯\Ë	™†\Þ\ëW†‘oi©,QzrMhxz0¶€\ã“\ÍYŠ5—_ÛŽƒ&°”½ûj\ÛZ;È˜\ÔZZ-ºs\Ë\ÍS\Óaó\ï[PÙ›2¯£h®c–%9\'\rŠ\ÐP¥=”1W;\ã-R\çE\Òà¸¶*$y¼¼‘‘\Ó5 t9â¢š5šbnŽ¥zzŠò\Çñ¶½·å¸‹þýŠ¥/<C\'\ÊoŠÿ\0º U%chÁ¢ò5µ\Ã\Â\ÝP•?ªû\É\Ò\Íq5Ü4\íºF9fõ4Š*›;aQ\Ïa!f\è+J\×Ã·3\Æ$K›=‡¹—ÿ\0­V£Ð¤Œ\á\ï\ì‡\Ñ\Éþ”\Ó:\èÒ»2Å¼˜\éR%¤\Í\ÈBki4¸ñÿ\0!s\ëŒÔ£L¶J? SJÇ©20<’\r3\È\Üqš\èÆ—b9k\Æo÷c¤\Zfœ[nû—Ï°Xu(Z79¹-£Q÷ò}*›¦\rwqøv\Ã\0ý–f÷g8¬=aô›-\ÐZZ¬“t-»!hMUX\ês£ƒV\íùªx,\Ý:Ö¶pme”0\ãŸJiœ²3õ/š\è\0ªÁp#\éZ\Z…µž¡5\ÍÕ°¹S*!\é¸ô5¥	·¿ð\ÛF\èñò„s\éMX\ç{œÿ\0™\Åm\é¾\"ºÓ­;H-\â™X·\Ú\nÿ\0¯Jš\ËÀþ\"¾Ext\ÖE#!¥p¹ü\êøøc\âi+GlŠO-\ç*Œ\å$zo„õiµ¿\rZ\Þ\ÜÓ¶\åvÊœfµ­V\Ñ4˜´=\×NŒ\ç\ÊL3z·sùÕ©9¬\Ù\È÷!\Í!§Ša\ë@\r~EBjf\éQ(Á©`Hj\'\éR“Q?J\0ª8’­/J¨G\ïEZ^”€p§ö¦S³@\çcšµ\"†¨–<P1\Ô\ÓÒ¤\ÛM+\ÅPŠ\ïŠ\åoO›®»cýZ\àWZc\ÏZ\ä\ä\çQºn\à‘@\Ð\Ò~j©«Gö›h\Óq·­]w¹öª\Z”¾E\Ôqz®ú¤6t¶6Ö—6zdûZ?µ\Æ\ÊFx/ø\â¢h\È]„ô¦X»\Ë\àû’€™4»Õ˜aùû5MzŒ·,#F\Ã.=5s]DB\0Š…ª`¤j6šˆy«š¬85:8\ÍœÞ¯\Ù<O$z„Ež7‡ôU\ß\Ûù\Ú:\Ý\'ú\ËY€ú/z+E°\Ïeò\ê‹8®\×dŠ	è­Ž•jB@ªz”v04™ÌŸ\Â=\ë\æaRJ[œw\Ô\æ$‡Ë•\Ó9\ÚH¤Zg˜ò3;žX\æ—v{.§»©\ÛM;\\ŠN¦¹ýj\É.£bTn¯­oHÕŸp»³YûVµF–g•\ÝDöó2²\ïQC˜üu\ÍvúÖ“\ä;T“¨j\åa±š\ÛQXdƒšê£ˆEn “GW¥©H‚ã¢Š½¥\Æ£s6>a…¦iŠ\n3{Ö¾•j1,›q¾CQ\Þ2žÆ¦œŽH\àÖD\0@\0)CU3!ý\Åfø—EM{C’Ì°Ió!sÙ…i\nø§q£\Ëmþë‘<¶°ŽÄ¹lþT³|8¿HÙ¿´-Y‡E\0Œ×¥»Œ\ÕI°j®lª3\Êÿ\0\á\Ô\íe\êG\Óz0\"³¦¶xdd*p\rzÓ¢º2r1\ÍrL°¼²F\Èƒ\Îi;3¶Œ›\Ð\å\ì\Ë\Å d\í\Øô5\è~¸ð\Ýò¤\ZŒb\Ò\àÿ\0#~=«œ\Zl,\äŽ9\íC\Ú\Î0\n\Õ\Â:\æ§\Ìõ\Äøy§Ì‚H‘dŒò9¤,²?w^q¢\ëºÎŒ\ëý}*ÿ\0ªc¹ü×²xS\Ä\ZÖµd¯y¤\Ä\Ë@J÷Á\Í=Lñt±¸Hóó^?qB/‡öQûŸÒ«\êzN\á\ÈMÆ£4Q\02«7°\Óx‡þ	4\ìi‹»“‡*76=³Þ¼S\Ä\Út\Ðk’Eq=\ÅÄ¤\ßq÷¹\ì)\Æ\í\à¡[ÚKy<O\â\ÉõF{m:²\Øô\à|\ïõô®V6Iù(B\æº4\Ó\Ô>Xdû\Õø\ì\ÑSp J\ÆJ\Ì\ÛJU‘‡k¢Æ¬\Üýi\Ú\Ì}’K~²>•¯su”y\éŠ\ËIÙ®Zf\ä€J|U<Þ¦?‡t$\Ö|Uƒg\ÈF-/û£­wÑ¬[\Æz ‚û±S¶\ïÿ\0]r¾œ\Ûk7º‹\ÊCn\îÀžXš\î¾\ÂÏ¤\\\ß\ÉÌ—3±$÷¦ŽJ®\Èì”š4Å§\Ó8¯q\n\ä\Ôn¸©ø¨\äÁ¤g\ëQµ3P·ZL·Je<\Òm¥`µFjR8¨›š`V?\ë*\ÊôªÃ—«\0ñSaŽ§S\æ@\r$\æ“&¤Ûš6\Ð+‘\ä\Ò§ž*=\é€Hß»oaš\ãab\æg<–c\Íuw‹Y[¦\×+n1mŸSE†‰­¸\ÜqÞ³\Ý×‰Š2\åRÆ¶,P<#\ï\Z\Ê\ÓÁ“_\Ô%\ì¬U!?Ã¸¢¹\Ö5\r\ZSò\ê/wL\ãô\'òªªó.n$$K	6òB‡[H»mÆºe\à%T].\ãþ\Ë|­ú\Z\ì¼a¤oQ\Ü»¹\á\Ç\ç\Ï\ãZ«µ`9\\\î4\Æ\'’Â¡Y´\"\ëŠAÖ†æ›º‹Ô²\Ð%Ý¼–ÏŒJ…N}\Å\Ød\Û\Ík`¹×›ÙˆÁfª0\Ë;onzÖ¬\×v\Ë\ÐkT\Ô\ZT(ƒ^hSƒ¼¤q¢>@\íR•WO\Úwy\'Š¹(\ÇJ*\ÏSÒ¥ð¢³ôª’Õ§\Î*\\\Ô{D•lgÊ›«þ%Þ¸w®†X\Æ+\nðnj\Ów;¡²Ö–?r\ÃÞºK	\n§®I®{O\\ \Çz\ê,¢X=\ëÒ\ÄÙ›z\ÇJZN”U6fJ:Uy_\êLüµRc@\ì1\æ\æ«\É1¢OZ©,œ\Z²\â+\Ü¯=i\îÎ§q7”\åŒHQ\ÐfºË‹‚»ŽzV]ƒŸ.øŒd\Ä\ÄP‘\ÝCGrÎš\î#”\í20\åjM\ß>\nñPx¥·ñ%\Ï\ï\æHŽGº)ª\Ñ\Ï#7.MmõRg¡ü5³‚\ï\Æd…]#œ2\ÈÖ½\Å#]¨¡G \åŸmûò>e\Ä@þµêƒšU%s\çø†³–1Á=’@\ry\ç\Å-67†\ÇS)…„²»(õgÚ½\n¨k\Úbk:åƒõ±¡\ìja+3\ÎÀb>¯‰…O3\ç[ûˆ£›võ\Új´š­´p‚®C\ÑEg_F\ÑH\Ñ?ú\Äb­õVr(ój¯#\ì±\ÔcbÌ’=\Ä\ä·$œ\àS£\Ç:³)\nzlGl\èG­\\Õ¤0\Û	Gðœš£\æª\è\ìCÿ\0§v­uk$>\\¤¬\Ø8ô¯O\Ðl¿²t{k,‚c_˜^õƒ\á\ÛÁq§G†\È\rt°dŒU_CAjJŠ4CJÁÁ\Æ\r#™!\å…D\í\Å5˜ƒ‚i¬x¤\Ça¬\ÕIL=h””1\â£\Üh\Ì\Õ\É¥&R\rRcúCÖ†\Æ6—q¤=)¹¤\êx¥=*·˜À\à\Z—w\nÀ\ÕriY\Îi¹\æšžªvisœ\àm\Ås©òÛ§©\æ·5ù\n\é…\0û\ì¬|‘}1¢\å \"1“Yz2Iy7wl“\åÀ\ç\Ñò¬\í	Ji\çpÁ\É?­\Ýa\n˜¦UZöýv\Íu\r\Ø_‘û\Ñ±#\Ñ\Ôú×Ž^\Ûý£N˜žª2+\Ø<\rsý­ðò\ÄK$FõRqúb´Œ­`<\Ñ\×nF9JU&·5ˆ<‹ùgš\Êu¢j\ÌLÎb¡«S\'5QÁŠD’ ô¢¡˜5ÐŽ—~\çc\ïUn‡\ËR\Æ~je\×\Ý5ò\Ñm½Nœþ£y%š£Bû_wZ\×\Òu4Ô­¾b\Ë÷‡¯½sz\ç;G¥d[\ÜMg2\Í\êk\Úúº«E[s¾„´G¢º\ÔEj\r/W·\Õ-À\ÈIÀù\Õâ˜¯¤e\ã#±jgÝ©òŽ:\ÖÂš\è\ïùYµ…r¹ÛW´.iq\ï\n+¨„lŒXZ`Ç“]Ðª+¾=L˜\ÊZi\ëM\ÍUˆ$$bªKR¹ùj¹>´\ì4E\'Ý®O^×“M¸[tPò°\ÜA\ì+©¸—Šó\ßY¼—bù9v0ô÷ªF\ÔÖ¡.².c\Ï*\ÝÖ¬\éN^+\Ã\ënøü«–Œ\ã\ë]N„2²X\Ø~†©-Nøh?]Ÿ\ÏÕ„¹\Î\ëxN\à\0JŽ\ß\æS.—Ì½€\â·O\åVRµLö°uùUŽ\ÓÁ6—\Âo$R\Ûùö3°gQ\Ã)õ¿Jõý/\ÇÕ¡ó \Ôc±–Žcµ—ó¯´n-ºa\à\ÔFÑ—8Á9¥\'ubrœ.9ûKò\Èú\"÷\Åþ\Ó\ã\Ýq«[ûm\Äþ¼\Ó\Å.5&±\Ð\ãkkwZ\å\Î$a\ì;W-\'n‘V\"Ò¶ü\Ó6O§jÉµÐŠ.z™ùÿ\0‘‰,MŒöª›z\×Ô£ò\ä:UGˆª\æˆ\ÇBq¸…-\Ëx÷ÎƒÞ›â—‘R\áü\Õb\Ïþ>\ëQø\Â>\"q\Ó?Òª\Ç\ÏTÜ“M¼º\Ñô)³¤žK\\ô â¢—\ÆZ\Üðùfh¢¼#ó§xwO¸ºÓ˜¡‰’S·l\Ç\nk}>Oy\âl­<4[Hå®r_\Ûz‹½õ\Ãg\ÖCO]fðne?W5\×\Åð¥ø2\ë+ôHúõ~?…ºZ¨j7N{\íP;¤f\ìsž	»¾¼ñR(i¥bo4\ä•^8\Ízsq\ÅE§i:Ÿ\ÙôøDj~ó¼\ÇÔš˜ô¬Ù‹c)‡­IŠLR$‰‡\rNÃŠf\Ú`EIS¨È¤ÀJCHÔ©\r2ŸE0F\ìR•¨eÊž)!#¨2wSZ\\\Z–\ÍU„dk²fb\Ç%‹Ê²”\æu¥®ÿ\0\Ç\Ô`v“N ‹\ëš‹\Þ,\ß\ÝqPZ\'—`¾õ>¤1h­0|¶ÑjC$Œî¢oº\Ã»ƒšŽ\ë-SIbso(•ô<\Ô~µÃ Á\Íjü?¿þ\Îø—\ä1\";øŠc¶z\ÔV‰]\n\æ÷Š ÙªH\Ø\Ç\ÌAþu\Î:\×o\ã{R·¬ù\á\ãøŽ\rq,*ªtbe)“š£\"bµXqU%Z‹’g€wQS´cµ\\FÂŒ\ZeÀùk.\Û\Äv÷-µ88\î+/[ñ]½¾\èU\ËM\ÝTW\ÏF…G+X\ã\äm•µ©\Üm$u¬†‘qU¡ž[’óJ.r©K.\0æ¾‡O’š‹:à¬¬ÅŽúKI–hl‹\Ð\×£\ë–Ú½¢ôK¥<Ö¼\É\ã’6ù†*{[Û>\æ;«vÃ©\ï\Ð\Ö8¼\"­­Î˜NÇ¤\êX\Ø~é¿`\ßL¨zŠ¼šòkV12§–W\ï®Š¹\ÍMÉ\×=q\á):wL¹;žŠXÛ¹8ók{ ¨Á®_N\r%…²@XÀ\â·-\ÉH‚“Ò»-¡•\ÉÛ­6šd\â¢2P‰$üµNG¥‘òµBf\äóL¤6\â_”\\®¨ÙÑ»ŠÝ\ë›\Õ_\æ4Ñ¼Ž{\È\nýk Ñ›jœzùŠ\Âv\æ¶4c\Èú\Õ&vFZjYr\ëOgþ+}¿‘­o$H„Ú´4\ß\Üø†\Ò\Ö\ìÝ¥¬qªYr[š\ê\í>Eú\Í]û±U6“5h§«89±º>\ã­n\Ûx{S\Ô-\Ö{H#h\Éû\Ì\àWSiðóAŠró^^9\'\'*é­¼+\áhcUE€þ\ïY7©\Õ,\ÍS^\é\ç±øGY™\ÍGûõKU\Ó.´\Èk‰\íKm\Û™\"½qto*\íM08÷j¼ú.’ùT\Ñ\í½ƒñ \ËûY\Íê¿¯¼ðKÂ²Ü˜qP]\ác\ê1^\èþ¶PX\é6H;1E¨\ßÃ‘?\ÐlÀö‰Â©6cWjxFŸ‡ºÀ9«)Aö(\ì\ãùW¥ø§\Ã\ÐAh\Òýž]r´J8õ\ÅyŸŠn h!‰dV‘ˆ8µY\È\ç\Ìô¢kz}ž€ö³\ÄZP[aÖº}3Y:®\è\n‘\Ï ×šÁl|\ånÀ\×m§\\§”±“ƒšm\ÏS®\ÄhN\Ó\ëZjk7ð\â¸[¡\å\Ê$\rm\é³\î*\Z1h\ê‰)*;~TUœf‚\n\ÅqQžµe’¢e\æ€!4dzS\ÊñM\Ù@	\Æ*&^*\Æ\Þ)…h«\nfqS²\ÔE9¤AÉ©3Öš©ƒRƒHcvzT \ïVÁªZ‹˜\í÷¯Piœ\ìÁŽ\à@\ÍXZ¯u\ç\ÜXŠ_#%AÁ55³±·zmp¼¯¥Pº›o\Ôž˜ªv?=\è=\Æi\×™n¦\'ª“š~‹o<¯;\Ä\ãz‹4597$HGzd\Ü\"/ ¨giLÈ“.\Ö¥Kpz¢¥ŒycŠÌ¼¼—MÕ´\ÝV#‡·N~‡5tŒV~·I¢Ü•dÃÂ´†\âG·x\Ñ\ãž\ÇO¾Œ\æ)ò¡½™w\å^z\Ýó[š6ª<AðZ…`÷:cª¸\'‘±‡þ\ÊEc\Üc\Íl\Èúj\æ­:UºUYWƒW1š†D\È\"±¹,Ï¢,eM\î\"\ïÙ­¡R\Âö¯)¿x\ï5k™c@¤8úW®KM 8$`\Zó\Ý&m2õ\í\å^‡!¿¼=jc\Ë\Í`QD*ÁTÚž²sš\ã!r*0\Ì85Òy>ü{S	V·Œ½“šlŠU˜\í£K,›òN\0E£WCýÝ¬§Õ¿¥W¼&K­£«S\ì$\Û\ãÖ¢µo;[ˆvO\é\\v´Ùª\Ø\í\ì\Ê\Ç\n þ¯,\Çß—Ò¬G{¼óM£3c\Í\È\ëL\ß\ïU–PW­;x©°‰]øª2¿=ji\åª¿4ˆ\æ\ç½sšÀ\Øù­ùb¹ýa\ÉG½RF\Ð\Ü\ç\Ùù­6ý a¿\î\æ³5Ì§š{I¦})ð\îdº\Ð,\Ø®ýk\Å;\à\Ð\Ù\í¤08•u\à\àš\ä>\Ü	<9h3\Ð\È?Z\î5\Ý0\ëZL¶+/–d \î\ÆqƒI\ê\Îy|d6\ÚEÖ‹ku¨¾£5\Ö\ÛfeI9\"°ôiµ[þ\çPk˜u6\Ù$.8Rrr\rOa¥\ÝiZ\éÑ¿´g¸´¼²|¬­­\Ðž\ë+\Í\Ölg\Ðt\ÝGOò\í\í.Â‹ \Ù3\Å+#T“Vg§\nrµ\Èjú4\ZÇŒn!\åP,ƒ®\Æ\Ç>µ\Ñ\Ü5è¿‹\Êx¾\Ëÿ\0-›ð®c[]Vo´»¨ wÓ¾v‘wq»µ4ŽxnÊ†\ÝoÀV¯ö\é#û\"\Èòó&\Ì\àQ]\'›\á5\É\äÛ®*dZb\éŸOY›-¥\Ü\çø‰Sš\Â\Ç>\Ó}¡\Ç\äM;\Úz£7Æ¨²\é¥[•de\"¾n\ÕSÄ“¢* ~¾”ñ‚\î\ÓÀH\"¾nÕ­\æ‹\Ä×‚H\Ùp\Ù\ä{U vÉ»Ž6û¬q]ŒV‹\å\0ª+…·fGW#\îœ\×}at’Æ§¦ESA6DM¾\Æ\íW4¬ª(ô8¬\Ýv\ï\ìP[\ÊS\ÌÄ˜þ\ím\é±#*´l•a\Ð\Öl\Æ\çEm÷E]\ÅU·O•kAW\å¤I-D\ÉV\ÊTl”Sm©qL \Za§·ZŒ\ÐmQÔQ\Ò\0”T^e=\ÎE@Fhc&\ÅAx7[¿\â¥QA\ZŠ\Zk±\\õV+V\"Løõ5”eñvV\ÜÖ›o\"\Ü\\²FÀ²õ•h\Ë\Éð\Ü\Þ	P‚]‡\"­\éHñÃ½\ÌI¥¬Eq	ó\Üy&²¬§h.C8ù{T2y¥¿þð\ëøS&lÉšto\æ\Ý\Ë)y¨&??	‘H\è%†X\Ïñ!¥,<\Ðr®>´Ð“4þ\r\\™!ñ\'†\å$ùö\å\ÑO<Œ©þcò©­ek6\ÖFeSýT\â¹oj\Ãÿ\0\í\ä-ˆg“\Ëa\ê®1ü\Íu1\Äl5kKn¶×Œ\è\ÙcŸð­¥¬X2P”†0iôµ\ÏfIFXG¥4‚Š\\;U}SB‡W³h›/ð>:\Z¾±\à\æ§\è+\çq8‰\Çtö;aNñ<rö\Î{§·¹c¡\Ç\×\ÜU)=z¯ˆ48õ›\\€\æ>Qñ\×\Ø×–\Ï\Û\Î\ÐÎ¥$C†R:W½„\ÅÆ¼|\ÌeM¦B\"¤¸¸\"-˜ùi¤Ž\ÕZ\å°@õ®Ç±Ð´bmÁ§hÿ\0ò¸‘¿p¿SM±\è\Ã\éS\éQmY¦\ç,ø®Xk7s^†£KŠD¸\æ«1&˜2\r>¤›°\\’\0\Í\\ŽM\Ýk\Æ\riC(À E§5N\ã¸«{\\\×?w+´Í†\à\Z,±#ñ\ÔV Isš¸\Ò6:\Õ¼¶{Ð¢g54@f`‹\ÔÔ…O¥4‡ \àŠfñv=£\á\"½¾ž–\ìyYõ¯L¿kÑ¦\Îtð¦\è!1†^Mð‚èº•‘‰\Ä\ì?J\îW\Æ\Êu	R=\"\ê[\î>\Î\×J\Ýúgo¥M7-hó\ë\Z¿ˆmõ½5¬V\Ú\Ø\Ä\æ_\ãs\ÜJm\Ðñµyka}c1\Û]	ž\é[\åu^€Z\Ú\Öõ¯\ì¨mþ\Ïln®.%\Ålg¹\É\íF«\Üji0»\Ód±¸…ö”fÜ¬;{\Ðn\Û,A$\Ö,–W\'\Æp\ê@)¶fA\çvsÒ–\ÛS’\ç]½±T_.\ÙT–\Ï95z\ê\ë\ì–S\Ü\í\ß\åFÏ·\×4$sõ$¸O:\ÖxF3$l£>\ã \ÙM§hVÖ—‘‚	C\ÇZ\å4¿ø„Ï£\Þ\ß\Ï¶Zœ…<•ŒsŽ{ö«¾$¸Ô®üK§h\Ö\Íc°¼\Ï\"³\Ð}*š\'!l•›øI?¥x»¯[\ßj(”ù‡®=+\×-/\ï5	\í¿—Î¸¶¹’“û\Ø\Ï&¾Q›\Ù÷daú\Õ#H\Z*w.tz&\çD\ÆH^+Q\ÇºK‰\çˆö\Ã\nd\Ì\èZ–3\ÈOf§£B±\í\0U\0\íQùjG\"¦\Ó\ÛË¾U\ìx™Îª\Ú?–­\íÀ¦Z§\Ê*\Ñ^*+\â¡qVö\Ô2/4€¦\ëQ\í«,µMÁ\Í7U‰£#AER9¨ÊœÔ¬9¦–À ˜qQb¤\É4b€#\Í!l\nŸ\Éu¦˜q\ß4€Èšòö\ÖG’\Ò‘XvªË¬\êð»JºRn¤/Z\Û	µÁ\Æ*r\ãª•ºñ©q	Il#_z\ÇK\ÉK0·_Z\î®m’d\ÎÑŸZÆ¹±DË‘Ò›c*\Û\0#v>•S;\æ\Å[û9ö¨m4™\ïR¸¡À¦J»[´¡†¢¿„*©jŽ#\Äy·\Ö,n\Ð\á\È\Æ}ÁÈ¯B\Ô\æ.·¼êµ=$Sþ\Ö?ýU\Ãø¦3LI€¡”s\ìx­\ÛkÁ/ƒtþ²i÷n\ç¾Ã‚mu`7ñN¥t	#(\éšZÁ\îAõ¢¥˜q\Å€\Ö˜\Ç¬:ŒñP2\×\Ç\Î\îMž”v ó\rs¾\'ð\ê\ë6\Ï5ºª^(\Îq÷ý¾µÐ¸\0\Ó7`Ö”\êÊ›RŽ\à\Õ\Ñ\âe‚f†`C©Á™s÷W¢x¿\ÃBù´l\Ô	\Óýb\â\çw¼òA\èk\éðØ¨×§u¹\Ì\áfjÙŒ[/¸­h\"Xl•H\ÏV\ã½fÙŒÂƒÚµ‡1\è*©üLRØ­\ã!JûÔ„sR2\à\ÓB\ä\Ó<C\å©\ã$5DŸ*\Ó÷M¾ŽYvú\Ödö¦9NsW!™sN˜‡\æ˜²GŠ¬\éZsš¨\ËI\ZE™²G\ÇJ¨\êV¤Š+>d\Ãæ™ªg¡|\'¤î½¾\Ñü\Åv\ZŠ\ßA¹\Ö\"ºÒ¤—MŠý÷]!û„œr+†øS&o\î¤\È1]EÎ«eeo\â\Í2\îP—S\\\î†\ÈÀ\ïTŠM_S­ñ¥ôñc\Þi±¤²›¥ò•\ÎnZ¹\á\ß\\\ê÷7¶—öKi}h\ë½·)2¬ŸHlü?¢^\ÉùVsA$ø\\•]¼šo„\ï\á\Õ<S¯j6›ž\Éü¤Žb¤ âŒÜ“V4¼:\â]o\ÄS‚0\×B1ÿ\0­«´Yl®\"—!6\rô\Åyˆ4iDO\r\ìko6¦%O(\ê\Äü¹õ\Õ\è¯{÷M¥1]=¹bv§ŒuõÉ¡X\Å\îyŽ‰{ª™ü;ôJšDEm\ç—9 gš\ìõg\ÙñE?Þ¶:\æ,mµ›ˆô\ßI¥O°¼ód¹aû²‰>§5\Ñx²\ÓSYÒµ½6\Ì\ÞR\é$\np\Ä0\ê?:­\nh\Í\ÑyÑµda÷uY?P+Ã®\Â&­r¨0V©¯wÒ´\ÝB\Ï@º›QˆC=\í\é¸ò\ÎÀkÁ¯\Ûnµ|?\é\áÿ\0\Z\\¨\è^·=+WK“\É\Õ\á=ò§úV5³d\n¸££‚AF\rùU\nzž›ù\Ð:¨É¦)\Ù\"8\êTz5ÀdŸ•‡?>\àl‘€\è)4s´z¢Ee\èFj\Ó@@\Î+/Ã·>v“™\Éiü+l>\å\æ³&\ÅO(\Ô_Ü¤\ÓA4\ro@\éZrD1U^*V\Ê%*\'^*\ë-B\ë\Å=Ö«I‘ZµEšC*(È§ªU(¤¶€+¹\Ç\".E&M( \n¦\\‡\ã¥MtÍŽ*²7ú3NO\Ê3“@ËŠ\à¯5ªamIõ4¶·qÜ†1œ€pj]ñi\êsE€ÌkŽ\ç5€>`¤¸p#–\Åò\ç\ÔPGl™*\rD|£Úks\Î\ÜS®T\È(9mJ1%\ÔGÉ‘õ[\Ã\Î\×>×´\á\ÕcK¸Ç¡C\Ï\éÊ·^\ÝK{ñX>Í¯‹–\ÙøY„–\îpr?Âµƒ\Ô\×\Ù\\­:\Î\ã9/\É÷T\ç¯‹\á\ÂWNž\Ñ\Î\ÒvB=³[j¸©Ÿ\Ä!§&Šy¢ F»µ@\æ¥~•šøûÝž’ “­BÇš{µBÍ“Mµa‘öŒö¯\ÔÏ›¬]0\à4ÄÎ½[P\Çg!q\Åy4‡u\Û1\êÍ“^¦V›rh\Ê{›6iò ö­P¸Z­§A¹ý*ó^\Å;\ÛS¤4Õ§¿SQƒŠh’Rx¨\Ù\Î)sH\Ô\ÐÆ‰Jš°’ñÖ©IJŒqLE™Fj«w©r\Åj»±šE\"*¤\Ã\"®0-U¥\nh¸³k\áþ­k¥\ë’Áu*\Â\'*\È\îp¹‰\í^»s¬\è\ÝGu/öT\×–gš2G\ë_8\Ýgv\rDœb\Ín®}%s\ã+cG&¯¦\Ü7\nG\éY\ëñB³‹ÉT\Ó\ÑGdV#ô\áVVp\ÜYGZ\ØM:\Õ@\ÄKùV‰]´‘\ê²üX\Ñ\åûtrsŸ’	þURo‹\Ú~r—Ùµÿ\0^v‘C\"Œô©Q£f\ÆÀq\Ûr¡Ü¿\Æ;e\0¨½Ž\Â¿Ö«Mñ±2V\Â\ï\ØUþ•\ÊM”‘\ä!G¦2+•\ÖB£\0½\Í7¹ZXôC\ã\Ýíœ\ÃdQp®ògiõ\Æ+Î‰fc#±gc¹‰\îOZ¯8«\Æ\åf h³f\ÜUÿ\0¼1\ëYv\ÙN+A\"®\"g_\á½{CŠ\Ï\ÊÔµ1mrŸ!‰ÐŒú\×V²xz\â\É\ä´\Õ\Ö\êaö\Ø\à\è+È¦ò\\bEF>\â©ùQ\Å4s\Ãû·WS”8\ïTd\Ñ\ïž»\Ú\æ\Û<\ÆÁ\Ô{\Z\éüõò\È’+Ò´ù­u„ž)\0\â\É÷\ÏA]8=kõ2\'´d‰\éWv\ÖT·›\Îqš\×Š.\"6^*»¨«.xª\Ï@Ê¯Bñ\Õ\ÜdTl¼Pk¥@F\rhJ¸ªRjJ)¬½jX×šVQ\ÍhªV›³&¬ù`\Óv`\Ð+ž\Ü0\äVl0)ûE©=½m\â³q\å\ên?¼€þTg\Û\éPiˆ\â*¬rsYº„žl\Ë\Ï\0WTJ\È\n+š\Ö,&ûZ<.¨˜ÁqT€Åœ“u}Fk^;H”UÁ\ïYSBÖ·ˆd–9®<\nÛ‚Tu<Qa\\ ùe\"¯‘”ü+8È©p0G5tK•À¤\"”«ó\×+u!\Ó|Y\Ð\Û\"IŸ¯õ\Ö\Î;\×1\â8w´Ž+F~½Gõ¦€\ÞOô_jV\ê\0†\í\Ñ\ã¿|ÿ\0:\ÚS\rrs^\r\Þ\Õ3\Õ\r¼žø?ýz\êŠ‚§ª’*æºŠÄÒŠ‹\Ì\Í\Ó5˜u[5u\Â\ÈÎ™\èj\Ñnµ\åö\ZŒ\ÚuÈš\"\Ú¢½N\Ôa\Ômhl2÷¾te\Í\rŽ\êsRÐ•\ê\Z°\Ã5Zò\ìmc[”‹B òk\Í\ÝsyÝ«\ÐuòÁ\Ñ1‚k€„o¾Œ\ï×¿•iM\ÈÆ¦Œ\ê´\á‹r´ù›oi û5º’>ð\ÍQº9“ð¯Rœ¯ž[?ZŽ¤ \n¤1A©1HÀb¨.Tl’jX3C(\ëOSŠ\0˜ \ÛUeˆ–«Jô¦•€¥\åtªò\Äyâµ€LT¢h.\')¨.\ÖS\ïU\íðÏƒVµ†;½x¬\Í\å[*qAºv‰»f|¶À\îkeS5\Ì\Ø\\Tõ5\Ò\Ä\ß%tGc)54–H\Ô&rµX°FŒ&\ìô\ç5d\àõŸ°®\Æ*B7 ‘Œý*¬E‰§¹ý\Î\0úW#«ü\Î½u·)¶,²)8\á{\×%¨ó6¥)lR*[Ž@®Ž+p\Ö\ãŽ\Õ\Î\ÅÃ­u¶i¾\ÐóŠ\ÄfcÅ³8¨\Øð+i¬ü\È\Êóv5=¼°–ŽPU‡~Æšb¸5¨`ž»»)njG2Gù™\Ü(\ÇrMg}–_?.{õ\Ï5\ßx/\Ã\ëu©G¨\ê.#·ˆ\æÛ¬\ëô¥\Égª\Ú.c\'”E_\ÈV½©9=« m¦T`S\ëZ6Ž6žk`÷/»²*\êHJŠ …OSW\"\Æ8¤\"n¢¡u«3M•y¦2¶8¦0©\\\Z…ø \nó\n¡/Z\Ð~T\Õ)Ž3ŠGn¸¨Øi¹4€psN\íQŠ‘zR¸	Yó)mV-£;”®jóµJò\Ü\ÜBU]‘\Ç*\êpA¦)aÔ£Õ–? ˜ý\áÚ´g´®\ÖSùVÒµP\Ù]Vqþóf•ô­`.N¯%R•ï¬”HU\Æ0}*,abŒ\ÈGðƒ‚i³\Øj1‚\Ïpe>¤sLKöP\Ë1S\íÖ\Ä †\ã&gˆ¢\ç\î“È«ð–\Ø2:\ÕX4Ë³(3\ÜH\ê?„·­\å`Ž”…r¥\ÆBX\Zê“§GX_ð\Ï?Îº;Áˆ3Ž†²®#[«;ˆü´‡\éB\Ì³7„®\Ñ[æ²¹Y—\Øô®º\Þ\ä\Ü\Ú\ÛOÿ\0=bV8õ\ï\\‡}ö\Û\ä\ÝZ²\êÀd*\Ûð¬þ~…\Z±¡‘£÷õ­e¬@\ÜZ)IÀ\âŠÀG™°\Å[ÒµY´›¯:3•?}?¼=*®A5ˆG=«yÁN.2]™\ë6—0jVIujÀ£Gu>†œËŠóm\Ä\r¢\\\ä’\Ö\îq\"Zô…š+«e¹·pð\È2¤W\Éc°¡+ôg¡\Zœ\È\å5\Æf¿`OÊŠq\\=ˆÎ§ýt\Ù\êï›«–?\Ý\Ç\é\\®†‹.³n§?Ê½l¾£c*²\Ô\ì\î\Ø4q\ÑF+&\ã–\Íjº/•>s]\Ê<¨ÅRŠn\r*ñBA\Ðq\éQ1\â¤\'Š…©’4š@Âš\Ù\Å3še\"Ï™Az‚”hP\æ˜\ìi\ê)²/˜\Ñ\Îj¼ö\ïX\ç­nj‹Áú\Öh±³Øž\Åö^FÇ 5\Ö\Æ\ß.Eq\Ñ|­š\ë-4)ô­ã±›:m\Â:Î¾#{kf[W`­;\0\çJõox2\ßPð¬ZeŠ\"\Ïj#\×\ëQü8lø2\Û<\Çþu\Ö\ZNd6|\å­èš–‡\"E¨Û˜‹‚T\îW~A¸lWµ|bÿ\0[¥ý\É?˜¯¹\ævú\Ð\Ý\ÕËŽ\Äq\\}k­³m–«ô®r\Ö ÜŸÂº8Ty\n=«+”IÀ\Ìkza¸@“F’!\êW+´Wô5\Õ\éRùñTˆ‘y´\"Wû{;\Ðu6óaŠ[fX\Ê\n/NÕ«\r´SF‚d\ëPX›Ñ©:\Ý\Ú\Ç\äŽQ”\ç5W\"\çUk¦”´‰D\ÎHQ\Ô\Ô\Ö@¥ÿ\0’\íÁI5²*‚zÕ©ÿ\0u$W ò§·z†fÑ°ö\ãw\ÊqW R\n«\ë*«3W\ã\"¢`Se\ÅMª÷<)^Až†©}še˜±¸fO\î•Î®R”NHþC\É\â©\Â\ãqosZ2ò¦¨¶9Iú\ÓjI\æ¦m ´ô<Ñ¶€1R\Ð\Å`H8\ëP\Ç\Æòd\Ú°jÀ\"‚E+Ê¤rE!c´g®P‹p_vi g7\×7N\É\ÈP{Ž•£\Z˜\Ô\ëZMn«\ÈªN\î*®\"$#J‘€\ÏJ…ó*\Ëý\ÚS¹@Ñ°\Æx¬H\Æõ´\ÒuüJÝ¹ R\ÒO\ì\ï\"`\É{ÿ\0]i\é#û;\Ä:¥€$(—zö\Éþ†²|F>Í®\Ç(F¯ŸppkF\îo#\Å6WG\î^[¨b?½Œ\ÔV«T]´;EˆZ)–ò\æ®\'–óš%|®(3ª5F\ÒF\ç]CH®\éš\ÞðÎ»6—)´f\Ýo/\01û¦²_h\é“÷€p¤:Â½8ÔƒRF”Ý™\ÒjŒ|›‡\ï°\Ö€‡ûIX“[z\Ãl¶¸>\ØþUC\Ãñ\íó¦#ƒÀ®L\Z\\¬Ò£\Ô\è%rª ÷E\ÎI©®n•\Äj6\Z®[#5\Ñ#63\Ò)ws\Í.\áE„7m0¦jRÀ\n€Ïƒ@\ì4¦)6\ÓZni<\Î(\0\ÛOE¨\Ã\äâ§­&HóDñSGÒž\ëò\Ò\Z9mR<}k\ãÁ®‹T\\ÉŠÇ’>i£F\Ê[q]–þyŠ\ÝH\Ü\ìL\Ö<±l¤·º6ò¥iK>°Ñ¬­ô]\"\Ö\Â,m‰\0$w=\Íi\î>^k\æk^ÍºÀ#·˜k~\ï\Æ\ÚØ°û4šƒ¬drWˆú\ÑË©\r÷Å½+\í^\Z—\nö,NIê­€Zù\ä\ÒZ:·‰/µTû,——o»%BC\Z\Ì_½M\íbã¡¡d2q]	¶>k\Ãýbýk¨Ž\É\Åd1/Pù¤úš\×\Ð%d!ry¨/-Á5sE·;‡\é¢[;‹$3\Âý\ê§8\×!»x`°ŽHûL\ÍÀ­}&,Ú´fR €N\rS2l\Ç\Zc\\,w8Ä‰\Ãm<f¥ºž[x·0g\0t«h·`\èO5i¬bo¾¹¤2m¯d1£½m[\ê9\n­\ÅR¸±\n\É^3\Í?\ìÊ±\åŽ\r :i™€ ñVXnšÁ\Ó.Â±„œó\Åký¤\Å\Zz\ÓOJi\Zc?h’\ÖRË¸jI\î\ØLc*«HÉ J\Ü\ÔL\Øj)%\ÜsM\ÜYh]ô¹5\0\ë\ÍLµ,	NÛš@0u©E3n)Â˜˜\Ù[\å¬ùH¯\È2*„\é\ÍP/Þ©\"©\ï*ø«*üP!Ÿgk2ú\ØE&Gz\ØTu.UM\0q^.‡u­œ\Ø\ÉI\n`GøŠ­}\'\á\Ý.ñH\ßm1ŒŸ®ó³­\Än4y\ÑG\Ì\n²þ°,¿\Ò|;©\Û½\ïTºyý+X\ìh¶;\ËrE9~|\ÑT<;pntKG\'$.\Â}Áÿ\0QYIY\Î{pD’&\ây\0\ç°*M¶7££õ\Ýjs„¦º†7iV\ä\ÕûWSpŽ¯2Ö³bW\'5wM\çTµ_úh+:¿4§¹·¬&l\æ\'¿ø\Ôú= :L{G-\ÍG®X¿–´¬\ÙtØ•†S¥qa>\ênPžS‚EW#hÀ«21r[\Ô\Õw\Ð\Ì\ÈZ¢f\ÅL\Õƒ4€¥¨òI©„Y¡bæ¢-¤\Ó\Äg0\\TÊ£€¦! æ¦Œb­²(@D8§?\Ý4±ŒS˜|¦‚‘\Ï\ß&\é3Y²E\Ím\\¦\\\Õ	#4!\É\êgÜ§\î\ë%ò	­»„ù\rcL¸j¤MÈ’g‰·#jY¯gœ#“Ž•Xõ¢­1’!ÃƒW\â]\ÍY\Ë÷‡Öµ\ív(cEˆ”ÀŠ\ìl˜5²·¨®Qbù«z\Êvf~\\VBf„®»0EO¦2£d\n¤Hj½b€R$\ìôÙ·§@8\íZª¥\ëIQ³ð®‚\ÝEZ!’ÁA’)·\\ö§\Èø¨6\ï\à÷©¸‡Å™P0$Q^D\Ò.â¥÷Ht­\Ï4™kº	²À†µª—A\ïT®#2°(Á[ÔŠX\ãh‘XûP\âXw¨\Ý\Ûi\æ¤Y£1ü\ÄQqL‹™ŠK–ª²Ý’üt­\ë2<¨\äV;!\Ý@2·nõn6d_˜U8Fe\çµZf,q@\Îãš•jTŠ•)0%©qQÔ«Ò¤B\í -8S\Â\Ó#djœÑŠ\Ðn•Rn)š\Ðû¨#oh®*¼i€\ÌóP\Ý\Ç\æ\Ä@ô©»\Ò7\Ü4ƒ4\á’3\ÝH®G\Â\ÙmN{iqû\è\Ùò \×l\Ì‡\Ø\×$:G‹\×\î\ïn¾WkÁ/6\î\Ü\çt3ô\È\ÇóTz}\ÅÚ• -Â—O~Œ?­Or\Ä\Ç\ÃU\È/D\0\íDlÿ\0ys[:µŒZ=\äš}õc\Õ]N\ÄV,\ÖöR)û9x_²¿\"´„\ã8©E\è\Ëq³%¥º•¤Ž\Ø\å\Êð®\é¡&\×-\ÃóŠ\ÊþÏ½³U9Þ’ŽLG8õ©\á\äa­B\ÇøA5gû¶T75ue2y¯:Š¿x¥PÛŠŽx\Ã\ÞAœü’oþuaÝ¤–U*6`}\ë	ü2ªneƒ/š&c#–©Œ*\ÄqdÕ+Œbº\Ìy \Çj‡\Ê\ëbh0*‹ÇƒH\n\ÞX¥ò½ªmµ Jb*ù~\Ô# «[=¨òý¨¸ô\ÛR/\ÌiþP§¤x¨\ÄU¥q…©‚\Ôn„šhw3f$ñT\ä‹Ú¶zŠ®\ÐqÒ©0¹\Ï\ÝEÁ\â±gˆ\î5\Õ][ûV,ö\ç\'Š¤ÀÁ‘n”\Ì\ZÓ’\Ø\ç¥Bm³Ú\ÆS^µ½§.\è\"²þ\ÎW \ÍoX&-\Ôcµ+Œ”/5~qUvóW ^\0¨`[$Ö¯~µF$\Æ\r]†\àsÞ‘,\ë4†;G=« I¶%s:lª±ŽFkj9C\ÍQ›.,sC1\Å\"‘Šv3@‰#\äsH\äô©òŽicP\Ò}(4‰\Ï$\ZI-•†O\Þ\íVd•Ä›ü¾µZòIc@\ÉoS\é@\Ê\Ùem¤ô«\n\ÜU•¤l‘V\ÔñL	†Z©=‚;—\ì*Âµ)`M\0gý˜!\àRþj/m\î¤o¸jpAš\0ˆ®)£­K\'Zˆu¤À•*e¨`\Ôøæ‡N¤´	‘\È\ØJG=\êû®ET–.8¦r\ã\ÃÒ¼F¢a·Š`;˜\Ý\r¡¾\í\0`\Ìq;\ë\\Š\âk1N¸+,c?QÁ®¿PŒ¬Û\ë\\ß‰\ÓvŸo1\ê’\Ïû\Ãÿ\0­T‹€­8ƒ^\Ñu²Fû\à\í4U;¶2xz\ÚU\ëo7\äÿ\0Ei¸\æµ=S]\Ð\íµ\ë&@hòb“ƒ\éô¯\Ôô\ë\Í.\è\Ã{Dù\ã=\Ð×º\ä\Ö~»£[xƒN{[€_ùe/t?\á_\'—f2 ù\'ðþGd\ás\Ä\ä0\ì?\Z\è¼<Ÿñ0\É\êšÏ½\Ñ\ît\É|«\Å\Ù2É°/÷‡¨ö­mq|\Çþ™‘úŠúJÓŒ¨ó\'¡„¥©°\ÑŸ8\éRƒƒVaÁA\äTR\ã\í=\ë>”\ÐOq¡*A\Å8ŒQK¸bµ Y€e\â³\Ý9««žõ©\ÍEC§ªñO\ØjEŠ•öóK¶¥ò\'špˆÓ¸ˆ<³NUÁ©Ž`\Ò` “.ÑŠ®ò<\ÓCN•U˜\î\Æ8«K*?JŽDšS\nËšž•­¸ƒPI¢\ã0¤€zUv„c¥o5°aÒ©½·\'Š.32+}\Î8­»[_qP\ÛÛõ\ÐYÀ¢Æ‹Ž\æK[ø®Z\Ú\í9n•q\ÌC·5JJ\àR¸\\$x×Q#·™\Å0¡-šµ=(\Ím>c[pLA\ÖM±À­¨mù\Õ\"­\åÕ…aT•¶ŒzTð¶þªW\ëL’\Æwt©a\æ˜\0”?l\Ð¤”)ùˆZyñ Š¡«\ÈÊ EI`|\ëOŸ’8\Í\0GZ·Ú¡X¶¹\ÇJ´©‘@\Èri²Ë…\ÅZò\êµ\Ä%ºP\Ê	!@\'®XF*$Œ¤Ýµ©€÷\â¢V©_-MU\æ“8l°\ÅZU8\ÍA\n\åª\ï\0b\r\Å&\ÓR\n	•\åb«U\Öa #Õ™¹L|¯Lc™xª\ÒÅš¶ÇŠ‰\ØP&LSOÝ©\ä Š…ºS©\æ©\íX\Ú\Ìb\ãC¸Œ(, H?]\âf:Æ‘7\Ç$_\ßR¿;ns6¼\Ñ/m\ÙyT\Þ> \æŠ4K]M£\æl¡ò¢µ‹V4–\ç²\âRmªwS˜˜*õ5ùÚ¼¥dwœw\ÄmýšÁFõ\ÝñŽ•ƒ¡ÿ\0\Ç\Ì\Þ\ÉýkO\Ç™d³LrŸÒ³´A‰nO ¾§\nšÁò³|F\ìD›¨õÅ½M¯\ÈZšO5\Ý\r ‘“\'\Ü¥zjj7\à\Õ,‹´\ÔM\ÍLX:f£Á=(0¼\ÔÁ)¸9©³@š²”\Çò\æœ\Zp\'\É3\ä\Ïz¥K8\æ™\Í\0J«‘š§<Y$\Õ\å\ãŠlˆ¡0f|qb¥eù¸©\n€i¬@\\ž‚˜’@\ÄñJõqeŒ¶ZFVûB\ã\îcš‘4@/J£,|ž+QÁ\éU\Ù3E\ÆgÆ‡}h\Ç3„\Ø:RGn3À©<¢¦€\ÈO4Ð¦§$J P+m5n1M\Å>!–	›¶-…¶``k\n×„¯fFE;‰¢ú\ÆKd\n²ŠA§FT(¦4ø|Uˆ˜\çm@›üÊ°¯‘\Í<\0(–\É:\á†x¦Cj¶±”^„\æ­p:Uk™<P*óS¢\àUx\Û\ÍI\æ\â€&¨¥\Æ*6ŸÉ¹h`\Ô·55\ßb\r-QÒ˜­‘Kº\"š­äš¡ù…h§Ý¤.A©>õ%8S9\"©¼6jûT3@\ßªòU\Ñ95ZE\æ€*ž´\Ö^*]¼\Ò)Ÿt>LV€¬™\ÑÜ§ÉšÂ˜a\Í[œf>\Ã\â‘\Ð	7Çš*O\Å\å\ë\Èýôú\r¬v5=³Vl\Ö\í$¬\ì@¦+D\çV\éü¸¥~{N¥¥k\Ö<\ëÅ®\Z\å\0þý*Ž†I[–õ T¾\"m\×(}ri4 ú–õøXÿ\0³\Å\Óvf\Öý¶¡GRj\rÆ¬:\áqUöó]mY¶=O†KP!›\È©#zm9E0¹(`Z¬`ªDÔ‰#¯²¨)\Øâš’zÒ—ª$­:óLjgÁ4ª¸€EZ\r>Š\Ê\ÞAcJl÷£)\î*\ÊñM’G_¸2i‰Í¦\\G.@\È0jÐ‚\á†\r_/\Ó5s@\Ê.†«°9«\ì*»ŽjJ	!\ÆzU©T\ÅSS†«qÂ€*¼g4ª„\n´Tf” 4\\El\Z’ót©¼¡H‘\á³N\ài\Û¨­{p1Yü¨+J\ÚNn\Æ\Â–£ \É5S\Ï;±šy—Š¤\Ä^W§ù†©,\ÜS„¼Ó¸‹É§\í\rÖª,µ(—Š.\Ù88ª\Ç#Š³»#­BüŠ\0…©ŒÞµ&\ÚR‹ŽsLó\Ø\Í-I,h#5\0<1\Å9Z£ô?5\0]ˆ|Â¯.1Y\ê\ãU˜œ‘H`ŒR\ÔKOV\Å\0;-MQµ cµMRrKU\ÉT‘\ÅU1zP#@Xò)\æ*Sš1L.g\ÏËŠ\ç\ïWd¤WU*f°uX0û±@\Ñ\Çx–#$VôÍ±¾†Š¹¯(}l}\èÈ~U#h«£\ÔqYú»³qžH\Åi ùk#[#\ËQžk\àiFõ,wžq\âþ›ôŒT¾ƒÛ³U|B\Äj_ðŠµ\á\âE»7«\Zûl:ý\ÌN:\Þ7.ZÎ°¼o4f6V±’85uØ±¤E\0\ä\0+Fep+F\ÚqR;Œ\ÛF)ô\Æ\Ïj,M\ÉUZn\Êtjv\Ò\Ñ`\æŸ¶š§\âÀPLŸ5;\íÂ˜\Í\é@E3&@˜\ài§$ÒŠ1A$œ\Ôg5e×Š…2ˆÛ¥Vc“ÐŠ²\Õ	8©Wi\ßV\"}´1He­\âœÒª\ÍL½)\Ø	¼Ê’>µU~õMæª­	¥@«®\ÚÃ‚\è«òkr½‡z	e°¹5!Œ\â›5h/\ËL’“–ZE—,y©åŒ“\Ågý•’ó\Ì\ÝòúU!—\ÖCS#jºÕ„ ;†*2\Ô\Æ4\Ý\ÔX\ï\Å2Ir8¨\Ý\ê,å©ˆ‰<\Ór)$8¨K@ƒ“R¨¨b«H>Z\0rŠ·J©S\Äq@7cŠ3»=*\r\Ùz’€,¦žj6x©°v\ÐIµi\Âõ¦ñA#ˆ¨±RA‘Š\Ê\ÔS|Mô­)\ÍS»Œµ»cÒ˜\îr—0¬\ÖóBÇ‡B¿˜¢§Áƒ\ïE4\Í\é\Ê6\Ô\ïK\í8®wY‘š\ç\à\nØ³¼R\Ó\í\ï¢,«\È=`êºõ‡¥|]\ZN5¹YÞ\ÑÀø…ó«²ÿ\0u´´•ò¬b\ÈÉ¬tn\×\'ú(ý+vÂª\0öU©Dâ©»-†É§Œ\â¡NMN:SfAKš\0£€3GSI@\ë@™eG…h@iÝ©ˆ½!¥\ïKHhn(\Å;\ZCMYú\Ó\é5QòŒP&<(¥\íK@ˆ\Ü\Z…–¬µ@ô®üU|Ù«Ö™Š‘$°¨\Ù*Â­#Š¤€¨\Ã4|­E&Kb­\ÛÅ• cR\"i.m\Ú=§®j\ê¦\Ús®\áƒÚ’v¤z~YHr}«~\Õ6 QY\Ð\ä+NÈ¢÷%—\âJ´\å¨b\çh–™%w\\\nª\Ã-We!ªg­P\Í\ÔK(\Ú\ÆÕ¬ÕŒð¡2 \äñšš!c†\í¥Vv\n\âŽ¸\ïõô³\"\Å‹h‘ D®XM‡W¼ˆ8ó÷)_™Ëž\ãÞ¾k\êY#T\ån÷“wÕ½7\å\Ò\É÷6\æ…õ4^\ÒÕ´\ìA2\Î!ø\î_SŽœTòiVjñ‰~Y‘[I Žw\Ü\ÖI\Õ\î\Æ$\Ø\Ì\ÎW\Ó5!Ö§,E\n±p\îUH\ÞGL\ÖSÀfw÷f÷iõ·á½´\Óñ\Zœ\Ímgv·ª¶\ÞC\Û\ïF\'pƒ\íSÁc§\Ì\Ö\ïö_%^\\F¬Ä™Hª²\ê’L¥V\ÞÕ˜4W\ï\à\çÚŸ.±#J“}–\"†Á\ÏÓ­Tðx÷X]oöö\Ñ.ú\Ý\ë\Ö\Ëm^‚”/¨+MM®\"Ž\Ü[Iª»Ñ‰c¥G¬iÖ–ö…\í¢@c—\Ë-…¸\Çñg¡úU{½^gŒ¬QCo¹ƒ±‰pXƒ‘“õ¨.õyo!òš(£Vm\ï\å®7·©­¨`ññ­	s5ö\æn\Ú+ß½õ²\Ö\Âr…˜\Ë\à{•[†eŒõ\Ú9>\Õ\ÐÇ§Z­\Õ\ë2F#‰•Q]\ÈQŸS\\\ÌUÕ‡PsZ\éªK\ç\Í+G¬\Ä†WŽ•×˜\á±UeziZÖ½¾\Ô^žm]_ò&Š\ÜÐƒJ·73¤‘(HÁ<Œ\r\Çô¢KK”Š\á Û¹_o8f9ªj\×2IŸ(hØ° u\'\×ð\â†Õ¥óTˆ¡X\ÕJùA~Sžµ\ç<f\Õ\Üõkù´M?ü\Ýw\Ýkªeó@Ð’\Æyži#)€3Gœ\írqúÔ±\Ú\Ú\Üy8ˆÃ½þ@X\å\Ô\äúV<Ú¼®˜h£Ù¹N\Ð8\Âô_¥Oýµ%Ã¬‚\Þ$‘HÃ€sôúPðy“ŠNO›]T´Zi¥õ\Ö÷z\é\ç¨s@º\Ñ\Û<pOµ¢G%YT\ç§J³öh\Å\É`#À˜Ï½fI\çlr/öƒ™evd\Æ\ä#Ž:V\ÓÁc?vmhô\æ\Ùs¦•ûò\Ý^þW”/ýv\Z\Öi&²-Š²Ç»¦{c5b+[.\àF\"@r88\é\ÍR72›¿´\äy™\ÏN>•#jyŠ\ËjŠ1òz\æ«ƒ\Ì\'(N\ÍE\'\ï=\ìù½oug\Ò\×\ÐJPWº%º‚“\åuŒ2P>elž\ÇÒ­Iki#¨‰bòƒ€\î®IßdÍ¨I–&(‡\Ê0?\Õ\ãÒ§MVY¶•H\Ð\î\Ü\ÛW\ïzŠ˜,\ÆQ‚RwIý¯%\ÛWó¾¾BR†¤—ö0ªG#k¸°#;útü\èki\ìV(˜Æ¥\Û\Ì;—=N:qQ\Ïv\ÌË˜aØ \Þ2{ýj´º¤\âŠ±«•e\æ v\ÍR\Ì]8G™\Ý;üZn÷\êì·¼ŸKu5;²—ˆt›[	\Öó •Qž9Kþ0z}(¬\ÝS\\¸¼†Ks1pÒ´kƒ!	¢½<®Ž\"LC¼¯\Þý¿[ü‰¨\âÞ‡ÿ\Ù',NULL,NULL,NULL,'59P166480','2020-07-01 23:00:00','2020-07-01 23:00:00',5000,NULL,NULL),(2,1,'285723691',_binary 'ÿ\Øÿ\à\0JFIF\0\0`\0`\0\0ÿ\Û\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342ÿ\Û\0C			\r\r2!!22222222222222222222222222222222222222222222222222ÿÀ\0/\Ø\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁR\Ñð$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\á\â\ã\ä\å\æ\ç\è\é\êñòóôõö÷øùúÿ\Ä\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3Rðbr\Ñ\n$4\á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\â\ã\ä\å\æ\ç\è\é\êòóôõö÷øùúÿ\Ú\0\0\0?\0v\ìU{\Æÿ\0R;™\\kKœ\äB\çðªpÊ·6\áÑ—\æ\Ï\"«™-¨¤\Í8S\Z´® 98Pk—•¥šM‘\ã5\×\êvbòÜ m¬Eq“ù–w1\ØW©5phi1ñiP“‹ˆ–G=9®g\ÄP[Á¨*[mh\È85§¬k¯.!²b©ýMs.I’I>¦©šD\ÙÑ´h¯\Ë	™†\Þ\ëW†‘oi©,QzrMhxz0¶€\ã“\ÍYŠ5—_ÛŽƒ&°”½ûj\ÛZ;È˜\ÔZZ-ºs\Ë\ÍS\Óaó\ï[PÙ›2¯£h®c–%9\'\rŠ\ÐP¥=”1W;\ã-R\çE\Òà¸¶*$y¼¼‘‘\Ó5 t9â¢š5šbnŽ¥zzŠò\Çñ¶½·å¸‹þýŠ¥/<C\'\ÊoŠÿ\0º U%chÁ¢ò5µ\Ã\Â\ÝP•?ªû\É\Ò\Íq5Ü4\íºF9fõ4Š*›;aQ\Ïa!f\è+J\×Ã·3\Æ$K›=‡¹—ÿ\0­V£Ð¤Œ\á\ï\ì‡\Ñ\Éþ”\Ó:\èÒ»2Å¼˜\éR%¤\Í\ÈBki4¸ñÿ\0!s\ëŒÔ£L¶J? SJÇ©20<’\r3\È\Üqš\èÆ—b9k\Æo÷c¤\Zfœ[nû—Ï°Xu(Z79¹-£Q÷ò}*›¦\rwqøv\Ã\0ý–f÷g8¬=aô›-\ÐZZ¬“t-»!hMUX\ês£ƒV\íùªx,\Ý:Ö¶pme”0\ãŸJiœ²3õ/š\è\0ªÁp#\éZ\Z…µž¡5\ÍÕ°¹S*!\é¸ô5¥	·¿ð\ÛF\èñò„s\éMX\ç{œÿ\0™\Åm\é¾\"ºÓ­;H-\â™X·\Ú\nÿ\0¯Jš\ËÀþ\"¾Ext\ÖE#!¥p¹ü\êøøc\âi+GlŠO-\ç*Œ\å$zo„õiµ¿\rZ\Þ\ÜÓ¶\åvÊœfµ­V\Ñ4˜´=\×NŒ\ç\ÊL3z·sùÕ©9¬\Ù\È÷!\Í!§Ša\ë@\r~EBjf\éQ(Á©`Hj\'\éR“Q?J\0ª8’­/J¨G\ïEZ^”€p§ö¦S³@\çcšµ\"†¨–<P1\Ô\ÓÒ¤\ÛM+\ÅPŠ\ïŠ\åoO›®»cýZ\àWZc\ÏZ\ä\ä\çQºn\à‘@\Ð\Ò~j©«Gö›h\Óq·­]w¹öª\Z”¾E\Ôqz®ú¤6t¶6Ö—6zdûZ?µ\Æ\ÊFx/ø\â¢h\È]„ô¦X»\Ë\àû’€™4»Õ˜aùû5MzŒ·,#F\Ã.=5s]DB\0Š…ª`¤j6šˆy«š¬85:8\ÍœÞ¯\Ù<O$z„Ež7‡ôU\ß\Ûù\Ú:\Ý\'ú\ËY€ú/z+E°\Ïeò\ê‹8®\×dŠ	è­Ž•jB@ªz”v04™ÌŸ\Â=\ë\æaRJ[œw\Ô\æ$‡Ë•\Ó9\ÚH¤Zg˜ò3;žX\æ—v{.§»©\ÛM;\\ŠN¦¹ýj\É.£bTn¯­oHÕŸp»³YûVµF–g•\ÝDöó2²\ïQC˜üu\ÍvúÖ“\ä;T“¨j\åa±š\ÛQXdƒšê£ˆEn “GW¥©H‚ã¢Š½¥\Æ£s6>a…¦iŠ\n3{Ö¾•j1,›q¾CQ\Þ2žÆ¦œŽH\àÖD\0@\0)CU3!ý\Åfø—EM{C’Ì°Ió!sÙ…i\nø§q£\Ëmþë‘<¶°ŽÄ¹lþT³|8¿HÙ¿´-Y‡E\0Œ×¥»Œ\ÕI°j®lª3\Êÿ\0\á\Ô\íe\êG\Óz0\"³¦¶xdd*p\rzÓ¢º2r1\ÍrL°¼²F\Èƒ\Îi;3¶Œ›\Ð\å\ì\Ë\Å d\í\Øô5\è~¸ð\Ýò¤\ZŒb\Ò\àÿ\0#~=«œ\Zl,\äŽ9\íC\Ú\Î0\n\Õ\Â:\æ§\Ìõ\Äøy§Ì‚H‘dŒò9¤,²?w^q¢\ëºÎŒ\ëý}*ÿ\0ªc¹ü×²xS\Ä\ZÖµd¯y¤\Ä\Ë@J÷Á\Í=Lñt±¸Hóó^?qB/‡öQûŸÒ«\êzN\á\ÈMÆ£4Q\02«7°\Óx‡þ	4\ìi‹»“‡*76=³Þ¼S\Ä\Út\Ðk’Eq=\ÅÄ¤\ßq÷¹\ì)\Æ\í\à¡[ÚKy<O\â\ÉõF{m:²\Øô\à|\ïõô®V6Iù(B\æº4\Ó\Ô>Xdû\Õø\ì\ÑSp J\ÆJ\Ì\ÛJU‘‡k¢Æ¬\Üýi\Ú\Ì}’K~²>•¯su”y\éŠ\ËIÙ®Zf\ä€J|U<Þ¦?‡t$\Ö|Uƒg\ÈF-/û£­wÑ¬[\Æz ‚û±S¶\ïÿ\0]r¾œ\Ûk7º‹\ÊCn\îÀžXš\î¾\ÂÏ¤\\\ß\ÉÌ—3±$÷¦ŽJ®\Èì”š4Å§\Ó8¯q\n\ä\Ôn¸©ø¨\äÁ¤g\ëQµ3P·ZL·Je<\Òm¥`µFjR8¨›š`V?\ë*\ÊôªÃ—«\0ñSaŽ§S\æ@\r$\æ“&¤Ûš6\Ð+‘\ä\Ò§ž*=\é€Hß»oaš\ãab\æg<–c\Íuw‹Y[¦\×+n1mŸSE†‰­¸\ÜqÞ³\Ý×‰Š2\åRÆ¶,P<#\ï\Z\Ê\ÓÁ“_\Ô%\ì¬U!?Ã¸¢¹\Ö5\r\ZSò\ê/wL\ãô\'òªªó.n$$K	6òB‡[H»mÆºe\à%T].\ãþ\Ë|­ú\Z\ì¼a¤oQ\Ü»¹\á\Ç\ç\Ï\ãZ«µ`9\\\î4\Æ\'’Â¡Y´\"\ëŠAÖ†æ›º‹Ô²\Ð%Ý¼–ÏŒJ…N}\Å\Ød\Û\Ík`¹×›ÙˆÁfª0\Ë;onzÖ¬\×v\Ë\ÐkT\Ô\ZT(ƒ^hSƒ¼¤q¢>@\íR•WO\Úwy\'Š¹(\ÇJ*\ÏSÒ¥ð¢³ôª’Õ§\Î*\\\Ô{D•lgÊ›«þ%Þ¸w®†X\Æ+\nðnj\Ów;¡²Ö–?r\ÃÞºK	\n§®I®{O\\ \Çz\ê,¢X=\ëÒ\ÄÙ›z\ÇJZN”U6fJ:Uy_\êLüµRc@\ì1\æ\æ«\É1¢OZ©,œ\Z²\â+\Ü¯=i\îÎ§q7”\åŒHQ\ÐfºË‹‚»ŽzV]ƒŸ.øŒd\Ä\ÄP‘\ÝCGrÎš\î#”\í20\åjM\ß>\nñPx¥·ñ%\Ï\ï\æHŽGº)ª\Ñ\Ï#7.MmõRg¡ü5³‚\ï\Æd…]#œ2\ÈÖ½\Å#]¨¡G \åŸmûò>e\Ä@þµêƒšU%s\çø†³–1Á=’@\ry\ç\Å-67†\ÇS)…„²»(õgÚ½\n¨k\Úbk:åƒõ±¡\ìja+3\ÎÀb>¯‰…O3\ç[ûˆ£›võ\Új´š­´p‚®C\ÑEg_F\ÑH\Ñ?ú\Äb­õVr(ój¯#\ì±\ÔcbÌ’=\Ä\ä·$œ\àS£\Ç:³)\nzlGl\èG­\\Õ¤0\Û	Gðœš£\æª\è\ìCÿ\0§v­uk$>\\¤¬\Ø8ô¯O\Ðl¿²t{k,‚c_˜^õƒ\á\ÛÁq§G†\È\rt°dŒU_CAjJŠ4CJÁÁ\Æ\r#™!\å…D\í\Å5˜ƒ‚i¬x¤\Ça¬\ÕIL=h””1\â£\Üh\Ì\Õ\É¥&R\rRcúCÖ†\Æ6—q¤=)¹¤\êx¥=*·˜À\à\Z—w\nÀ\ÕriY\Îi¹\æšžªvisœ\àm\Ås©òÛ§©\æ·5ù\n\é…\0û\ì¬|‘}1¢\å \"1“Yz2Iy7wl“\åÀ\ç\Ñò¬\í	Ji\çpÁ\É?­\Ýa\n˜¦UZöýv\Íu\r\Ø_‘û\Ñ±#\Ñ\Ôú×Ž^\Ûý£N˜žª2+\Ø<\rsý­ðò\ÄK$FõRqúb´Œ­`<\Ñ\×nF9JU&·5ˆ<‹ùgš\Êu¢j\ÌLÎb¡«S\'5QÁŠD’ ô¢¡˜5ÐŽ—~\çc\ïUn‡\ËR\Æ~je\×\Ý5ò\Ñm½Nœþ£y%š£Bû_wZ\×\Òu4Ô­¾b\Ë÷‡¯½sz\ç;G¥d[\ÜMg2\Í\êk\Úúº«E[s¾„´G¢º\ÔEj\r/W·\Õ-À\ÈIÀù\Õâ˜¯¤e\ã#±jgÝ©òŽ:\ÖÂš\è\ïùYµ…r¹ÛW´.iq\ï\n+¨„lŒXZ`Ç“]Ðª+¾=L˜\ÊZi\ëM\ÍUˆ$$bªKR¹ùj¹>´\ì4E\'Ý®O^×“M¸[tPò°\ÜA\ì+©¸—Šó\ßY¼—bù9v0ô÷ªF\ÔÖ¡.².c\Ï*\ÝÖ¬\éN^+\Ã\ënøü«–Œ\ã\ë]N„2²X\Ø~†©-Nøh?]Ÿ\ÏÕ„¹\Î\ëxN\à\0JŽ\ß\æS.—Ì½€\â·O\åVRµLö°uùUŽ\ÓÁ6—\Âo$R\Ûùö3°gQ\Ã)õ¿Jõý/\ÇÕ¡ó \Ôc±–Žcµ—ó¯´n-ºa\à\ÔFÑ—8Á9¥\'ubrœ.9ûKò\Èú\"÷\Åþ\Ó\ã\Ýq«[ûm\Äþ¼\Ó\Å.5&±\Ð\ãkkwZ\å\Î$a\ì;W-\'n‘V\"Ò¶ü\Ó6O§jÉµÐŠ.z™ùÿ\0‘‰,MŒöª›z\×Ô£ò\ä:UGˆª\æˆ\ÇBq¸…-\Ëx÷ÎƒÞ›â—‘R\áü\Õb\Ïþ>\ëQø\Â>\"q\Ó?Òª\Ç\ÏTÜ“M¼º\Ñô)³¤žK\\ô â¢—\ÆZ\Üðùfh¢¼#ó§xwO¸ºÓ˜¡‰’S·l\Ç\nk}>Oy\âl­<4[Hå®r_\Ûz‹½õ\Ãg\ÖCO]fðne?W5\×\Åð¥ø2\ë+ôHúõ~?…ºZ¨j7N{\íP;¤f\ìsž	»¾¼ñR(i¥bo4\ä•^8\Ízsq\ÅE§i:Ÿ\ÙôøDj~ó¼\ÇÔš˜ô¬Ù‹c)‡­IŠLR$‰‡\rNÃŠf\Ú`EIS¨È¤ÀJCHÔ©\r2ŸE0F\ìR•¨eÊž)!#¨2wSZ\\\Z–\ÍU„dk²fb\Ç%‹Ê²”\æu¥®ÿ\0\Ç\Ô`v“N ‹\ëš‹\Þ,\ß\ÝqPZ\'—`¾õ>¤1h­0|¶ÑjC$Œî¢oº\Ã»ƒšŽ\ë-SIbso(•ô<\Ô~µÃ Á\Íjü?¿þ\Îø—\ä1\";øŠc¶z\ÔV‰]\n\æ÷Š ÙªH\Ø\Ç\ÌAþu\Î:\×o\ã{R·¬ù\á\ãøŽ\rq,*ªtbe)“š£\"bµXqU%Z‹’g€wQS´cµ\\FÂŒ\ZeÀùk.\Û\Äv÷-µ88\î+/[ñ]½¾\èU\ËM\ÝTW\ÏF…G+X\ã\äm•µ©\Üm$u¬†‘qU¡ž[’óJ.r©K.\0æ¾‡O’š‹:à¬¬ÅŽúKI–hl‹\Ð\×£\ë–Ú½¢ôK¥<Ö¼\É\ã’6ù†*{[Û>\æ;«vÃ©\ï\Ð\Ö8¼\"­­Î˜NÇ¤\êX\Ø~é¿`\ßL¨zŠ¼šòkV12§–W\ï®Š¹\ÍMÉ\×=q\á):wL¹;žŠXÛ¹8ók{ ¨Á®_N\r%…²@XÀ\â·-\ÉH‚“Ò»-¡•\ÉÛ­6šd\â¢2P‰$üµNG¥‘òµBf\äóL¤6\â_”\\®¨ÙÑ»ŠÝ\ë›\Õ_\æ4Ñ¼Ž{\È\nýk Ñ›jœzùŠ\Âv\æ¶4c\Èú\Õ&vFZjYr\ëOgþ+}¿‘­o$H„Ú´4\ß\Üø†\Ò\Ö\ìÝ¥¬qªYr[š\ê\í>Eú\Í]û±U6“5h§«89±º>\ã­n\Ûx{S\Ô-\Ö{H#h\Éû\Ì\àWSiðóAŠró^^9\'\'*é­¼+\áhcUE€þ\ïY7©\Õ,\ÍS^\é\ç±øGY™\ÍGûõKU\Ó.´\Èk‰\íKm\Û™\"½qto*\íM08÷j¼ú.’ùT\Ñ\í½ƒñ \ËûY\Íê¿¯¼ðKÂ²Ü˜qP]\ác\ê1^\èþ¶PX\é6H;1E¨\ßÃ‘?\ÐlÀö‰Â©6cWjxFŸ‡ºÀ9«)Aö(\ì\ãùW¥ø§\Ã\ÐAh\Òýž]r´J8õ\ÅyŸŠn h!‰dV‘ˆ8µY\È\ç\Ìô¢kz}ž€ö³\ÄZP[aÖº}3Y:®\è\n‘\Ï ×šÁl|\ånÀ\×m§\\§”±“ƒšm\ÏS®\ÄhN\Ó\ëZjk7ð\â¸[¡\å\Ê$\rm\é³\î*\Z1h\ê‰)*;~TUœf‚\n\ÅqQžµe’¢e\æ€!4dzS\ÊñM\Ù@	\Æ*&^*\Æ\Þ)…h«\nfqS²\ÔE9¤AÉ©3Öš©ƒRƒHcvzT \ïVÁªZ‹˜\í÷¯Piœ\ìÁŽ\à@\ÍXZ¯u\ç\ÜXŠ_#%AÁ55³±·zmp¼¯¥Pº›o\Ôž˜ªv?=\è=\Æi\×™n¦\'ª“š~‹o<¯;\Ä\ãz‹4597$HGzd\Ü\"/ ¨giLÈ“.\Ö¥Kpz¢¥ŒycŠÌ¼¼—MÕ´\ÝV#‡·N~‡5tŒV~·I¢Ü•dÃÂ´†\âG·x\Ñ\ãž\ÇO¾Œ\æ)ò¡½™w\å^z\Ýó[š6ª<AðZ…`÷:cª¸\'‘±‡þ\ÊEc\Üc\Íl\Èúj\æ­:UºUYWƒW1š†D\È\"±¹,Ï¢,eM\î\"\ïÙ­¡R\Âö¯)¿x\ï5k™c@¤8úW®KM 8$`\Zó\Ý&m2õ\í\å^‡!¿¼=jc\Ë\Í`QD*ÁTÚž²sš\ã!r*0\Ì85Òy>ü{S	V·Œ½“šlŠU˜\í£K,›òN\0E£WCýÝ¬§Õ¿¥W¼&K­£«S\ì$\Û\ãÖ¢µo;[ˆvO\é\\v´Ùª\Ø\í\ì\Ê\Ç\n þ¯,\Çß—Ò¬G{¼óM£3c\Í\È\ëL\ß\ïU–PW­;x©°‰]øª2¿=ji\åª¿4ˆ\æ\ç½sšÀ\Øù­ùb¹ýa\ÉG½RF\Ð\Ü\ç\Ùù­6ý a¿\î\æ³5Ì§š{I¦})ð\îdº\Ð,\Ø®ýk\Å;\à\Ð\Ù\í¤08•u\à\àš\ä>\Ü	<9h3\Ð\È?Z\î5\Ý0\ëZL¶+/–d \î\ÆqƒI\ê\Îy|d6\ÚEÖ‹ku¨¾£5\Ö\ÛfeI9\"°ôiµ[þ\çPk˜u6\Ù$.8Rrr\rOa¥\ÝiZ\éÑ¿´g¸´¼²|¬­­\Ðž\ë+\Í\Ölg\Ðt\ÝGOò\í\í.Â‹ \Ù3\Å+#T“Vg§\nrµ\Èjú4\ZÇŒn!\åP,ƒ®\Æ\Ç>µ\Ñ\Ü5è¿‹\Êx¾\Ëÿ\0-›ð®c[]Vo´»¨ wÓ¾v‘wq»µ4ŽxnÊ†\ÝoÀV¯ö\é#û\"\Èòó&\Ì\àQ]\'›\á5\É\äÛ®*dZb\éŸOY›-¥\Ü\çø‰Sš\Â\Ç>\Ó}¡\Ç\äM;\Úz£7Æ¨²\é¥[•de\"¾n\ÕSÄ“¢* ~¾”ñ‚\î\ÓÀH\"¾nÕ­\æ‹\Ä×‚H\Ùp\Ù\ä{U vÉ»Ž6û¬q]ŒV‹\å\0ª+…·fGW#\îœ\×}at’Æ§¦ESA6DM¾\Æ\íW4¬ª(ô8¬\Ýv\ï\ìP[\ÊS\ÌÄ˜þ\ím\é±#*´l•a\Ð\Öl\Æ\çEm÷E]\ÅU·O•kAW\å¤I-D\ÉV\ÊTl”Sm©qL \Za§·ZŒ\ÐmQÔQ\Ò\0”T^e=\ÎE@Fhc&\ÅAx7[¿\â¥QA\ZŠ\Zk±\\õV+V\"Løõ5”eñvV\ÜÖ›o\"\Ü\\²FÀ²õ•h\Ë\Éð\Ü\Þ	P‚]‡\"­\éHñÃ½\ÌI¥¬Eq	ó\Üy&²¬§h.C8ù{T2y¥¿þð\ëøS&lÉšto\æ\Ý\Ë)y¨&??	‘H\è%†X\Ïñ!¥,<\Ðr®>´Ð“4þ\r\\™!ñ\'†\å$ùö\å\ÑO<Œ©þcò©­ek6\ÖFeSýT\â¹oj\Ãÿ\0\í\ä-ˆg“\Ëa\ê®1ü\Íu1\Äl5kKn¶×Œ\è\ÙcŸð­¥¬X2P”†0iôµ\ÏfIFXG¥4‚Š\\;U}SB‡W³h›/ð>:\Z¾±\à\æ§\è+\çq8‰\Çtö;aNñ<rö\Î{§·¹c¡\Ç\×\ÜU)=z¯ˆ48õ›\\€\æ>Qñ\×\Ø×–\Ï\Û\Î\ÐÎ¥$C†R:W½„\ÅÆ¼|\ÌeM¦B\"¤¸¸\"-˜ùi¤Ž\ÕZ\å°@õ®Ç±Ð´bmÁ§hÿ\0ò¸‘¿p¿SM±\è\Ã\éS\éQmY¦\ç,ø®Xk7s^†£KŠD¸\æ«1&˜2\r>¤›°\\’\0\Í\\ŽM\Ýk\Æ\riC(À E§5N\ã¸«{\\\×?w+´Í†\à\Z,±#ñ\ÔV Isš¸\Ò6:\Õ¼¶{Ð¢g54@f`‹\ÔÔ…O¥4‡ \àŠfñv=£\á\"½¾ž–\ìyYõ¯L¿kÑ¦\Îtð¦\è!1†^Mð‚èº•‘‰\Ä\ì?J\îW\Æ\Êu	R=\"\ê[\î>\Î\×J\Ýúgo¥M7-hó\ë\Z¿ˆmõ½5¬V\Ú\Ø\Ä\æ_\ãs\ÜJm\Ðñµyka}c1\Û]	ž\é[\åu^€Z\Ú\Öõ¯\ì¨mþ\Ïln®.%\Ålg¹\É\íF«\Üji0»\Ód±¸…ö”fÜ¬;{\Ðn\Û,A$\Ö,–W\'\Æp\ê@)¶fA\çvsÒ–\ÛS’\ç]½±T_.\ÙT–\Ï95z\ê\ë\ì–S\Ü\í\ß\åFÏ·\×4$sõ$¸O:\ÖxF3$l£>\ã \ÙM§hVÖ—‘‚	C\ÇZ\å4¿ø„Ï£\Þ\ß\Ï¶Zœ…<•ŒsŽ{ö«¾$¸Ô®üK§h\Ö\Íc°¼\Ï\"³\Ð}*š\'!l•›øI?¥x»¯[\ßj(”ù‡®=+\×-/\ï5	\í¿—Î¸¶¹’“û\Ø\Ï&¾Q›\Ù÷daú\Õ#H\Z*w.tz&\çD\ÆH^+Q\ÇºK‰\çˆö\Ã\nd\Ì\èZ–3\ÈOf§£B±\í\0U\0\íQùjG\"¦\Ó\ÛË¾U\ìx™Îª\Ú?–­\íÀ¦Z§\Ê*\Ñ^*+\â¡qVö\Ô2/4€¦\ëQ\í«,µMÁ\Í7U‰£#AER9¨ÊœÔ¬9¦–À ˜qQb¤\É4b€#\Í!l\nŸ\Éu¦˜q\ß4€Èšòö\ÖG’\Ò‘XvªË¬\êð»JºRn¤/Z\Û	µÁ\Æ*r\ãª•ºñ©q	Il#_z\ÇK\ÉK0·_Z\î®m’d\ÎÑŸZÆ¹±DË‘Ò›c*\Û\0#v>•S;\æ\Å[û9ö¨m4™\ïR¸¡À¦J»[´¡†¢¿„*©jŽ#\Äy·\Ö,n\Ð\á\È\Æ}ÁÈ¯B\Ô\æ.·¼êµ=$Sþ\Ö?ýU\Ãø¦3LI€¡”s\ìx­\ÛkÁ/ƒtþ²i÷n\ç¾Ã‚mu`7ñN¥t	#(\éšZÁ\îAõ¢¥˜q\Å€\Ö˜\Ç¬:ŒñP2\×\Ç\Î\îMž”v ó\rs¾\'ð\ê\ë6\Ï5ºª^(\Îq÷ý¾µÐ¸\0\Ó7`Ö”\êÊ›RŽ\à\Õ\Ñ\âe‚f†`C©Á™s÷W¢x¿\ÃBù´l\Ô	\Óýb\â\çw¼òA\èk\éðØ¨×§u¹\Ì\áfjÙŒ[/¸­h\"Xl•H\ÏV\ã½fÙŒÂƒÚµ‡1\è*©üLRØ­\ã!JûÔ„sR2\à\ÓB\ä\Ó<C\å©\ã$5DŸ*\Ó÷M¾ŽYvú\Ödö¦9NsW!™sN˜‡\æ˜²GŠ¬\éZsš¨\ËI\ZE™²G\ÇJ¨\êV¤Š+>d\Ãæ™ªg¡|\'¤î½¾\Ñü\Åv\ZŠ\ßA¹\Ö\"ºÒ¤—MŠý÷]!û„œr+†øS&o\î¤\È1]EÎ«eeo\â\Í2\îP—S\\\î†\ÈÀ\ïTŠM_S­ñ¥ôñc\Þi±¤²›¥ò•\ÎnZ¹\á\ß\\\ê÷7¶—öKi}h\ë½·)2¬ŸHlü?¢^\ÉùVsA$ø\\•]¼šo„\ï\á\Õ<S¯j6›ž\Éü¤Žb¤ âŒÜ“V4¼:\â]o\ÄS‚0\×B1ÿ\0­«´Yl®\"—!6\rô\Åyˆ4iDO\r\ìko6¦%O(\ê\Äü¹õ\Õ\è¯{÷M¥1]=¹bv§ŒuõÉ¡X\Å\îyŽ‰{ª™ü;ôJšDEm\ç—9 gš\ìõg\ÙñE?Þ¶:\æ,mµ›ˆô\ßI¥O°¼ód¹aû²‰>§5\Ñx²\ÓSYÒµ½6\Ì\ÞR\é$\np\Ä0\ê?:­\nh\Í\ÑyÑµda÷uY?P+Ã®\Â&­r¨0V©¯wÒ´\ÝB\Ï@º›QˆC=\í\é¸ò\ÎÀkÁ¯\Ûnµ|?\é\áÿ\0\Z\\¨\è^·=+WK“\É\Õ\á=ò§úV5³d\n¸££‚AF\rùU\nzž›ù\Ð:¨É¦)\Ù\"8\êTz5ÀdŸ•‡?>\àl‘€\è)4s´z¢Ee\èFj\Ó@@\Î+/Ã·>v“™\Éiü+l>\å\æ³&\ÅO(\Ô_Ü¤\ÓA4\ro@\éZrD1U^*V\Ê%*\'^*\ë-B\ë\Å=Ö«I‘ZµEšC*(È§ªU(¤¶€+¹\Ç\".E&M( \n¦\\‡\ã¥MtÍŽ*²7ú3NO\Ê3“@ËŠ\à¯5ªamIõ4¶·qÜ†1œ€pj]ñi\êsE€ÌkŽ\ç5€>`¤¸p#–\Åò\ç\ÔPGl™*\rD|£Úks\Î\ÜS®T\È(9mJ1%\ÔGÉ‘õ[\Ã\Î\×>×´\á\ÕcK¸Ç¡C\Ï\éÊ·^\ÝK{ñX>Í¯‹–\ÙøY„–\îpr?Âµƒ\Ô\×\Ù\\­:\Î\ã9/\É÷T\ç¯‹\á\ÂWNž\Ñ\Î\ÒvB=³[j¸©Ÿ\Ä!§&Šy¢ F»µ@\æ¥~•šøûÝž’ “­BÇš{µBÍ“Mµa‘öŒö¯\ÔÏ›¬]0\à4ÄÎ½[P\Çg!q\Åy4‡u\Û1\êÍ“^¦V›rh\Ê{›6iò ö­P¸Z­§A¹ý*ó^\Å;\ÛS¤4Õ§¿SQƒŠh’Rx¨\Ù\Î)sH\Ô\ÐÆ‰Jš°’ñÖ©IJŒqLE™Fj«w©r\Åj»±šE\"*¤\Ã\"®0-U¥\nh¸³k\áþ­k¥\ë’Áu*\Â\'*\È\îp¹‰\í^»s¬\è\ÝGu/öT\×–gš2G\ë_8\Ýgv\rDœb\Ín®}%s\ã+cG&¯¦\Ü7\nG\éY\ëñB³‹ÉT\Ó\ÑGdV#ô\áVVp\ÜYGZ\ØM:\Õ@\ÄKùV‰]´‘\ê²üX\Ñ\åûtrsŸ’	þURo‹\Ú~r—Ùµÿ\0^v‘C\"Œô©Q£f\ÆÀq\Ûr¡Ü¿\Æ;e\0¨½Ž\Â¿Ö«Mñ±2V\Â\ï\ØUþ•\ÊM”‘\ä!G¦2+•\ÖB£\0½\Í7¹ZXôC\ã\Ýíœ\ÃdQp®ògiõ\Æ+Î‰fc#±gc¹‰\îOZ¯8«\Æ\åf h³f\ÜUÿ\0¼1\ëYv\ÙN+A\"®\"g_\á½{CŠ\Ï\ÊÔµ1mrŸ!‰ÐŒú\×V²xz\â\É\ä´\Õ\Ö\êaö\Ø\à\è+È¦ò\\bEF>\â©ùQ\Å4s\Ãû·WS”8\ïTd\Ñ\ïž»\Ú\æ\Û<\ÆÁ\Ô{\Z\éüõò\È’+Ò´ù­u„ž)\0\â\É÷\ÏA]8=kõ2\'´d‰\éWv\ÖT·›\Îqš\×Š.\"6^*»¨«.xª\Ï@Ê¯Bñ\Õ\ÜdTl¼Pk¥@F\rhJ¸ªRjJ)¬½jX×šVQ\ÍhªV›³&¬ù`\Óv`\Ð+ž\Ü0\äVl0)ûE©=½m\â³q\å\ên?¼€þTg\Û\éPiˆ\â*¬rsYº„žl\Ë\Ï\0WTJ\È\n+š\Ö,&ûZ<.¨˜ÁqT€Åœ“u}Fk^;H”UÁ\ïYSBÖ·ˆd–9®<\nÛ‚Tu<Qa\\ ùe\"¯‘”ü+8È©p0G5tK•À¤\"”«ó\×+u!\Ó|Y\Ð\Û\"IŸ¯õ\Ö\Î;\×1\â8w´Ž+F~½Gõ¦€\ÞOô_jV\ê\0†\í\Ñ\ã¿|ÿ\0:\ÚS\rrs^\r\Þ\Õ3\Õ\r¼žø?ýz\êŠ‚§ª’*æºŠÄÒŠ‹\Ì\Í\Ó5˜u[5u\Â\ÈÎ™\èj\Ñnµ\åö\ZŒ\ÚuÈš\"\Ú¢½N\Ôa\Ômhl2÷¾te\Í\rŽ\êsRÐ•\ê\Z°\Ã5Zò\ìmc[”‹B òk\Í\ÝsyÝ«\ÐuòÁ\Ñ1‚k€„o¾Œ\ï×¿•iM\ÈÆ¦Œ\ê´\á‹r´ù›oi û5º’>ð\ÍQº9“ð¯Rœ¯ž[?ZŽ¤ \n¤1A©1HÀb¨.Tl’jX3C(\ëOSŠ\0˜ \ÛUeˆ–«Jô¦•€¥\åtªò\Äyâµ€LT¢h.\')¨.\ÖS\ïU\íðÏƒVµ†;½x¬\Í\å[*qAºv‰»f|¶À\îkeS5\Ì\Ø\\Tõ5\Ò\Ä\ß%tGc)54–H\Ô&rµX°FŒ&\ìô\ç5d\àõŸ°®\Æ*B7 ‘Œý*¬E‰§¹ý\Î\0úW#«ü\Î½u·)¶,²)8\á{\×%¨ó6¥)lR*[Ž@®Ž+p\Ö\ãŽ\Õ\Î\ÅÃ­u¶i¾\ÐóŠ\ÄfcÅ³8¨\Øð+i¬ü\È\Êóv5=¼°–ŽPU‡~Æšb¸5¨`ž»»)njG2Gù™\Ü(\ÇrMg}–_?.{õ\Ï5\ßx/\Ã\ëu©G¨\ê.#·ˆ\æÛ¬\ëô¥\Égª\Ú.c\'”E_\ÈV½©9=« m¦T`S\ëZ6Ž6žk`÷/»²*\êHJŠ …OSW\"\Æ8¤\"n¢¡u«3M•y¦2¶8¦0©\\\Z…ø \nó\n¡/Z\Ð~T\Õ)Ž3ŠGn¸¨Øi¹4€psN\íQŠ‘zR¸	Yó)mV-£;”®jóµJò\Ü\ÜBU]‘\Ç*\êpA¦)aÔ£Õ–? ˜ý\áÚ´g´®\ÖSùVÒµP\Ù]Vqþóf•ô­`.N¯%R•ï¬”HU\Æ0}*,abŒ\ÈGðƒ‚i³\Øj1‚\Ïpe>¤sLKöP\Ë1S\íÖ\Ä †\ã&gˆ¢\ç\î“È«ð–\Ø2:\ÕX4Ë³(3\ÜH\ê?„·­\å`Ž”…r¥\ÆBX\Zê“§GX_ð\Ï?Îº;Áˆ3Ž†²®#[«;ˆü´‡\éB\Ì³7„®\Ñ[æ²¹Y—\Øô®º\Þ\ä\Ü\Ú\ÛOÿ\0=bV8õ\ï\\‡}ö\Û\ä\ÝZ²\êÀd*\Ûð¬þ~…\Z±¡‘£÷õ­e¬@\ÜZ)IÀ\âŠÀG™°\Å[ÒµY´›¯:3•?}?¼=*®A5ˆG=«yÁN.2]™\ë6—0jVIujÀ£Gu>†œËŠóm\Ä\r¢\\\ä’\Ö\îq\"Zô…š+«e¹·pð\È2¤W\Éc°¡+ôg¡\Zœ\È\å5\Æf¿`OÊŠq\\=ˆÎ§ýt\Ù\êï›«–?\Ý\Ç\é\\®†‹.³n§?Ê½l¾£c*²\Ô\ì\î\Ø4q\ÑF+&\ã–\Íjº/•>s]\Ê<¨ÅRŠn\r*ñBA\Ðq\éQ1\â¤\'Š…©’4š@Âš\Ù\Å3še\"Ï™Az‚”hP\æ˜\ìi\ê)²/˜\Ñ\Îj¼ö\ïX\ç­nj‹Áú\Öh±³Øž\Åö^FÇ 5\Ö\Æ\ß.Eq\Ñ|­š\ë-4)ô­ã±›:m\Â:Î¾#{kf[W`­;\0\çJõox2\ßPð¬ZeŠ\"\Ïj#\×\ëQü8lø2\Û<\Çþu\Ö\ZNd6|\å­èš–‡\"E¨Û˜‹‚T\îW~A¸lWµ|bÿ\0[¥ý\É?˜¯¹\ævú\Ð\Ý\ÕËŽ\Äq\\}k­³m–«ô®r\Ö ÜŸÂº8Ty\n=«+”IÀ\Ìkza¸@“F’!\êW+´Wô5\Õ\éRùñTˆ‘y´\"Wû{;\Ðu6óaŠ[fX\Ê\n/NÕ«\r´SF‚d\ëPX›Ñ©:\Ý\Ú\Ç\äŽQ”\ç5W\"\çUk¦”´‰D\ÎHQ\Ô\Ô\Ö@¥ÿ\0’\íÁI5²*‚zÕ©ÿ\0u$W ò§·z†fÑ°ö\ãw\ÊqW R\n«\ë*«3W\ã\"¢`Se\ÅMª÷<)^Až†©}še˜±¸fO\î•Î®R”NHþC\É\â©\Â\ãqosZ2ò¦¨¶9Iú\ÓjI\æ¦m ´ô<Ñ¶€1R\Ð\Å`H8\ëP\Ç\Æòd\Ú°jÀ\"‚E+Ê¤rE!c´g®P‹p_vi g7\×7N\É\ÈP{Ž•£\Z˜\Ô\ëZMn«\ÈªN\î*®\"$#J‘€\ÏJ…ó*\Ëý\ÚS¹@Ñ°\Æx¬H\Æõ´\ÒuüJÝ¹ R\ÒO\ì\ï\"`\É{ÿ\0]i\é#û;\Ä:¥€$(—zö\Éþ†²|F>Í®\Ç(F¯ŸppkF\îo#\Å6WG\î^[¨b?½Œ\ÔV«T]´;EˆZ)–ò\æ®\'–óš%|®(3ª5F\ÒF\ç]CH®\éš\ÞðÎ»6—)´f\Ýo/\01û¦²_h\é“÷€p¤:Â½8ÔƒRF”Ý™\ÒjŒ|›‡\ï°\Ö€‡ûIX“[z\Ãl¶¸>\ØþUC\Ãñ\íó¦#ƒÀ®L\Z\\¬Ò£\Ô\è%rª ÷E\ÎI©®n•\Äj6\Z®[#5\Ñ#63\Ò)ws\Í.\áE„7m0¦jRÀ\n€Ïƒ@\ì4¦)6\ÓZni<\Î(\0\ÛOE¨\Ã\äâ§­&HóDñSGÒž\ëò\Ò\Z9mR<}k\ãÁ®‹T\\ÉŠÇ’>i£F\Ê[q]–þyŠ\ÝH\Ü\ìL\Ö<±l¤·º6ò¥iK>°Ñ¬­ô]\"\Ö\Â,m‰\0$w=\Íi\î>^k\æk^ÍºÀ#·˜k~\ï\Æ\ÚØ°û4šƒ¬drWˆú\ÑË©\r÷Å½+\í^\Z—\nö,NIê­€Zù\ä\ÒZ:·‰/µTû,——o»%BC\Z\Ì_½M\íbã¡¡d2q]	¶>k\Ãýbýk¨Ž\É\Åd1/Pù¤úš\×\Ð%d!ry¨/-Á5sE·;‡\é¢[;‹$3\Âý\ê§8\×!»x`°ŽHûL\ÍÀ­}&,Ú´fR €N\rS2l\Ç\Zc\\,w8Ä‰\Ãm<f¥ºž[x·0g\0t«h·`\èO5i¬bo¾¹¤2m¯d1£½m[\ê9\n­\ÅR¸±\n\É^3\Í?\ìÊ±\åŽ\r :i™€ ñVXnšÁ\Ó.Â±„œó\Åký¤\Å\Zz\ÓOJi\Zc?h’\ÖRË¸jI\î\ØLc*«HÉ J\Ü\ÔL\Øj)%\ÜsM\ÜYh]ô¹5\0\ë\ÍLµ,	NÛš@0u©E3n)Â˜˜\Ù[\å¬ùH¯\È2*„\é\ÍP/Þ©\"©\ï*ø«*üP!Ÿgk2ú\ØE&Gz\ØTu.UM\0q^.‡u­œ\Ø\ÉI\n`GøŠ­}\'\á\Ý.ñH\ßm1ŒŸ®ó³­\Än4y\ÑG\Ì\n²þ°,¿\Ò|;©\Û½\ïTºyý+X\ìh¶;\ËrE9~|\ÑT<;pntKG\'$.\Â}Áÿ\0QYIY\Î{pD’&\ây\0\ç°*M¶7££õ\Ýjs„¦º†7iV\ä\ÕûWSpŽ¯2Ö³bW\'5wM\çTµ_úh+:¿4§¹·¬&l\æ\'¿ø\Ôú= :L{G-\ÍG®X¿–´¬\ÙtØ•†S¥qa>\ênPžS‚EW#hÀ«21r[\Ô\Õw\Ð\Ì\ÈZ¢f\ÅL\Õƒ4€¥¨òI©„Y¡bæ¢-¤\Ó\Äg0\\TÊ£€¦! æ¦Œb­²(@D8§?\Ý4±ŒS˜|¦‚‘\Ï\ß&\é3Y²E\Ím\\¦\\\Õ	#4!\É\êgÜ§\î\ë%ò	­»„ù\rcL¸j¤MÈ’g‰·#jY¯gœ#“Ž•Xõ¢­1’!ÃƒW\â]\ÍY\Ë÷‡Öµ\ív(cEˆ”ÀŠ\ìl˜5²·¨®Qbù«z\Êvf~\\VBf„®»0EO¦2£d\n¤Hj½b€R$\ìôÙ·§@8\íZª¥\ëIQ³ð®‚\ÝEZ!’ÁA’)·\\ö§\Èø¨6\ï\à÷©¸‡Å™P0$Q^D\Ò.â¥÷Ht­\Ï4™kº	²À†µª—A\ïT®#2°(Á[ÔŠX\ãh‘XûP\âXw¨\Ý\Ûi\æ¤Y£1ü\ÄQqL‹™ŠK–ª²Ý’üt­\ë2<¨\äV;!\Ý@2·nõn6d_˜U8Fe\çµZf,q@\Îãš•jTŠ•)0%©qQÔ«Ò¤B\í -8S\Â\Ó#djœÑŠ\Ðn•Rn)š\Ðû¨#oh®*¼i€\ÌóP\Ý\Ç\æ\Ä@ô©»\Ò7\Ü4ƒ4\á’3\ÝH®G\Â\ÙmN{iqû\è\Ùò \×l\Ì‡\Ø\×$:G‹\×\î\ïn¾WkÁ/6\î\Ü\çt3ô\È\ÇóTz}\ÅÚ• -Â—O~Œ?­Or\Ä\Ç\ÃU\È/D\0\íDlÿ\0ys[:µŒZ=\äš}õc\Õ]N\ÄV,\ÖöR)û9x_²¿\"´„\ã8©E\è\Ëq³%¥º•¤Ž\Ø\å\Êð®\é¡&\×-\ÃóŠ\ÊþÏ½³U9Þ’ŽLG8õ©\á\äa­B\ÇøA5gû¶T75ue2y¯:Š¿x¥PÛŠŽx\Ã\ÞAœü’oþuaÝ¤–U*6`}\ë	ü2ªneƒ/š&c#–©Œ*\ÄqdÕ+Œbº\Ìy \Çj‡\Ê\ëbh0*‹ÇƒH\n\ÞX¥ò½ªmµ Jb*ù~\Ô# «[=¨òý¨¸ô\ÛR/\ÌiþP§¤x¨\ÄU¥q…©‚\Ôn„šhw3f$ñT\ä‹Ú¶zŠ®\ÐqÒ©0¹\Ï\ÝEÁ\â±gˆ\î5\Õ][ûV,ö\ç\'Š¤ÀÁ‘n”\Ì\ZÓ’\Ø\ç¥Bm³Ú\ÆS^µ½§.\è\"²þ\ÎW \ÍoX&-\Ôcµ+Œ”/5~qUvóW ^\0¨`[$Ö¯~µF$\Æ\r]†\àsÞ‘,\ë4†;G=« I¶%s:lª±ŽFkj9C\ÍQ›.,sC1\Å\"‘Šv3@‰#\äsH\äô©òŽicP\Ò}(4‰\Ï$\ZI-•†O\Þ\íVd•Ä›ü¾µZòIc@\ÉoS\é@\Ê\Ùem¤ô«\n\ÜU•¤l‘V\ÔñL	†Z©=‚;—\ì*Âµ)`M\0gý˜!\àRþj/m\î¤o¸jpAš\0ˆ®)£­K\'Zˆu¤À•*e¨`\Ôøæ‡N¤´	‘\È\ØJG=\êû®ET–.8¦r\ã\ÃÒ¼F¢a·Š`;˜\Ý\r¡¾\í\0`\Ìq;\ë\\Š\âk1N¸+,c?QÁ®¿PŒ¬Û\ë\\ß‰\ÓvŸo1\ê’\Ïû\Ãÿ\0­T‹€­8ƒ^\Ñu²Fû\à\í4U;¶2xz\ÚU\ëo7\äÿ\0Ei¸\æµ=S]\Ð\íµ\ë&@hòb“ƒ\éô¯\Ôô\ë\Í.\è\Ã{Dù\ã=\Ð×º\ä\Ö~»£[xƒN{[€_ùe/t?\á_\'—f2 ù\'ðþGd\ás\Ä\ä0\ì?\Z\è¼<Ÿñ0\É\êšÏ½\Ñ\ît\É|«\Å\Ù2É°/÷‡¨ö­mq|\Çþ™‘úŠúJÓŒ¨ó\'¡„¥©°\ÑŸ8\éRƒƒVaÁA\äTR\ã\í=\ë>”\ÐOq¡*A\Å8ŒQK¸bµ Y€e\â³\Ý9««žõ©\ÍEC§ªñO\ØjEŠ•öóK¶¥ò\'špˆÓ¸ˆ<³NUÁ©Ž`\Ò` “.ÑŠ®ò<\ÓCN•U˜\î\Æ8«K*?JŽDšS\nËšž•­¸ƒPI¢\ã0¤€zUv„c¥o5°aÒ©½·\'Š.32+}\Î8­»[_qP\ÛÛõ\ÐYÀ¢Æ‹Ž\æK[ø®Z\Ú\í9n•q\ÌC·5JJ\àR¸\\$x×Q#·™\Å0¡-šµ=(\Ím>c[pLA\ÖM±À­¨mù\Õ\"­\åÕ…aT•¶ŒzTð¶þªW\ëL’\Æwt©a\æ˜\0”?l\Ð¤”)ùˆZyñ Š¡«\ÈÊ EI`|\ëOŸ’8\Í\0GZ·Ú¡X¶¹\ÇJ´©‘@\Èri²Ë…\ÅZò\êµ\Ä%ºP\Ê	!@\'®XF*$Œ¤Ýµ©€÷\â¢V©_-MU\æ“8l°\ÅZU8\ÍA\n\åª\ï\0b\r\Å&\ÓR\n	•\åb«U\Öa #Õ™¹L|¯Lc™xª\ÒÅš¶ÇŠ‰\ØP&LSOÝ©\ä Š…ºS©\æ©\íX\Ú\Ìb\ãC¸Œ(, H?]\âf:Æ‘7\Ç$_\ßR¿;ns6¼\Ñ/m\ÙyT\Þ> \æŠ4K]M£\æl¡ò¢µ‹V4–\ç²\âRmªwS˜˜*õ5ùÚ¼¥dwœw\ÄmýšÁFõ\ÝñŽ•ƒ¡ÿ\0\Ç\Ì\Þ\ÉýkO\Ç™d³LrŸÒ³´A‰nO ¾§\nšÁò³|F\ìD›¨õÅ½M¯\ÈZšO5\Ý\r ‘“\'\Ü¥zjj7\à\Õ,‹´\ÔM\ÍLX:f£Á=(0¼\ÔÁ)¸9©³@š²”\Çò\æœ\Zp\'\É3\ä\Ïz¥K8\æ™\Í\0J«‘š§<Y$\Õ\å\ãŠlˆ¡0f|qb¥eù¸©\n€i¬@\\ž‚˜’@\ÄñJõqeŒ¶ZFVûB\ã\îcš‘4@/J£,|ž+QÁ\éU\Ù3E\ÆgÆ‡}h\Ç3„\Ø:RGn3À©<¢¦€\ÈO4Ð¦§$J P+m5n1M\Å>!–	›¶-…¶``k\n×„¯fFE;‰¢ú\ÆKd\n²ŠA§FT(¦4ø|Uˆ˜\çm@›üÊ°¯‘\Í<\0(–\É:\á†x¦Cj¶±”^„\æ­p:Uk™<P*óS¢\àUx\Û\ÍI\æ\â€&¨¥\Æ*6ŸÉ¹h`\Ô·55\ßb\r-QÒ˜­‘Kº\"š­äš¡ù…h§Ý¤.A©>õ%8S9\"©¼6jûT3@\ßªòU\Ñ95ZE\æ€*ž´\Ö^*]¼\Ò)Ÿt>LV€¬™\ÑÜ§ÉšÂ˜a\Í[œf>\Ã\â‘\Ð	7Çš*O\Å\å\ë\Èýôú\r¬v5=³Vl\Ö\í$¬\ì@¦+D\çV\éü¸¥~{N¥¥k\Ö<\ëÅ®\Z\å\0þý*Ž†I[–õ T¾\"m\×(}ri4 ú–õøXÿ\0³\Å\Óvf\Öý¶¡GRj\rÆ¬:\áqUöó]mY¶=O†KP!›\È©#zm9E0¹(`Z¬`ªDÔ‰#¯²¨)\Øâš’zÒ—ª$­:óLjgÁ4ª¸€EZ\r>Š\Ê\ÞAcJl÷£)\î*\ÊñM’G_¸2i‰Í¦\\G.@\È0jÐ‚\á†\r_/\Ó5s@\Ê.†«°9«\ì*»ŽjJ	!\ÆzU©T\ÅSS†«qÂ€*¼g4ª„\n´Tf” 4\\El\Z’ót©¼¡H‘\á³N\ài\Û¨­{p1Yü¨+J\ÚNn\Æ\Â–£ \É5S\Ï;±šy—Š¤\Ä^W§ù†©,\ÜS„¼Ó¸‹É§\í\rÖª,µ(—Š.\Ù88ª\Ç#Š³»#­BüŠ\0…©ŒÞµ&\ÚR‹ŽsLó\Ø\Í-I,h#5\0<1\Å9Z£ô?5\0]ˆ|Â¯.1Y\ê\ãU˜œ‘H`ŒR\ÔKOV\Å\0;-MQµ cµMRrKU\ÉT‘\ÅU1zP#@Xò)\æ*Sš1L.g\ÏËŠ\ç\ïWd¤WU*f°uX0û±@\Ñ\Çx–#$VôÍ±¾†Š¹¯(}l}\èÈ~U#h«£\ÔqYú»³qžH\Åi ùk#[#\ËQžk\àiFõ,wžq\âþ›ôŒT¾ƒÛ³U|B\Äj_ðŠµ\á\âE»7«\Zûl:ý\ÌN:\Þ7.ZÎ°¼o4f6V±’85uØ±¤E\0\ä\0+Fep+F\ÚqR;Œ\ÛF)ô\Æ\Ïj,M\ÉUZn\Êtjv\Ò\Ñ`\æŸ¶š§\âÀPLŸ5;\íÂ˜\Í\é@E3&@˜\ài§$ÒŠ1A$œ\Ôg5e×Š…2ˆÛ¥Vc“ÐŠ²\Õ	8©Wi\ßV\"}´1He­\âœÒª\ÍL½)\Ø	¼Ê’>µU~õMæª­	¥@«®\ÚÃ‚\è«òkr½‡z	e°¹5!Œ\â›5h/\ËL’“–ZE—,y©åŒ“\Ågý•’ó\Ì\ÝòúU!—\ÖCS#jºÕ„ ;†*2\Ô\Æ4\Ý\ÔX\ï\Å2Ir8¨\Ý\ê,å©ˆ‰<\Ór)$8¨K@ƒ“R¨¨b«H>Z\0rŠ·J©S\Äq@7cŠ3»=*\r\Ùz’€,¦žj6x©°v\ÐIµi\Âõ¦ñA#ˆ¨±RA‘Š\Ê\ÔS|Mô­)\ÍS»Œµ»cÒ˜\îr—0¬\ÖóBÇ‡B¿˜¢§Áƒ\ïE4\Í\é\Ê6\Ô\ïK\í8®wY‘š\ç\à\nØ³¼R\Ó\í\ï¢,«\È=`êºõ‡¥|]\ZN5¹YÞ\ÑÀø…ó«²ÿ\0u´´•ò¬b\ÈÉ¬tn\×\'ú(ý+vÂª\0öU©Dâ©»-†É§Œ\â¡NMN:SfAKš\0£€3GSI@\ë@™eG…h@iÝ©ˆ½!¥\ïKHhn(\Å;\ZCMYú\Ó\é5QòŒP&<(¥\íK@ˆ\Ü\Z…–¬µ@ô®üU|Ù«Ö™Š‘$°¨\Ù*Â­#Š¤€¨\Ã4|­E&Kb­\ÛÅ• cR\"i.m\Ú=§®j\ê¦\Ús®\áƒÚ’v¤z~YHr}«~\Õ6 QY\Ð\ä+NÈ¢÷%—\âJ´\å¨b\çh–™%w\\\nª\Ã-We!ªg­P\Í\ÔK(\Ú\ÆÕ¬ÕŒð¡2 \äñšš!c†\í¥Vv\n\âŽ¸\ïõô³\"\Å‹h‘ D®XM‡W¼ˆ8ó÷)_™Ëž\ãÞ¾k\êY#T\ån÷“wÕ½7\å\Ò\É÷6\æ…õ4^\ÒÕ´\ìA2\Î!ø\î_SŽœTòiVjñ‰~Y‘[I Žw\Ü\ÖI\Õ\î\Æ$\Ø\Ì\ÎW\Ó5!Ö§,E\n±p\îUH\ÞGL\ÖSÀfw÷f÷iõ·á½´\Óñ\Zœ\Ímgv·ª¶\ÞC\Û\ïF\'pƒ\íSÁc§\Ì\Ö\ïö_%^\\F¬Ä™Hª²\ê’L¥V\ÞÕ˜4W\ï\à\çÚŸ.±#J“}–\"†Á\ÏÓ­Tðx÷X]oöö\Ñ.ú\Ý\ë\Ö\Ëm^‚”/¨+MM®\"Ž\Ü[Iª»Ñ‰c¥G¬iÖ–ö…\í¢@c—\Ë-…¸\Çñg¡úU{½^gŒ¬QCo¹ƒ±‰pXƒ‘“õ¨.õyo!òš(£Vm\ï\å®7·©­¨`ññ­	s5ö\æn\Ú+ß½õ²\Ö\Âr…˜\Ë\à{•[†eŒõ\Ú9>\Õ\ÐÇ§Z­\Õ\ë2F#‰•Q]\ÈQŸS\\\ÌUÕ‡PsZ\éªK\ç\Í+G¬\Ä†WŽ•×˜\á±UeziZÖ½¾\Ô^žm]_ò&Š\ÜÐƒJ·73¤‘(HÁ<Œ\r\Çô¢KK”Š\á Û¹_o8f9ªj\×2IŸ(hØ° u\'\×ð\â†Õ¥óTˆ¡X\ÕJùA~Sžµ\ç<f\Õ\Üõkù´M?ü\Ýw\Ýkªeó@Ð’\Æyži#)€3Gœ\írqúÔ±\Ú\Ú\Üy8ˆÃ½þ@X\å\Ô\äúV<Ú¼®˜h£Ù¹N\Ð8\Âô_¥Oýµ%Ã¬‚\Þ$‘HÃ€sôúPðy“ŠNO›]T´Zi¥õ\Ö÷z\é\ç¨s@º\Ñ\Û<pOµ¢G%YT\ç§J³öh\Å\É`#À˜Ï½fI\çlr/öƒ™evd\Æ\ä#Ž:V\ÓÁc?vmhô\æ\Ùs¦•ûò\Ý^þW”/ýv\Z\Öi&²-Š²Ç»¦{c5b+[.\àF\"@r88\é\ÍR72›¿´\äy™\ÏN>•#jyŠ\ËjŠ1òz\æ«ƒ\Ì\'(N\ÍE\'\ï=\ìù½oug\Ò\×\ÐJPWº%º‚“\åuŒ2P>elž\ÇÒ­Iki#¨‰bòƒ€\î®IßdÍ¨I–&(‡\Ê0?\Õ\ãÒ§MVY¶•H\Ð\î\Ü\ÛW\ïzŠ˜,\ÆQ‚RwIý¯%\ÛWó¾¾BR†¤—ö0ªG#k¸°#;útü\èki\ìV(˜Æ¥\Û\Ì;—=N:qQ\Ïv\ÌË˜aØ \Þ2{ýj´º¤\âŠ±«•e\æ v\ÍR\Ì]8G™\Ý;üZn÷\êì·¼ŸKu5;²—ˆt›[	\Öó •Qž9Kþ0z}(¬\ÝS\\¸¼†Ks1pÒ´kƒ!	¢½<®Ž\"LC¼¯\Þý¿[ü‰¨\âÞ‡ÿ\Ù',NULL,NULL,NULL,'59P166480','2020-07-01 00:01:00','2020-07-01 00:00:00',5000,NULL,NULL),(3,1,'285723691',_binary 'ÿ\Øÿ\à\0JFIF\0\0`\0`\0\0ÿ\Û\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342ÿ\Û\0C			\r\r2!!22222222222222222222222222222222222222222222222222ÿÀ\0/\Ø\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁR\Ñð$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\á\â\ã\ä\å\æ\ç\è\é\êñòóôõö÷øùúÿ\Ä\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3Rðbr\Ñ\n$4\á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\â\ã\ä\å\æ\ç\è\é\êòóôõö÷øùúÿ\Ú\0\0\0?\0v\ìU{\Æÿ\0R;™\\kKœ\äB\çðªpÊ·6\áÑ—\æ\Ï\"«™-¨¤\Í8S\Z´® 98Pk—•¥šM‘\ã5\×\êvbòÜ m¬Eq“ù–w1\ØW©5phi1ñiP“‹ˆ–G=9®g\ÄP[Á¨*[mh\È85§¬k¯.!²b©ýMs.I’I>¦©šD\ÙÑ´h¯\Ë	™†\Þ\ëW†‘oi©,QzrMhxz0¶€\ã“\ÍYŠ5—_ÛŽƒ&°”½ûj\ÛZ;È˜\ÔZZ-ºs\Ë\ÍS\Óaó\ï[PÙ›2¯£h®c–%9\'\rŠ\ÐP¥=”1W;\ã-R\çE\Òà¸¶*$y¼¼‘‘\Ó5 t9â¢š5šbnŽ¥zzŠò\Çñ¶½·å¸‹þýŠ¥/<C\'\ÊoŠÿ\0º U%chÁ¢ò5µ\Ã\Â\ÝP•?ªû\É\Ò\Íq5Ü4\íºF9fõ4Š*›;aQ\Ïa!f\è+J\×Ã·3\Æ$K›=‡¹—ÿ\0­V£Ð¤Œ\á\ï\ì‡\Ñ\Éþ”\Ó:\èÒ»2Å¼˜\éR%¤\Í\ÈBki4¸ñÿ\0!s\ëŒÔ£L¶J? SJÇ©20<’\r3\È\Üqš\èÆ—b9k\Æo÷c¤\Zfœ[nû—Ï°Xu(Z79¹-£Q÷ò}*›¦\rwqøv\Ã\0ý–f÷g8¬=aô›-\ÐZZ¬“t-»!hMUX\ês£ƒV\íùªx,\Ý:Ö¶pme”0\ãŸJiœ²3õ/š\è\0ªÁp#\éZ\Z…µž¡5\ÍÕ°¹S*!\é¸ô5¥	·¿ð\ÛF\èñò„s\éMX\ç{œÿ\0™\Åm\é¾\"ºÓ­;H-\â™X·\Ú\nÿ\0¯Jš\ËÀþ\"¾Ext\ÖE#!¥p¹ü\êøøc\âi+GlŠO-\ç*Œ\å$zo„õiµ¿\rZ\Þ\ÜÓ¶\åvÊœfµ­V\Ñ4˜´=\×NŒ\ç\ÊL3z·sùÕ©9¬\Ù\È÷!\Í!§Ša\ë@\r~EBjf\éQ(Á©`Hj\'\éR“Q?J\0ª8’­/J¨G\ïEZ^”€p§ö¦S³@\çcšµ\"†¨–<P1\Ô\ÓÒ¤\ÛM+\ÅPŠ\ïŠ\åoO›®»cýZ\àWZc\ÏZ\ä\ä\çQºn\à‘@\Ð\Ò~j©«Gö›h\Óq·­]w¹öª\Z”¾E\Ôqz®ú¤6t¶6Ö—6zdûZ?µ\Æ\ÊFx/ø\â¢h\È]„ô¦X»\Ë\àû’€™4»Õ˜aùû5MzŒ·,#F\Ã.=5s]DB\0Š…ª`¤j6šˆy«š¬85:8\ÍœÞ¯\Ù<O$z„Ež7‡ôU\ß\Ûù\Ú:\Ý\'ú\ËY€ú/z+E°\Ïeò\ê‹8®\×dŠ	è­Ž•jB@ªz”v04™ÌŸ\Â=\ë\æaRJ[œw\Ô\æ$‡Ë•\Ó9\ÚH¤Zg˜ò3;žX\æ—v{.§»©\ÛM;\\ŠN¦¹ýj\É.£bTn¯­oHÕŸp»³YûVµF–g•\ÝDöó2²\ïQC˜üu\ÍvúÖ“\ä;T“¨j\åa±š\ÛQXdƒšê£ˆEn “GW¥©H‚ã¢Š½¥\Æ£s6>a…¦iŠ\n3{Ö¾•j1,›q¾CQ\Þ2žÆ¦œŽH\àÖD\0@\0)CU3!ý\Åfø—EM{C’Ì°Ió!sÙ…i\nø§q£\Ëmþë‘<¶°ŽÄ¹lþT³|8¿HÙ¿´-Y‡E\0Œ×¥»Œ\ÕI°j®lª3\Êÿ\0\á\Ô\íe\êG\Óz0\"³¦¶xdd*p\rzÓ¢º2r1\ÍrL°¼²F\Èƒ\Îi;3¶Œ›\Ð\å\ì\Ë\Å d\í\Øô5\è~¸ð\Ýò¤\ZŒb\Ò\àÿ\0#~=«œ\Zl,\äŽ9\íC\Ú\Î0\n\Õ\Â:\æ§\Ìõ\Äøy§Ì‚H‘dŒò9¤,²?w^q¢\ëºÎŒ\ëý}*ÿ\0ªc¹ü×²xS\Ä\ZÖµd¯y¤\Ä\Ë@J÷Á\Í=Lñt±¸Hóó^?qB/‡öQûŸÒ«\êzN\á\ÈMÆ£4Q\02«7°\Óx‡þ	4\ìi‹»“‡*76=³Þ¼S\Ä\Út\Ðk’Eq=\ÅÄ¤\ßq÷¹\ì)\Æ\í\à¡[ÚKy<O\â\ÉõF{m:²\Øô\à|\ïõô®V6Iù(B\æº4\Ó\Ô>Xdû\Õø\ì\ÑSp J\ÆJ\Ì\ÛJU‘‡k¢Æ¬\Üýi\Ú\Ì}’K~²>•¯su”y\éŠ\ËIÙ®Zf\ä€J|U<Þ¦?‡t$\Ö|Uƒg\ÈF-/û£­wÑ¬[\Æz ‚û±S¶\ïÿ\0]r¾œ\Ûk7º‹\ÊCn\îÀžXš\î¾\ÂÏ¤\\\ß\ÉÌ—3±$÷¦ŽJ®\Èì”š4Å§\Ó8¯q\n\ä\Ôn¸©ø¨\äÁ¤g\ëQµ3P·ZL·Je<\Òm¥`µFjR8¨›š`V?\ë*\ÊôªÃ—«\0ñSaŽ§S\æ@\r$\æ“&¤Ûš6\Ð+‘\ä\Ò§ž*=\é€Hß»oaš\ãab\æg<–c\Íuw‹Y[¦\×+n1mŸSE†‰­¸\ÜqÞ³\Ý×‰Š2\åRÆ¶,P<#\ï\Z\Ê\ÓÁ“_\Ô%\ì¬U!?Ã¸¢¹\Ö5\r\ZSò\ê/wL\ãô\'òªªó.n$$K	6òB‡[H»mÆºe\à%T].\ãþ\Ë|­ú\Z\ì¼a¤oQ\Ü»¹\á\Ç\ç\Ï\ãZ«µ`9\\\î4\Æ\'’Â¡Y´\"\ëŠAÖ†æ›º‹Ô²\Ð%Ý¼–ÏŒJ…N}\Å\Ød\Û\Ík`¹×›ÙˆÁfª0\Ë;onzÖ¬\×v\Ë\ÐkT\Ô\ZT(ƒ^hSƒ¼¤q¢>@\íR•WO\Úwy\'Š¹(\ÇJ*\ÏSÒ¥ð¢³ôª’Õ§\Î*\\\Ô{D•lgÊ›«þ%Þ¸w®†X\Æ+\nðnj\Ów;¡²Ö–?r\ÃÞºK	\n§®I®{O\\ \Çz\ê,¢X=\ëÒ\ÄÙ›z\ÇJZN”U6fJ:Uy_\êLüµRc@\ì1\æ\æ«\É1¢OZ©,œ\Z²\â+\Ü¯=i\îÎ§q7”\åŒHQ\ÐfºË‹‚»ŽzV]ƒŸ.øŒd\Ä\ÄP‘\ÝCGrÎš\î#”\í20\åjM\ß>\nñPx¥·ñ%\Ï\ï\æHŽGº)ª\Ñ\Ï#7.MmõRg¡ü5³‚\ï\Æd…]#œ2\ÈÖ½\Å#]¨¡G \åŸmûò>e\Ä@þµêƒšU%s\çø†³–1Á=’@\ry\ç\Å-67†\ÇS)…„²»(õgÚ½\n¨k\Úbk:åƒõ±¡\ìja+3\ÎÀb>¯‰…O3\ç[ûˆ£›võ\Új´š­´p‚®C\ÑEg_F\ÑH\Ñ?ú\Äb­õVr(ój¯#\ì±\ÔcbÌ’=\Ä\ä·$œ\àS£\Ç:³)\nzlGl\èG­\\Õ¤0\Û	Gðœš£\æª\è\ìCÿ\0§v­uk$>\\¤¬\Ø8ô¯O\Ðl¿²t{k,‚c_˜^õƒ\á\ÛÁq§G†\È\rt°dŒU_CAjJŠ4CJÁÁ\Æ\r#™!\å…D\í\Å5˜ƒ‚i¬x¤\Ça¬\ÕIL=h””1\â£\Üh\Ì\Õ\É¥&R\rRcúCÖ†\Æ6—q¤=)¹¤\êx¥=*·˜À\à\Z—w\nÀ\ÕriY\Îi¹\æšžªvisœ\àm\Ås©òÛ§©\æ·5ù\n\é…\0û\ì¬|‘}1¢\å \"1“Yz2Iy7wl“\åÀ\ç\Ñò¬\í	Ji\çpÁ\É?­\Ýa\n˜¦UZöýv\Íu\r\Ø_‘û\Ñ±#\Ñ\Ôú×Ž^\Ûý£N˜žª2+\Ø<\rsý­ðò\ÄK$FõRqúb´Œ­`<\Ñ\×nF9JU&·5ˆ<‹ùgš\Êu¢j\ÌLÎb¡«S\'5QÁŠD’ ô¢¡˜5ÐŽ—~\çc\ïUn‡\ËR\Æ~je\×\Ý5ò\Ñm½Nœþ£y%š£Bû_wZ\×\Òu4Ô­¾b\Ë÷‡¯½sz\ç;G¥d[\ÜMg2\Í\êk\Úúº«E[s¾„´G¢º\ÔEj\r/W·\Õ-À\ÈIÀù\Õâ˜¯¤e\ã#±jgÝ©òŽ:\ÖÂš\è\ïùYµ…r¹ÛW´.iq\ï\n+¨„lŒXZ`Ç“]Ðª+¾=L˜\ÊZi\ëM\ÍUˆ$$bªKR¹ùj¹>´\ì4E\'Ý®O^×“M¸[tPò°\ÜA\ì+©¸—Šó\ßY¼—bù9v0ô÷ªF\ÔÖ¡.².c\Ï*\ÝÖ¬\éN^+\Ã\ënøü«–Œ\ã\ë]N„2²X\Ø~†©-Nøh?]Ÿ\ÏÕ„¹\Î\ëxN\à\0JŽ\ß\æS.—Ì½€\â·O\åVRµLö°uùUŽ\ÓÁ6—\Âo$R\Ûùö3°gQ\Ã)õ¿Jõý/\ÇÕ¡ó \Ôc±–Žcµ—ó¯´n-ºa\à\ÔFÑ—8Á9¥\'ubrœ.9ûKò\Èú\"÷\Åþ\Ó\ã\Ýq«[ûm\Äþ¼\Ó\Å.5&±\Ð\ãkkwZ\å\Î$a\ì;W-\'n‘V\"Ò¶ü\Ó6O§jÉµÐŠ.z™ùÿ\0‘‰,MŒöª›z\×Ô£ò\ä:UGˆª\æˆ\ÇBq¸…-\Ëx÷ÎƒÞ›â—‘R\áü\Õb\Ïþ>\ëQø\Â>\"q\Ó?Òª\Ç\ÏTÜ“M¼º\Ñô)³¤žK\\ô â¢—\ÆZ\Üðùfh¢¼#ó§xwO¸ºÓ˜¡‰’S·l\Ç\nk}>Oy\âl­<4[Hå®r_\Ûz‹½õ\Ãg\ÖCO]fðne?W5\×\Åð¥ø2\ë+ôHúõ~?…ºZ¨j7N{\íP;¤f\ìsž	»¾¼ñR(i¥bo4\ä•^8\Ízsq\ÅE§i:Ÿ\ÙôøDj~ó¼\ÇÔš˜ô¬Ù‹c)‡­IŠLR$‰‡\rNÃŠf\Ú`EIS¨È¤ÀJCHÔ©\r2ŸE0F\ìR•¨eÊž)!#¨2wSZ\\\Z–\ÍU„dk²fb\Ç%‹Ê²”\æu¥®ÿ\0\Ç\Ô`v“N ‹\ëš‹\Þ,\ß\ÝqPZ\'—`¾õ>¤1h­0|¶ÑjC$Œî¢oº\Ã»ƒšŽ\ë-SIbso(•ô<\Ô~µÃ Á\Íjü?¿þ\Îø—\ä1\";øŠc¶z\ÔV‰]\n\æ÷Š ÙªH\Ø\Ç\ÌAþu\Î:\×o\ã{R·¬ù\á\ãøŽ\rq,*ªtbe)“š£\"bµXqU%Z‹’g€wQS´cµ\\FÂŒ\ZeÀùk.\Û\Äv÷-µ88\î+/[ñ]½¾\èU\ËM\ÝTW\ÏF…G+X\ã\äm•µ©\Üm$u¬†‘qU¡ž[’óJ.r©K.\0æ¾‡O’š‹:à¬¬ÅŽúKI–hl‹\Ð\×£\ë–Ú½¢ôK¥<Ö¼\É\ã’6ù†*{[Û>\æ;«vÃ©\ï\Ð\Ö8¼\"­­Î˜NÇ¤\êX\Ø~é¿`\ßL¨zŠ¼šòkV12§–W\ï®Š¹\ÍMÉ\×=q\á):wL¹;žŠXÛ¹8ók{ ¨Á®_N\r%…²@XÀ\â·-\ÉH‚“Ò»-¡•\ÉÛ­6šd\â¢2P‰$üµNG¥‘òµBf\äóL¤6\â_”\\®¨ÙÑ»ŠÝ\ë›\Õ_\æ4Ñ¼Ž{\È\nýk Ñ›jœzùŠ\Âv\æ¶4c\Èú\Õ&vFZjYr\ëOgþ+}¿‘­o$H„Ú´4\ß\Üø†\Ò\Ö\ìÝ¥¬qªYr[š\ê\í>Eú\Í]û±U6“5h§«89±º>\ã­n\Ûx{S\Ô-\Ö{H#h\Éû\Ì\àWSiðóAŠró^^9\'\'*é­¼+\áhcUE€þ\ïY7©\Õ,\ÍS^\é\ç±øGY™\ÍGûõKU\Ó.´\Èk‰\íKm\Û™\"½qto*\íM08÷j¼ú.’ùT\Ñ\í½ƒñ \ËûY\Íê¿¯¼ðKÂ²Ü˜qP]\ác\ê1^\èþ¶PX\é6H;1E¨\ßÃ‘?\ÐlÀö‰Â©6cWjxFŸ‡ºÀ9«)Aö(\ì\ãùW¥ø§\Ã\ÐAh\Òýž]r´J8õ\ÅyŸŠn h!‰dV‘ˆ8µY\È\ç\Ìô¢kz}ž€ö³\ÄZP[aÖº}3Y:®\è\n‘\Ï ×šÁl|\ånÀ\×m§\\§”±“ƒšm\ÏS®\ÄhN\Ó\ëZjk7ð\â¸[¡\å\Ê$\rm\é³\î*\Z1h\ê‰)*;~TUœf‚\n\ÅqQžµe’¢e\æ€!4dzS\ÊñM\Ù@	\Æ*&^*\Æ\Þ)…h«\nfqS²\ÔE9¤AÉ©3Öš©ƒRƒHcvzT \ïVÁªZ‹˜\í÷¯Piœ\ìÁŽ\à@\ÍXZ¯u\ç\ÜXŠ_#%AÁ55³±·zmp¼¯¥Pº›o\Ôž˜ªv?=\è=\Æi\×™n¦\'ª“š~‹o<¯;\Ä\ãz‹4597$HGzd\Ü\"/ ¨giLÈ“.\Ö¥Kpz¢¥ŒycŠÌ¼¼—MÕ´\ÝV#‡·N~‡5tŒV~·I¢Ü•dÃÂ´†\âG·x\Ñ\ãž\ÇO¾Œ\æ)ò¡½™w\å^z\Ýó[š6ª<AðZ…`÷:cª¸\'‘±‡þ\ÊEc\Üc\Íl\Èúj\æ­:UºUYWƒW1š†D\È\"±¹,Ï¢,eM\î\"\ïÙ­¡R\Âö¯)¿x\ï5k™c@¤8úW®KM 8$`\Zó\Ý&m2õ\í\å^‡!¿¼=jc\Ë\Í`QD*ÁTÚž²sš\ã!r*0\Ì85Òy>ü{S	V·Œ½“šlŠU˜\í£K,›òN\0E£WCýÝ¬§Õ¿¥W¼&K­£«S\ì$\Û\ãÖ¢µo;[ˆvO\é\\v´Ùª\Ø\í\ì\Ê\Ç\n þ¯,\Çß—Ò¬G{¼óM£3c\Í\È\ëL\ß\ïU–PW­;x©°‰]øª2¿=ji\åª¿4ˆ\æ\ç½sšÀ\Øù­ùb¹ýa\ÉG½RF\Ð\Ü\ç\Ùù­6ý a¿\î\æ³5Ì§š{I¦})ð\îdº\Ð,\Ø®ýk\Å;\à\Ð\Ù\í¤08•u\à\àš\ä>\Ü	<9h3\Ð\È?Z\î5\Ý0\ëZL¶+/–d \î\ÆqƒI\ê\Îy|d6\ÚEÖ‹ku¨¾£5\Ö\ÛfeI9\"°ôiµ[þ\çPk˜u6\Ù$.8Rrr\rOa¥\ÝiZ\éÑ¿´g¸´¼²|¬­­\Ðž\ë+\Í\Ölg\Ðt\ÝGOò\í\í.Â‹ \Ù3\Å+#T“Vg§\nrµ\Èjú4\ZÇŒn!\åP,ƒ®\Æ\Ç>µ\Ñ\Ü5è¿‹\Êx¾\Ëÿ\0-›ð®c[]Vo´»¨ wÓ¾v‘wq»µ4ŽxnÊ†\ÝoÀV¯ö\é#û\"\Èòó&\Ì\àQ]\'›\á5\É\äÛ®*dZb\éŸOY›-¥\Ü\çø‰Sš\Â\Ç>\Ó}¡\Ç\äM;\Úz£7Æ¨²\é¥[•de\"¾n\ÕSÄ“¢* ~¾”ñ‚\î\ÓÀH\"¾nÕ­\æ‹\Ä×‚H\Ùp\Ù\ä{U vÉ»Ž6û¬q]ŒV‹\å\0ª+…·fGW#\îœ\×}at’Æ§¦ESA6DM¾\Æ\íW4¬ª(ô8¬\Ýv\ï\ìP[\ÊS\ÌÄ˜þ\ím\é±#*´l•a\Ð\Öl\Æ\çEm÷E]\ÅU·O•kAW\å¤I-D\ÉV\ÊTl”Sm©qL \Za§·ZŒ\ÐmQÔQ\Ò\0”T^e=\ÎE@Fhc&\ÅAx7[¿\â¥QA\ZŠ\Zk±\\õV+V\"Løõ5”eñvV\ÜÖ›o\"\Ü\\²FÀ²õ•h\Ë\Éð\Ü\Þ	P‚]‡\"­\éHñÃ½\ÌI¥¬Eq	ó\Üy&²¬§h.C8ù{T2y¥¿þð\ëøS&lÉšto\æ\Ý\Ë)y¨&??	‘H\è%†X\Ïñ!¥,<\Ðr®>´Ð“4þ\r\\™!ñ\'†\å$ùö\å\ÑO<Œ©þcò©­ek6\ÖFeSýT\â¹oj\Ãÿ\0\í\ä-ˆg“\Ëa\ê®1ü\Íu1\Äl5kKn¶×Œ\è\ÙcŸð­¥¬X2P”†0iôµ\ÏfIFXG¥4‚Š\\;U}SB‡W³h›/ð>:\Z¾±\à\æ§\è+\çq8‰\Çtö;aNñ<rö\Î{§·¹c¡\Ç\×\ÜU)=z¯ˆ48õ›\\€\æ>Qñ\×\Ø×–\Ï\Û\Î\ÐÎ¥$C†R:W½„\ÅÆ¼|\ÌeM¦B\"¤¸¸\"-˜ùi¤Ž\ÕZ\å°@õ®Ç±Ð´bmÁ§hÿ\0ò¸‘¿p¿SM±\è\Ã\éS\éQmY¦\ç,ø®Xk7s^†£KŠD¸\æ«1&˜2\r>¤›°\\’\0\Í\\ŽM\Ýk\Æ\riC(À E§5N\ã¸«{\\\×?w+´Í†\à\Z,±#ñ\ÔV Isš¸\Ò6:\Õ¼¶{Ð¢g54@f`‹\ÔÔ…O¥4‡ \àŠfñv=£\á\"½¾ž–\ìyYõ¯L¿kÑ¦\Îtð¦\è!1†^Mð‚èº•‘‰\Ä\ì?J\îW\Æ\Êu	R=\"\ê[\î>\Î\×J\Ýúgo¥M7-hó\ë\Z¿ˆmõ½5¬V\Ú\Ø\Ä\æ_\ãs\ÜJm\Ðñµyka}c1\Û]	ž\é[\åu^€Z\Ú\Öõ¯\ì¨mþ\Ïln®.%\Ålg¹\É\íF«\Üji0»\Ód±¸…ö”fÜ¬;{\Ðn\Û,A$\Ö,–W\'\Æp\ê@)¶fA\çvsÒ–\ÛS’\ç]½±T_.\ÙT–\Ï95z\ê\ë\ì–S\Ü\í\ß\åFÏ·\×4$sõ$¸O:\ÖxF3$l£>\ã \ÙM§hVÖ—‘‚	C\ÇZ\å4¿ø„Ï£\Þ\ß\Ï¶Zœ…<•ŒsŽ{ö«¾$¸Ô®üK§h\Ö\Íc°¼\Ï\"³\Ð}*š\'!l•›øI?¥x»¯[\ßj(”ù‡®=+\×-/\ï5	\í¿—Î¸¶¹’“û\Ø\Ï&¾Q›\Ù÷daú\Õ#H\Z*w.tz&\çD\ÆH^+Q\ÇºK‰\çˆö\Ã\nd\Ì\èZ–3\ÈOf§£B±\í\0U\0\íQùjG\"¦\Ó\ÛË¾U\ìx™Îª\Ú?–­\íÀ¦Z§\Ê*\Ñ^*+\â¡qVö\Ô2/4€¦\ëQ\í«,µMÁ\Í7U‰£#AER9¨ÊœÔ¬9¦–À ˜qQb¤\É4b€#\Í!l\nŸ\Éu¦˜q\ß4€Èšòö\ÖG’\Ò‘XvªË¬\êð»JºRn¤/Z\Û	µÁ\Æ*r\ãª•ºñ©q	Il#_z\ÇK\ÉK0·_Z\î®m’d\ÎÑŸZÆ¹±DË‘Ò›c*\Û\0#v>•S;\æ\Å[û9ö¨m4™\ïR¸¡À¦J»[´¡†¢¿„*©jŽ#\Äy·\Ö,n\Ð\á\È\Æ}ÁÈ¯B\Ô\æ.·¼êµ=$Sþ\Ö?ýU\Ãø¦3LI€¡”s\ìx­\ÛkÁ/ƒtþ²i÷n\ç¾Ã‚mu`7ñN¥t	#(\éšZÁ\îAõ¢¥˜q\Å€\Ö˜\Ç¬:ŒñP2\×\Ç\Î\îMž”v ó\rs¾\'ð\ê\ë6\Ï5ºª^(\Îq÷ý¾µÐ¸\0\Ó7`Ö”\êÊ›RŽ\à\Õ\Ñ\âe‚f†`C©Á™s÷W¢x¿\ÃBù´l\Ô	\Óýb\â\çw¼òA\èk\éðØ¨×§u¹\Ì\áfjÙŒ[/¸­h\"Xl•H\ÏV\ã½fÙŒÂƒÚµ‡1\è*©üLRØ­\ã!JûÔ„sR2\à\ÓB\ä\Ó<C\å©\ã$5DŸ*\Ó÷M¾ŽYvú\Ödö¦9NsW!™sN˜‡\æ˜²GŠ¬\éZsš¨\ËI\ZE™²G\ÇJ¨\êV¤Š+>d\Ãæ™ªg¡|\'¤î½¾\Ñü\Åv\ZŠ\ßA¹\Ö\"ºÒ¤—MŠý÷]!û„œr+†øS&o\î¤\È1]EÎ«eeo\â\Í2\îP—S\\\î†\ÈÀ\ïTŠM_S­ñ¥ôñc\Þi±¤²›¥ò•\ÎnZ¹\á\ß\\\ê÷7¶—öKi}h\ë½·)2¬ŸHlü?¢^\ÉùVsA$ø\\•]¼šo„\ï\á\Õ<S¯j6›ž\Éü¤Žb¤ âŒÜ“V4¼:\â]o\ÄS‚0\×B1ÿ\0­«´Yl®\"—!6\rô\Åyˆ4iDO\r\ìko6¦%O(\ê\Äü¹õ\Õ\è¯{÷M¥1]=¹bv§ŒuõÉ¡X\Å\îyŽ‰{ª™ü;ôJšDEm\ç—9 gš\ìõg\ÙñE?Þ¶:\æ,mµ›ˆô\ßI¥O°¼ód¹aû²‰>§5\Ñx²\ÓSYÒµ½6\Ì\ÞR\é$\np\Ä0\ê?:­\nh\Í\ÑyÑµda÷uY?P+Ã®\Â&­r¨0V©¯wÒ´\ÝB\Ï@º›QˆC=\í\é¸ò\ÎÀkÁ¯\Ûnµ|?\é\áÿ\0\Z\\¨\è^·=+WK“\É\Õ\á=ò§úV5³d\n¸££‚AF\rùU\nzž›ù\Ð:¨É¦)\Ù\"8\êTz5ÀdŸ•‡?>\àl‘€\è)4s´z¢Ee\èFj\Ó@@\Î+/Ã·>v“™\Éiü+l>\å\æ³&\ÅO(\Ô_Ü¤\ÓA4\ro@\éZrD1U^*V\Ê%*\'^*\ë-B\ë\Å=Ö«I‘ZµEšC*(È§ªU(¤¶€+¹\Ç\".E&M( \n¦\\‡\ã¥MtÍŽ*²7ú3NO\Ê3“@ËŠ\à¯5ªamIõ4¶·qÜ†1œ€pj]ñi\êsE€ÌkŽ\ç5€>`¤¸p#–\Åò\ç\ÔPGl™*\rD|£Úks\Î\ÜS®T\È(9mJ1%\ÔGÉ‘õ[\Ã\Î\×>×´\á\ÕcK¸Ç¡C\Ï\éÊ·^\ÝK{ñX>Í¯‹–\ÙøY„–\îpr?Âµƒ\Ô\×\Ù\\­:\Î\ã9/\É÷T\ç¯‹\á\ÂWNž\Ñ\Î\ÒvB=³[j¸©Ÿ\Ä!§&Šy¢ F»µ@\æ¥~•šøûÝž’ “­BÇš{µBÍ“Mµa‘öŒö¯\ÔÏ›¬]0\à4ÄÎ½[P\Çg!q\Åy4‡u\Û1\êÍ“^¦V›rh\Ê{›6iò ö­P¸Z­§A¹ý*ó^\Å;\ÛS¤4Õ§¿SQƒŠh’Rx¨\Ù\Î)sH\Ô\ÐÆ‰Jš°’ñÖ©IJŒqLE™Fj«w©r\Åj»±šE\"*¤\Ã\"®0-U¥\nh¸³k\áþ­k¥\ë’Áu*\Â\'*\È\îp¹‰\í^»s¬\è\ÝGu/öT\×–gš2G\ë_8\Ýgv\rDœb\Ín®}%s\ã+cG&¯¦\Ü7\nG\éY\ëñB³‹ÉT\Ó\ÑGdV#ô\áVVp\ÜYGZ\ØM:\Õ@\ÄKùV‰]´‘\ê²üX\Ñ\åûtrsŸ’	þURo‹\Ú~r—Ùµÿ\0^v‘C\"Œô©Q£f\ÆÀq\Ûr¡Ü¿\Æ;e\0¨½Ž\Â¿Ö«Mñ±2V\Â\ï\ØUþ•\ÊM”‘\ä!G¦2+•\ÖB£\0½\Í7¹ZXôC\ã\Ýíœ\ÃdQp®ògiõ\Æ+Î‰fc#±gc¹‰\îOZ¯8«\Æ\åf h³f\ÜUÿ\0¼1\ëYv\ÙN+A\"®\"g_\á½{CŠ\Ï\ÊÔµ1mrŸ!‰ÐŒú\×V²xz\â\É\ä´\Õ\Ö\êaö\Ø\à\è+È¦ò\\bEF>\â©ùQ\Å4s\Ãû·WS”8\ïTd\Ñ\ïž»\Ú\æ\Û<\ÆÁ\Ô{\Z\éüõò\È’+Ò´ù­u„ž)\0\â\É÷\ÏA]8=kõ2\'´d‰\éWv\ÖT·›\Îqš\×Š.\"6^*»¨«.xª\Ï@Ê¯Bñ\Õ\ÜdTl¼Pk¥@F\rhJ¸ªRjJ)¬½jX×šVQ\ÍhªV›³&¬ù`\Óv`\Ð+ž\Ü0\äVl0)ûE©=½m\â³q\å\ên?¼€þTg\Û\éPiˆ\â*¬rsYº„žl\Ë\Ï\0WTJ\È\n+š\Ö,&ûZ<.¨˜ÁqT€Åœ“u}Fk^;H”UÁ\ïYSBÖ·ˆd–9®<\nÛ‚Tu<Qa\\ ùe\"¯‘”ü+8È©p0G5tK•À¤\"”«ó\×+u!\Ó|Y\Ð\Û\"IŸ¯õ\Ö\Î;\×1\â8w´Ž+F~½Gõ¦€\ÞOô_jV\ê\0†\í\Ñ\ã¿|ÿ\0:\ÚS\rrs^\r\Þ\Õ3\Õ\r¼žø?ýz\êŠ‚§ª’*æºŠÄÒŠ‹\Ì\Í\Ó5˜u[5u\Â\ÈÎ™\èj\Ñnµ\åö\ZŒ\ÚuÈš\"\Ú¢½N\Ôa\Ômhl2÷¾te\Í\rŽ\êsRÐ•\ê\Z°\Ã5Zò\ìmc[”‹B òk\Í\ÝsyÝ«\ÐuòÁ\Ñ1‚k€„o¾Œ\ï×¿•iM\ÈÆ¦Œ\ê´\á‹r´ù›oi û5º’>ð\ÍQº9“ð¯Rœ¯ž[?ZŽ¤ \n¤1A©1HÀb¨.Tl’jX3C(\ëOSŠ\0˜ \ÛUeˆ–«Jô¦•€¥\åtªò\Äyâµ€LT¢h.\')¨.\ÖS\ïU\íðÏƒVµ†;½x¬\Í\å[*qAºv‰»f|¶À\îkeS5\Ì\Ø\\Tõ5\Ò\Ä\ß%tGc)54–H\Ô&rµX°FŒ&\ìô\ç5d\àõŸ°®\Æ*B7 ‘Œý*¬E‰§¹ý\Î\0úW#«ü\Î½u·)¶,²)8\á{\×%¨ó6¥)lR*[Ž@®Ž+p\Ö\ãŽ\Õ\Î\ÅÃ­u¶i¾\ÐóŠ\ÄfcÅ³8¨\Øð+i¬ü\È\Êóv5=¼°–ŽPU‡~Æšb¸5¨`ž»»)njG2Gù™\Ü(\ÇrMg}–_?.{õ\Ï5\ßx/\Ã\ëu©G¨\ê.#·ˆ\æÛ¬\ëô¥\Égª\Ú.c\'”E_\ÈV½©9=« m¦T`S\ëZ6Ž6žk`÷/»²*\êHJŠ …OSW\"\Æ8¤\"n¢¡u«3M•y¦2¶8¦0©\\\Z…ø \nó\n¡/Z\Ð~T\Õ)Ž3ŠGn¸¨Øi¹4€psN\íQŠ‘zR¸	Yó)mV-£;”®jóµJò\Ü\ÜBU]‘\Ç*\êpA¦)aÔ£Õ–? ˜ý\áÚ´g´®\ÖSùVÒµP\Ù]Vqþóf•ô­`.N¯%R•ï¬”HU\Æ0}*,abŒ\ÈGðƒ‚i³\Øj1‚\Ïpe>¤sLKöP\Ë1S\íÖ\Ä †\ã&gˆ¢\ç\î“È«ð–\Ø2:\ÕX4Ë³(3\ÜH\ê?„·­\å`Ž”…r¥\ÆBX\Zê“§GX_ð\Ï?Îº;Áˆ3Ž†²®#[«;ˆü´‡\éB\Ì³7„®\Ñ[æ²¹Y—\Øô®º\Þ\ä\Ü\Ú\ÛOÿ\0=bV8õ\ï\\‡}ö\Û\ä\ÝZ²\êÀd*\Ûð¬þ~…\Z±¡‘£÷õ­e¬@\ÜZ)IÀ\âŠÀG™°\Å[ÒµY´›¯:3•?}?¼=*®A5ˆG=«yÁN.2]™\ë6—0jVIujÀ£Gu>†œËŠóm\Ä\r¢\\\ä’\Ö\îq\"Zô…š+«e¹·pð\È2¤W\Éc°¡+ôg¡\Zœ\È\å5\Æf¿`OÊŠq\\=ˆÎ§ýt\Ù\êï›«–?\Ý\Ç\é\\®†‹.³n§?Ê½l¾£c*²\Ô\ì\î\Ø4q\ÑF+&\ã–\Íjº/•>s]\Ê<¨ÅRŠn\r*ñBA\Ðq\éQ1\â¤\'Š…©’4š@Âš\Ù\Å3še\"Ï™Az‚”hP\æ˜\ìi\ê)²/˜\Ñ\Îj¼ö\ïX\ç­nj‹Áú\Öh±³Øž\Åö^FÇ 5\Ö\Æ\ß.Eq\Ñ|­š\ë-4)ô­ã±›:m\Â:Î¾#{kf[W`­;\0\çJõox2\ßPð¬ZeŠ\"\Ïj#\×\ëQü8lø2\Û<\Çþu\Ö\ZNd6|\å­èš–‡\"E¨Û˜‹‚T\îW~A¸lWµ|bÿ\0[¥ý\É?˜¯¹\ævú\Ð\Ý\ÕËŽ\Äq\\}k­³m–«ô®r\Ö ÜŸÂº8Ty\n=«+”IÀ\Ìkza¸@“F’!\êW+´Wô5\Õ\éRùñTˆ‘y´\"Wû{;\Ðu6óaŠ[fX\Ê\n/NÕ«\r´SF‚d\ëPX›Ñ©:\Ý\Ú\Ç\äŽQ”\ç5W\"\çUk¦”´‰D\ÎHQ\Ô\Ô\Ö@¥ÿ\0’\íÁI5²*‚zÕ©ÿ\0u$W ò§·z†fÑ°ö\ãw\ÊqW R\n«\ë*«3W\ã\"¢`Se\ÅMª÷<)^Až†©}še˜±¸fO\î•Î®R”NHþC\É\â©\Â\ãqosZ2ò¦¨¶9Iú\ÓjI\æ¦m ´ô<Ñ¶€1R\Ð\Å`H8\ëP\Ç\Æòd\Ú°jÀ\"‚E+Ê¤rE!c´g®P‹p_vi g7\×7N\É\ÈP{Ž•£\Z˜\Ô\ëZMn«\ÈªN\î*®\"$#J‘€\ÏJ…ó*\Ëý\ÚS¹@Ñ°\Æx¬H\Æõ´\ÒuüJÝ¹ R\ÒO\ì\ï\"`\É{ÿ\0]i\é#û;\Ä:¥€$(—zö\Éþ†²|F>Í®\Ç(F¯ŸppkF\îo#\Å6WG\î^[¨b?½Œ\ÔV«T]´;EˆZ)–ò\æ®\'–óš%|®(3ª5F\ÒF\ç]CH®\éš\ÞðÎ»6—)´f\Ýo/\01û¦²_h\é“÷€p¤:Â½8ÔƒRF”Ý™\ÒjŒ|›‡\ï°\Ö€‡ûIX“[z\Ãl¶¸>\ØþUC\Ãñ\íó¦#ƒÀ®L\Z\\¬Ò£\Ô\è%rª ÷E\ÎI©®n•\Äj6\Z®[#5\Ñ#63\Ò)ws\Í.\áE„7m0¦jRÀ\n€Ïƒ@\ì4¦)6\ÓZni<\Î(\0\ÛOE¨\Ã\äâ§­&HóDñSGÒž\ëò\Ò\Z9mR<}k\ãÁ®‹T\\ÉŠÇ’>i£F\Ê[q]–þyŠ\ÝH\Ü\ìL\Ö<±l¤·º6ò¥iK>°Ñ¬­ô]\"\Ö\Â,m‰\0$w=\Íi\î>^k\æk^ÍºÀ#·˜k~\ï\Æ\ÚØ°û4šƒ¬drWˆú\ÑË©\r÷Å½+\í^\Z—\nö,NIê­€Zù\ä\ÒZ:·‰/µTû,——o»%BC\Z\Ì_½M\íbã¡¡d2q]	¶>k\Ãýbýk¨Ž\É\Åd1/Pù¤úš\×\Ð%d!ry¨/-Á5sE·;‡\é¢[;‹$3\Âý\ê§8\×!»x`°ŽHûL\ÍÀ­}&,Ú´fR €N\rS2l\Ç\Zc\\,w8Ä‰\Ãm<f¥ºž[x·0g\0t«h·`\èO5i¬bo¾¹¤2m¯d1£½m[\ê9\n­\ÅR¸±\n\É^3\Í?\ìÊ±\åŽ\r :i™€ ñVXnšÁ\Ó.Â±„œó\Åký¤\Å\Zz\ÓOJi\Zc?h’\ÖRË¸jI\î\ØLc*«HÉ J\Ü\ÔL\Øj)%\ÜsM\ÜYh]ô¹5\0\ë\ÍLµ,	NÛš@0u©E3n)Â˜˜\Ù[\å¬ùH¯\È2*„\é\ÍP/Þ©\"©\ï*ø«*üP!Ÿgk2ú\ØE&Gz\ØTu.UM\0q^.‡u­œ\Ø\ÉI\n`GøŠ­}\'\á\Ý.ñH\ßm1ŒŸ®ó³­\Än4y\ÑG\Ì\n²þ°,¿\Ò|;©\Û½\ïTºyý+X\ìh¶;\ËrE9~|\ÑT<;pntKG\'$.\Â}Áÿ\0QYIY\Î{pD’&\ây\0\ç°*M¶7££õ\Ýjs„¦º†7iV\ä\ÕûWSpŽ¯2Ö³bW\'5wM\çTµ_úh+:¿4§¹·¬&l\æ\'¿ø\Ôú= :L{G-\ÍG®X¿–´¬\ÙtØ•†S¥qa>\ênPžS‚EW#hÀ«21r[\Ô\Õw\Ð\Ì\ÈZ¢f\ÅL\Õƒ4€¥¨òI©„Y¡bæ¢-¤\Ó\Äg0\\TÊ£€¦! æ¦Œb­²(@D8§?\Ý4±ŒS˜|¦‚‘\Ï\ß&\é3Y²E\Ím\\¦\\\Õ	#4!\É\êgÜ§\î\ë%ò	­»„ù\rcL¸j¤MÈ’g‰·#jY¯gœ#“Ž•Xõ¢­1’!ÃƒW\â]\ÍY\Ë÷‡Öµ\ív(cEˆ”ÀŠ\ìl˜5²·¨®Qbù«z\Êvf~\\VBf„®»0EO¦2£d\n¤Hj½b€R$\ìôÙ·§@8\íZª¥\ëIQ³ð®‚\ÝEZ!’ÁA’)·\\ö§\Èø¨6\ï\à÷©¸‡Å™P0$Q^D\Ò.â¥÷Ht­\Ï4™kº	²À†µª—A\ïT®#2°(Á[ÔŠX\ãh‘XûP\âXw¨\Ý\Ûi\æ¤Y£1ü\ÄQqL‹™ŠK–ª²Ý’üt­\ë2<¨\äV;!\Ý@2·nõn6d_˜U8Fe\çµZf,q@\Îãš•jTŠ•)0%©qQÔ«Ò¤B\í -8S\Â\Ó#djœÑŠ\Ðn•Rn)š\Ðû¨#oh®*¼i€\ÌóP\Ý\Ç\æ\Ä@ô©»\Ò7\Ü4ƒ4\á’3\ÝH®G\Â\ÙmN{iqû\è\Ùò \×l\Ì‡\Ø\×$:G‹\×\î\ïn¾WkÁ/6\î\Ü\çt3ô\È\ÇóTz}\ÅÚ• -Â—O~Œ?­Or\Ä\Ç\ÃU\È/D\0\íDlÿ\0ys[:µŒZ=\äš}õc\Õ]N\ÄV,\ÖöR)û9x_²¿\"´„\ã8©E\è\Ëq³%¥º•¤Ž\Ø\å\Êð®\é¡&\×-\ÃóŠ\ÊþÏ½³U9Þ’ŽLG8õ©\á\äa­B\ÇøA5gû¶T75ue2y¯:Š¿x¥PÛŠŽx\Ã\ÞAœü’oþuaÝ¤–U*6`}\ë	ü2ªneƒ/š&c#–©Œ*\ÄqdÕ+Œbº\Ìy \Çj‡\Ê\ëbh0*‹ÇƒH\n\ÞX¥ò½ªmµ Jb*ù~\Ô# «[=¨òý¨¸ô\ÛR/\ÌiþP§¤x¨\ÄU¥q…©‚\Ôn„šhw3f$ñT\ä‹Ú¶zŠ®\ÐqÒ©0¹\Ï\ÝEÁ\â±gˆ\î5\Õ][ûV,ö\ç\'Š¤ÀÁ‘n”\Ì\ZÓ’\Ø\ç¥Bm³Ú\ÆS^µ½§.\è\"²þ\ÎW \ÍoX&-\Ôcµ+Œ”/5~qUvóW ^\0¨`[$Ö¯~µF$\Æ\r]†\àsÞ‘,\ë4†;G=« I¶%s:lª±ŽFkj9C\ÍQ›.,sC1\Å\"‘Šv3@‰#\äsH\äô©òŽicP\Ò}(4‰\Ï$\ZI-•†O\Þ\íVd•Ä›ü¾µZòIc@\ÉoS\é@\Ê\Ùem¤ô«\n\ÜU•¤l‘V\ÔñL	†Z©=‚;—\ì*Âµ)`M\0gý˜!\àRþj/m\î¤o¸jpAš\0ˆ®)£­K\'Zˆu¤À•*e¨`\Ôøæ‡N¤´	‘\È\ØJG=\êû®ET–.8¦r\ã\ÃÒ¼F¢a·Š`;˜\Ý\r¡¾\í\0`\Ìq;\ë\\Š\âk1N¸+,c?QÁ®¿PŒ¬Û\ë\\ß‰\ÓvŸo1\ê’\Ïû\Ãÿ\0­T‹€­8ƒ^\Ñu²Fû\à\í4U;¶2xz\ÚU\ëo7\äÿ\0Ei¸\æµ=S]\Ð\íµ\ë&@hòb“ƒ\éô¯\Ôô\ë\Í.\è\Ã{Dù\ã=\Ð×º\ä\Ö~»£[xƒN{[€_ùe/t?\á_\'—f2 ù\'ðþGd\ás\Ä\ä0\ì?\Z\è¼<Ÿñ0\É\êšÏ½\Ñ\ît\É|«\Å\Ù2É°/÷‡¨ö­mq|\Çþ™‘úŠúJÓŒ¨ó\'¡„¥©°\ÑŸ8\éRƒƒVaÁA\äTR\ã\í=\ë>”\ÐOq¡*A\Å8ŒQK¸bµ Y€e\â³\Ý9««žõ©\ÍEC§ªñO\ØjEŠ•öóK¶¥ò\'špˆÓ¸ˆ<³NUÁ©Ž`\Ò` “.ÑŠ®ò<\ÓCN•U˜\î\Æ8«K*?JŽDšS\nËšž•­¸ƒPI¢\ã0¤€zUv„c¥o5°aÒ©½·\'Š.32+}\Î8­»[_qP\ÛÛõ\ÐYÀ¢Æ‹Ž\æK[ø®Z\Ú\í9n•q\ÌC·5JJ\àR¸\\$x×Q#·™\Å0¡-šµ=(\Ím>c[pLA\ÖM±À­¨mù\Õ\"­\åÕ…aT•¶ŒzTð¶þªW\ëL’\Æwt©a\æ˜\0”?l\Ð¤”)ùˆZyñ Š¡«\ÈÊ EI`|\ëOŸ’8\Í\0GZ·Ú¡X¶¹\ÇJ´©‘@\Èri²Ë…\ÅZò\êµ\Ä%ºP\Ê	!@\'®XF*$Œ¤Ýµ©€÷\â¢V©_-MU\æ“8l°\ÅZU8\ÍA\n\åª\ï\0b\r\Å&\ÓR\n	•\åb«U\Öa #Õ™¹L|¯Lc™xª\ÒÅš¶ÇŠ‰\ØP&LSOÝ©\ä Š…ºS©\æ©\íX\Ú\Ìb\ãC¸Œ(, H?]\âf:Æ‘7\Ç$_\ßR¿;ns6¼\Ñ/m\ÙyT\Þ> \æŠ4K]M£\æl¡ò¢µ‹V4–\ç²\âRmªwS˜˜*õ5ùÚ¼¥dwœw\ÄmýšÁFõ\ÝñŽ•ƒ¡ÿ\0\Ç\Ì\Þ\ÉýkO\Ç™d³LrŸÒ³´A‰nO ¾§\nšÁò³|F\ìD›¨õÅ½M¯\ÈZšO5\Ý\r ‘“\'\Ü¥zjj7\à\Õ,‹´\ÔM\ÍLX:f£Á=(0¼\ÔÁ)¸9©³@š²”\Çò\æœ\Zp\'\É3\ä\Ïz¥K8\æ™\Í\0J«‘š§<Y$\Õ\å\ãŠlˆ¡0f|qb¥eù¸©\n€i¬@\\ž‚˜’@\ÄñJõqeŒ¶ZFVûB\ã\îcš‘4@/J£,|ž+QÁ\éU\Ù3E\ÆgÆ‡}h\Ç3„\Ø:RGn3À©<¢¦€\ÈO4Ð¦§$J P+m5n1M\Å>!–	›¶-…¶``k\n×„¯fFE;‰¢ú\ÆKd\n²ŠA§FT(¦4ø|Uˆ˜\çm@›üÊ°¯‘\Í<\0(–\É:\á†x¦Cj¶±”^„\æ­p:Uk™<P*óS¢\àUx\Û\ÍI\æ\â€&¨¥\Æ*6ŸÉ¹h`\Ô·55\ßb\r-QÒ˜­‘Kº\"š­äš¡ù…h§Ý¤.A©>õ%8S9\"©¼6jûT3@\ßªòU\Ñ95ZE\æ€*ž´\Ö^*]¼\Ò)Ÿt>LV€¬™\ÑÜ§ÉšÂ˜a\Í[œf>\Ã\â‘\Ð	7Çš*O\Å\å\ë\Èýôú\r¬v5=³Vl\Ö\í$¬\ì@¦+D\çV\éü¸¥~{N¥¥k\Ö<\ëÅ®\Z\å\0þý*Ž†I[–õ T¾\"m\×(}ri4 ú–õøXÿ\0³\Å\Óvf\Öý¶¡GRj\rÆ¬:\áqUöó]mY¶=O†KP!›\È©#zm9E0¹(`Z¬`ªDÔ‰#¯²¨)\Øâš’zÒ—ª$­:óLjgÁ4ª¸€EZ\r>Š\Ê\ÞAcJl÷£)\î*\ÊñM’G_¸2i‰Í¦\\G.@\È0jÐ‚\á†\r_/\Ó5s@\Ê.†«°9«\ì*»ŽjJ	!\ÆzU©T\ÅSS†«qÂ€*¼g4ª„\n´Tf” 4\\El\Z’ót©¼¡H‘\á³N\ài\Û¨­{p1Yü¨+J\ÚNn\Æ\Â–£ \É5S\Ï;±šy—Š¤\Ä^W§ù†©,\ÜS„¼Ó¸‹É§\í\rÖª,µ(—Š.\Ù88ª\Ç#Š³»#­BüŠ\0…©ŒÞµ&\ÚR‹ŽsLó\Ø\Í-I,h#5\0<1\Å9Z£ô?5\0]ˆ|Â¯.1Y\ê\ãU˜œ‘H`ŒR\ÔKOV\Å\0;-MQµ cµMRrKU\ÉT‘\ÅU1zP#@Xò)\æ*Sš1L.g\ÏËŠ\ç\ïWd¤WU*f°uX0û±@\Ñ\Çx–#$VôÍ±¾†Š¹¯(}l}\èÈ~U#h«£\ÔqYú»³qžH\Åi ùk#[#\ËQžk\àiFõ,wžq\âþ›ôŒT¾ƒÛ³U|B\Äj_ðŠµ\á\âE»7«\Zûl:ý\ÌN:\Þ7.ZÎ°¼o4f6V±’85uØ±¤E\0\ä\0+Fep+F\ÚqR;Œ\ÛF)ô\Æ\Ïj,M\ÉUZn\Êtjv\Ò\Ñ`\æŸ¶š§\âÀPLŸ5;\íÂ˜\Í\é@E3&@˜\ài§$ÒŠ1A$œ\Ôg5e×Š…2ˆÛ¥Vc“ÐŠ²\Õ	8©Wi\ßV\"}´1He­\âœÒª\ÍL½)\Ø	¼Ê’>µU~õMæª­	¥@«®\ÚÃ‚\è«òkr½‡z	e°¹5!Œ\â›5h/\ËL’“–ZE—,y©åŒ“\Ågý•’ó\Ì\ÝòúU!—\ÖCS#jºÕ„ ;†*2\Ô\Æ4\Ý\ÔX\ï\Å2Ir8¨\Ý\ê,å©ˆ‰<\Ór)$8¨K@ƒ“R¨¨b«H>Z\0rŠ·J©S\Äq@7cŠ3»=*\r\Ùz’€,¦žj6x©°v\ÐIµi\Âõ¦ñA#ˆ¨±RA‘Š\Ê\ÔS|Mô­)\ÍS»Œµ»cÒ˜\îr—0¬\ÖóBÇ‡B¿˜¢§Áƒ\ïE4\Í\é\Ê6\Ô\ïK\í8®wY‘š\ç\à\nØ³¼R\Ó\í\ï¢,«\È=`êºõ‡¥|]\ZN5¹YÞ\ÑÀø…ó«²ÿ\0u´´•ò¬b\ÈÉ¬tn\×\'ú(ý+vÂª\0öU©Dâ©»-†É§Œ\â¡NMN:SfAKš\0£€3GSI@\ë@™eG…h@iÝ©ˆ½!¥\ïKHhn(\Å;\ZCMYú\Ó\é5QòŒP&<(¥\íK@ˆ\Ü\Z…–¬µ@ô®üU|Ù«Ö™Š‘$°¨\Ù*Â­#Š¤€¨\Ã4|­E&Kb­\ÛÅ• cR\"i.m\Ú=§®j\ê¦\Ús®\áƒÚ’v¤z~YHr}«~\Õ6 QY\Ð\ä+NÈ¢÷%—\âJ´\å¨b\çh–™%w\\\nª\Ã-We!ªg­P\Í\ÔK(\Ú\ÆÕ¬ÕŒð¡2 \äñšš!c†\í¥Vv\n\âŽ¸\ïõô³\"\Å‹h‘ D®XM‡W¼ˆ8ó÷)_™Ëž\ãÞ¾k\êY#T\ån÷“wÕ½7\å\Ò\É÷6\æ…õ4^\ÒÕ´\ìA2\Î!ø\î_SŽœTòiVjñ‰~Y‘[I Žw\Ü\ÖI\Õ\î\Æ$\Ø\Ì\ÎW\Ó5!Ö§,E\n±p\îUH\ÞGL\ÖSÀfw÷f÷iõ·á½´\Óñ\Zœ\Ímgv·ª¶\ÞC\Û\ïF\'pƒ\íSÁc§\Ì\Ö\ïö_%^\\F¬Ä™Hª²\ê’L¥V\ÞÕ˜4W\ï\à\çÚŸ.±#J“}–\"†Á\ÏÓ­Tðx÷X]oöö\Ñ.ú\Ý\ë\Ö\Ëm^‚”/¨+MM®\"Ž\Ü[Iª»Ñ‰c¥G¬iÖ–ö…\í¢@c—\Ë-…¸\Çñg¡úU{½^gŒ¬QCo¹ƒ±‰pXƒ‘“õ¨.õyo!òš(£Vm\ï\å®7·©­¨`ññ­	s5ö\æn\Ú+ß½õ²\Ö\Âr…˜\Ë\à{•[†eŒõ\Ú9>\Õ\ÐÇ§Z­\Õ\ë2F#‰•Q]\ÈQŸS\\\ÌUÕ‡PsZ\éªK\ç\Í+G¬\Ä†WŽ•×˜\á±UeziZÖ½¾\Ô^žm]_ò&Š\ÜÐƒJ·73¤‘(HÁ<Œ\r\Çô¢KK”Š\á Û¹_o8f9ªj\×2IŸ(hØ° u\'\×ð\â†Õ¥óTˆ¡X\ÕJùA~Sžµ\ç<f\Õ\Üõkù´M?ü\Ýw\Ýkªeó@Ð’\Æyži#)€3Gœ\írqúÔ±\Ú\Ú\Üy8ˆÃ½þ@X\å\Ô\äúV<Ú¼®˜h£Ù¹N\Ð8\Âô_¥Oýµ%Ã¬‚\Þ$‘HÃ€sôúPðy“ŠNO›]T´Zi¥õ\Ö÷z\é\ç¨s@º\Ñ\Û<pOµ¢G%YT\ç§J³öh\Å\É`#À˜Ï½fI\çlr/öƒ™evd\Æ\ä#Ž:V\ÓÁc?vmhô\æ\Ùs¦•ûò\Ý^þW”/ýv\Z\Öi&²-Š²Ç»¦{c5b+[.\àF\"@r88\é\ÍR72›¿´\äy™\ÏN>•#jyŠ\ËjŠ1òz\æ«ƒ\Ì\'(N\ÍE\'\ï=\ìù½oug\Ò\×\ÐJPWº%º‚“\åuŒ2P>elž\ÇÒ­Iki#¨‰bòƒ€\î®IßdÍ¨I–&(‡\Ê0?\Õ\ãÒ§MVY¶•H\Ð\î\Ü\ÛW\ïzŠ˜,\ÆQ‚RwIý¯%\ÛWó¾¾BR†¤—ö0ªG#k¸°#;útü\èki\ìV(˜Æ¥\Û\Ì;—=N:qQ\Ïv\ÌË˜aØ \Þ2{ýj´º¤\âŠ±«•e\æ v\ÍR\Ì]8G™\Ý;üZn÷\êì·¼ŸKu5;²—ˆt›[	\Öó •Qž9Kþ0z}(¬\ÝS\\¸¼†Ks1pÒ´kƒ!	¢½<®Ž\"LC¼¯\Þý¿[ü‰¨\âÞ‡ÿ\Ù',NULL,NULL,NULL,'59P166480','2020-07-01 00:02:00','2020-07-01 06:00:00',5000,NULL,NULL),(4,NULL,NULL,NULL,NULL,NULL,NULL,'59-P166480','2020-07-01 00:03:00','2020-07-03 06:00:00',5000,NULL,NULL),(5,NULL,NULL,NULL,NULL,NULL,NULL,'59-P166480','2020-07-01 00:04:00','2020-07-01 00:00:00',NULL,'1234567',NULL),(6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-07-22 12:56:20','2020-07-01 00:00:00',NULL,'1234567',NULL),(7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-08-02 02:08:38','2020-08-02 02:08:38',NULL,'1234567',NULL);
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price`
--

DROP TABLE IF EXISTS `price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `price` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_vehicletype` int(20) NOT NULL,
  `dayprice` int(10) NOT NULL,
  `monthprice` int(10) NOT NULL,
  `startdate` timestamp NOT NULL,
  `enddate` timestamp NULL DEFAULT NULL,
  `status` int(2) NOT NULL,
  `createdby` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `createddate` timestamp NULL DEFAULT NULL,
  `modifiedby` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `modifieddate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk1_price_user` (`createdby`),
  KEY `fk2_price_user` (`modifiedby`),
  CONSTRAINT `fk1_price_user` FOREIGN KEY (`createdby`) REFERENCES `user` (`id`),
  CONSTRAINT `fk2_price_user` FOREIGN KEY (`modifiedby`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_price_vehicle` FOREIGN KEY (`id`) REFERENCES `vehicletype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price`
--

LOCK TABLES `price` WRITE;
/*!40000 ALTER TABLE `price` DISABLE KEYS */;
INSERT INTO `price` VALUES (1,1,5000,100000,'2020-06-30 17:00:00','2020-09-29 17:00:00',1,NULL,NULL,NULL,NULL),(2,2,6000,120000,'2020-06-30 17:00:00','2020-09-29 17:00:00',1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rentdetail`
--

DROP TABLE IF EXISTS `rentdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rentdetail` (
  `id` bigint(20) NOT NULL,
  `plateno` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `framenumber` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `machinenumber` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `enddate` timestamp NULL DEFAULT NULL,
  `id_customer` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `id_price` bigint(20) DEFAULT NULL,
  `id_vehicletype` bigint(20) DEFAULT NULL,
  `status` int(2) NOT NULL,
  `createdby` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `createddate` timestamp NULL DEFAULT NULL,
  `modifiedby` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `modifieddate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk1_rentdetail_user` (`createdby`),
  KEY `fk2_rentdetail_user` (`modifiedby`),
  KEY `fk_rentdetail_customer` (`id_customer`),
  KEY `fk_rentdetail_vehicletype` (`id_vehicletype`),
  KEY `fk_rentdetail_price` (`id_price`),
  CONSTRAINT `fk1_rentdetail_user` FOREIGN KEY (`createdby`) REFERENCES `user` (`id`),
  CONSTRAINT `fk2_rentdetail_user` FOREIGN KEY (`modifiedby`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_rentdetail_customer` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id`),
  CONSTRAINT `fk_rentdetail_price` FOREIGN KEY (`id_price`) REFERENCES `price` (`id`),
  CONSTRAINT `fk_rentdetail_vehicletype` FOREIGN KEY (`id_vehicletype`) REFERENCES `vehicletype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rentdetail`
--

LOCK TABLES `rentdetail` WRITE;
/*!40000 ALTER TABLE `rentdetail` DISABLE KEYS */;
INSERT INTO `rentdetail` VALUES (1,'59P166480','8X15D01653','Z956Y0K651','2020-08-31 17:00:00','285723691',1,1,1,NULL,NULL,NULL,NULL),(2,'59-e121500','5LK018U4PL','98J7K15975','2020-08-31 17:00:00','296705613',1,2,1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `rentdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(2) NOT NULL,
  `createdby` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `createddate` timestamp NULL DEFAULT NULL,
  `modifiedby` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `modifieddate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk1_role_user` (`createdby`),
  KEY `fk2_role_user` (`modifiedby`),
  CONSTRAINT `fk1_role_user` FOREIGN KEY (`createdby`) REFERENCES `user` (`id`),
  CONSTRAINT `fk2_role_user` FOREIGN KEY (`modifiedby`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'MANAGER',1,NULL,NULL,NULL,NULL),(2,'EMPLOYEE',1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `id` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `addr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gender` int(2) NOT NULL,
  `phoneNo` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `managerid` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `status` int(2) NOT NULL,
  `createdby` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `createddate` timestamp NULL DEFAULT NULL,
  `modifiedby` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `modifieddate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk1_user_user_idx` (`managerid`),
  KEY `fk2_user_user_idx` (`createdby`),
  KEY `fk3_user_user_idx` (`modifiedby`),
  CONSTRAINT `fk1_user_user` FOREIGN KEY (`managerid`) REFERENCES `user` (`id`),
  CONSTRAINT `fk2_user_user` FOREIGN KEY (`createdby`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('12345','$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','NhÃ¢n ViÃªn 2','Linh Trung, Thá»§ Äá»©c',0,'0123456789','123456',0,NULL,NULL,NULL,NULL),('123456','$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','Huá»³nh ÄÄƒng Nguyá»‡n','Linh Trung, Thá»§ Äá»©c',1,'0984609990',NULL,1,NULL,NULL,NULL,NULL),('1234567','$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','NhÃ¢n ViÃªn 1','Linh Trung, Thá»§ Äá»©c',1,'0123456789','123456',1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_role` (
  `id_user` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `id_role` bigint(20) NOT NULL,
  PRIMARY KEY (`id_user`,`id_role`),
  KEY `user_role_role_fk_idx` (`id_role`),
  CONSTRAINT `fk_user_role_role` FOREIGN KEY (`id_role`) REFERENCES `role` (`id`),
  CONSTRAINT `fk_user_role_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES ('123456',1),('12345',2),('123456',2),('1234567',2);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicletype`
--

DROP TABLE IF EXISTS `vehicletype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `vehicletype` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(2) NOT NULL,
  `createdby` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `createddate` timestamp NULL DEFAULT NULL,
  `modifiedby` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `modifieddate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk1_vehicletype_user` (`createdby`),
  KEY `fk2_vehicletype_user` (`modifiedby`),
  CONSTRAINT `fk1_vehicletype_user` FOREIGN KEY (`createdby`) REFERENCES `user` (`id`),
  CONSTRAINT `fk2_vehicletype_user` FOREIGN KEY (`modifiedby`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicletype`
--

LOCK TABLES `vehicletype` WRITE;
/*!40000 ALTER TABLE `vehicletype` DISABLE KEYS */;
INSERT INTO `vehicletype` VALUES (1,'Xe sá»‘',1,NULL,NULL,NULL,NULL),(2,'Tay Ga',1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `vehicletype` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-11 10:23:27
