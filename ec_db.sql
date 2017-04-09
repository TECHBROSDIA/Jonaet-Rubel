/*
MySQL Data Transfer
Source Host: localhost
Source Database: ec_db
Target Host: localhost
Target Database: ec_db
Date: 4/10/2017 3:57:01 AM
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for academicyear
-- ----------------------------
DROP TABLE IF EXISTS `academicyear`;
CREATE TABLE `academicyear` (
  `academic_id` int(50) NOT NULL AUTO_INCREMENT,
  `academic_yeat` varchar(100) NOT NULL,
  `assess_id` int(50) DEFAULT NULL,
  PRIMARY KEY (`academic_id`),
  KEY `FKASS` (`assess_id`),
  CONSTRAINT `FKASS` FOREIGN KEY (`assess_id`) REFERENCES `assessment` (`assess_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int(50) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `user_id` int(50) DEFAULT NULL,
  PRIMARY KEY (`admin_id`),
  KEY `FKU3` (`user_id`),
  CONSTRAINT `FKU3` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for assessment
-- ----------------------------
DROP TABLE IF EXISTS `assessment`;
CREATE TABLE `assessment` (
  `assess_id` int(50) NOT NULL AUTO_INCREMENT,
  `assess_title` varchar(100) NOT NULL,
  `claim_clouserdate` date NOT NULL,
  `sub_id` int(50) DEFAULT NULL,
  PRIMARY KEY (`assess_id`),
  KEY `FKS` (`sub_id`),
  CONSTRAINT `FKS` FOREIGN KEY (`sub_id`) REFERENCES `subject` (`sub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for claim
-- ----------------------------
DROP TABLE IF EXISTS `claim`;
CREATE TABLE `claim` (
  `claim_id` int(50) NOT NULL AUTO_INCREMENT,
  `claim_description` varchar(100) NOT NULL,
  `claim_date` date NOT NULL,
  `assess_id` int(50) DEFAULT NULL,
  `claim_type_id` int(50) DEFAULT NULL,
  `ecc_id` int(50) DEFAULT NULL,
  `stu_id` int(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`claim_id`),
  KEY `FKASS2` (`assess_id`),
  KEY `FKCL` (`claim_type_id`),
  KEY `FKE4` (`ecc_id`),
  KEY `FKS6` (`stu_id`),
  CONSTRAINT `FKASS2` FOREIGN KEY (`assess_id`) REFERENCES `assessment` (`assess_id`),
  CONSTRAINT `FKCL` FOREIGN KEY (`claim_type_id`) REFERENCES `claim_type` (`claim_type_id`),
  CONSTRAINT `FKE4` FOREIGN KEY (`ecc_id`) REFERENCES `ecc` (`ecc_id`),
  CONSTRAINT `FKS6` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for claim_type
-- ----------------------------
DROP TABLE IF EXISTS `claim_type`;
CREATE TABLE `claim_type` (
  `claim_type_id` int(50) NOT NULL,
  `claim_type_name` varchar(100) NOT NULL,
  PRIMARY KEY (`claim_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `course_id` int(50) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(100) DEFAULT NULL,
  `course_length` varchar(100) DEFAULT NULL,
  `course_startdate` date NOT NULL,
  `course_enddate` date NOT NULL,
  `faculty_id` int(50) DEFAULT NULL,
  PRIMARY KEY (`course_id`),
  KEY `FKF` (`faculty_id`),
  CONSTRAINT `FKF` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`faculty_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for ecc
-- ----------------------------
DROP TABLE IF EXISTS `ecc`;
CREATE TABLE `ecc` (
  `ecc_id` int(50) NOT NULL,
  `eccFrist_name` varchar(100) DEFAULT NULL,
  `eccLast_name` varchar(100) DEFAULT NULL,
  `faculty` varchar(100) DEFAULT NULL,
  `ecc_joindate` date NOT NULL,
  `user_id` int(50) DEFAULT NULL,
  PRIMARY KEY (`ecc_id`),
  KEY `FKU` (`user_id`),
  CONSTRAINT `FKU` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for ecm
-- ----------------------------
DROP TABLE IF EXISTS `ecm`;
CREATE TABLE `ecm` (
  `ecm_id` int(50) NOT NULL,
  `ecmFirst_name` varchar(100) DEFAULT NULL,
  `ecmLast_name` varchar(100) DEFAULT NULL,
  `ecm_joindate` date NOT NULL,
  `user_id` int(50) DEFAULT NULL,
  PRIMARY KEY (`ecm_id`),
  KEY `FKU2` (`user_id`),
  CONSTRAINT `FKU2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for evidence
-- ----------------------------
DROP TABLE IF EXISTS `evidence`;
CREATE TABLE `evidence` (
  `claim_id` int(50) NOT NULL,
  `evi_type_id` int(50) NOT NULL,
  PRIMARY KEY (`claim_id`,`evi_type_id`),
  KEY `FKEV9` (`evi_type_id`),
  CONSTRAINT `FKCL7` FOREIGN KEY (`claim_id`) REFERENCES `claim` (`claim_id`),
  CONSTRAINT `FKEV9` FOREIGN KEY (`evi_type_id`) REFERENCES `evidence_type` (`evi_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for evidence_type
-- ----------------------------
DROP TABLE IF EXISTS `evidence_type`;
CREATE TABLE `evidence_type` (
  `evi_type_id` int(50) NOT NULL DEFAULT '0',
  `evi_type_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`evi_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for faculty
-- ----------------------------
DROP TABLE IF EXISTS `faculty`;
CREATE TABLE `faculty` (
  `faculty_id` int(50) NOT NULL AUTO_INCREMENT,
  `faculty_name` varchar(100) DEFAULT NULL,
  `faculty_estb_date` date NOT NULL,
  `ecc_id` int(50) DEFAULT NULL,
  PRIMARY KEY (`faculty_id`),
  KEY `FKE` (`ecc_id`),
  CONSTRAINT `FKE` FOREIGN KEY (`ecc_id`) REFERENCES `ecc` (`ecc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `stu_id` int(50) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `course_id` int(50) DEFAULT NULL,
  PRIMARY KEY (`stu_id`),
  KEY `FKC12` (`course_id`),
  CONSTRAINT `FKC12` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for subject
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject` (
  `sub_id` int(50) NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(100) DEFAULT NULL,
  `course_id` int(50) DEFAULT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `FKC` (`course_id`),
  CONSTRAINT `FKC` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(50) NOT NULL DEFAULT '0',
  `user_name` varchar(100) NOT NULL,
  `user_type` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records 
-- ----------------------------
