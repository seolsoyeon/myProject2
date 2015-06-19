DROP TABLE users;
/*
DROP TABLE review;
/*Review Test 용*/
DROP SEQUENCE seq_review_rev_no;
DROP TABLE show;
DROP TABLE musician;
DROP TABLE owner;
DROP TABLE reply;
DROP TABLE qna;
DROP SEQUENCE seq_show_show_no;
DROP SEQUENCE seq_qna_qna_no;
/*Comment Test용*/
DROP  SEQUENCE seq_reply_rp_no;
*/

CREATE TABLE users(
 user_id VARCHAR2(50) NOT NULL,
 password VARCHAR2(100) NOT NULL,
 phone VARCHAR2(30) NOT NULL,
 role CHAR(1) DEFAULT 'u',
 PRIMARY KEY(user_id)
);

/*
COMMENT ON TABLE users IS '회원';

INSERT INTO users( user_id, password, email, phone, role) VALUES ('user01','1111','user01@naver.com','010-1111-2222', 'u');

CREATE TABLE OWNER (
   user_id VARCHAR2(50) NOT NULL REFERENCES users(user_id),
   ownerTwitter_Id VARCHAR2(255),
   ownerFacebook_Id VARCHAR2(255),
   store_name VARCHAR2(50) NOT NULL,
   address_si VARCHAR2(255) NOT NULL,
   address_gu VARCHAR2(255) NOT NULL,
   address_dong VARCHAR2(255) NOT NULL,
   address_detail VARCHAR2(255) NOT NULL,
   telephone VARCHAR2(30) NOT NULL,
   admin_name VARCHAR2(50) NOT NULL
);

COMMENT ON TABLE OWNER IS '회원-사업주';

INSERT INTO users( user_id, password, email, phone, role) VALUES ('owner01','oooo','owner01@naver.com','010-1111-2222', 'o');
INSERT INTO users( user_id, password, email, phone, role) VALUES ('owner02','oooo','owner02@naver.com','010-1111-2222', 'o');
INSERT INTO users( user_id, password, email, phone, role) VALUES ('owner03','oooo','owner03@naver.com','010-1111-2222', 'o');
INSERT INTO users( user_id, password, email, phone, role) VALUES ('owner04','oooo','owner04@naver.com','010-1111-2222', 'o');
INSERT INTO users( user_id, password, email, phone, role) VALUES ('owner05','oooo','owner05@naver.com','010-1111-2222', 'o');

INSERT INTO owner VALUES ('owner01', 'twitter.com/owner', 'facebook.com/owner', '비트캠프', '서울시', '서초구', '서초동', '1327-15', '1234567890', '김개똥');
INSERT INTO owner VALUES ('owner02', 'twitter.com/ddalrasha', 'facebook.com/ddalrasha', '분당', '성남시', '분당', '서현동', '84-4', '01093003840', '최개똥');
INSERT INTO owner VALUES ('owner03', 'twitter.com/owner3', 'facebook.com/owner3', '연희동', '서울시', '서대문구', '연희동', '194-40', '987654321', '이개똥');
INSERT INTO owner VALUES ('owner04', 'twitter.com/owner4', 'facebook.com/owner4', '다음카카오', '제주특별자치도 ', '제주시', '영평동', '2181', '1577-3321', '박개똥');
INSERT INTO owner VALUES ('owner05', 'twitter.com/ddalrasha', 'facebook.com/ddalrasha', '순천', '전라남도', '순천시', '조곡동', '둑실 5길 25', '01093003840', '김빵빵');

CREATE TABLE musician(
 user_id VARCHAR2(50) NOT NULL REFERENCES users(user_id),
 musician_name VARCHAR2(50) NOT NULL,       
 genre VARCHAR2(50) NOT NULL,
 musicianTwitter_id VARCHAR2(100),
 musicianFacebook_id VARCHAR2(100),
 career CLOB,
 content1 VARCHAR2(60),
 content2 VARCHAR2(60),
 content3 VARCHAR2(60),
 add_list CHAR(2) DEFAULT 'n',
 reg_date DATE,
 file_route VARCHAR2(50)
);

COMMENT ON TABLE MUSICIAN IS '회원-뮤지션';

//================Q & A==================================
CREATE TABLE qna(
 qna_no NUMBER NOT NULL,
 qna_userId VARCHAR2(50) NOT NULL REFERENCES users(user_id),
 qna_password VARCHAR2(10),
 qna_title VARCHAR2(30) NOT NULL,
 qna_content CLOB NOT NULL,
 qna_check VARCHAR2(1) DEFAULT 'N',
 qna_date DATE,
 PRIMARY KEY(qna_no)
);

CREATE SEQUENCE seq_qna_qna_no 	 	
INCREMENT BY 1 START WITH 1;

INSERT INTO QNA VALUES (seq_qna_qna_no.nextval,'user01', '1111','제목이다여기는', '여기는내용이구','N',sysdate);

//========후기게시판 test용===============================================
CREATE TABLE review(
rev_no 	NUMBER NOT NULL,
re_show_no NUMBER NOT NULL,	
re_showDate DATE,
re_cafeName VARCHAR2(100) NOT NULL,
user_id VARCHAR2(50) NOT NULL REFERENCES users(user_id),
re_content CLOB NOT NULL,
re_email VARCHAR2(40) NOT NULL,
re_count NUMBER DEFAULT 0 NOT NULL ,
file_route VARCHAR2(100),
re_reg_date DATE
);

CREATE SEQUENCE seq_review_rev_no	INCREMENT BY 1 START WITH 100;

INSERT INTO review(rev_no, re_show_no, re_showDate, re_cafeName,user_id, re_content,re_email,re_count, file_route, re_reg_date) VALUES(seq_review_rev_no.nextval, 100, '15/06/22', '비트캠프', 'owner01' ,'리뷰테스트1', 'owner01@naver.com', 0, '1.jpg, 2.jpg', SYSDATE);

commit;
 //==================================================================
 
 
 //========Reply test용===============================================
 CREATE TABLE reply(
rp_qnaNo 	NUMBER NOT NULL REFERENCES qna(qna_no),
rp_no 	NUMBER NOT NULL,
user_id VARCHAR2(50) NOT NULL REFERENCES users(user_id),
rp_content CLOB NOT NULL,
rp_reg_date DATE
);

CREATE SEQUENCE seq_reply_rp_no	INCREMENT BY 1 START WITH 1;

 
commit; 

 //=============================================================================
 
 CREATE TABLE show(
 show_no NUMBER NOT NULL,	
 owner_id VARCHAR2(50) NOT NULL,
 owner_storeName VARCHAR2(100) NOT NULL,
 musician_id VARCHAR2(50) NOT NULL,       
 show_time VARCHAR2(50) NOT NULL,
 seat INTEGER NOT NULL,
 ticket_price INTEGER NOT NULL,
 show_code CHAR(1) NOT NULL,
 upload VARCHAR2(400),
 PRIMARY KEY(show_no)
);
 
COMMENT ON TABLE SHOW IS '공연';

CREATE SEQUENCE seq_show_show_no	INCREMENT BY 1 START WITH 100;

INSERT INTO users( user_id, password, email, phone, role) VALUES ('musician01','mmmm','musician01@naver.com','010-1111-2222', 'm');
INSERT INTO users( user_id, password, email, phone, role) VALUES ('musician02','mmmm','musician02@naver.com','010-1111-2222', 'm');
INSERT INTO users( user_id, password, email, phone, role) VALUES ('musician03','mmmm','musician03@naver.com','010-1111-2222', 'm');
INSERT INTO users( user_id, password, email, phone, role) VALUES ('musician04','mmmm','musician04@naver.com','010-1111-2222', 'm');
INSERT INTO users( user_id, password, email, phone, role) VALUES ('musician05','mmmm','musician05@naver.com','010-1111-2222', 'm');
INSERT INTO users( user_id, password, email, phone, role) VALUES ('musician06','mmmm','musician06@naver.com','010-1111-2222', 'm');


INSERT INTO musician(user_id, musician_name, genre, musicianTwitter_id, musicianFacebook_id,career,content1,content2,content3, add_list) VALUES ('musician01', '지노밴드','Jazz','지노.twitter','지노.facebook','순천의아들','Vocal','Piano','Etc','n');
INSERT INTO musician(user_id, musician_name, genre, musicianTwitter_id, musicianFacebook_id,career,content1,content2,content3, add_list) VALUES ('musician02', '키노밴드','Jazz','키노.twitter','키노.facebook','순천의아들','Vocal','Violin','Etc','y');
INSERT INTO musician(user_id, musician_name, genre, musicianTwitter_id, musicianFacebook_id,career,content1,content2,content3, add_list) VALUES ('musician03', '티노밴드','Jazz','티노.twitter','티노.facebook','순천의아들','Vocal','Piano','Etc','n');
INSERT INTO musician(user_id, musician_name, genre, musicianTwitter_id, musicianFacebook_id,career,content1,content2,content3,add_list) VALUES ('musician04', '피노밴드','Jazz','피노.twitter','피노.facebook','순천의아들','Vocal','Piano','Cello','y');
INSERT INTO musician(user_id, musician_name, genre, musicianTwitter_id, musicianFacebook_id,career,content1,content2,content3, add_list) VALUES ('musician05', '기노밴드','Jazz','기노.twitter','기노.facebook','순천의아들','Vocal','Piano','Etc','y');
INSERT INTO musician(user_id, musician_name, genre, musicianTwitter_id, musicianFacebook_id,career,content1,content2,content3, add_list) VALUES ('musician06', '니노밴드','Jazz','니노.twitter','니노.facebook','순천의아들','Vocal','Piano','Cello','n');

INSERT INTO show(show_no, owner_id, owner_storeName, musician_id, show_time, seat, ticket_price, show_code, upload) VALUES (seq_show_show_no.nextval, 'owner01', '비트캠프', 'musician01','2015-06-22', 100, 9900,'Y','1.jpg,2.jpg');
INSERT INTO show(show_no, owner_id, owner_storeName, musician_id, show_time, seat, ticket_price, show_code, upload) VALUES (seq_show_show_no.nextval, 'owner02', '분당', 'musician02','2015-06-23', 1000, 19900,'Y','3.jpg,4.jpg');
INSERT INTO show(show_no, owner_id, owner_storeName, musician_id, show_time, seat, ticket_price, show_code, upload) VALUES (seq_show_show_no.nextval, 'owner03', '연희동', 'musician03','2015-06-24', 500, 2900,'Y','5.jpg,6.jpg');
INSERT INTO show(show_no, owner_id, owner_storeName, musician_id, show_time, seat, ticket_price, show_code, upload) VALUES (seq_show_show_no.nextval, 'owner04', '다음카카오', 'musician04','2015-06-25', 10, 7900,'Y','7.jpg,8.jpg');
INSERT INTO show(show_no, owner_id, owner_storeName, musician_id, show_time, seat, ticket_price, show_code, upload) VALUES (seq_show_show_no.nextval, 'owner05', '순천', 'musician05','2015-06-26', 60, 59900,'Y','9.jpg,10.jpg');
COMMIT;


//아래는 sql테스트용제작
// ==================================================================================================================

//1단계 ROWNUM 새기기
SELECT inner_table.* , ROWNUM AS row_seq
              FROM(SELECT user_id, musician_name, genre, musicianTwitter_id, musicianFacebook_id,career,content 
                    FROM musician) inner_table
            WHERE ROWNUM <= 6

//2단계 ROWNUM내에서 해당부분만뽑아내기
SELECT *
        FROM(SELECT inner_table.* , ROWNUM AS row_seq
              FROM(SELECT  musician_name
                    FROM musician) inner_table
            WHERE ROWNUM <= 10 )
      WHERE row_seq BETWEEN 1 AND 10
      
      
// ==================================================================================================================
// add_list 업데이트 하는부분

UPDATE musician
SET add_list = 'n'
WHERE user_id like 'musician%';

commit;


UPDATE musician
SET add_list = 'y'
WHERE user_id like 'musician02';

commit;
      
// ==================================================================================================================
// reg_date 업데이트 하는 부분
UPDATE musician
SET reg_date = SYSDATE
WHERE user_id = 'musician02';

commit;


UPDATE musician
SET reg_date =''
WHERE user_id like 'musician%';

commit;


SELECT user_id, musician_name, TO_CHAR(reg_date, 'YYYY/MM/DD HH:MI:SS') REGDATE, add_list
FROM musician
WHERE user_id like 'musician%'
ORDER BY REGDATE DESC;



// ==================================================================================================================
*/