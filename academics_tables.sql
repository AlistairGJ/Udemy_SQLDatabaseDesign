create table DEPARTMENT
(
    DEPTNUM	integer		not null,
    DESCRIP	char(10),
    INSTNAME	char(80),
    DEPTNAME	char(80),
    STATE	char(4),
    POSTCODE	integer,
	primary key (DEPTNUM)
);


create table ACADEMIC
(
    ACNUM	integer		not null,
    DEPTNUM	integer		not null,
    FAMNAME	char(20),
    GIVENAME	char(20),
    INITIALS	char(10),
    TITLE	char(10),
	primary key (ACNUM),
	foreign key (DEPTNUM) references DEPARTMENT
);


create table PAPER
(
    PANUM	integer		not null,
    TITLE	char(100),
	primary key (PANUM)
);


create table AUTHOR
(
    PANUM	integer		not null,
    ACNUM	integer		not null,
	foreign key (PANUM) references PAPER,
	foreign key (ACNUM) references ACADEMIC,
	primary key (PANUM, ACNUM)
);


create table FIELD
(
    FIELDNUM	integer		not null,
    ID		char(10)	not null,
    TITLE	char(80),
	primary key (FIELDNUM)
);


create table INTEREST
(
    FIELDNUM	integer		not null,
    ACNUM	integer		not null,
    DESCRIP	char(80),
	foreign key (FIELDNUM) references FIELD,
	foreign key (ACNUM) references ACADEMIC,
	primary key (FIELDNUM, ACNUM)
);