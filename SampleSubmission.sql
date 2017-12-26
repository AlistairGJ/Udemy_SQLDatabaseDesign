DROP TABLE IF EXISTS Project;
DROP TABLE IF EXISTS Sample;
DROP TABLE IF EXISTS TCU;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Submission;
DROP TABLE IF EXISTS Analysis;
DROP TABLE IF EXISTS AnalysisResult;
DROP TABLE IF EXISTS RequiredAnalysis;
DROP TABLE IF EXISTS ProjectLead;

CREATE TABLE Project(
	ProjectID					INTEGER,
    	PRIMARY KEY (ProjectID)
);

-- How to do drop-downs? (for building and room - dependent dropdowns?)
-- How to add units? (temperature...)
-- If want drop-downs for Building / Room, will need more relations to fill these feilds
-- For units, must state this as an assumption (and use same throughout the DB) or add to name of attribute
CREATE TABLE TCU(
	TCU_ID						INTEGER,
    Building					VARCHAR(20),
   	Room						VARCHAR(20),
   	Temperature_celcius			NUMERIC, 
   	PRIMARY KEY (TCU_ID)
);

CREATE TABLE Department(
	DepartmentID				VARCHAR(5),
   	DepartmentName				VARCHAR(30),
   	PRIMARY KEY (DepartmentID)
);

CREATE TABLE Sample(
	SampleID					SERIAL,
    LotNumber					VARCHAR(80),
   	ExperimentNumber			VARCHAR(80),
   	BatchNumber					VARCHAR(80),
   	ProcessStep					VARCHAR(80),
   	ProjectID					INTEGER,
   	TCU_ID						INTEGER,
   	DepartmentID				CHAR(3),
   	PRIMARY KEY (SampleID),
   	FOREIGN KEY (ProjectID) REFERENCES Project (ProjectID),
   	FOREIGN KEY (TCU_ID) REFERENCES TCU (TCU_ID),
    	FOREIGN KEY (DepartmentID) REFERENCES Department (DepartmentID)
);




CREATE TABLE Employee(
	EmployeeID					VARCHAR(7),
   	FirstName					VARCHAR(80),
   	LastName					VARCHAR(80),
   	Email						VARCHAR(254), 
   	ManagerID					VARCHAR(7),
   	DepartmentID				VARCHAR(5),
    PRIMARY KEY (EmployeeID),
   	FOREIGN KEY (ManagerID) REFERENCES Employee,
   	FOREIGN KEY (DepartmentID) REFERENCES Department
);

-- Function for determining overdue status?
-- Only specify date format when printing
-- OVERDUE function / query - not something that is stored. If stored - everyday would have to run and update DB

CREATE TABLE Submission(
   	SubmissionID				SERIAL,
  	NumberOfVials				INTEGER,
  	DateSubmitted				DATE,
    DueDate						DATE,
    Volume_microLitre			NUMERIC,
    UserComment					VARCHAR(1024),
   	ProteinConc_mgPerL			NUMERIC,
    EmployeeID					VARCHAR(7),
    SampleID					INTEGER, 
    PRIMARY KEY (SubmissionID),
   	FOREIGN KEY (EmployeeID) REFERENCES Employee,
    FOREIGN KEY (SampleID) REFERENCES Sample    
);

CREATE TABLE Analysis(
    AnalysisID					VARCHAR(40),
   	Description					VARCHAR(1024),
    ResultUnits					VARCHAR(255),  
    PRIMARY KEY (AnalysisID)
);

-- Function for TAT, part of a query
CREATE TABLE AnalysisResult(
	AnalysisID					VARCHAR(40),
   	SubmissionID				INTEGER,
   	ResultValue					NUMERIC,
   	PRIMARY KEY (AnalysisID, SubmissionID),
   	FOREIGN KEY (AnalysisID) REFERENCES Analysis, 
    FOREIGN KEY (SubmissionID) REFERENCES Submission
);

CREATE TABLE RequiredAnalysis(
	SampleID					INTEGER,
   	AnalysisID					VARCHAR(40),
   	PRIMARY KEY (SampleID, AnalysisID),
   	FOREIGN KEY (SampleID) REFERENCES Sample,
   	FOREIGN KEY (AnalysisID) REFERENCES Analysis   
);

CREATE TABLE ProjectLead(
	ProjectID					INTEGER,
   	EmployeeID					VARCHAR(40),
   	PRIMARY KEY (ProjectID, EmployeeID),
   	FOREIGN KEY (ProjectID) REFERENCES Project,
   	FOREIGN KEY (EmployeeID) REFERENCES Employee   
);













