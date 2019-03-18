-- -------------------------------------------------------------------------- --
--  Projects
--  URLS
--  PATHS
--  FormatStrings
--  CMDS
--  Session
--  Roles
--  Requirements
--
--  OBJECTS:
--  -------
--  
-- -------------------------------------------------------------------------- --
DROP DATABASE IF EXISTS u; 

CREATE DATABASE u;  

USE u; 

-- -------------------------------------------------------------------------- --
--  
-- -------------------------------------------------------------------------- --
CREATE TABLE API
(
    id          	    BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	token_id			VARCHAR(32)	 CHARACTER SET ascii COLLATE ascii_bin NOT NULL UNIQUE,
	category			VARCHAR(64)	 CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
	created_on			DATE NOT NULL,
	version				VARCHAR(8)	 CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
	created_by_co			VARCHAR(64)	 CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
	created_by			VARCHAR(64)	 CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
	 sig				VARCHAR(255)	 CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
	description	VARCHAR(255)	 CHARACTER SET ascii COLLATE ascii_bin DEFAULT NULL,
	src_url		VARCHAR(255)	 CHARACTER SET ascii COLLATE ascii_bin DEFAULT NULL
	
)
ENGINE =INNODB;

INSERT INTO API(id, token_id, category,created_on, version, created_by_co, created_by, sig, src_url) VALUES 
(NULL, TO_BASE64(RANDOM_BYTES(64)),'Files', NOW(), '0.0.1','Cundiff Group, LLC', 'Claude E. Cundiff','bool create_file(File* f)','http://localhost/c/api/files'),
(NULL, TO_BASE64(RANDOM_BYTES(64)),'Files', NOW(), '0.0.1','Cundiff Group, LLC', 'Claude E. Cundiff','bool create_file(File* f)','http://localhost/c/api/files');

-- -------------------------------------------------------------------------- --
--  
-- -------------------------------------------------------------------------- --
CREATE TABLE Session
(
    id          	    BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	session_token		VARCHAR(255)	 CHARACTER SET ascii COLLATE ascii_bin NOT NULL UNIQUE,
    session_strt		DATETIME NOT NULL,
    session_end 		DATETIME DEFAULT NULL,
    curr_project		VARCHAR(64)	 CHARACTER SET ascii COLLATE ascii_bin DEFAULT NULL,
	curr_schema			VARCHAR(64)  CHARACTER SET ascii COLLATE ascii_bin DEFAULT NULL,
	curr_table			VARCHAR(64)  CHARACTER SET ascii COLLATE ascii_bin DEFAULT NULL
)
ENGINE =INNODB;

-- -------------------------------------------------------------------------- --
--  
-- -------------------------------------------------------------------------- --
CREATE TABLE CMDS
(
    id          	    BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
)
ENGINE =INNODB;

-- -------------------------------------------------------------------------- --
--  
-- -------------------------------------------------------------------------- --
CREATE TABLE Projects
(
    id          	    BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    hex_id              CHAR(64) NOT NULL UNIQUE,
    creation_time		DATETIME NOT NULL,
    modified_time		DATETIME NOT NULL,
	project_name		VARCHAR(64)	 CHARACTER SET ascii COLLATE ascii_bin NOT NULL UNIQUE,
    start_date			DATETIME NOT NULL,
    target_date			DATETIME NOT NULL
)
ENGINE =INNODB;



-- -------------------------------------------------------------------------- --
--  
-- -------------------------------------------------------------------------- --
CREATE TABLE Paths
(
    id          	    BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
)
ENGINE =INNODB;

-- -------------------------------------------------------------------------- --
--  
-- -------------------------------------------------------------------------- --
CREATE TABLE Loggers
(
    id          	    BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
)
ENGINE =INNODB;

-- -------------------------------------------------------------------------- --
--  
-- -------------------------------------------------------------------------- --
CREATE TABLE Objects
(
    id          	    BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
)
ENGINE =INNODB;

-- -------------------------------------------------------------------------- --
--  
-- -------------------------------------------------------------------------- --
CREATE TABLE Ops
(
    id          	    BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
)
ENGINE =INNODB;

-- -------------------------------------------------------------------------- --
--  
-- -------------------------------------------------------------------------- --
CREATE TABLE Libs
(
    id          	    BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	lib_name			VARCHAR(64)	 CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
	version				VARCHAR(64)	 CHARACTER SET ascii COLLATE ascii_bin DEFAULT NULL,
	url					VARCHAR(255)	 CHARACTER SET ascii COLLATE ascii_bin DEFAULT NULL
)
ENGINE =INNODB; 

-- -------------------------------------------------------------------------- --
--  do_curl_post(), encode_base64(), decode_base64(), do_hash(), send_ajax_headers()
-- -------------------------------------------------------------------------- --
CREATE TABLE resources
(
    id          	    BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    resource_type		VARCHAR(64)	 CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
	resource_name		VARCHAR(64)	 CHARACTER SET ascii COLLATE ascii_bin NOT NULL UNIQUE,
	location_as_path	VARCHAR(255)	 CHARACTER SET ascii COLLATE ascii_bin DEFAULT NULL,
	location_as_url		VARCHAR(255)	 CHARACTER SET ascii COLLATE ascii_bin DEFAULT NULL
    
)
ENGINE =INNODB;

-- -------------------------------------------------------------------------- --
--  
-- -------------------------------------------------------------------------- --
CREATE TABLE web_services
(
    id          	    BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    creation_time		DATETIME NOT NULL,
    modified_time		DATETIME NOT NULL
)
ENGINE =INNODB;

-- -------------------------------------------------------------------------- --
--  
-- -------------------------------------------------------------------------- --
CREATE TABLE SessionContext
(
    id          	    BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    creation_time		DATETIME NOT NULL,
    modified_time		DATETIME NOT NULL
)
ENGINE =INNODB;



