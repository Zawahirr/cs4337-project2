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

select_employees_for_workstation(0, _, _, Available, Available, []).

select_employees_for_workstation(N, Shift, Workstation, Available, Remaining, [E|Es]) :-
    N > 0,
    select(E, Available, Rest),
    employee_allowed(E, Shift, Workstation),
    N1 is N - 1,
    select_employees_for_workstation(N1, Shift, Workstation, Rest, Remaining, Es).

assign_workstations([], _, Available, Available, []).

assign_workstations([ws(W, Min, Max)|Rest], Shift, Available, Remaining, [workstation(W, Employees)|ScheduleRest]) :-
    between(Min, Max, Count),
    select_employees_for_workstation(Count, Shift, W, Available, AfterThisStation, Employees),
    assign_workstations(Rest, Shift, AfterThisStation, Remaining, ScheduleRest).

build_shift_schedule(Shift, Available, Remaining, Schedule) :-
    active_workstations(Shift, ActiveStations),
    assign_workstations(ActiveStations, Shift, Available, Remaining, Schedule).

schedule_shift(Shift, Available, Remaining, Schedule) :-
    active_workstations(Shift, ActiveStations),
    assign_workstations(ActiveStations, Shift, Available, Remaining, Schedule).

plan(plan(Morning, Evening, Night)) :-
    findall(E, employee(E), Employees),
    schedule_shift(morning, Employees, AfterMorning, Morning),
    schedule_shift(evening, AfterMorning, AfterEvening, Evening),
    schedule_shift(night, AfterEvening, AfterNight, Night),
    AfterNight = [].