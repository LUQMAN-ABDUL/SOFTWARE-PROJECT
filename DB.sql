
-- CREATE TABLE students_info (
--     student_id SERIAL PRIMARY KEY,
--     first_name VARCHAR(50),
--     last_name VARCHAR(50),
--     email VARCHAR(100),
--     phone_number VARCHAR(15),
--     address TEXT,
--     date_of_birth DATE
-- );

-- INSERT INTO students_info (student_id,first_name, last_name, email, phone_number, address, date_of_birth)
-- VALUES
-- (11004272,'Ishaan', 'Bhardwaj', 'ishbhardwaj@st.ug.edu.gh', '0553072737', '123 Main St', '2000-01-01'),
-- (11010910,'Samia', 'Soleimani', 'samiasolei@st.ug.edu.gh', '0551068786', '719 Elm St', '2003-05-02'),
-- (11275876,'Prince', 'Nyayun', 'pnyayun@st.ug.edu.gh', '0257629963', '215 Quarshie St', '1999-02-08'),
-- (10979385,'Luqman', 'Abdulmumin', 'labdulmumin@st.ug.edu.gh', '02777450374', '238 Alafia St', '2000-05-06'),
-- (11012330,'Arthur', 'Ebenezer', 'artheben@st.ug.edu.gh', '0246833694', '543 Ogbona St', '2000-08-02'),
-- (11049492,'Asare', 'Marvin', 'asaremav@st.ug.edu.gh', '0556833694', '321 Baboon St', '2001-04-05'),
-- (11018690,'Oblie', 'Pius', 'obliepius@st.ug.edu.gh', '0541759050', '654 Osa St', '2002-07-02'),
-- (11021544,'Iddrisu', 'Tahiru', 'iddrisutahiru@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11012343,'Kumi', 'Kelvin', 'kumikelvin@st.ug.edu.gh', '0265996633', '224 Wasabanga St', '2003-09-11'),
-- (11014727,'Annan Chioma', 'Praise', 'annanchioma@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11014977,'Mohammed Salihu', 'Hamisu', 'mohasalihu@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11015506,'Daniel Agyin', 'Manford', 'daagyin@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11023595,'Nyavor Cyril', 'Etornam', 'nyacyrili@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11025159,'David Kweku', 'Ntow', 'dakweku@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11038081,'Agyepong', 'Kwasi', 'agyekwasi@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11049523,'Peggy Esinam', 'Somuah', 'peesinam@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11053386,'Amonsah', 'Samuel', 'amonsam@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11105235,'Andrews Kwarteng', 'Twum', 'andkwat@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11112276,'Fiavor Isaac', 'Sedem', 'fiaisaac@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11116537,'Yakubu Tanko', 'Mohammed', 'yakutanko@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11116737,'Eririe', 'Jefferey', 'eririejefi@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11116804,'Kafui Kwame', 'Kemeh', 'kafuikemeh@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11117318,'Nyarko Steven', 'Abrokwah', 'nyarkosteven@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11117536,'Muhammed Nurul Haqq', 'Munagah', 'muhanuru@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11123762,'Bernadine Adusei', 'Okrah', 'bernaddineokrah@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11139245,'Maame Efua', 'Ayisi', 'maameefua@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11139828,'Ansiogya Philemon', 'Kwabena', 'ansiphilemon@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11164744,'Antwi Samuel', 'Anafi', 'kkofi@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11170350,'Nkansah Boadu', 'Tabi', 'nkansahtabi@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11172376,'Wenide Isaac', 'Atta', 'weniataa@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11208328,'John Tenkorang', 'Anim', 'johnanim@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11209640,'Abubakar', 'Latifa', 'abulatifah@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11213307,'Attu Samuel', 'Idana', 'attusamuel@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11218951,'Adorboe Prince', 'Philips', 'adorboeprince@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11238291,'Ninson', 'Obed', 'ninsonobed@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11246366,'Anewah', 'Vincent', 'anewahvincent@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11252855,'Quansah', 'Jeffery', 'quansahjeff@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11252857,'Nuku Tagbor', 'Joshua', 'nukujosh@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11253931,'Desmond Afelete', 'Kamasah', 'desafelete@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11254079,'Fordjour Edward', 'John', 'fordjouredward@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11254301,'Kudiabor', 'Jonathan', 'kujonathan@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11254405,'Abena Nhyira', 'Nsaako', 'abenansaako@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11262592,'Dedoo Donatus', 'Dodzi', 'dedoododzi@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11264010,'Ayertey Vanessa', 'Esinam', 'ayerteyvanessa@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11285635,'David Tetteh', 'Ankrah', 'davidtetteh@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11292620,'Sena', 'Anyomi', 'senaanyomi@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11293871,'Amponsah Jonathan', 'Boadu', 'joboadu@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11296641,'Asare Baffour', 'David', 'bdavid@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11296662,'Amevenku K.', 'Mawuli', 'amemawuli@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11297849,'Isaac Nii', 'Nortey', 'isaacnii@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11305528,'Nana Fosu', 'Asamoah', 'nanafosu@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11330446,'Yasmeen Xoladem', 'Doku', 'yasxoladem@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11332163,'Matthew Kotey', 'Amponsah', 'matkotey@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11333321,'Fall', 'Galas', 'fallgalas@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11334401,'Awal', 'Mohammed', 'awalmohammed@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-19'),
-- (11338323,'Ahmed Fareed', 'Opare', 'fareedoparei@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2005-05-18'),
-- (11347946,'Derick', 'Amponsah', 'derrickamponsah@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2004-06-17'),
-- (11348310,'Freda Elikplim', 'Apetsi', 'fredaapetsi@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-03-16'),
-- (11353826,'Dabanka Hayet', 'Gyasiwa', 'hayetgyasiwa@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2002-01-15'),
-- (11356825,'Edward Opoku', 'Agyemang', 'edwardagyemang@st.ug.edu.gh', '0265996788', '224 Pwalugu St', '2003-05-12'),
-- (11358243,'Nana Kwasi', 'Kwakye', 'nanakkwakye@st.ug.edu.gh', '0265996933', '224 Nkyi St', '2003-09-30'),
-- (10975105,'Daniel Akwertey', 'Tetteh', 'danitetteh@st.ug.edu.gh', '0265996933', '224 Nkyi St', '2003-09-30');


-- SELECT *
-- FROM students_info;






-- CREATE TABLE FeePayments (

--     payment_id SERIAL PRIMARY KEY,
--     student_id INT REFERENCES students_info(student_id),
--     amount_paid DECIMAL(10, 2),
--     payment_date DATE
-- );

-- INSERT INTO FeePayments (student_id, amount_paid, payment_date)
-- VALUES
-- (11004272, 1000.00, '2024-01-15'),
-- (11010910, 500.00, '2024-02-15'),
-- (11275876, 1200.00, '2024-03-20'),
-- (10979385, 1400.00, '2024-03-25'),
-- (11012330, 600.00, '2024-02-27'),
-- (11049492, 700.00, '2024-01-02'),
-- (11018690, 800.00, '2024-01-05'),
-- (11021544, 600.00, '2024-01-07'),
-- (11012343, 450.00, '2024-01-07'),
-- (11014727, 350.00, '2024-01-07'),
-- (11014977, 500.00, '2024-01-07'),
-- (11015506, 550.00, '2024-01-07'),
-- (11023595, 700.00, '2024-01-07'),
-- (11025159, 800.00, '2024-01-07'),
-- (11038081, 540.00, '2024-01-07'),
-- (11049523, 740.00, '2024-01-07'),
-- (11053386, 780.00, '2024-01-07'),
-- (11105235, 980.00, '2024-01-07'),
-- (11112276, 1200.00, '2024-01-07'),
-- (11116537, 560.00, '2024-01-07'),
-- (11116804, 900.00, '2024-01-07'),
-- (11117318, 1000.00, '2024-01-07'),
-- (11117536, 900.00, '2024-01-07'),
-- (11117536, 700.00, '2024-01-07'),
-- (11123762, 800.00, '2024-01-07'),
-- (11139245, 820.00, '2024-01-07'),
-- (11139828, 930.00, '2024-01-07'),
-- (11164744, 950.00, '2024-01-07'),
-- (11170350, 670.00, '2024-01-07'),
-- (11172376, 770.00, '2024-01-07'),
-- (11208328, 910.00, '2024-01-07'),
-- (11209640, 960.00, '2024-01-07'),
-- (11213307, 780.00, '2024-01-07'),
-- (11218951, 730.00, '2024-01-07'),
-- (11238291, 560.00, '2024-01-07'),
-- (11246366, 660.00, '2024-01-07'),
-- (11252855, 890.00, '2024-01-07'),
-- (11252857, 980.00, '2024-01-07'),
-- (11253931, 670.00, '2024-01-07'),
-- (11254079, 830.00, '2024-01-07'),
-- (11254301, 700.00, '2024-01-07'),
-- (11254405, 600.00, '2024-01-07'),
-- (11262592, 200.00, '2024-01-07'),
-- (11264010, 100.00, '2024-01-07'),
-- (11285635, 300.00, '2024-01-07'),
-- (11292620, 1400.00, '2024-01-07'),
-- (11293871, 1500.00, '2024-01-07'),
-- (11296641, 1200.00, '2024-01-07'),
-- (11296662, 1300.00, '2024-01-07'),
-- (11297849, 1200.00, '2024-01-07'),
-- (11305528, 780.00, '2024-01-07'),
-- (11330446, 1100.00, '2024-01-07'),
-- (11332163, 900.00, '2024-01-07'),
-- (11333321, 700.00, '2024-01-07'),
-- (11334401, 800.00, '2024-01-07'),
-- (11338323, 1000.00, '2024-01-07'),
-- (11347946, 900.00, '2024-01-07'),
-- (11348310, 1400.00, '2024-01-07'),
-- (11353826, 1300.00, '2024-01-07'),
-- (11356825, 1200.00, '2024-01-07'),
-- (11358243, 1500.00, '2024-01-07'),
-- (10975105, 800.00, '2024-01-07');

-- SELECT *
-- FROM FeePayments;
-- CREATE TABLE TotalFees (
--     student_id INT REFERENCES students_info(student_id),
--     TotalFee DECIMAL(10, 2) DEFAULT 2000.00
-- );


-- INSERT INTO TotalFees (student_id)
-- SELECT student_id FROM students_info;

	
-- CREATE TABLE CourseInfo (
--     course_id SERIAL PRIMARY KEY,
--     course_name VARCHAR(100),
--     course_description TEXT,
-- 	course_credit INT,
-- course_code VARCHAR(10)

-- );

-- INSERT INTO CourseInfo (course_id,course_name, course_description,course_credit,course_code)
-- VALUES
-- (201,'Database Systems', 'Introduction to database systems and SQL',3,'CPEN 211'),
-- (202,'Software Engineering', 'Introduction to software engineering',3,'CPEN 208'),
-- (203,'Data Communication', 'Overview of data transmission',2,'CPEN 212'),
-- (204,'Computer System Design', 'Overview of system design',3,'CPEN 202'),
-- (205,'Linear Circuits', 'Overview of circuit analysis and design',3,'CPEN 206'),
-- (206,'Signals And Systems', 'Intoduction to signals and systems',3,'CPEN 303'),
-- (207,'Linear Algebra', 'Overview of algbebra',4,'SENG 201'),	
-- (208,'Basic Electronics', 'Introduction to basic electronics',3,'SENG 103');	
-- SELECT *
-- FROM CourseInfo;


-- CREATE TABLE EnrollmentInfo (
--     enrollment_id SERIAL PRIMARY KEY,
--     student_id INT REFERENCES students_info(student_id),
--     course_id INT REFERENCES CourseInfo(course_id),
--     enrollment_date DATE
-- );
-- INSERT INTO EnrollmentInfo (enrollment_id,student_id, course_id, enrollment_date)
-- VALUES
-- (1001,11004272, 201, '2024-03-10'),
-- (1002,11010910, 202, '2024-03-16'),
-- (1003,11275876, 203, '2024-04-12'),
-- (1004,10979385, 204, '2024-05-25'),
-- (1005,11012330, 205, '2024-05-18'),
-- (1006,11049492, 206, '2024-04-20'),
-- (1007,11018690, 207, '2024-05-22'),
-- (1008,11021544, 208, '2024-03-26');

-- SELECT *
-- FROM EnrollmentInfo;
-- CREATE TABLE Lecturers(
-- 	lecturer_id SERIAL PRIMARY KEY,
-- 	first_name VARCHAR(100),
-- 	last_name VARCHAR(100),
-- 	email VARCHAR(100) UNIQUE,
-- 	phone_number VARCHAR(20)
-- 	);
-- INSERT INTO Lecturers(lecturer_id,first_name,last_name,email,phone_number)
-- VALUES
-- 	(1111,'John','Asiamah','johnasiamah@gamail.com','0246677890'),
-- 	(1112,'Kenneth','Broni','kenbro@gmail.com','0258657790'),
-- 	(1113,'Agyare','Debrah','agyaredebra@gamail.com','0276690870'),
-- 	(1114,'Isaac','Aboagye','isaacaboagye@gamail.com','0546707590'),
-- 	(1115,'Percy','Okae','percyokae@gamail.com','0275678870'),
-- 	(1116,'Margaret','Richardson','margaretrichardson@gamail.com','0552446098'),
-- 	(1117,'Godfred','Mills','godfredmills@gamail.com','0501234568'),
-- 	(1118,'Prosper','Anni','prosperanni@gamail.com','0247082458');
-- SELECT *
-- FROM Lecturers;

-- CREATE TABLE lectures_info (
--     lecture_id SERIAL PRIMARY KEY,
--     lecture_name VARCHAR(100),
--     course_id INT REFERENCES CourseInfo(course_id),
--     lecture_date DATE
-- );

-- INSERT INTO lectures_info (lecture_id,lecture_name, course_id, lecture_date)
-- VALUES
-- (311,'Introduction to SQL', 201, '2024-03-15'),
-- (312,'Database Design', 202, '2024-01-20'),
-- (313,'Analog to Digital Signal Conversion', 203, '2024-04-25'),
-- (314,'Nodal Circuit Analysis', 204, '2024-03-27'),
-- (315,'Basic Algorithm Technique', 205, '2024-05-18'),
-- (316,'Signal Processing', 206, '2024-03-05'),
-- (317,'Thevenins and Nortons Theorem', 207, '2024-03-20'),
-- (318,'Arrays and LinkedList', 208, '2024-04-23');

-- SELECT *
-- FROM lectures_info;

-- CREATE TABLE TAAssignments (
--     ta_assignment_id SERIAL PRIMARY KEY,
--     lecture_id INT REFERENCES lectures_info(lecture_id),
--     ta_name VARCHAR(100),
--     ta_email VARCHAR(100)
-- );

-- INSERT INTO TAAssignments (ta_assignment_id,lecture_id, ta_name, ta_email)
-- VALUES
-- (211,311, 'Kevin Cudjoe', 'kelvincudjoe@gmail.com'),
-- (212,312, 'Agudey Daniel', 'agudeydaniel@gmail.com'),
-- (213,313, 'Haaris Abdul Waqas', 'habdulwaqas@gmail.com'),
-- (214,314, 'Samuel Ibe', 'ibesamuel@gmail.com'),
-- (215,315, 'Saani Mustapha', 'saanimustapha@gmail.com'),
-- (216,316, 'Samuel Adams', 'adamssamuel@gmail.com'),
-- (217,317, 'Luqman Quarshie', 'qualuqman@gmail.com'),
-- (218,318, 'Nathaniel Adika', 'adikanat@gmail.com');

-- SELECT *
-- FROM TAAssignments;







-- CREATE OR REPLACE FUNCTION calculate_outstanding_fees()
-- RETURNS JSON AS $$
-- DECLARE
--     result JSON;
-- BEGIN
--     WITH total_paid AS (
--         SELECT
--             student_id,
--             COALESCE(SUM(amount_paid), 0) AS total_paid
--         FROM
--             FeePayments
--         GROUP BY
--             student_id
--     )
--     SELECT json_agg(
--         json_build_object(
--             'student_id', s.student_id,
--             'first_name', s.first_name,
--             'last_name', s.last_name,
--             'total_paid', COALESCE(tp.total_paid, 0),
--             'outstanding_fees', tf.TotalFee - COALESCE(tp.total_paid, 0)
--         )
--     )
--     INTO result
--     FROM
--         students_info s
--     LEFT JOIN
--         total_paid tp ON s.student_id = tp.student_id
--     LEFT JOIN
--         TotalFees tf ON s.student_id = tf.student_id;

--     RETURN result;
-- END;
-- $$ LANGUAGE plpgsql;

-- SELECT calculate_outstanding_fees();
