CREATE TABLE Emp  
(
	eid  Integer PRIMARY KEY,  
 	ename varchar2(255), 
 	age Integer,
 	salary Float
);

CREATE TABLE Works  
( 
	eid  Integer,  
 	did  Integer, 
 	pct_time Integer,
 	CONSTRAINT work_pk
		PRIMARY KEY (eid,did),
	CONSTRAINT work_fk1
		FOREIGN KEY (eid) REFERENCES Emp(eid) 
);

CREATE TABLE Dept
( 
        did  Integer PRIMARY KEY,               
        dname varchar2(255),
	budget Float,
	managerid Integer,
        CONSTRAINT dept_fk1
                FOREIGN KEY (managerid) REFERENCES Emp(eid)
);

ALTER TABLE Works add FOREIGN KEY (did) REFERENCES Dept(did);

