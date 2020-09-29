/*********************** Question 5 ************************/

team(['40112879','40072743', '26307647']).
student_info('40112879', 'Amine').
student_info('40072743', 'Weichen').
student_info('26307647', 'Michelle').

takes_course('40112879', 'comp348', 'Principles of Programming Languages').
takes_course('40112879', 'comp233', 'Probability and Statistics for Computer Science').

takes_course('40072743', 'soen341', 'Software Process').
takes_course('40072743', 'encs282', 'Tech. Writing + Communication').
takes_course('40072743', 'comp348', 'Principles of Programming Languages').
takes_course('40072743', 'econ201', 'Introduction-Microeconomics').

takes_course('26307647', 'soen490', 'Capstone Software Engineering Design Project').
takes_course('26307647', 'soen321', 'Information Systems Security').
takes_course('26307647', 'comp345', 'Advanced Program Design with C++').
takes_course('26307647', 'comp348', 'Principles of Programming Languages').

all_courses_by_student(X, L):- team(X), member(S, X),student_info(S,N), findall(N|CNUM|CNAM, takes_course(S, CNUM, CNAM), L).

/* Question 5a Courses taken per team member
?- all_courses_by_student(['40112879','40072743', '26307647'],L)

OUTPUT:
L = [('Amine' '|' comp348 '|' 'Principles of Programming Languages'), ('Amine' '|' comp233 '|' 'Probability and Statistics for Computer Science')]
L = [('Weichen' '|' soen341 '|' 'Software Process'), ('Weichen' '|' encs282 '|' 'Tech. Writing + Communication'), ('Weichen' '|' comp348 '|' 'Principles of Programming Languages'), ('Weichen' '|' econ201 '|' 'Introduction-Microeconomics')]
L = [('Michelle' '|' soen490 '|' 'Capstone Software Engineering Design Project'), ('Michelle' '|' soen321 '|' 'Information Systems Security'), ('Michelle' '|' comp345 '|' 'Advanced Program Design with C++'), ('Michelle' '|' comp348 '|' 'Principles of Programming Languages')]
*/


/* Question 5b  Team Size  
?- length(['40112879','40072743', '26307647'],N)

OUTPUI:
N = 3
*/

unique_courses(Set):-findall(S,takes_course(_,_,S),L),list_to_set(L,Set).

/* Question 5c  Unique Courses   
?- unique_courses(Unique_courses)

OUTPUT:
Unique_courses = ['Principles of Programming Languages', 'Probability and Statistics for Computer Science', 'Software Process', 'Tech. Writing + Communication', 'Introduction-Microeconomics', 'Capstone Software Engineering Design Project', 'Information Systems Security', 'Advanced Program Design with C++']
*/

sort2_courses(X):-findall(S,takes_course(_,_,S),L),sort(L,X).

/* Question 5d  Sort/2 Courses     
?- sort2_courses(Sorted)

OUTPUT: Sort Alphabetically and removes duplicates
Sorted = ['Advanced Program Design with C++', 'Capstone Software Engineering Design Project', 'Information Systems Security', 'Introduction-Microeconomics', 'Principles of Programming Languages', 'Probability and Statistics for Computer Science', 'Software Process', 'Tech. Writing + Communication']*/
