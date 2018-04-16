create table message (
        num     INT NOT NULL PRIMARY KEY,
        confirm VARCHAR(1) DEFAULT '1',
        userinfo varchar(30) not null,
        sendmessage varchar(3000),
        regdate DATE NOT NULL,
        userinfo2 varchar(30) not null
);
create table remessage (
        num     INT NOT NULL PRIMARY KEY,
        confirm VARCHAR(1) DEFAULT '1',
        userinfo varchar(30) not null,
        receivemessage varchar(3000),
        regdate DATE NOT NULL,
        userinfo2 varchar(30) not null
);

SELECT * FROM message;
SELECT * FROM remessage;