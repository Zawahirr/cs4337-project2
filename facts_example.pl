employee(alice).
employee(bob).
employee(carla).
employee(dan).
employee(ella).
employee(faris).

workstation(register, 1, 2).
workstation(kitchen, 2, 3).
workstation(cleaning, 1, 2).

workstation_idle(cleaning, morning).
workstation_idle(cleaning, night).
workstation_idle(kitchen, evening).
workstation_idle(kitchen, night).

avoid_workstation(alice, kitchen).
avoid_workstation(dan, register).

avoid_shift(carla, night).
avoid_shift(ella, morning).