# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.24)
# Database: CO3098_CW3
# Generation Time: 2018-12-17 02:59:36 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table authority
# ------------------------------------------------------------

DROP TABLE IF EXISTS `authority`;

CREATE TABLE `authority` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKj9vkma9pkho8of1bwxnt5rvgb` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `authority` WRITE;
/*!40000 ALTER TABLE `authority` DISABLE KEYS */;

INSERT INTO `authority` (`id`, `name`)
VALUES
	(1,'PERSON_CREATE'),
	(2,'PERSON_READ'),
	(3,'PERSON_UPDATE'),
	(4,'PERSON_DELETE');

/*!40000 ALTER TABLE `authority` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth_access_token
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_access_token`;

CREATE TABLE `oauth_access_token` (
  `token_id` varchar(255) DEFAULT NULL,
  `token` varchar(1000) DEFAULT NULL,
  `authentication_id` varchar(255) NOT NULL DEFAULT '',
  `user_name` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  `authentication` varchar(10000) DEFAULT NULL,
  `refresh_token` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`authentication_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `oauth_access_token` WRITE;
/*!40000 ALTER TABLE `oauth_access_token` DISABLE KEYS */;

INSERT INTO `oauth_access_token` (`token_id`, `token`, `authentication_id`, `user_name`, `client_id`, `authentication`, `refresh_token`)
VALUES
	('6c4512b643803ef62b245e95a3866339','¬í\0sr\0Corg.springframework.security.oauth2.common.DefaultOAuth2AccessToken²ž6$úÎ\0L\0additionalInformationt\0Ljava/util/Map;L\0\nexpirationt\0Ljava/util/Date;L\0refreshTokent\0?Lorg/springframework/security/oauth2/common/OAuth2RefreshToken;L\0scopet\0Ljava/util/Set;L\0	tokenTypet\0Ljava/lang/String;L\0valueq\0~\0xpsr\0java.util.Collections$EmptyMapY6…ZÜçÐ\0\0xpsr\0java.util.DatehjKYt\0\0xpw\0\0gºŒ€ixsr\0Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/ßGcÐÉ·\0L\0\nexpirationq\0~\0xr\0Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokensá\ncTÔ^\0L\0valueq\0~\0xpt\0$88731945-2944-4418-af15-7bbe795690desq\0~\0	w\0\0h=ƒ)Ùxsr\0%java.util.Collections$UnmodifiableSet€’Ñ›€U\0\0xr\0,java.util.Collections$UnmodifiableCollectionB\0€Ë^÷\0L\0ct\0Ljava/util/Collection;xpsr\0java.util.LinkedHashSetØl×Z•Ý*\0\0xr\0java.util.HashSetºD…•–¸·4\0\0xpw\0\0\0?@\0\0\0\0\0t\0readt\0writext\0bearert\0$21433e3e-7ee2-4259-867b-836b5323e799','d557e74143287f87984f133c7409755d','admin','spring-security-oauth2-read-write-client','¬í\0sr\0Aorg.springframework.security.oauth2.provider.OAuth2Authentication½@bR\0L\0\rstoredRequestt\0<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\0userAuthenticationt\02Lorg/springframework/security/core/Authentication;xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenÓª(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailst\0Ljava/lang/Object;xp\0sr\0&java.util.Collections$UnmodifiableListü%1µìŽ\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0€Ë^÷\0L\0cq\0~\0xpsr\0java.util.ArrayListxÒ™Ça\0I\0sizexp\0\0\0w\0\0\0sr\0)org.genealogy.explorer.security.AuthorityŽ¹ºÝÈ™\0L\0idt\0Ljava/lang/Long;L\0namet\0Ljava/lang/String;xpsr\0java.lang.Long;‹äÌ#ß\0J\0valuexr\0java.lang.Number†¬•”à‹\0\0xp\0\0\0\0\0\0\0t\0\rPERSON_CREATEsq\0~\0\rsq\0~\0\0\0\0\0\0\0\0t\0PERSON_READsq\0~\0\rsq\0~\0\0\0\0\0\0\0\0t\0\rPERSON_UPDATEsq\0~\0\rsq\0~\0\0\0\0\0\0\0\0t\0\rPERSON_DELETExq\0~\0psr\0:org.springframework.security.oauth2.provider.OAuth2Request\0\0\0\0\0\0\0\0Z\0approvedL\0authoritiesq\0~\0L\0\nextensionst\0Ljava/util/Map;L\0redirectUriq\0~\0L\0refresht\0;Lorg/springframework/security/oauth2/provider/TokenRequest;L\0resourceIdst\0Ljava/util/Set;L\0\rresponseTypesq\0~\0!xr\08org.springframework.security.oauth2.provider.BaseRequest6(z>£qi½\0L\0clientIdq\0~\0L\0requestParametersq\0~\0L\0scopeq\0~\0!xpt\0(spring-security-oauth2-read-write-clientsr\0%java.util.Collections$UnmodifiableMapñ¥¨þtõB\0L\0mq\0~\0xpsr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\ngrant_typet\0passwordt\0	client_idt\0(spring-security-oauth2-read-write-clientt\0usernamet\0adminxsr\0%java.util.Collections$UnmodifiableSet€’Ñ›€U\0\0xq\0~\0	sr\0java.util.LinkedHashSetØl×Z•Ý*\0\0xr\0java.util.HashSetºD…•–¸·4\0\0xpw\0\0\0?@\0\0\0\0\0t\0readt\0writexsq\0~\02w\0\0\0?@\0\0\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0ô\0L\0roleq\0~\0xpt\0USERxsq\0~\0\'?@\0\0\0\0\0\0w\0\0\0\0\0\0\0xppsq\0~\02w\0\0\0?@\0\0\0\0\0t\0ge-server-rest-apixsq\0~\02w\0\0\0?@\0\0\0\0\0\0xsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0ô\0L\0credentialsq\0~\0L\0	principalq\0~\0xq\0~\0sq\0~\0sq\0~\0\0\0\0w\0\0\0q\0~\0q\0~\0q\0~\0q\0~\0xq\0~\0Asr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxq\0~\0\'?@\0\0\0\0\0w\0\0\0\0\0\0q\0~\0)q\0~\0*q\0~\0+q\0~\0,q\0~\0-q\0~\0.x\0psr\0$org.genealogy.explorer.security.Userãí>œ\ZÆ–\0Z\0accountExpiredZ\0\raccountLockedZ\0credentialsExpiredZ\0enabledL\0authoritiesq\0~\0L\0idq\0~\0L\0passwordq\0~\0L\0usernameq\0~\0xp\0\0\0sr\0/org.hibernate.collection.internal.PersistentBagecý? ‚\0\0L\0bagq\0~\0xr\0>org.hibernate.collection.internal.AbstractPersistentCollectionéÓÜM©;¥\0\nZ\0allowLoadOutsideTransactionI\0\ncachedSizeZ\0dirtyZ\0initializedZ\0\risTempSessionL\0keyt\0Ljava/io/Serializable;L\0ownerq\0~\0L\0roleq\0~\0L\0sessionFactoryUuidq\0~\0L\0storedSnapshotq\0~\0Hxp\0ÿÿÿÿ\0\0q\0~\0q\0~\0Et\00org.genealogy.explorer.security.User.authoritiespsq\0~\0\0\0\0w\0\0\0q\0~\0q\0~\0q\0~\0q\0~\0xsq\0~\0\0\0\0w\0\0\0q\0~\0q\0~\0q\0~\0q\0~\0xq\0~\0t\0<$2a$08$qvrzQZ7jJ7oy2p/msL4M0.l83Cd0jNsX6AJUitbgRXGzge4j035hat\0admin','b52ed757015a8e4f47823314293fdd7e');

/*!40000 ALTER TABLE `oauth_access_token` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth_approvals
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_approvals`;

CREATE TABLE `oauth_approvals` (
  `userid` varchar(255) DEFAULT NULL,
  `clientid` varchar(255) DEFAULT NULL,
  `scope` varchar(255) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `expiresat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lastmodifiedat` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table oauth_client_details
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_client_details`;

CREATE TABLE `oauth_client_details` (
  `client_id` varchar(255) NOT NULL DEFAULT '',
  `resource_ids` varchar(255) DEFAULT NULL,
  `client_secret` varchar(255) DEFAULT NULL,
  `scope` varchar(255) DEFAULT NULL,
  `authorized_grant_types` varchar(255) DEFAULT NULL,
  `web_server_redirect_uri` varchar(255) DEFAULT NULL,
  `authorities` varchar(255) DEFAULT NULL,
  `access_token_validity` int(11) DEFAULT NULL,
  `refresh_token_validity` int(11) DEFAULT NULL,
  `additional_information` varchar(4096) DEFAULT NULL,
  `autoapprove` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `oauth_client_details` WRITE;
/*!40000 ALTER TABLE `oauth_client_details` DISABLE KEYS */;

INSERT INTO `oauth_client_details` (`client_id`, `resource_ids`, `client_secret`, `scope`, `authorized_grant_types`, `web_server_redirect_uri`, `authorities`, `access_token_validity`, `refresh_token_validity`, `additional_information`, `autoapprove`)
VALUES
	('spring-security-oauth2-read-client','ge-server-rest-api','$2a$04$WGq2P9egiOYoOFemBRfsiO9qTcyJtNRnPKNBl5tokP7IP.eZn93km','read','password,authorization_code,refresh_token,implicit',NULL,'USER',10800,2592000,NULL,NULL),
	('spring-security-oauth2-read-write-client','ge-server-rest-api','$2a$04$soeOR.QFmClXeFIrhJVLWOQxfHjsJLSpWrU1iGxcMGdu.a5hvfY4W','read,write','password,authorization_code,refresh_token,implicit',NULL,'USER',10800,2592000,NULL,NULL);

/*!40000 ALTER TABLE `oauth_client_details` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth_client_token
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_client_token`;

CREATE TABLE `oauth_client_token` (
  `token_id` varchar(255) DEFAULT NULL,
  `token` varchar(1000) DEFAULT NULL,
  `authentication_id` varchar(255) NOT NULL DEFAULT '',
  `user_name` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`authentication_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table oauth_code
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_code`;

CREATE TABLE `oauth_code` (
  `code` varchar(255) DEFAULT NULL,
  `authentication` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table oauth_refresh_token
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_refresh_token`;

CREATE TABLE `oauth_refresh_token` (
  `token_id` varchar(255) DEFAULT NULL,
  `token` varchar(1000) DEFAULT NULL,
  `authentication` varchar(10000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `oauth_refresh_token` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_token` DISABLE KEYS */;

INSERT INTO `oauth_refresh_token` (`token_id`, `token`, `authentication`)
VALUES
	('df5c6afd6761e9cc66d935e30e428e8f','¬í\0sr\0Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/ßGcÐÉ·\0L\0\nexpirationt\0Ljava/util/Date;xr\0Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokensá\ncTÔ^\0L\0valuet\0Ljava/lang/String;xpt\0$ba37a0f5-27cc-4c3e-b19d-3fd5d405e2c8sr\0java.util.DatehjKYt\0\0xpw\0\0h=r\0ax','¬í\0sr\0Aorg.springframework.security.oauth2.provider.OAuth2Authentication½@bR\0L\0\rstoredRequestt\0<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\0userAuthenticationt\02Lorg/springframework/security/core/Authentication;xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenÓª(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailst\0Ljava/lang/Object;xp\0sr\0&java.util.Collections$UnmodifiableListü%1µì\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0Ë^÷\0L\0cq\0~\0xpsr\0java.util.ArrayListxÒÇa\0I\0sizexp\0\0\0w\0\0\0sr\0)org.genealogy.explorer.security.Authority½pOðD1\0L\0idt\0Ljava/lang/Long;L\0namet\0Ljava/lang/String;xpsr\0java.lang.Long;äÌ#ß\0J\0valuexr\0java.lang.Number¬à\0\0xp\0\0\0\0\0\0\0t\0\rPERSON_CREATEsq\0~\0\rsq\0~\0\0\0\0\0\0\0\0t\0PERSON_READsq\0~\0\rsq\0~\0\0\0\0\0\0\0\0t\0\rPERSON_UPDATEsq\0~\0\rsq\0~\0\0\0\0\0\0\0\0t\0\rPERSON_DELETExq\0~\0psr\0:org.springframework.security.oauth2.provider.OAuth2Request\0\0\0\0\0\0\0\0Z\0approvedL\0authoritiesq\0~\0L\0\nextensionst\0Ljava/util/Map;L\0redirectUriq\0~\0L\0refresht\0;Lorg/springframework/security/oauth2/provider/TokenRequest;L\0resourceIdst\0Ljava/util/Set;L\0\rresponseTypesq\0~\0!xr\08org.springframework.security.oauth2.provider.BaseRequest6(z>£qi½\0L\0clientIdq\0~\0L\0requestParametersq\0~\0L\0scopeq\0~\0!xpt\0(spring-security-oauth2-read-write-clientsr\0%java.util.Collections$UnmodifiableMapñ¥¨þtõB\0L\0mq\0~\0xpsr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\ngrant_typet\0passwordt\0	client_idt\0(spring-security-oauth2-read-write-clientt\0usernamet\0adminxsr\0%java.util.Collections$UnmodifiableSetÑU\0\0xq\0~\0	sr\0java.util.LinkedHashSetØl×ZÝ*\0\0xr\0java.util.HashSetºD¸·4\0\0xpw\0\0\0?@\0\0\0\0\0t\0readt\0writexsq\0~\02w\0\0\0?@\0\0\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0þ\0L\0roleq\0~\0xpt\0USERxsq\0~\0\'?@\0\0\0\0\0\0w\0\0\0\0\0\0\0xppsq\0~\02w\0\0\0?@\0\0\0\0\0t\0ge-server-rest-apixsq\0~\02w\0\0\0?@\0\0\0\0\0\0xsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0þ\0L\0credentialsq\0~\0L\0	principalq\0~\0xq\0~\0sq\0~\0sq\0~\0\0\0\0w\0\0\0q\0~\0q\0~\0q\0~\0q\0~\0xq\0~\0Asr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxq\0~\0\'?@\0\0\0\0\0w\0\0\0\0\0\0q\0~\0)q\0~\0*q\0~\0+q\0~\0,q\0~\0-q\0~\0.x\0psr\0$org.genealogy.explorer.security.Userãí>\ZÆ\0Z\0accountExpiredZ\0\raccountLockedZ\0credentialsExpiredZ\0enabledL\0authoritiesq\0~\0L\0idq\0~\0L\0passwordq\0~\0L\0usernameq\0~\0xp\0\0\0sr\0/org.hibernate.collection.internal.PersistentBag>j\r0I_ \0L\0bagq\0~\0xr\0>org.hibernate.collection.internal.AbstractPersistentCollection@,ø\rXÕRò\0Z\0allowLoadOutsideTransactionI\0\ncachedSizeZ\0dirtyZ\0elementRemovedZ\0initializedZ\0\risTempSessionL\0keyt\0Ljava/io/Serializable;L\0ownerq\0~\0L\0roleq\0~\0L\0sessionFactoryUuidq\0~\0L\0storedSnapshotq\0~\0Hxp\0ÿÿÿÿ\0\0\0q\0~\0q\0~\0Et\00org.genealogy.explorer.security.User.authoritiespsq\0~\0\0\0\0w\0\0\0q\0~\0q\0~\0q\0~\0q\0~\0xsq\0~\0\0\0\0w\0\0\0q\0~\0q\0~\0q\0~\0q\0~\0xq\0~\0t\0<$2a$08$qvrzQZ7jJ7oy2p/msL4M0.l83Cd0jNsX6AJUitbgRXGzge4j035hat\0admin'),
	('b52ed757015a8e4f47823314293fdd7e','¬í\0sr\0Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/ßGcÐÉ·\0L\0\nexpirationt\0Ljava/util/Date;xr\0Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokensá\ncTÔ^\0L\0valuet\0Ljava/lang/String;xpt\0$88731945-2944-4418-af15-7bbe795690desr\0java.util.DatehjKYt\0\0xpw\0\0h=)Ùx','¬í\0sr\0Aorg.springframework.security.oauth2.provider.OAuth2Authentication½@bR\0L\0\rstoredRequestt\0<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\0userAuthenticationt\02Lorg/springframework/security/core/Authentication;xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenÓª(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailst\0Ljava/lang/Object;xp\0sr\0&java.util.Collections$UnmodifiableListü%1µì\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0Ë^÷\0L\0cq\0~\0xpsr\0java.util.ArrayListxÒÇa\0I\0sizexp\0\0\0w\0\0\0sr\0)org.genealogy.explorer.security.Authority¹ºÝÈ\0L\0idt\0Ljava/lang/Long;L\0namet\0Ljava/lang/String;xpsr\0java.lang.Long;äÌ#ß\0J\0valuexr\0java.lang.Number¬à\0\0xp\0\0\0\0\0\0\0t\0\rPERSON_CREATEsq\0~\0\rsq\0~\0\0\0\0\0\0\0\0t\0PERSON_READsq\0~\0\rsq\0~\0\0\0\0\0\0\0\0t\0\rPERSON_UPDATEsq\0~\0\rsq\0~\0\0\0\0\0\0\0\0t\0\rPERSON_DELETExq\0~\0psr\0:org.springframework.security.oauth2.provider.OAuth2Request\0\0\0\0\0\0\0\0Z\0approvedL\0authoritiesq\0~\0L\0\nextensionst\0Ljava/util/Map;L\0redirectUriq\0~\0L\0refresht\0;Lorg/springframework/security/oauth2/provider/TokenRequest;L\0resourceIdst\0Ljava/util/Set;L\0\rresponseTypesq\0~\0!xr\08org.springframework.security.oauth2.provider.BaseRequest6(z>£qi½\0L\0clientIdq\0~\0L\0requestParametersq\0~\0L\0scopeq\0~\0!xpt\0(spring-security-oauth2-read-write-clientsr\0%java.util.Collections$UnmodifiableMapñ¥¨þtõB\0L\0mq\0~\0xpsr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\ngrant_typet\0passwordt\0	client_idt\0(spring-security-oauth2-read-write-clientt\0usernamet\0adminxsr\0%java.util.Collections$UnmodifiableSetÑU\0\0xq\0~\0	sr\0java.util.LinkedHashSetØl×ZÝ*\0\0xr\0java.util.HashSetºD¸·4\0\0xpw\0\0\0?@\0\0\0\0\0t\0readt\0writexsq\0~\02w\0\0\0?@\0\0\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0ô\0L\0roleq\0~\0xpt\0USERxsq\0~\0\'?@\0\0\0\0\0\0w\0\0\0\0\0\0\0xppsq\0~\02w\0\0\0?@\0\0\0\0\0t\0ge-server-rest-apixsq\0~\02w\0\0\0?@\0\0\0\0\0\0xsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0ô\0L\0credentialsq\0~\0L\0	principalq\0~\0xq\0~\0sq\0~\0sq\0~\0\0\0\0w\0\0\0q\0~\0q\0~\0q\0~\0q\0~\0xq\0~\0Asr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxq\0~\0\'?@\0\0\0\0\0w\0\0\0\0\0\0q\0~\0)q\0~\0*q\0~\0+q\0~\0,q\0~\0-q\0~\0.x\0psr\0$org.genealogy.explorer.security.Userãí>\ZÆ\0Z\0accountExpiredZ\0\raccountLockedZ\0credentialsExpiredZ\0enabledL\0authoritiesq\0~\0L\0idq\0~\0L\0passwordq\0~\0L\0usernameq\0~\0xp\0\0\0sr\0/org.hibernate.collection.internal.PersistentBagecý? \0\0L\0bagq\0~\0xr\0>org.hibernate.collection.internal.AbstractPersistentCollectionéÓÜM©;¥\0\nZ\0allowLoadOutsideTransactionI\0\ncachedSizeZ\0dirtyZ\0initializedZ\0\risTempSessionL\0keyt\0Ljava/io/Serializable;L\0ownerq\0~\0L\0roleq\0~\0L\0sessionFactoryUuidq\0~\0L\0storedSnapshotq\0~\0Hxp\0ÿÿÿÿ\0\0q\0~\0q\0~\0Et\00org.genealogy.explorer.security.User.authoritiespsq\0~\0\0\0\0w\0\0\0q\0~\0q\0~\0q\0~\0q\0~\0xsq\0~\0\0\0\0w\0\0\0q\0~\0q\0~\0q\0~\0q\0~\0xq\0~\0t\0<$2a$08$qvrzQZ7jJ7oy2p/msL4M0.l83Cd0jNsX6AJUitbgRXGzge4j035hat\0admin');

/*!40000 ALTER TABLE `oauth_refresh_token` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table person
# ------------------------------------------------------------

DROP TABLE IF EXISTS `person`;

CREATE TABLE `person` (
  `id` int(11) NOT NULL,
  `date_of_birth` int(11) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `father_id` int(11) DEFAULT NULL,
  `mother_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKd8e0hnemhy3qyp9oirm03nnyn` (`father_id`),
  KEY `FKr1fbnoc27nj64bnv21moap7el` (`mother_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;

INSERT INTO `person` (`id`, `date_of_birth`, `gender`, `name`, `father_id`, `mother_id`)
VALUES
	(1,20181207,'F','Piyali',NULL,NULL),
	(2,20181228,'M','Dj',8,10),
	(3,20181215,'M','QWERTY',2,1),
	(4,20120909,'H','hello',3,1),
	(5,20190909,'H','teoolo',3,1),
	(8,20190909,'f','der',11,12),
	(10,20190909,'f','ter',NULL,NULL),
	(11,20190909,'f','ter',13,NULL),
	(12,20190909,'f','ter',NULL,NULL),
	(13,20190909,'f','ter',NULL,NULL);

/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_`;

CREATE TABLE `user_` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_expired` bit(1) DEFAULT NULL,
  `account_locked` bit(1) DEFAULT NULL,
  `credentials_expired` bit(1) DEFAULT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKcfu5mc57wynm82447fk7rs4dw` (`user_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `user_` WRITE;
/*!40000 ALTER TABLE `user_` DISABLE KEYS */;

INSERT INTO `user_` (`id`, `account_expired`, `account_locked`, `credentials_expired`, `enabled`, `password`, `user_name`)
VALUES
	(1,b'0',b'0',b'0',b'1','$2a$08$qvrzQZ7jJ7oy2p/msL4M0.l83Cd0jNsX6AJUitbgRXGzge4j035ha','admin');

/*!40000 ALTER TABLE `user_` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users_authorities
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users_authorities`;

CREATE TABLE `users_authorities` (
  `user_id` bigint(20) NOT NULL,
  `authority_id` bigint(20) NOT NULL,
  KEY `FKac1qasdciwqra319h2pa72gh6` (`authority_id`),
  KEY `FKr0831xdfdp0ulvxfc854mfuct` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `users_authorities` WRITE;
/*!40000 ALTER TABLE `users_authorities` DISABLE KEYS */;

INSERT INTO `users_authorities` (`user_id`, `authority_id`)
VALUES
	(1,1),
	(1,2),
	(1,3),
	(1,4);

/*!40000 ALTER TABLE `users_authorities` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
