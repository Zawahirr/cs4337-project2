:- multifile workstation_idle/2.
:- multifile avoid_workstation/2.
:- multifile avoid_shift/2.

% Fallback rules so missing facts do not cause undefined predicate errors.
workstation_idle(_, _) :- fail.
avoid_workstation(_, _) :- fail.
avoid_shift(_, _) :- fail.

shifts([morning, evening, night]).

employee_allowed_shift(Employee, Shift) :-
    \+ avoid_shift(Employee, Shift).

employee_allowed_workstation(Employee, Workstation) :-
    \+ avoid_workstation(Employee, Workstation).

employee_allowed(Employee, Shift, Workstation) :-
    employee_allowed_shift(Employee, Shift),
    employee_allowed_workstation(Employee, Workstation).

active_workstations(Shift, Active) :-
    findall(ws(W, Min, Max),
        (workstation(W, Min, Max), \+ workstation_idle(W, Shift)),
        Active).