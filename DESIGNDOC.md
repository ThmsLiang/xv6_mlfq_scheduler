# Design Doc for Project 3

## Changed Files
- `proc.c` and `proc.h`: for implementation of MLFQ, we add necessary variables inside `struct proc` and change `allocproc()`, `userint()`, `scheduler()` in `proc.c`
- For creating new syscall, we changed necessary files like `syscall.h/c`, `user.h`, `usys.S`, `sysproc.c`, and eventually implement `int getpinfo(int)` inside `proc.c` 
- For testing, we created `test1.c`, `test2.c`, `test3.c`

## Helper Functions
- In `proc.c`, we created serveral helper functions to manage queues and pstats. 
    - `struct pqueue *returnQueue(void)`;
    - `void addQueue(struct pqueue *pq, struct proc *p)`;
    - `void deleteQueue(struct pqueue *pq, struct proc *p)`;
    - `void degrade(struct pqueue *pq, struct proc *p)`;
    - `void updatePstat(void)` 
    - `void boost()`: for putting a waiting proc in q2 to q0.

## New struct
- `pstat.h`:
    - `sched_stat_t`: as specified by project description, we have this struct to keep track of process info.
    - `pstat`: original struct we created for tracking and debugging, more information than sched_stat_t.

- `proc.h`: 
    - `pqueue`: a queue that has its own priority. 