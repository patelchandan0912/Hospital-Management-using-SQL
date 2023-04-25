/*
	Instructions: Build SQL Queries for each SCREEN designed in your Balsamiq project.
	You must include one or more SELECT, INSERT, UPDATE, or DELETE queries where appropriate in your design.
	These queries will be re-executed/verified in your Physical Design restored from your .bak file. 


	Student Name: Chandan Patel	
	Date: 10/28/2022
	Assignment: Assignment 1
	Description of Assignment: Creating Hospital Database (Logical Design, ERD, database,Queries -INSERT, SELECT,UPDATE, DELETE according to hospital website wireframe)

*/
-- SCREEN 1 SQL Queries
-- HOME Page (Only URL Link is there-- click the link in the pdf for respective button)

-- SCREEN 2 SQL Queries
-- Administration Page (Only URL Link is there-- click the link in the pdf for respective button)

-- SCREEN 3 (Administartion - Department-  SQL Queries (click the link in the pdf for respective button)
-- 3.1 Create Department Details: Example (Execute the below code- Department Table gets the new entry)- All below mentioned codes can be directly executed for testing as it is not inserted in the database
USE [TAMPA_HOSPITAL]
GO

INSERT INTO [dbo].[department]
           ([department_name]
           ,[office_number]
           ,[telephone])
     VALUES
  
('Cardiac Department (CAD)','813-278-3492','813-278-3943')

GO
-- 3.2 Create Nurse Details - Example (Execute the below code- Nurse Table gets the new entry)
USE [TAMPA_HOSPITAL]
GO

INSERT INTO [dbo].[nurse]
           ([nurse_number]
           ,[nurse_f_name]
           ,[nurse_m_name]
           ,[nurse_l_name]
           ,[certification]
           ,[year_hired]
           ,[department_number]
           ,[nurse_supervised_by])
     VALUES
           (113,'Babita','','Kumari','LPH',2013,106,109)
GO

-- 3.3 Create Doctor Details - Example (Execute the below code- Doctor Table gets the new entry)
USE [TAMPA_HOSPITAL]
GO

INSERT INTO [dbo].[doctor]
           ([doctor_number]
           ,[doctor_f_name]
           ,[doctor_m_name]
           ,[doctor_l_name]
           ,[office_number]
           ,[telephone]
           ,[department_number]
           ,[doctor_backs_by])
     VALUES
     (208,'Clinton','','Daniel','813-278-4884','813-278-3900',104,203)

GO

-- SCREEN 4  (Administartion - Operation Details- (click the link in the pdf for respective button))-  SQL Queries 
-- 4.1 Create Operation Details - Example (Execute the below code- Operation Table gets the new entry)
USE [TAMPA_HOSPITAL]
GO

INSERT INTO [dbo].[operation]
           ([patient_number]
           ,[doctor_number]
           ,[DRG_code]
           ,[date_of_operation]
           ,[start_time]
           ,[end_time]
           ,[operating_room_number])
     VALUES
         (121,206,340,'2022-03-01','18.01','23.42',8)
GO
-- 4.2 Create Operation Type Details - Example (Execute the below code- Operation Type Table gets the new entry)

USE [TAMPA_HOSPITAL]
GO

INSERT INTO [dbo].[operation_type]
           ([DRG_code]
           ,[operation_name]
           ,[duration]
           ,[cost])
     VALUES
          (600,'Appendectomy Internal','16.23','60000')
GO

-- SCREEN 5  (Administartion - Claim and Insurance Details - (click the link in the pdf for respective button))-  SQL Queries
--5.1 Create Claim Details - Example (Execute the below code- Claim Table gets the new entry)

USE [TAMPA_HOSPITAL]
GO

INSERT INTO [dbo].[claim]
           ([company_id]
           ,[patient_number]
           ,[diagnosis]
           ,[amount_claim]
           ,[amount_cleared])
     VALUES
(103,120,'APPENDECTOMY WITH COMPLICATED PRINCIPAL DIAGNOSIS WITH MCC','60000','5042.11')

GO

--5.2 Create Insurance Company Details - Example (Execute the below code- Insurance Company Table gets the new entry)

USE [TAMPA_HOSPITAL]
GO

INSERT INTO [dbo].[insurance_company]
           ([company_name]
           ,[telephone]
           ,[street_address]
           ,[city_address]
           ,[state_address]
           ,[zipcode])
     VALUES
         
 ('Universal Insurance Company','813-578-3880','1400 NW 33rd St Ste','Doral','FL','33120')
 

GO
-- Scree 6 for UPDATE and DELETE PROFILE of existing customers (click the link in the pdf for respective button)
    --6.1 Update doctor's office phone number : Example (Execute the below code- Doctor office number gets updated in Doctor Table)

UPDATE doctor set office_number = '813-278-5555' where doctor_number= 207 and doctor_f_name = 'James' and doctor_l_name = 'Watt' and office_number = '813-278-2384'

    -- 6.2 DELETE nurse profile by providing nurse details: Example (Execute the below code- Nurse number 107 profile gets deleted from the nurse table) 

DELETE from nurse where nurse_number = 107 and nurse_f_name = 'Mitchelle' and nurse_l_name = 'James'

    -- 6.3 DELETE nurse profile by providing doctor details: Example (Execute the below code- Doctor number 203 profile gets deleted from the doctor table) 
DELETE from doctor  where doctor_number = 203 and doctor_f_name = 'Julia' and doctor_l_name = 'Robert'

-- SCREEN 7  (Patient Details)  (click the link in the pdf for respective button)-  SQL Queries
--7.1 Create Patient Details - Example (Execute the below code- Patient Table gets the new entry)
USE [TAMPA_HOSPITAL]
GO

INSERT INTO [dbo].[patient]
           ([patient_f_name]
           ,[patient_m_name]
           ,[patient_l_name]
           ,[age]
           ,[apartment_address]
           ,[street_address]
           ,[city_address]
           ,[state_address]
           ,[zipcode])
     VALUES
        ('Manisha','','Singh',50,'110','8401 NW 33rd St Ste 410','Doral','FL','33142')

GO

-- SCREEN 8  (Department) (click the link in the pdf for respective button)-  SQL Queries
--8.1 Enter Department number - Example for department number 109(Execute the below code- Gives details of like department name, office number, telephone, doctor number, doctor name, telephone of doctor, office no. of doctor, doctor backs by,nurse name, nurse number, certification, year hired, nurse supervisor)
-- department wise details 

select a.department_name,a.office_number,a.telephone as department_telephone,b.doctor_number, b.doctor_f_name, b.doctor_m_name, b.doctor_l_name,
b.telephone as doctor_telephone, b.office_number as doctor_office_number, b.doctor_backs_by, c.nurse_number, c.nurse_f_name, c.nurse_m_name, c.nurse_l_name, c.certification, c.year_hired, c.nurse_supervised_by
from department a left join doctor b on a.department_number = b.department_number 
left join nurse  c on a.department_number = c.department_number
where a.department_number = 109

-- 8.2 Get the nurse details by entering nurse number (Example for nurse number 107(Execute the below code)

select * from dbo.nurse where nurse_number = 107

-- 8.3 Get the doctor details (including degree table main content) by entering doctor number (Example for doctor number 203 (Execute the below code)

select a.doctor_f_name, a.doctor_l_name,a.department_number,a.doctor_number,b.degree_type,b.major,b.university,b.years_of_passing from doctor a 
inner join degree b on a.doctor_number = b.doctor_number where a.doctor_number  = 203

-- SCREEN 9  (Operations/Diagnosis) (click the link in the pdf for respective button)-  SQL Queries
--9.1 SELECT operation performed by doctors details- Example for doctor number = 203 (Execute the below code)

select * from doctor inner join operation on doctor.doctor_number = operation.doctor_number
inner join operation_type on operation.DRG_code = operation_type.DRG_code
where doctor.doctor_number = 203

-- 9.2 To get operated patient details by patient_number - Example for patient number = 114 (Execute the below code)

select * from patient left join operation on patient.patient_number = operation.patient_number left join operation_type on operation.DRG_code = operation_type.DRG_code
where patient.patient_number = 114

-- SCREEN 10 (Claims) (click the link in the pdf for respective button)-  SQL Queries
-- 10.1 To get claim details by searching claim number 
select a.claim_number,a.patient_number,a.diagnosis,a.amount_claim,a.amount_cleared,b.company_name,b.telephone as company_contact from claim a 
LEFT join insurance_company b on a.company_id = b.company_id where a.claim_number = 25

-- 10.2 To get claim and patient details by searching patient number 
select * from claim a LEFT join insurance_company b on a.company_id = b.company_id where a.patient_number = 116





















