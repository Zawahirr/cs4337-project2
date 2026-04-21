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