-- Create the Roles table
CREATE TABLE dbo.Roles (
	ID INT IDENTITY(1,1) NOT NULL,
	Description NVARCHAR(50) NOT NULL,
CONSTRAINT pk_roles_id PRIMARY KEY (ID)
)

CREATE TABLE dbo.Staff (
	ID INT IDENTITY (1,1) NOT NULL,
	First_Name NVARCHAR(50) NOT NULL,
	Last_Name NVARCHAR(50) NOT NULL,
	Role_ID INT NOT NULL,
CONSTRAINT pk_staff_id PRIMARY KEY (ID),
CONSTRAINT fk_staff_role_id FOREIGN KEY (Role_ID) REFERENCES dbo.Roles (ID)
)

CREATE TABLE dbo.Station_Types (
	ID INT IDENTITY(1,1) NOT NULL,
	Description NVARCHAR(50) NOT NULL,
CONSTRAINT pk_station_types_id PRIMARY KEY (ID)
)

CREATE TABLE dbo.Stations (
	ID INT IDENTITY(1,1) NOT NULL,
	Station_Name NVARCHAR(50) NOT NULL,
	Description NVARCHAR(50) NOT NULL,
	Station_Type_ID INT NOT NULL,
CONSTRAINT pk_stations_id PRIMARY KEY (ID),
CONSTRAINT fk_stations_station_type_id FOREIGN KEY (Station_Type_ID) REFERENCES dbo.Station_Types (ID)
)

CREATE TABLE dbo.Defect_Category (
	ID INT IDENTITY(1,1) NOT NULL,
	Description NVARCHAR(50) NOT NULL,
CONSTRAINT pk_defect_category_id PRIMARY KEY (ID)
)

CREATE TABLE dbo.Defect_Reason (
	ID INT IDENTITY(1,1) NOT NULL,
	Description NVARCHAR(50) NOT NULL,
	Category_ID INT NOT NULL,
CONSTRAINT pk_defect_reason PRIMARY KEY (ID),
CONSTRAINT fk_defect_reason_category_id FOREIGN KEY (Category_ID) REFERENCES dbo.Defect_Category (ID)
)

CREATE TABLE dbo.Production_Defect_Tracking (
	Operator_ID INT NOT NULL,
	Station_ID INT NOT NULL,
	Defect_Category_ID INT NOT NULL,
	Defect_Reason_ID INT NOT NULL,
	Operator_Comments NVARCHAR(50) NOT NULL,
	Repairman_ID INT NOT NULL,
	Repair_Station_ID INT NOT NULL,
	Repair_Notes NVARCHAR(50) NOT NULL,
	Supervisor_ID INT NOT NULL,
	Supervisor_Notes NVARCHAR(50) NOT NULL,
	Root_Cause NVARCHAR(50) NOT NULL,
	Time DATETIME NOT NULL,
CONSTRAINT fk_production_defect_tracking_operator_id FOREIGN KEY (Operator_ID) REFERENCES dbo.Station_Types (ID),
CONSTRAINT fk_production_defect_tracking_repairman_id FOREIGN KEY (Repairman_ID) REFERENCES dbo.Station_Types (ID),
CONSTRAINT fk_production_defect_tracking_supervisor_id FOREIGN KEY (Supervisor_ID) REFERENCES dbo.Station_Types (ID),
CONSTRAINT fk_production_defect_tracking_station_id FOREIGN KEY (Station_ID) REFERENCES dbo.Stations (ID),
CONSTRAINT fk_production_defect_tracking_repair_station_id FOREIGN KEY (Repair_Station_ID) REFERENCES dbo.Stations (ID),
CONSTRAINT fk_production_defect_tracking_defect_category_id FOREIGN KEY (Defect_Category_ID) REFERENCES dbo.Defect_Category (ID),
CONSTRAINT fk_production_defect_tracking_defect_reason_id FOREIGN KEY (Defect_Reason_ID) REFERENCES dbo.Defect_Reason (ID),
)
