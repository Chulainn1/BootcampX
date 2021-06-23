SELECT students.name as student, avg(assignment_submissions.duration ) as avg_duration, avg(assignments.duration) as avg_est_duration 
FROM students
JOIN assignment_submissions ON student_id = students.id
JOIN assignments ON assignment_id = assignments.id
WHERE end_date IS NULL
GROUP BY student
HAVING avg(assignment_submissions.duration) < avg(assignments.duration)
ORDER BY avg_duration ASC;

