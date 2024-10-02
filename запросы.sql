SELECT 
    `studname` as 'имя студента',`group_#gr` as 'группа студента'
FROM
    `student`
WHERE
    `student`.`group_#gr` = '1.21';
    
SELECT 
    distinct `studname` as 'имя студента',`group_#gr` as 'группа студента', `mark` as 'оценка'
FROM
    `student`, `vedomost`
WHERE
    `vedomost`.`mark` = '5' and  `student`.`group_#gr` = '1.21' and `vedomost`.`student_#stud` = `student`.`#stud`;
    
SELECT 
    distinct `student`.`studname` as 'имя студента',`student`.`group_#gr` as 'группа студента', `mark` as 'оценка',  `subject`.`sabjname` as 'предмет'
FROM
    `student`, `vedomost`, `subject`
WHERE
    `vedomost`.`mark` = '5'  and `sabjname`='математика' and `vedomost`.`student_#stud` = `student`.`#stud` and `vedomost`.`subject_#sabg`=`subject`.`#sabg`;
    
