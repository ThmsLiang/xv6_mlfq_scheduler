#include "param.h"
#define NPSTAT 64
#define NTICKS 500
#define NSCHEDSTATS 1500

struct sched_stat_t
{
 int start_tick;            //the number of ticks when this process is scheduled
 int duration;              //number of ticks the process is running before it gives up the CPU
 int priority;              //the priority of the process when it's scheduled 

};


// for debugging
struct pstat
{
    int pid;                // PID of each process
    char *name;             // name of the process
    int priority;           // current priority level of each process (0-2)
    int ticks[3];           // number of ticks each process used the last time it was
                            // scheduled in each priority queue
                            // cannot be greater than the time-slice for each queue

    int times[3];           // number of times each process was scheduled at each of 3
                            // priority queues
    int queue[NTICKS];      //queue that a RUNNABLE process is sitting in during each tick

    int total_ticks;        // total number of ticks each RUNNABLE process has
                            // accumulated in all queues
                            // this value should be equal to the sum of the 3 values in ticks

    int wait_time;          // number of ticks each RUNNABLE process waited in the lowest
                            // priority queue
};

struct pstat global_pstat[NPSTAT];
