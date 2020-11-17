major(s123, cs).
completed(s123, cs210).
completed(s123, cs310).
completed(s123, mt320).

required(cs, cs210).
required(cs, cs310).
required(cs, cs324).
required(cs, cs390).
required(cs, mt320).

prerequisites(cs210, []).
prerequisites(cs310, [cs210]).
prerequisites(cs324, [cs310, mt320]).
prerequisites(cs390, [cs310, mt320]).
prerequisites(mt320, []).

teaches(cs210, sue).
teaches(cs310, ricky).
teaches(cs324, sally).
teaches(cs390, matthew).
teaches(mt320, serena).

sections_taught(sue, [fall, summer]).
sections_taught(ricky, [winter]).
sections_taught(sally, [fall, summer]).
sections_taught(matthew, [summer, winter]).
sections_taught(serena, [winter]).

allCompleted(_,[]).
allCompleted(Student, Courses) :-
    maplist(completed(Student), Courses).

advise(Student, Course) :-
    major(Student, Major),
    required(Major, Course),
    not(completed(Student, Course)),
    prerequisites(Course, Prerequisites),
    allCompleted(Student, Prerequisites).

which_professor(Course, Professors) :-
    teaches(Course, Professors).

sections_available(Course, Sections) :-
    teaches(Course, Professor),
    sections_taught(Professor, Sections).

