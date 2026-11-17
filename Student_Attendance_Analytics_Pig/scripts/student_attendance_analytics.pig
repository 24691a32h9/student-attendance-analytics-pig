-- Student Attendance Analytics using Apache Pig
-- Run from the project root: pig -x local scripts/student_attendance_analytics.pig

attendance = LOAD 'data/attendance_records.csv'
    USING PigStorage(',')
    AS (
        student_id:chararray,
        student_name:chararray,
        department:chararray,
        semester:chararray,
        subject:chararray,
        total_classes:int,
        attended_classes:int
    );

-- Remove the CSV header row and invalid records.
valid_records = FILTER attendance BY
    student_id != 'student_id'
    AND total_classes > 0
    AND attended_classes >= 0
    AND attended_classes <= total_classes;

-- Calculate attendance percentage for each student in each subject.
subject_attendance = FOREACH valid_records GENERATE
    student_id,
    student_name,
    department,
    semester,
    subject,
    total_classes,
    attended_classes,
    (double)attended_classes * 100.0 / (double)total_classes
        AS attendance_percentage:double;

-- Student-wise overall attendance across all subjects.
student_groups = GROUP valid_records BY
    (student_id, student_name, department, semester);

student_summary = FOREACH student_groups GENERATE
    FLATTEN(group) AS (student_id, student_name, department, semester),
    SUM(valid_records.total_classes) AS total_classes,
    SUM(valid_records.attended_classes) AS attended_classes,
    (double)SUM(valid_records.attended_classes) * 100.0 /
        (double)SUM(valid_records.total_classes) AS attendance_percentage:double;

-- Subject-wise attendance summary.
subject_groups = GROUP valid_records BY subject;

subject_summary = FOREACH subject_groups GENERATE
    group AS subject,
    COUNT(valid_records) AS student_subject_records,
    SUM(valid_records.total_classes) AS total_classes,
    SUM(valid_records.attended_classes) AS attended_classes,
    (double)SUM(valid_records.attended_classes) * 100.0 /
        (double)SUM(valid_records.total_classes) AS attendance_percentage:double;

-- Students whose overall attendance is below 75 percent.
low_attendance = FILTER student_summary BY attendance_percentage < 75.0;

-- Store results. Delete these output folders before rerunning if they already exist.
STORE subject_attendance INTO 'output/subject_wise_records' USING PigStorage(',');
STORE student_summary INTO 'output/student_summary' USING PigStorage(',');
STORE subject_summary INTO 'output/subject_summary' USING PigStorage(',');
STORE low_attendance INTO 'output/low_attendance' USING PigStorage(',');

DUMP low_attendance;
