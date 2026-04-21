employee(amy).
employee(brad).
employee(chris).
employee(dina).
employee(eric).
employee(faiza).

workstation(frontdesk, 1, 2).
workstation(stockroom, 2, 3).
workstation(packing, 1, 2).

workstation_idle(stockroom, night).

avoid_workstation(amy, packing).
avoid_workstation(eric, frontdesk).

avoid_shift(brad, morning).
avoid_shift(faiza, evening).