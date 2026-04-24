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

## 2026-04-23 6:25 PM

### Thoughts so far
At this point I can build a schedule for one shift from a pool of available employees. The remaining task is to connect the three shifts together in the required order and enforce the project rule that every employee must work exactly one workstation for exactly one shift.

The Day 2 predicates already remove employees from the available list as they are assigned, so I should be able to reuse that idea by passing the remaining list from morning to evening and then from evening to night.

### Plan for this session
- Add a predicate that schedules one shift from the current employee pool
- Chain morning, evening, and night together
- Implement the final plan/1 predicate in the required structure
- Ensure the final result only succeeds when all employees are assigned
- Add tests for successful and failing plan/1 queries
- Update the README to reflect Day 3 progress

## 2026-04-23 6:40 PM

### Reflection
Today I connected the single-shift scheduling logic into the full project predicate plan/1. The plan now starts with the full employee list, schedules the morning shift, then schedules evening from the remaining employees, and finally schedules night from the remaining employees after evening.

The key idea today was using the remaining employee pool to enforce that employees are not reused. Requiring the remaining list after the night shift to be empty is what enforces that every employee is assigned exactly once overall.

I tested the final plan/1 predicate with the example datasets and also tested an unsatisfiable dataset to confirm that the predicate fails when no valid plan can be built. This feels much closer to the full assignment now because the code is producing schedules in the required plan(Morning, Evening, Night) form.

### Next session
Next session I want to focus on cleanup, stronger edge-case testing, and making sure the repository is polished for grading. I also want to verify that the README and devlog clearly explain the work and that the final repository will be easy for a TA to run.