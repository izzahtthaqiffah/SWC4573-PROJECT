% ==========
% Facts
% ==========

% Projects
% project(ProjectID, Category, InnovationScore)
project(p1001, rpg, 90).
project(p1002, puzzle, 67).
project(p1003, puzzle, 89).
project(p1004, fps, 78).
project(p1005, rpg, 56).
project(p1006, moba, 34).

% Judges
% judge(JudgeID, ExpertiseCategory)
judge(j01, rpg).
judge(j02, puzzle).
judge(j03, fps).
judge(j04, moba).

% Booths
% booth(BoothNumber, Category)
booth(b01, rpg).
booth(b02, puzzle).
booth(b03, fps).
booth(b04, moba).

% ==========
% Rules
% ==========

% Matching and Eligibility

is_qualified(JudgeID, BoothNumber):-
    judge(JudgeID, Category),
    booth(BoothNumber, Category).

assign_booth(ProjectID, BoothNumber):-
    project(ProjectID, Category, _),
    booth(BoothNumber, Category).

% Awards

best_innovation_awards(ProjectID):-
    project(ProjectID, _, InnovationScore),
    InnovationScore > 85.

:- initialization(main).
main :- 
    write('----- Assign Judge to Booth -----'),nl,
    forall(
        is_qualified(JudgeID, BoothNumber),
        (format('Judge ~w is qualify to judge Booth ~w~n', [JudgeID, BoothNumber]))
    ),
    nl,
    write('----- Assign Project to Booth -----'),nl,
    forall(
        assign_booth(ProjectID, BoothNumber),
        format('Project ~w is assigned to booth ~w~n', [ProjectID, BoothNumber])
    ),
    nl,
    write('--- Best Innovation Award Winners ---'),nl,
    forall(
        best_innovation_awards(ProjectID),
        (
            write('Project '), 
            write(ProjectID), 
            write(' wins the Best Innovation Award!'),
            nl
        )
    ).
