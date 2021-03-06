CREATE TABLE `TB_BANK` (
  `institute_code` varchar(16) COLLATE utf8mb4_general_ci NOT NULL,
  `institute_name` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  `reg_dtime` datetime DEFAULT CURRENT_TIMESTAMP,
  `upd_dtime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`institute_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci

CREATE TABLE `TB_BANK_HISTORY` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `bank_code` varchar(16) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `reg_dtime` datetime DEFAULT CURRENT_TIMESTAMP,
  `upd_dtime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `TB_BANK_HISTORY_TB_BANK_institute_code_fk` (`bank_code`),
  CONSTRAINT `TB_BANK_HISTORY_TB_BANK_institute_code_fk` FOREIGN KEY (`bank_code`) REFERENCES `tb_bank` (`institute_code`)
) ENGINE=InnoDB AUTO_INCREMENT=4159 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci

CREATE TABLE `TB_USER` (
  `user_id` varchar(32) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `reg_dtime` datetime DEFAULT CURRENT_TIMESTAMP,
  `upd_dtime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci