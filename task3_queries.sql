-- 1
SELECT
	to_char(ts.date, 'Mon') AS "Month",
	COUNT(ts.time_slot_id) AS "Total",
	COUNT(individual_lesson_id) AS "Individual",
	COUNT(group_lesson_id) AS "Group",
	COUNT(ensemble_id) AS "Ensemble"
FROM time_slot ts
LEFT JOIN individual_lesson ON ts.time_slot_id = individual_lesson.time_slot_id
LEFT JOIN group_lesson ON ts.time_slot_id = group_lesson.time_slot_id
LEFT JOIN ensemble ON ts.time_slot_id = ensemble.time_slot_id
WHERE EXTRACT(YEAR FROM ts.date) = 2023
GROUP BY "Month";

-- 2
SELECT r.count AS "No of Siblings", COUNT(r.count) AS "No of Students"
FROM (SELECT COUNT(student_sibling.student_id) as count
	FROM student
	LEFT JOIN student_sibling ON student_sibling.student_id = student.student_id
	GROUP BY student.student_id) r
GROUP BY r.count
ORDER BY r.count ASC;

-- 3
SELECT ins.instructor_id AS "Instructor ID", ins.name as "Name",
	COUNT(individual_lesson_id) + COUNT(group_lesson_id) + COUNT(ensemble_id) AS "No of Lessons"
FROM instructor ins
LEFT JOIN individual_lesson ON ins.instructor_id = individual_lesson.instructor_id
LEFT JOIN group_lesson ON ins.instructor_id = group_lesson.instructor_id
LEFT JOIN ensemble ON ins.instructor_id = ensemble.instructor_id
GROUP BY ins.instructor_id
HAVING COUNT(individual_lesson_id) + COUNT(group_lesson_id) + COUNT(ensemble_id) > 0;

-- 4
SELECT TO_CHAR(time_slot.date, 'Dy') AS "Day", genre.name AS "Genre",
	(SELECT CASE
	 	WHEN ensemble.max_students - COUNT(student_id) <= 0 THEN 'No Seats'
	 	WHEN ensemble.max_students - COUNT(student_id) <= 2 THEN '1 or 2 Seats'
	 	ELSE 'Many Seats'
	 END
	 FROM ensemble_student
	 WHERE ensemble_student.ensemble_id = ensemble.ensemble_id AND accepted = FALSE) AS "No of Free Seats"
FROM ensemble
JOIN time_slot ON time_slot.time_slot_id = ensemble.time_slot_id
JOIN genre ON genre.genre_id = ensemble.genre
WHERE time_slot.date BETWEEN current_date AND current_date + interval '1 week'
ORDER BY time_slot.date ASC

