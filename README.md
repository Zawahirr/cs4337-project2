# CS4337 Project 2

This repository contains my solution for CS4337 Project 2.

## Project summary
This project implements a Prolog backend for generating a work schedule. The main predicate is `plan/1`, which produces a schedule in the form:

`plan(Morning, Evening, Night)`

Each shift is a list of:

`workstation(WorkstationName, EmployeeList)`

The solution uses facts from a consulted file and constructs schedules that respect:
- workstation minimum and maximum staffing
- idle workstation exclusions
- avoid_workstation constraints
- avoid_shift constraints
- the requirement that each employee works exactly one workstation for exactly one shift

## Files
- `scheduler.pl` - main Prolog scheduling logic
- `facts_example.pl` - first example facts file
- `facts_test2.pl` - second example facts file
- `facts_unsat.pl` - unsatisfiable facts file used to test failure
- `test_queries.txt` - development and testing queries
- `devlog.md` - session-by-session development log

## How to run
Using SWI-Prolog from the command line:

```prolog
?- [facts_example, scheduler].
?- plan(P).