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

## 2026-04-21 6:30 PM

### Reflection
I completed the initial repository setup and created all base project files. I added multiple facts files so I can test more than one scenario later, including one impossible case for checking failure behavior. I also added starter helper predicates in `scheduler.pl` to check whether employees are allowed on shifts and workstations and to collect active workstations for a shift.

One thing I paid attention to was the project hint about optional predicates possibly not being defined. I used fallback rules with `fail` so missing facts like `workstation_idle/2` or `avoid_shift/2` will not crash SWI-Prolog.

I tested the helper predicates in SWI-Prolog and confirmed that idle workstations are filtered correctly and avoid rules behave the way I expected.

### Next session
Next session I want to begin building the assignment logic for one shift. That means choosing valid employees for a workstation while respecting the workstation min/max values and shift/workstation restrictions.

## 2026-04-22 8:00 PM

### Thoughts so far
Day 1 gave me a clean starting point. I now have the facts files, README, test queries, and helper predicates for checking shift and workstation restrictions. The next major step is to move from checking constraints to actually constructing part of a schedule.

I want to build this in stages. Instead of jumping directly to the full plan/1 predicate, I want to first solve the smaller problem of assigning employees to the active workstations for one shift.

### Plan for this session
- Add predicates that select valid employees for a workstation
- Respect avoid_shift and avoid_workstation restrictions while selecting employees
- Respect workstation minimum and maximum staffing limits
- Build a predicate that assigns employees across all active workstations for one shift
- Add test queries for single-shift scheduling
- Update the README to reflect Day 2 progress

## 2026-04-22 8:45 PM

### Reflection
Today I moved from helper predicates into actual scheduling logic for one shift. I added a predicate for selecting a specific number of valid employees for a workstation and a predicate for assigning employees across the active workstations of a shift.

The main idea today was to keep working from a remaining employee pool. When employees are assigned to one workstation, they are removed from the available list before the next workstation is processed. This should help later when I need to guarantee that each employee is used exactly once overall.

I tested the new logic with the sample facts files and confirmed that the results are shaped like workstation(Workstation, EmployeeList) terms. I also confirmed that idle workstations stay excluded because the shift builder depends on active_workstations/2.

One thing I still need to be careful about is that Day 2 only solves one shift at a time. The final project still requires plan/1 to connect morning, evening, and night and ensure every employee works exactly one workstation for exactly one shift.

### Next session
Next session I want to build the full plan/1 predicate by chaining together morning, evening, and night scheduling from one shared employee pool.