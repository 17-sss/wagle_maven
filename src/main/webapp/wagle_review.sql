-- boardid varchar를 늘렸으니까 다시 만들어주세요 ! ! 
create table reviewboard(
    num INT NOT NULL PRIMARY KEY,
    boardid varchar(5) default '1',  
    writer varchar(30) not null,
    content varchar(3000) not null
);

CREATE SEQUENCE wagle_reviewser
  START WITH 1
  INCREMENT BY 1
  NOMAXVALUE ;
  
select * from reviewboard;
DROP table reviewboard;