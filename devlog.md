## 2026-04-21 5:50 PM

### Thoughts so far
This project is a Prolog scheduling backend. The main requirement is to implement plan/1 so it can generate a schedule in the form plan(Morning, Evening, Night). Each shift should be a list of workstation(Workstation, Employees) terms. The schedule must obey workstation min/max staffing rules, omit idle workstations, and respect avoid_shift and avoid_workstation constraints.

### Plan for this session
- Create the local git repository and GitHub repository
- Create all project files in the repository root
- Write starter documentation in the README
- Add sample facts files for testing
- Add starter helper predicates in scheduler.pl
- Add test queries for basic checking in SWI-Prolog
- Commit progress in multiple small commits

### Notes during session
I want to avoid writing too much scheduling logic too early. Today should focus on file setup, facts, and helper predicates that will support the full plan/1 implementation later.