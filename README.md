# CS4337 Project 2

This repository contains my work for CS4337 Project 2.

## Project summary
The goal of this project is to implement a Prolog backend for generating work schedules. The main predicate to implement is `plan/1`, which should produce a schedule in the form:

`plan(Morning, Evening, Night)`

Each shift should be a list of `workstation(Workstation, EmployeeList)` terms.

## Files
- `scheduler.pl` - main Prolog solution file
- `facts_example.pl` - first test dataset
- `facts_test2.pl` - second test dataset
- `facts_unsat.pl` - unsatisfiable dataset for failure testing
- `test_queries.txt` - sample queries used during development
- `devlog.md` - development log for all sessions

## Day 1 status
Repository setup, sample facts, helper predicates, and starter tests.

## How to run
Using SWI-Prolog:

```prolog
?- [facts_example, scheduler].
?- active_workstations(morning, X).