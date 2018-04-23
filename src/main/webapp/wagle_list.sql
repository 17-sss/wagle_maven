-- 이메일 컬럼/이벤트 컬럼 추가했으니 다시 만들어주세요 ! !
-- wreadcount(조회수) 추가했으니 다시 만들어주세요 ! !
CREATE TABLE wagle_list (
  wboardid INT not null,
  wname VARCHAR2(100),
  whost VARCHAR2(50),
  whostemail VARCHAR2(200),
  wagler VARCHAR2(50),
  wagleremail VARCHAR2(200),
  wmax INT,
  wprofile VARCHAR2(3000),
  wintro VARCHAR2(3000),
  wcategory VARCHAR2(100),
  wloc VARCHAR2(100),
  wstart VARCHAR2(100),
  wend VARCHAR2(100),
  wevent1 VARCHAR2(100),
  wevent2 VARCHAR2(100),
  weventdate1 VARCHAR2(100),
  weventdate2 VARCHAR2(100),
  wreadcount int default 0,
  filename VARCHAR2(100),
  filesize INT
);

CREATE SEQUENCE wagle_wagleser
  START WITH 1
  INCREMENT BY 1
  NOMAXVALUE ;

DROP SEQUENCE wagle_wagleser;

TRUNCATE TABLE wagle_list;
DROP TABLE wagle_list;
select * from wagle_list where (wagler IS NULL) AND (ROWNUM BETWEEN 0 AND 5) order by wboardid desc;
select * from wagle_list order by wboardid desc;

COMMIT;