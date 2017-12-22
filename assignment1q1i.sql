DROP TABLE Employee;
DROP TABLE Dept;
DROP TABLE Dependent;
DROP TABLE Project;

-- Define first, constrain at end
--Employee(_empNo_, givename, famname, gender, DOB)
CREATE TABLE Employee(
	empNo		INTEGER,
	givename	VARCHAR(80) NOT NULL,
	famname		VARCHAR(80) NOT NULL,
	gender		CHAR,
	DOB			DATE,
	PRIMARY KEY(empNo)
);

--Dept (_deptNo_, name, manager_empNo*)
CREATE TABLE Dept(
	deptNo			INTEGER,
	name			VARCHAR(40),
	manager_empNo	INTEGER,
    PRIMARY KEY(deptNo),
    FOREIGN KEY(manager_empNo) REFERENCES Employee(empNo)
);

--Dependent(_empNo*, name_, relationship)
CREATE TABLE Dependent(
	empNO			INTEGER,
	name			VARCHAR(80),
    PRIMARY KEY(empNo, name),
	relationship	VARCHAR(80),
    FOREIGN KEY(empNo) REFERENCES Employee(empNo)
);

--Project(_projNo_, description, deptNo*)
CREATE TABLE Project(
	projNo			INTEGER,
	description		VARCHAR(200),
	deptNo			INTEGER,
	PRIMARY KEY(projNo),
	FOREIGN KEY(deptNo) REFERENCES Dept
);