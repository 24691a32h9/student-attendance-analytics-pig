# Student Attendance Analytics using Apache Pig

## Project overview
This Big Data Analytics mini-project uses Apache Pig Latin to process student attendance records stored in CSV format. It calculates attendance percentages, produces student-wise and subject-wise summaries, and identifies students whose overall attendance is below 75%.

## Folder structure
```text
Student_Attendance_Analytics_Pig/
├── data/
│   └── attendance_records.csv
├── scripts/
│   └── student_attendance_analytics.pig
├── docs/
│   └── project_report.md
├── output/
│   └── (created when the Pig script runs)
└── README.md
```

## Requirements
- Java (compatible with your Hadoop/Pig installation)
- Apache Hadoop (optional for local mode; required for a Hadoop execution environment)
- Apache Pig
- Terminal / Command Prompt

Check installations:
```bash
java -version
pig -version
```

## Run the project (local mode)
1. Extract the ZIP file.
2. Open a terminal in the `Student_Attendance_Analytics_Pig` project folder.
3. Run:
```bash
pig -x local scripts/student_attendance_analytics.pig
```
4. Pig creates these output directories:
   - `output/subject_wise_records`
   - `output/student_summary`
   - `output/subject_summary`
   - `output/low_attendance`

Pig stores output as part files inside each directory. The CSV output has no header row.

If you run the script again, remove the existing `output` directory first because Pig normally will not overwrite an existing output path.

## Input data format
`attendance_records.csv` contains one row per student per subject:
- `student_id`
- `student_name`
- `department`
- `semester`
- `subject`
- `total_classes`
- `attended_classes`

The supplied dataset is sample/demo data. Replace it with your friend's permitted college data if available, while preserving the same column order and types. Keep the header row; the script filters it out.

## Main calculations
Attendance percentage = (Attended Classes / Total Classes) × 100

A student is flagged as having low attendance when their overall attendance percentage across the listed subjects is below 75%.

## Important notes
- The dataset is fictional sample data, not actual institutional attendance.
- This is an Apache Pig data-processing project; it does not require a Python dashboard.
- Output values may contain decimal precision depending on the Pig version.
- For a Hadoop run, configure Hadoop first and run `pig scripts/student_attendance_analytics.pig` in the configured environment.

## GitHub upload
Create an empty repository on the student's GitHub account. Then, from this project folder:
```bash
git init
git add .
git commit -m "Add Student Attendance Analytics using Apache Pig"
git branch -M main
git remote add origin https://github.com/ HER_GITHUB_USERNAME /student-attendance-analytics-pig.git
git push -u origin main
```
Before running the remote command, remove the spaces and replace `HER_GITHUB_USERNAME` with her exact GitHub username. If Git asks for authentication, use GitHub's browser sign-in / Git Credential Manager or a Personal Access Token (PAT) when prompted. Never put a GitHub password or token inside project files or share it in chat.
