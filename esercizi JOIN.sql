-- 1 Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT `students`.`name`, `students`.`surname`, `degrees`.`name`    
FROM `students`
INNER JOIN `degrees`
ON `degrees`.`id` = `students`.`degree_id`  
WHERE `degrees`.`name` = 'Corso di Laurea in Economia';

-- 2 Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze
SELECT `degrees`.`name`, `departments`.`name`  
FROM `degrees`
INNER JOIN `departments`
ON `departments`.`id` = `degrees`.`department_id`  
WHERE `departments`.`name` = 'Dipartimento di Neuroscienze';

-- 3 Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT `courses`.`name` AS 'nome corso', `teachers`.`name`, `teachers`.`surname` 
FROM `courses`
INNER JOIN `course_teacher`
ON `courses`.`id` = `course_teacher`.`course_id`
INNER JOIN `teachers`
ON `teachers`.`id` = `course_teacher`.`teacher_id`  
WHERE `teachers`.`id` = 44;

-- 4 Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT `students`.`surname`, `students`.`name`, `degrees`.`name` AS 'CORSO DI LAUREA', `departments`.`name` AS 'DIPARTIMENTO'
FROM `students`
INNER JOIN `degrees`
ON `degrees`.`id` = `students`.`degree_id`
INNER JOIN `departments`
ON `departments`.`id` = `degrees`.`department_id`
ORDER BY `students`.`name` ASC,
          `students`.`surname` ASC;

-- 5 Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT `degrees`.`name` AS 'corsi di laurea', `courses`.`name` AS 'corsi', `teachers`.`name`, `teachers`.`surname`    
FROM `degrees`
INNER JOIN `courses`
ON `degrees`.`id` = `courses`.`degree_id`
INNER JOIN `course_teacher`
ON `courses`.`id`= `course_teacher`.`course_id`
INNER JOIN `teachers`
ON `teachers`.`id` = `course_teacher`.`teacher_id`;

-- 6 Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT DISTINCT `teachers`.`name`, `teachers`.`surname`, `departments`.`name`
FROM `teachers`
INNER JOIN `course_teacher`
ON `teachers`.`id` = `course_teacher`.`teacher_id`
INNER JOIN `courses`
ON `courses`.`id` = `course_teacher`.`course_id`
INNER JOIN `degrees`
ON `degrees`.`id` = `courses`.`degree_id`
INNER JOIN `departments`
ON `departments`.`id` = `degrees`.`department_id`
WHERE `departments`.`name` = 'Dipartimento di Matematica';