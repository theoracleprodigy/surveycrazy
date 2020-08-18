CREATE TABLE users(
	user_id			int not null auto_increment,
	user_email		varchar(255) null,
	user_password	varchar(50) null,
	user_type_id	int not null,
	confirm_number	char(6) null,
	user_confirmed	int null,
	created			datetime null,
	last_used		datetime null,
CONSTRAINT pk_users_id PRIMARY KEY (user_id)
);

CREATE TABLE user_type(
	user_type_id	int not null auto_increment,
	user_type	varchar(255) not null,
	user_desc	varchar(255) not null,
CONSTRAINT pk_users_type PRIMARY KEY (user_type_id)
);

CREATE TABLE user_demographics (
    user_demographics_id int not null auto_increment,
    user_id             int not null,
	address1			varchar(100) null,
	address2			varchar(100) null,
	city				varchar(50) null,
	state				varchar(50) null,
	zip					int	null,
 	user_company        varchar(255) null,
	user_industry       varchar(255) null,
	user_website        varchar(255) null,
	user_phone1         numeric(10) null,
	user_phoneType1     varchar(50) null,
	user_phone2         numeric(10) null,
	user_phoneType2     varchar(50) null,
CONSTRAINT pk_demographics_id PRIMARY KEY (user_demographics_id)
);


CREATE TABLE survey(
	survey_id				int NOT FOR auto_increment,
	user_id					int not null,
	survey_title			varchar(255) NULL,
	survey_description		mediumtext NULL,
	survey_active			bit default 0,
	survey_date				datetime NULL,
	survey_begining_text 	text NULL ,
	survey_end_text 		text NULL ,
	survey_look_id 			int NULL ,
	survey_end_date 		datetime NULL 	
CONSTRAINT PK_survey PRIMARY KEY (survey_id)
)
GO


CREATE TABLE survey_look (
	survey_look_id 		int NOT NULL auto_increment,
	survey_css			varchar (255) NOT NULL ,
	survey_title 		varchar (255) NULL ,
	survey_desc			varchar (1000) NULL,
CONSTRAINT PK_survey_look PRIMARY KEY (survey_look_id)
)
GO

CREATE TABLE survey_questions(
	survey_questions_id		int NOT NULL auto_increment,
	survey_id				int not null,
	survey_type_id			int null,
	survey_allow_text		bit default 0,
	survey_question_order	int null,
	survey_question			mediumtext null,
	survey_text_question	mediumtext null,
CONSTRAINT PK_survey_questions PRIMARY KEY (survey_questions_id)
)

CREATE TABLE survey_option_values(
	survey_option_values_id		int NOT NULL auto_increment,
	survey_questions_id			int NOT NULL,
	survey_values_disp			varchar(100) NOT NULL,
	survey_values_value			varchar(100) NOT NULL,
	survey_option_order			int null,
CONSTRAINT PK_survey_option_values PRIMARY KEY (survey_option_values_id)
)


CREATE TABLE survey_results(
	survey_results_id			int NOT NULL auto_increment,
	survey_cusotmer_id			varchar(18) NOT NULL,
	survey_option_values_id		int NULL,
	survey_value				varchar(100) NULL,
	survey_textarea				mediumtext NULL,
	survey_ip					char(15) NULL,
	survey_question_id			int NOT NULL,
CONSTRAINT PK_survey_results PRIMARY KEY (survey_results_id)	
)


CREATE TABLE language_element (
	language_element_id	int NOT NULL AUTO_INCREMENT,
	common_element		varchar(25) NULL,
	page_id				varchar(25) NULL,
	section_id			varchar(25) NULL,
CONSTRAINT PK_language_element PRIMARY KEY (language_element_id)
);

CREATE TABLE language_text (
	language_text_id	int NOT NULL AUTO_INCREMENT,
	language_element_id	int NOT NULL,
	language_id			int NOT NULL, /* ENG, SPANISH, */
	language_text		mediumtext NOT NULL,
CONSTRAINT PK_languageText PRIMARY KEY (language_text_id)
);

CREATE TABLE language (
	language_id		int NOT NULL AUTO_INCREMENT,
	language_desc	varchar(25) NOT NULL,
CONSTRAINT PK_languages PRIMARY KEY (language_id)
);

INSERT INTO Language (language_desc) VALUES ('English');
INSERT INTO Language (language_desc) VALUES ('Chineese (Taiwan)');

/* add foreign keys.  */
ALTER TABLE survey_questions ADD CONSTRAINT FK_survey_questions FOREIGN KEY (survey_id) REFERENCES survey (survey_id) ON DELETE CASCADE;
ALTER TABLE survey_option_values ADD CONSTRAINT FK_survey_option_values FOREIGN KEY (survey_questions_id) REFERENCES survey_questions (survey_questions_id) ON DELETE CASCADE;
ALTER TABLE survey_results ADD CONSTRAINT FK_survey_results FOREIGN KEY (survey_questions_id) REFERENCES survey_questions (survey_questions_id) ON DELETE CASCADE;
ALTER TABLE user_demographics ADD CONSTRAINT FK_userDemographics FOREIGN KEY (user_id) REFERENCES users (user_id) ON DELETE CASCADE;
ALTER TABLE survey ADD CONSTRAINT FK_users FOREIGN KEY (user_id) REFERENCES users (user_id) ON DELETE CASCADE; 

ALTER TABLE language_text ADD CONSTRAINT FK_lanugage_text_language FOREIGN KEY (language_id) REFERENCES language (language_id);
ALTER TABLE language_text ADD CONSTRAINT FK_language_text_element FOREIGN KEY (language_element_id) REFERENCES language_element (language_element_id)  ON DELETE CASCADE;