# Project Report: Student Attendance Analytics using Apache Pig

## 1. Introduction
Student attendance is an important academic indicator. Manually reviewing attendance records for many students and subjects can be time-consuming. This project applies Apache Pig to process attendance data and generate useful summaries.

## 2. Problem Statement
To analyze student attendance records, calculate attendance percentages, summarize attendance by student and subject, and identify students whose overall attendance is below the 75% threshold.

## 3. Objectives
- Load attendance records from a CSV file using Apache Pig.
- Validate and filter input records.
- Calculate subject-level and overall attendance percentages.
- Generate student-wise and subject-wise summaries.
- Identify students with attendance below 75%.

## 4. Technologies Used
- Apache Pig / Pig Latin
- CSV (input data format)
- Hadoop ecosystem (optional when using Pig local mode)

## 5. Methodology
1. Store attendance records in CSV format.
2. Load the records using PigStorage.
3. Exclude the header and invalid records.
4. Calculate attendance percentages.
5. Group records by student to calculate overall attendance.
6. Group records by subject to calculate subject-wise attendance.
7. Filter student summaries to find attendance below 75%.
8. Store the generated datasets in output folders.

## 6. Formula
Attendance Percentage = (Attended Classes / Total Classes) × 100

## 7. Expected Outputs
- `subject_wise_records`: percentage for each student-subject record.
- `student_summary`: total classes, attended classes, and overall percentage for each student.
- `subject_summary`: aggregated attendance for each subject.
- `low_attendance`: students whose overall attendance is below 75%.

## 8. Result
The Pig script processes the sample attendance dataset and generates the four output datasets. The low-attendance output can help academic staff identify students who may need attendance counselling or follow-up.

## 9. Conclusion
The project demonstrates how Apache Pig can simplify batch processing of structured attendance data. It produces student-wise and subject-wise summaries and flags low attendance using a configurable threshold.

## 10. Future Enhancements
- Use larger attendance datasets stored in HDFS.
- Add month-wise and department-wise analysis.
- Generate visual reports using a separate visualization tool.
- Connect the analysis to an authorized institutional attendance source.
