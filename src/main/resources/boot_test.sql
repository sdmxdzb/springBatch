/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.7.17-log : Database - boot_test
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`boot_test` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `boot_test`;

/*Table structure for table `batch_job_execution` */

DROP TABLE IF EXISTS `batch_job_execution`;

CREATE TABLE `batch_job_execution` (
  `JOB_EXECUTION_ID` bigint(20) NOT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `JOB_INSTANCE_ID` bigint(20) NOT NULL,
  `CREATE_TIME` datetime NOT NULL,
  `START_TIME` datetime DEFAULT NULL,
  `END_TIME` datetime DEFAULT NULL,
  `STATUS` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `EXIT_CODE` varchar(2500) COLLATE utf8_bin DEFAULT NULL,
  `EXIT_MESSAGE` varchar(2500) COLLATE utf8_bin DEFAULT NULL,
  `LAST_UPDATED` datetime DEFAULT NULL,
  `JOB_CONFIGURATION_LOCATION` varchar(2500) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`JOB_EXECUTION_ID`),
  KEY `JOB_INST_EXEC_FK` (`JOB_INSTANCE_ID`),
  CONSTRAINT `JOB_INST_EXEC_FK` FOREIGN KEY (`JOB_INSTANCE_ID`) REFERENCES `batch_job_instance` (`JOB_INSTANCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `batch_job_execution` */

insert  into `batch_job_execution`(`JOB_EXECUTION_ID`,`VERSION`,`JOB_INSTANCE_ID`,`CREATE_TIME`,`START_TIME`,`END_TIME`,`STATUS`,`EXIT_CODE`,`EXIT_MESSAGE`,`LAST_UPDATED`,`JOB_CONFIGURATION_LOCATION`) values (1,2,1,'2017-08-18 15:44:12','2017-08-18 15:44:12','2017-08-18 15:44:12','FAILED','FAILED','','2017-08-18 15:44:12',NULL),(2,2,1,'2017-08-18 15:45:56','2017-08-18 15:45:56','2017-08-18 15:45:56','FAILED','FAILED','','2017-08-18 15:45:56',NULL),(3,2,1,'2017-08-18 15:50:18','2017-08-18 15:50:19','2017-08-18 15:50:19','FAILED','FAILED','','2017-08-18 15:50:19',NULL),(4,2,1,'2017-08-18 15:55:18','2017-08-18 15:55:18','2017-08-18 15:55:19','FAILED','FAILED','','2017-08-18 15:55:19',NULL),(5,2,1,'2017-08-18 15:57:55','2017-08-18 15:57:56','2017-08-18 15:57:56','COMPLETED','COMPLETED','','2017-08-18 15:57:56',NULL);

/*Table structure for table `batch_job_execution_context` */

DROP TABLE IF EXISTS `batch_job_execution_context`;

CREATE TABLE `batch_job_execution_context` (
  `JOB_EXECUTION_ID` bigint(20) NOT NULL,
  `SHORT_CONTEXT` varchar(2500) COLLATE utf8_bin NOT NULL,
  `SERIALIZED_CONTEXT` text COLLATE utf8_bin,
  PRIMARY KEY (`JOB_EXECUTION_ID`),
  CONSTRAINT `JOB_EXEC_CTX_FK` FOREIGN KEY (`JOB_EXECUTION_ID`) REFERENCES `batch_job_execution` (`JOB_EXECUTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `batch_job_execution_context` */

insert  into `batch_job_execution_context`(`JOB_EXECUTION_ID`,`SHORT_CONTEXT`,`SERIALIZED_CONTEXT`) values (1,'{\"map\":[\"\"]}',NULL),(2,'{\"map\":[\"\"]}',NULL),(3,'{\"map\":[\"\"]}',NULL),(4,'{\"map\":[\"\"]}',NULL),(5,'{\"map\":[\"\"]}',NULL);

/*Table structure for table `batch_job_execution_params` */

DROP TABLE IF EXISTS `batch_job_execution_params`;

CREATE TABLE `batch_job_execution_params` (
  `JOB_EXECUTION_ID` bigint(20) NOT NULL,
  `TYPE_CD` varchar(6) COLLATE utf8_bin NOT NULL,
  `KEY_NAME` varchar(100) COLLATE utf8_bin NOT NULL,
  `STRING_VAL` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `DATE_VAL` datetime DEFAULT NULL,
  `LONG_VAL` bigint(20) DEFAULT NULL,
  `DOUBLE_VAL` double DEFAULT NULL,
  `IDENTIFYING` char(1) COLLATE utf8_bin NOT NULL,
  KEY `JOB_EXEC_PARAMS_FK` (`JOB_EXECUTION_ID`),
  CONSTRAINT `JOB_EXEC_PARAMS_FK` FOREIGN KEY (`JOB_EXECUTION_ID`) REFERENCES `batch_job_execution` (`JOB_EXECUTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `batch_job_execution_params` */

insert  into `batch_job_execution_params`(`JOB_EXECUTION_ID`,`TYPE_CD`,`KEY_NAME`,`STRING_VAL`,`DATE_VAL`,`LONG_VAL`,`DOUBLE_VAL`,`IDENTIFYING`) values (1,'LONG','run.id','','1970-01-01 08:00:00',1,0,'Y'),(2,'LONG','run.id','','1970-01-01 08:00:00',1,0,'Y'),(3,'LONG','run.id','','1970-01-01 08:00:00',1,0,'Y'),(4,'LONG','run.id','','1970-01-01 08:00:00',1,0,'Y'),(5,'LONG','run.id','','1970-01-01 08:00:00',1,0,'Y');

/*Table structure for table `batch_job_execution_seq` */

DROP TABLE IF EXISTS `batch_job_execution_seq`;

CREATE TABLE `batch_job_execution_seq` (
  `ID` bigint(20) NOT NULL,
  `UNIQUE_KEY` char(1) COLLATE utf8_bin NOT NULL,
  UNIQUE KEY `UNIQUE_KEY_UN` (`UNIQUE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `batch_job_execution_seq` */

insert  into `batch_job_execution_seq`(`ID`,`UNIQUE_KEY`) values (5,'0');

/*Table structure for table `batch_job_instance` */

DROP TABLE IF EXISTS `batch_job_instance`;

CREATE TABLE `batch_job_instance` (
  `JOB_INSTANCE_ID` bigint(20) NOT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `JOB_NAME` varchar(100) COLLATE utf8_bin NOT NULL,
  `JOB_KEY` varchar(32) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`JOB_INSTANCE_ID`),
  UNIQUE KEY `JOB_INST_UN` (`JOB_NAME`,`JOB_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `batch_job_instance` */

insert  into `batch_job_instance`(`JOB_INSTANCE_ID`,`VERSION`,`JOB_NAME`,`JOB_KEY`) values (1,0,'importUserJob','853d3449e311f40366811cbefb3d93d7');

/*Table structure for table `batch_job_seq` */

DROP TABLE IF EXISTS `batch_job_seq`;

CREATE TABLE `batch_job_seq` (
  `ID` bigint(20) NOT NULL,
  `UNIQUE_KEY` char(1) COLLATE utf8_bin NOT NULL,
  UNIQUE KEY `UNIQUE_KEY_UN` (`UNIQUE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `batch_job_seq` */

insert  into `batch_job_seq`(`ID`,`UNIQUE_KEY`) values (1,'0');

/*Table structure for table `batch_step_execution` */

DROP TABLE IF EXISTS `batch_step_execution`;

CREATE TABLE `batch_step_execution` (
  `STEP_EXECUTION_ID` bigint(20) NOT NULL,
  `VERSION` bigint(20) NOT NULL,
  `STEP_NAME` varchar(100) COLLATE utf8_bin NOT NULL,
  `JOB_EXECUTION_ID` bigint(20) NOT NULL,
  `START_TIME` datetime NOT NULL,
  `END_TIME` datetime DEFAULT NULL,
  `STATUS` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `COMMIT_COUNT` bigint(20) DEFAULT NULL,
  `READ_COUNT` bigint(20) DEFAULT NULL,
  `FILTER_COUNT` bigint(20) DEFAULT NULL,
  `WRITE_COUNT` bigint(20) DEFAULT NULL,
  `READ_SKIP_COUNT` bigint(20) DEFAULT NULL,
  `WRITE_SKIP_COUNT` bigint(20) DEFAULT NULL,
  `PROCESS_SKIP_COUNT` bigint(20) DEFAULT NULL,
  `ROLLBACK_COUNT` bigint(20) DEFAULT NULL,
  `EXIT_CODE` varchar(2500) COLLATE utf8_bin DEFAULT NULL,
  `EXIT_MESSAGE` varchar(2500) COLLATE utf8_bin DEFAULT NULL,
  `LAST_UPDATED` datetime DEFAULT NULL,
  PRIMARY KEY (`STEP_EXECUTION_ID`),
  KEY `JOB_EXEC_STEP_FK` (`JOB_EXECUTION_ID`),
  CONSTRAINT `JOB_EXEC_STEP_FK` FOREIGN KEY (`JOB_EXECUTION_ID`) REFERENCES `batch_job_execution` (`JOB_EXECUTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `batch_step_execution` */

insert  into `batch_step_execution`(`STEP_EXECUTION_ID`,`VERSION`,`STEP_NAME`,`JOB_EXECUTION_ID`,`START_TIME`,`END_TIME`,`STATUS`,`COMMIT_COUNT`,`READ_COUNT`,`FILTER_COUNT`,`WRITE_COUNT`,`READ_SKIP_COUNT`,`WRITE_SKIP_COUNT`,`PROCESS_SKIP_COUNT`,`ROLLBACK_COUNT`,`EXIT_CODE`,`EXIT_MESSAGE`,`LAST_UPDATED`) values (1,2,'step1',1,'2017-08-18 15:44:12','2017-08-18 15:44:12','FAILED',0,0,0,0,0,0,0,1,'FAILED','org.springframework.batch.item.file.FlatFileParseException: Parsing error at line: 1 in resource=[file [D:\\sample-data.csv]], input=[PK\0\0\0\0\0!\0��X�z\0\0\0\0\0[Content_Types].xml �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�T�j�0��F�+I��\'�.�6��kl�ؒ�L���;vJȂi����Ҽe�y�Ѫ*�%4�&�wE6u��<�ӷΣ���ժt�����`���W[LDA䟤Ĵ�Ja�<X>�\\��gȥW�\\� ���L�%�ԡ\ZC/��EI��o�̌���^M��}iRE,T.�> �,3)h�.*���P\Z\0���ÌaDl�<���v�[W1W6°0���	��䴫m��#]\r\n	at org.springframework.batch.item.file.FlatFileItemReader.doRead(FlatFileItemReader.java:184)\r\n	at org.springframework.batch.item.support.AbstractItemCountingItemStreamItemReader.read(AbstractItemCountingItemStreamItemReader.java:88)\r\n	at org.springframework.batch.core.step.item.SimpleChunkProvider.doRead(SimpleChunkProvider.java:91)\r\n	at org.springframework.batch.core.step.item.SimpleChunkProvider.read(SimpleChunkProvider.java:157)\r\n	at org.springframework.batch.core.step.item.SimpleChunkProvider$1.doInIteration(SimpleChunkProvider.java:116)\r\n	at org.springframework.batch.repeat.support.RepeatTemplate.getNextResult(RepeatTemplate.java:374)\r\n	at org.springframework.batch.repeat.support.RepeatTemplate.executeInternal(RepeatTemplate.java:215)\r\n	at org.springframework.batch.repeat.support.RepeatTemplate.iterate(RepeatTemplate.java:144)\r\n	at org.springframework.batch.core.step.item.SimpleChunkProvider.provide(SimpleChunkProvider.java:110)\r\n	at org.springframework.batch.core.step.item.ChunkOrientedTasklet.execute(ChunkOrientedTasklet.java:69)\r\n	at org.springframework.batch.core.step.tasklet.TaskletStep$ChunkTransactionCallback.doInTransaction(TaskletStep.java:406)\r\n	at org.springframework.batch.core.step.tasklet.TaskletStep$ChunkTransactionCallback.doInTransaction(TaskletStep.java:330)\r\n	at org.springframework.transaction.support.TransactionTemplate.execute(TransactionTemplate.java:133)\r\n	at org.springframework.batch.core.step.tasklet.TaskletStep$2.doInChunkContext(TaskletStep.java:272)\r\n	at org.springframework.batch.core.scope.context.StepContextRepeatCall','2017-08-18 15:44:12'),(2,2,'step1',2,'2017-08-18 15:45:56','2017-08-18 15:45:56','FAILED',0,0,0,0,0,0,0,1,'FAILED','org.springframework.batch.item.file.FlatFileParseException: Parsing error at line: 1 in resource=[class path resource [sample-data.csv]], input=[PK\0\0\0\0\0!\0��X�z\0\0\0\0\0[Content_Types].xml �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�T�j�0��F�+I��\'�.�6��kl�ؒ�L���;vJȂi����Ҽe�y�Ѫ*�%4�&�wE6u��<�ӷΣ���ժt�����`���W[LDA䟤Ĵ�Ja�<X>�\\��gȥW�\\� ���L�%�ԡ\ZC/��EI��o�̌���^M��}iRE,T.�> �,3)h�.*���P\Z\0���ÌaDl�<���v�[W1W6°0���	��䴫m��#]\r\n	at org.springframework.batch.item.file.FlatFileItemReader.doRead(FlatFileItemReader.java:184)\r\n	at org.springframework.batch.item.support.AbstractItemCountingItemStreamItemReader.read(AbstractItemCountingItemStreamItemReader.java:88)\r\n	at org.springframework.batch.core.step.item.SimpleChunkProvider.doRead(SimpleChunkProvider.java:91)\r\n	at org.springframework.batch.core.step.item.SimpleChunkProvider.read(SimpleChunkProvider.java:157)\r\n	at org.springframework.batch.core.step.item.SimpleChunkProvider$1.doInIteration(SimpleChunkProvider.java:116)\r\n	at org.springframework.batch.repeat.support.RepeatTemplate.getNextResult(RepeatTemplate.java:374)\r\n	at org.springframework.batch.repeat.support.RepeatTemplate.executeInternal(RepeatTemplate.java:215)\r\n	at org.springframework.batch.repeat.support.RepeatTemplate.iterate(RepeatTemplate.java:144)\r\n	at org.springframework.batch.core.step.item.SimpleChunkProvider.provide(SimpleChunkProvider.java:110)\r\n	at org.springframework.batch.core.step.item.ChunkOrientedTasklet.execute(ChunkOrientedTasklet.java:69)\r\n	at org.springframework.batch.core.step.tasklet.TaskletStep$ChunkTransactionCallback.doInTransaction(TaskletStep.java:406)\r\n	at org.springframework.batch.core.step.tasklet.TaskletStep$ChunkTransactionCallback.doInTransaction(TaskletStep.java:330)\r\n	at org.springframework.transaction.support.TransactionTemplate.execute(TransactionTemplate.java:133)\r\n	at org.springframework.batch.core.step.tasklet.TaskletStep$2.doInChunkContext(TaskletStep.java:272)\r\n	at org.springframework.batch.core.scope.context.StepConte','2017-08-18 15:45:56'),(3,2,'step1',3,'2017-08-18 15:50:19','2017-08-18 15:50:19','FAILED',0,0,0,0,0,0,0,1,'FAILED','org.springframework.batch.item.file.FlatFileParseException: Parsing error at line: 1 in resource=[class path resource [sample-data.csv]], input=[PK\0\0\0\0\0!\0��X�z\0\0\0\0\0[Content_Types].xml �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�T�j�0��F�+I��\'�.�6��kl�ؒ�L���;vJȂi����Ҽe�y�Ѫ*�%4�&�wE6u��<�ӷΣ���ժt�����`���W[LDA䟤Ĵ�Ja�<X>�\\��gȥW�\\� ���L�%�ԡ\ZC/��EI��o�̌���^M��}iRE,T.�> �,3)h�.*���P\Z\0���ÌaDl�<���v�[W1W6°0���	��䴫m��#]\r\n	at org.springframework.batch.item.file.FlatFileItemReader.doRead(FlatFileItemReader.java:184)\r\n	at org.springframework.batch.item.support.AbstractItemCountingItemStreamItemReader.read(AbstractItemCountingItemStreamItemReader.java:88)\r\n	at org.springframework.batch.core.step.item.SimpleChunkProvider.doRead(SimpleChunkProvider.java:91)\r\n	at org.springframework.batch.core.step.item.SimpleChunkProvider.read(SimpleChunkProvider.java:157)\r\n	at org.springframework.batch.core.step.item.SimpleChunkProvider$1.doInIteration(SimpleChunkProvider.java:116)\r\n	at org.springframework.batch.repeat.support.RepeatTemplate.getNextResult(RepeatTemplate.java:374)\r\n	at org.springframework.batch.repeat.support.RepeatTemplate.executeInternal(RepeatTemplate.java:215)\r\n	at org.springframework.batch.repeat.support.RepeatTemplate.iterate(RepeatTemplate.java:144)\r\n	at org.springframework.batch.core.step.item.SimpleChunkProvider.provide(SimpleChunkProvider.java:110)\r\n	at org.springframework.batch.core.step.item.ChunkOrientedTasklet.execute(ChunkOrientedTasklet.java:69)\r\n	at org.springframework.batch.core.step.tasklet.TaskletStep$ChunkTransactionCallback.doInTransaction(TaskletStep.java:406)\r\n	at org.springframework.batch.core.step.tasklet.TaskletStep$ChunkTransactionCallback.doInTransaction(TaskletStep.java:330)\r\n	at org.springframework.transaction.support.TransactionTemplate.execute(TransactionTemplate.java:133)\r\n	at org.springframework.batch.core.step.tasklet.TaskletStep$2.doInChunkContext(TaskletStep.java:272)\r\n	at org.springframework.batch.core.scope.context.StepConte','2017-08-18 15:50:19'),(4,2,'step1',4,'2017-08-18 15:55:18','2017-08-18 15:55:19','FAILED',0,5,0,0,0,0,0,1,'FAILED','org.springframework.dao.DataIntegrityViolationException: PreparedStatementCallback; SQL [INSERT INTO people (first_name, last_name) VALUES (?, ?)]; Field \'person_id\' doesn\'t have a default value; nested exception is java.sql.BatchUpdateException: Field \'person_id\' doesn\'t have a default value\r\n	at org.springframework.jdbc.support.SQLErrorCodeSQLExceptionTranslator.doTranslate(SQLErrorCodeSQLExceptionTranslator.java:243)\r\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:73)\r\n	at org.springframework.jdbc.core.JdbcTemplate.execute(JdbcTemplate.java:649)\r\n	at org.springframework.jdbc.core.JdbcTemplate.execute(JdbcTemplate.java:662)\r\n	at org.springframework.jdbc.core.JdbcTemplate.batchUpdate(JdbcTemplate.java:950)\r\n	at org.springframework.jdbc.core.namedparam.NamedParameterBatchUpdateUtils.executeBatchUpdateWithNamedParameters(NamedParameterBatchUpdateUtils.java:40)\r\n	at org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate.batchUpdate(NamedParameterJdbcTemplate.java:335)\r\n	at org.springframework.batch.item.database.JdbcBatchItemWriter.write(JdbcBatchItemWriter.java:181)\r\n	at org.springframework.batch.core.step.item.SimpleChunkProcessor.writeItems(SimpleChunkProcessor.java:175)\r\n	at org.springframework.batch.core.step.item.SimpleChunkProcessor.doWrite(SimpleChunkProcessor.java:151)\r\n	at org.springframework.batch.core.step.item.SimpleChunkProcessor.write(SimpleChunkProcessor.java:274)\r\n	at org.springframework.batch.core.step.item.SimpleChunkProcessor.process(SimpleChunkProcessor.java:199)\r\n	at org.springframework.batch.core.step.item.ChunkOrientedTasklet.execute(ChunkOrientedTasklet.java:75)\r\n	at org.springframework.batch.core.step.tasklet.TaskletStep$ChunkTransactionCallback.doInTransaction(TaskletStep.java:406)\r\n	at org.springframework.batch.core.step.tasklet.TaskletStep$ChunkTransactionCallback.doInTransaction(TaskletStep.java:330)\r\n	at org.springframework.transaction.support.TransactionTemplate.execute(TransactionTemplate.java:133)\r\n	at org.springframework.batch.core.step.tasklet.TaskletStep$2.doInChunkContext(TaskletStep.java:272)\r\n	at org.springframework.batch.core.scope.context.StepContextRepeatCallback.doInIteration(StepContextRepeatCallback.java:81)\r\n	at org.springframework.batch.repeat.support.RepeatTemplate.getNextResult(RepeatTemplate.java:374)\r\n	at org.springframework.batch.repeat.support.RepeatTemplate.executeInternal(RepeatTemplate.java:215)\r\n	at org.spr','2017-08-18 15:55:19'),(5,3,'step1',5,'2017-08-18 15:57:56','2017-08-18 15:57:56','COMPLETED',1,5,0,5,0,0,0,0,'COMPLETED','','2017-08-18 15:57:56');

/*Table structure for table `batch_step_execution_context` */

DROP TABLE IF EXISTS `batch_step_execution_context`;

CREATE TABLE `batch_step_execution_context` (
  `STEP_EXECUTION_ID` bigint(20) NOT NULL,
  `SHORT_CONTEXT` varchar(2500) COLLATE utf8_bin NOT NULL,
  `SERIALIZED_CONTEXT` text COLLATE utf8_bin,
  PRIMARY KEY (`STEP_EXECUTION_ID`),
  CONSTRAINT `STEP_EXEC_CTX_FK` FOREIGN KEY (`STEP_EXECUTION_ID`) REFERENCES `batch_step_execution` (`STEP_EXECUTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `batch_step_execution_context` */

insert  into `batch_step_execution_context`(`STEP_EXECUTION_ID`,`SHORT_CONTEXT`,`SERIALIZED_CONTEXT`) values (1,'{\"map\":[{\"entry\":[{\"string\":[\"batch.taskletType\",\"org.springframework.batch.core.step.item.ChunkOrientedTasklet\"]},{\"string\":\"FlatFileItemReader.read.count\",\"int\":0},{\"string\":[\"batch.stepType\",\"org.springframework.batch.core.step.tasklet.TaskletStep\"]}]}]}',NULL),(2,'{\"map\":[{\"entry\":[{\"string\":[\"batch.taskletType\",\"org.springframework.batch.core.step.item.ChunkOrientedTasklet\"]},{\"string\":\"FlatFileItemReader.read.count\",\"int\":0},{\"string\":[\"batch.stepType\",\"org.springframework.batch.core.step.tasklet.TaskletStep\"]}]}]}',NULL),(3,'{\"map\":[{\"entry\":[{\"string\":[\"batch.taskletType\",\"org.springframework.batch.core.step.item.ChunkOrientedTasklet\"]},{\"string\":\"FlatFileItemReader.read.count\",\"int\":0},{\"string\":[\"batch.stepType\",\"org.springframework.batch.core.step.tasklet.TaskletStep\"]}]}]}',NULL),(4,'{\"map\":[{\"entry\":[{\"string\":[\"batch.taskletType\",\"org.springframework.batch.core.step.item.ChunkOrientedTasklet\"]},{\"string\":\"FlatFileItemReader.read.count\",\"int\":0},{\"string\":[\"batch.stepType\",\"org.springframework.batch.core.step.tasklet.TaskletStep\"]}]}]}',NULL),(5,'{\"map\":[{\"entry\":[{\"string\":[\"batch.taskletType\",\"org.springframework.batch.core.step.item.ChunkOrientedTasklet\"]},{\"string\":\"FlatFileItemReader.read.count\",\"int\":6},{\"string\":[\"batch.stepType\",\"org.springframework.batch.core.step.tasklet.TaskletStep\"]}]}]}',NULL);

/*Table structure for table `batch_step_execution_seq` */

DROP TABLE IF EXISTS `batch_step_execution_seq`;

CREATE TABLE `batch_step_execution_seq` (
  `ID` bigint(20) NOT NULL,
  `UNIQUE_KEY` char(1) COLLATE utf8_bin NOT NULL,
  UNIQUE KEY `UNIQUE_KEY_UN` (`UNIQUE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `batch_step_execution_seq` */

insert  into `batch_step_execution_seq`(`ID`,`UNIQUE_KEY`) values (5,'0');

/*Table structure for table `people` */

DROP TABLE IF EXISTS `people`;

CREATE TABLE `people` (
  `person_id` bigint(20) DEFAULT NULL,
  `first_name` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `last_name` varchar(20) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `people` */

insert  into `people`(`person_id`,`first_name`,`last_name`) values (NULL,'JILL','DOE'),(NULL,'JOE','DOE'),(NULL,'JUSTIN','DOE'),(NULL,'JANE','DOE'),(NULL,'JOHN','DOE');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
